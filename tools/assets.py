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
EXT = {'pal': '.pal', 'tiles4': '.png', 'tiles8': '.png', 'gfx': '.bin', 'bin': '.bin',
       'objects': '.s', 'sdata': '.s'}
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
def png_write(path, w, h, pixels, palette):
    def chunk(t, d):
        return struct.pack('>I', len(d)) + t + d + struct.pack('>I', zlib.crc32(t + d) & 0xffffffff)
    raw = b''.join(b'\0' + bytes(pixels[y * w:(y + 1) * w]) for y in range(h))
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 3, 0, 0, 0))
    png += chunk(b'PLTE', b''.join(bytes(c) for c in palette))
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
        if len(p) >= 2:
            names[int(p[0], 16) & ~1] = p[1]
    rom = g.rom
    for c in range(0x40):
        init = struct.unpack_from('<I', rom.d, 0x713FD0 + 16 * c)[0] & ~1
        n = names.get(init, '')
        if n.startswith('init_'):
            g.class_names[c] = n[5:]
    return g


def extract(rom_path):
    g = make_gen(rom_path)
    rom = g.rom.d
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
        elif typ in ('objects', 'sdata'):
            open(path, 'w').write('\n'.join(g.asset_text(off)) + '\n')
        else:
            open(path, 'wb').write(data)
        count[typ] = count.get(typ, 0) + 1
    open(os.path.join(SRC, 'README.txt'), 'w').write(
        'Generated from your baserom.gba by `make extract` (tools/assets.py).\n'
        'Edit these files and run `make`; see config/assets.txt for offsets and types.\n')
    print('extracted %d assets into assets/: %s' % (len(assets), ', '.join(
        '%d %s' % (v, k) for k, v in sorted(count.items()))))


# ------------------------------------------------------------------- build --
def build():
    assets = load_manifest()
    made = 0
    for off, size, typ, name in assets:
        if typ in ('objects', 'sdata'):
            continue
        src = os.path.join(SRC, name + EXT[typ])
        dst = os.path.join(OUT, name + '.bin')
        if not os.path.exists(src):
            raise SystemExit('missing %s -- run `make extract` first' % os.path.relpath(src, ROOT))
        if os.path.exists(dst) and os.path.getmtime(dst) >= os.path.getmtime(src) and \
                os.path.getmtime(dst) >= os.path.getmtime(MANIFEST):
            continue
        if typ == 'pal':
            data = text_to_pal(open(src).read(), src)
        elif typ in ('tiles4', 'tiles8'):
            bpp = 4 if typ == 'tiles4' else 8
            n = (size - 2) // (32 if bpp == 4 else 64)
            w, h, px = png_read(src)
            data = struct.pack('<H', n) + pixels_to_tiles(w, h, px, bpp, n, src)
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
