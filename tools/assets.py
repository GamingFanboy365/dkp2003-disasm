#!/usr/bin/env python3
"""
Extract game assets into editable files, and convert them back for the build.

  assets.py extract [baserom.gba]   write assets/ from the ROM (make extract)
  assets.py build                   assets/ -> build/assets/*.bin (make does this)

The list of assets is config/assets.txt (see tools/find_assets.py).  Formats:
  pal       JASC-PAL text, 8-bit RGB (BGR555 << 3); editable in most editors
  tiles4/8  indexed PNG, 16 tiles per row; pixel values are the colour indices.
            The PNG palette is only a preview (the level palette for 8bpp level
            tiles, grey ramps otherwise).  The tile count comes from the manifest.
  objects   assembly: one `level_object x, y, z, classinfo` per object
  sdata     assembly: tables with symbolic pointers
  rsprite   Rare sprite container: indexed PNG sprite sheet (16 frames per
            row, colour 0 transparent, previewed in the sprite's palette) plus
            a .json with the container header and per-frame tile counts.
            The build re-encodes it exactly like Rare's tool (tools/rare_sprite.py).
  sample    WAV, 8-bit mono PCM at the rate in its name (the instrument
            definition keeps the real rate; the WAV's rate is ignored).
            Its length may change: the definition's end pointer and length
            follow it.
  anim      sprite animation scripts, assembly with the anim_* macros
            (tools/anim.py); the build includes it, scripts may change length
  aipath    the CPU racers' path of a level, assembly with the ai_* macros
            (tools/aipath.py); the build includes it, nodes may be added
  checkpoints  a level's checkpoint lines (laps), assembly with the
            checkpoint macro (tools/checkpoints.py)
  text      the front end's strings and language tables, one string per line
            (tools/fetext.py); strings may change length
  gfx, bin  raw binary

assets/ is generated from your ROM and is not committed.
"""
import sys, os, struct, zlib, json, io, contextlib, subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, '..'))
sys.path.insert(0, HERE)

MANIFEST = os.path.join(ROOT, 'config', 'assets.txt')
SRC = os.path.join(ROOT, 'assets')
OUT = os.path.join(ROOT, 'build', 'assets')
EXT = {'pal': '.pal', 'tiles4': '.png', 'tiles8': '.png', 'rsprite': '.png', 'sample': '.wav',
       'gfx': '.bin', 'bin': '.bin',
       'objects': '.s', 'sdata': '.s', 'text': '.txt', 'anim': '.s', 'aipath': '.s', 'checkpoints': '.s'}
TILES_PER_ROW = 16


def load_manifest():
    out = []
    for l in open(MANIFEST):
        p = l.split('#')[0].split()
        if len(p) == 4:
            out.append((int(p[0], 0), int(p[1], 0), p[2], p[3]))
    return out


# ---------------------------------------------------------------- palettes --
def pal_to_text(b):
    lines = ['JASC-PAL', '0100', str(len(b) // 2)]
    for i in range(len(b) // 2):
        c = struct.unpack_from('<H', b, 2 * i)[0]
        lines.append('%d %d %d' % ((c & 31) << 3, ((c >> 5) & 31) << 3, ((c >> 10) & 31) << 3))
    return '\n'.join(lines) + '\n'


def text_to_pal(t, path):
    lines = [l.strip() for l in t.splitlines() if l.strip()]
    if lines[:2] != ['JASC-PAL', '0100']:
        raise SystemExit('%s: not a JASC-PAL file' % path)
    n = int(lines[2])
    out = bytearray()
    for l in lines[3:3 + n]:
        r, g, b = (int(x) for x in l.split()[:3])
        out += struct.pack('<H', (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10))
    return bytes(out)


def pal_rgb(b):
    return [((c & 31) << 3, ((c >> 5) & 31) << 3, ((c >> 10) & 31) << 3)
            for c in struct.unpack_from('<%dH' % (len(b) // 2), b)]


# --------------------------------------------------------------------- PNG --
def png_write(path, w, h, pixels, palette, transparent0=False):
    def chunk(t, d):
        return struct.pack('>I', len(d)) + t + d + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
    raw = b''.join(b'\0' + bytes(pixels[y * w:(y + 1) * w]) for y in range(h))
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 3, 0, 0, 0))
    png += chunk(b'PLTE', b''.join(bytes(c) for c in palette))
    if transparent0:
        png += chunk(b'tRNS', b'\0')
    png += chunk(b'IDAT', zlib.compress(raw, 9)) + chunk(b'IEND', b'')
    open(path, 'wb').write(png)


def png_read(path):
    """Read an indexed (or 8-bit greyscale) PNG; return (w, h, pixel indices)."""
    d = open(path, 'rb').read()
    if d[:8] != b'\x89PNG\r\n\x1a\n':
        raise SystemExit('%s: not a PNG' % path)
    pos, idat = 8, b''
    while pos < len(d):
        n, t = struct.unpack_from('>I4s', d, pos)
        body = d[pos + 8:pos + 8 + n]
        if t == b'IHDR':
            w, h, depth, ctype, _, _, interlace = struct.unpack('>IIBBBBB', body)
        elif t == b'IDAT':
            idat += body
        pos += 12 + n
    if ctype not in (0, 3) or interlace:
        raise SystemExit('%s: must be an indexed (palette) PNG without interlacing' % path)
    raw = zlib.decompress(idat)
    stride = (w * depth + 7) // 8
    bpp = max(1, depth // 8)
    rows, prev, k = [], bytearray(stride), 0
    for y in range(h):
        f = raw[k]; line = bytearray(raw[k + 1:k + 1 + stride]); k += 1 + stride
        for i in range(stride):
            a = line[i - bpp] if i >= bpp else 0
            b = prev[i]
            c = prev[i - bpp] if i >= bpp else 0
            if f == 1: line[i] = (line[i] + a) & 255
            elif f == 2: line[i] = (line[i] + b) & 255
            elif f == 3: line[i] = (line[i] + (a + b) // 2) & 255
            elif f == 4:
                p = a + b - c; pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                line[i] = (line[i] + (a if pa <= pb and pa <= pc else b if pb <= pc else c)) & 255
        rows.append(line); prev = line
    px = []
    for line in rows:
        if depth == 8:
            px += line[:w]
        else:
            per = 8 // depth
            for x in range(w):
                byte = line[x // per]
                px.append((byte >> (8 - depth * (x % per + 1))) & ((1 << depth) - 1))
    return w, h, px


# ------------------------------------------------------------------- audio --
def wav_write(path, rate, data):
    pcm = bytes(b ^ 0x80 for b in data)          # GBA signed -> WAV unsigned 8-bit
    fmt = struct.pack('<HHIIHH', 1, 1, rate, rate, 1, 8)
    body = b'WAVE' + b'fmt ' + struct.pack('<I', 16) + fmt + b'data' + struct.pack('<I', len(pcm)) + pcm
    if len(pcm) & 1:
        body += b'\0'
    open(path, 'wb').write(b'RIFF' + struct.pack('<I', len(body)) + body)


def wav_read(path):
    d = open(path, 'rb').read()
    if d[:4] != b'RIFF' or d[8:12] != b'WAVE':
        raise SystemExit('%s: not a WAV file' % path)
    pos, fmt, pcm = 12, None, None
    while pos + 8 <= len(d):
        cid, n = d[pos:pos + 4], struct.unpack_from('<I', d, pos + 4)[0]
        body = d[pos + 8:pos + 8 + n]
        if cid == b'fmt ':
            fmt = struct.unpack_from('<HHIIHH', body)
        elif cid == b'data':
            pcm = body
        pos += 8 + n + (n & 1)
    if fmt is None or pcm is None:
        raise SystemExit('%s: missing fmt or data chunk' % path)
    if fmt[0] != 1 or fmt[1] != 1 or fmt[5] != 8:
        raise SystemExit('%s: must be 8-bit mono PCM (got %d channel(s), %d-bit)' % (path, fmt[1], fmt[5]))
    return bytes(b ^ 0x80 for b in pcm)


# ------------------------------------------------------------------- tiles --
def tiles_to_pixels(data, bpp):
    tb = 32 if bpp == 4 else 64
    n = len(data) // tb
    cols = TILES_PER_ROW
    rows = (n + cols - 1) // cols
    w, h = cols * 8, rows * 8
    px = [0] * (w * h)
    for t in range(n):
        tx, ty = (t % cols) * 8, (t // cols) * 8
        for y in range(8):
            for x in range(8):
                if bpp == 8:
                    v = data[t * 64 + y * 8 + x]
                else:
                    byte = data[t * 32 + y * 4 + x // 2]
                    v = (byte >> 4) if x & 1 else (byte & 15)
                px[(ty + y) * w + tx + x] = v
    return w, h, px


def pixels_to_tiles(w, h, px, bpp, n, path):
    if w % 8 or h % 8:
        raise SystemExit('%s: size must be a multiple of 8' % path)
    cols = w // 8
    if cols * (h // 8) < n:
        raise SystemExit('%s: needs at least %d tiles' % (path, n))
    out = bytearray()
    for t in range(n):
        tx, ty = (t % cols) * 8, (t // cols) * 8
        for y in range(8):
            row = px[(ty + y) * w + tx:(ty + y) * w + tx + 8]
            if bpp == 8:
                out += bytes(row)
            else:
                if max(row) > 15:
                    raise SystemExit('%s: colour index > 15 in a 4bpp tileset' % path)
                out += bytes(row[2 * i] | (row[2 * i + 1] << 4) for i in range(4))
    return bytes(out)


# ----------------------------------------------------------------- extract --
def make_gen(rom_path):
    import gen_asm
    from analyze import parse_cfg, ROM
    cfg_path = os.path.join(ROOT, 'config', 'dkp.cfg')
    db_path = os.path.join(ROOT, 'build', 'db.json')
    if not os.path.exists(db_path):
        os.makedirs(os.path.dirname(db_path), exist_ok=True)
        subprocess.run([sys.executable, os.path.join(HERE, 'analyze.py'), rom_path, cfg_path, db_path], check=True)
    with contextlib.redirect_stderr(io.StringIO()):
        g = gen_asm.make_gen(rom_path, db_path, cfg_path)
    # object class names for comments in object lists
    names = {}
    for l in open(os.path.join(ROOT, 'config', 'symbols.txt')):
        p = l.split('#')[0].split()
        if len(p) >= 2 and ':' not in p[0]:      # (overlay:address entries are code)
            names[int(p[0], 16) & ~1] = p[1]
    rom = g.rom
    for c in range(0x40):
        init = struct.unpack_from('<I', rom.d, 0x713FD0 + 16 * c)[0] & ~1
        n = names.get(init, '')
        if n.startswith('init_'):
            g.class_names[c] = n[5:]
    return g


def sprite_palettes(rom):
    """Container offset -> palette offset, from the sprite table and track records."""
    out = {}
    for k in range(1, 152):
        gp, pp = struct.unpack_from('<II', rom, 0x713650 + 16 * k)
        out.setdefault(gp - 0x08000000, pp - 0x08000000)
    for t in range(48):
        b = 0x51D40 + 0x2C * t
        if not struct.unpack_from('<I', rom, b)[0]:
            break
        mp, pal16, th, thp = struct.unpack_from('<4I', rom, b + 0x14)
        out.setdefault(mp - 0x08000000, pal16 - 0x08000000)
        out.setdefault(th - 0x08000000, thp - 0x08000000)
    return out


def extract(rom_path):
    import rare_sprite
    g = make_gen(rom_path)
    rom = g.rom.d
    spals = sprite_palettes(rom)
    assets = load_manifest()
    by_name = {n: (o, s, t) for o, s, t, n in assets}
    count = {}
    for off, size, typ, name in assets:
        path = os.path.join(SRC, name + EXT[typ])
        os.makedirs(os.path.dirname(path), exist_ok=True)
        data = rom[off:off + size]
        if typ == 'pal':
            open(path, 'w').write(pal_to_text(data))
        elif typ in ('tiles4', 'tiles8'):
            bpp = 4 if typ == 'tiles4' else 8
            n = struct.unpack_from('<H', data)[0]
            w, h, px = tiles_to_pixels(data[2:], bpp)
            pal = None
            lv = name.rsplit('/', 1)[0] + '/palette'
            if bpp == 8 and lv in by_name and by_name[lv][2] == 'pal':
                po, ps, _ = by_name[lv]
                pal = pal_rgb(rom[po:po + ps])
            if pal is None:
                k = 16 if bpp == 4 else 256
                pal = [(i * 255 // (k - 1),) * 3 for i in range(k)]
            png_write(path, w, h, px, pal[:256])
            assert n == (size - 2) // (32 if bpp == 4 else 64)
        elif typ == 'rsprite':
            meta, frames, csize = rare_sprite.parse(data)
            assert csize == size and rare_sprite.build(meta, frames) == data, name
            counts = [m['tiles'] for m in meta['frames']]
            w, h, px = rare_sprite.to_pixels(counts, frames)
            po = spals.get(off)
            if po is None:
                # containers that follow a referenced one: borrow its palette (preview only)
                prev = [o for o in spals if o < off]
                po = spals[max(prev)] if prev else None
            pal = pal_rgb(rom[po:po + 32]) if po is not None else [(i * 17,) * 3 for i in range(16)]
            png_write(path, w, h, px, pal, transparent0=True)
            meta = dict({'comment': 'Rare sprite container; see tools/rare_sprite.py', 'rom_offset': '0x%06X' % off},
                        **meta)
            open(path[:-4] + '.json', 'w').write(json.dumps(meta, indent=1) + '\n')
        elif typ == 'sample':
            wav_write(path, int(name.rsplit('_', 1)[1][:-2]), data)
        elif typ in ('objects', 'sdata'):
            open(path, 'w').write('\n'.join(g.asset_text(off)) + '\n')
        elif typ == 'checkpoints':
            import checkpoints
            open(path, 'w').write('\n'.join(checkpoints.to_asm(rom, off, name)) + '\n')
        elif typ == 'aipath':
            import aipath
            open(path, 'w').write('\n'.join(aipath.to_asm(rom, off, name)) + '\n')
        elif typ == 'anim':
            import anim
            labels = {o: g.dlabel[o] for o in g.dlabel if off <= o < off + size}
            open(path, 'w').write('\n'.join(anim.parse(rom, off, size, labels)) + '\n')
        elif typ == 'text':
            import fetext
            tables, strings = fetext.parse(rom, off, size)
            labels = [g.dlabel.get(t, 'gUnk_%08X' % (0x08000000 + t)) for t, _ in tables]
            open(path, 'w', encoding='utf-8').write(fetext.to_text(tables, strings, labels))
        else:
            open(path, 'wb').write(data)
            if name.endswith('_tilemap'):
                bg_preview(rom, by_name, name, data)
        count[typ] = count.get(typ, 0) + 1
    # the music as standard MIDI files (a view: the build does not use them)
    import music
    mdir = os.path.join(SRC, 'audio', 'music')
    os.makedirs(mdir, exist_ok=True)
    for k, (division, tracks) in enumerate(music.songs(rom)):
        open(os.path.join(mdir, 'song_%02d.mid' % k), 'wb').write(music.to_midi(division, tracks))
    import soundfont
    open(os.path.join(mdir, 'dkp.sf2'), 'wb').write(soundfont.build(rom)[0])
    open(os.path.join(SRC, 'README.txt'), 'w').write(
        'Generated from your baserom.gba by `make extract` (tools/assets.py).\n'
        'Edit these files and run `make`; see config/assets.txt for offsets and types.\n')
    print('extracted %d assets into assets/: %s' % (len(assets), ', '.join(
        '%d %s' % (v, k) for k, v in sorted(count.items()))))


def bg_preview(rom, by_name, name, tilemap):
    """<x>_tilemap with <x>_tiles (8bpp) and palette beside it: write
    <x>_preview.png, the composed screen (a preview only, not used by the
    build; edit the tiles, map and palette instead)."""
    base, d = name[:-len('_tilemap')], os.path.dirname(name)
    if base + '_tiles' not in by_name or d + '/palette' not in by_name:
        return
    to, ts, tt = by_name[base + '_tiles']
    po, ps, _ = by_name[d + '/palette']
    if tt != 'tiles8':
        return
    tiles = rom[to + 2:to + ts]
    cols, rows = 32, len(tilemap) // 64
    w, h = cols * 8, rows * 8
    px = [0] * (w * h)
    for i in range(cols * rows):
        e = struct.unpack_from('<H', tilemap, 2 * i)[0]
        t, hf, vf = e & 0x3FF, e & 0x400, e & 0x800
        tb = tiles[64 * t:64 * t + 64]
        if len(tb) < 64:
            continue
        for y in range(8):
            for x in range(8):
                sx, sy = (7 - x if hf else x), (7 - y if vf else y)
                px[((i // cols) * 8 + sy) * w + (i % cols) * 8 + sx] = tb[y * 8 + x]
    vw = min(w, 240)                       # the visible screen width
    px = [px[y * w + x] for y in range(h) for x in range(vw)]
    png_write(os.path.join(SRC, base + '_preview.png'), vw, h, px, pal_rgb(rom[po:po + ps]))


# ------------------------------------------------------------------- build --
def build():
    assets = load_manifest()
    made = 0
    for off, size, typ, name in assets:
        if typ in ('objects', 'sdata', 'anim', 'aipath', 'checkpoints'):
            continue
        src = os.path.join(SRC, name + EXT[typ])
        dst = os.path.join(OUT, name + ('.s' if typ == 'text' else '.bin'))
        if not os.path.exists(src):
            raise SystemExit('missing %s -- run `make extract` first' % os.path.relpath(src, ROOT))
        srcs = [src] + ([src[:-4] + '.json'] if typ == 'rsprite' else [])
        if os.path.exists(dst) and all(os.path.getmtime(dst) >= os.path.getmtime(x) for x in srcs + [MANIFEST]):
            continue
        if typ == 'pal':
            data = text_to_pal(open(src).read(), src)
        elif typ in ('tiles4', 'tiles8'):
            bpp = 4 if typ == 'tiles4' else 8
            n = (size - 2) // (32 if bpp == 4 else 64)
            w, h, px = png_read(src)
            data = struct.pack('<H', n) + pixels_to_tiles(w, h, px, bpp, n, src)
        elif typ == 'sample':
            data = wav_read(src)
        elif typ == 'rsprite':
            import rare_sprite
            meta = json.load(open(src[:-4] + '.json'))
            counts = [m['tiles'] for m in meta['frames']]
            w, h, px = png_read(src)
            data = rare_sprite.build(meta, rare_sprite.from_pixels(counts, w, h, px, src))
        elif typ == 'text':
            import fetext
            tables, strings = fetext.from_text(open(src, encoding='utf-8').read(), os.path.relpath(src, ROOT))
            data = fetext.to_asm(tables, strings).encode()
        else:
            data = open(src, 'rb').read()
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        open(dst, 'wb').write(data)
        made += 1
    print('assets: %d converted' % made)


def main():
    if len(sys.argv) < 2 or sys.argv[1] not in ('extract', 'build'):
        raise SystemExit(__doc__)
    if sys.argv[1] == 'extract':
        extract(sys.argv[2] if len(sys.argv) > 2 else os.path.join(ROOT, 'baserom.gba'))
    else:
        build()


if __name__ == '__main__':
    main()
