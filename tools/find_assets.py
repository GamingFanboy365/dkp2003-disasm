#!/usr/bin/env python3
"""
Build the asset manifest (config/assets.txt) from the game's own tables.

The manifest only lists offsets, sizes and types -- no game content.  The
assets themselves are written by `tools/assets.py extract` (make extract)
from the user's baserom.gba.

Sources:
  * level headers     0x087146C0, 34 x 0x94  (palette, tilesets, objects, data)
  * track records     0x08051D40, 48 x 0x2C  (palettes, sky gradient, map, theme)
  * sprite table      0x08713650, 152 x 0x10 ({gfx, palette, 0, type})
  * hints from an mGBA DMA survey (front-end tilesets/tilemaps, palettes)

Asset types:
  pal       BGR555 palette                    -> assets/<name>.pal (JASC-PAL)
  tiles4/8  u16 tile count + 4bpp/8bpp tiles  -> assets/<name>.png (indexed)
  objects   level object list {x,y,z,info*}   -> assets/<name>.s
  sdata     table containing pointers         -> assets/<name>.s
  gfx       pointer-free graphics (Rare sprite/image formats, tilemaps)
                                              -> assets/<name>.bin
  bin       anything else                     -> assets/<name>.bin

pal/tiles/gfx assets are known to contain no pointers; tools/gen_asm.py
skips them when it looks for pointers in data (graphics produce many
0x08xxxxxx look-alikes).

Usage: find_assets.py baserom.gba build/db.json config/dkp.cfg > config/assets.txt
"""
import sys, os, struct, json, io, contextlib, bisect

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import gen_asm  # noqa: E402
from analyze import parse_cfg, ROM, ROM_BASE  # noqa: E402

LEVELS = 0x7146C0
LEVEL_SIZE = 0x94
NLEVELS = 34
TRACKS = 0x51D40
TRACK_SIZE = 0x2C
NTRACKS = 48
SPRITES = 0x713650
NSPRITES = 152

# level header fields: offset -> (name, type)
LEVEL_FIELDS = {0x00: ('palette', 'pal'), 0x04: ('bg_a', 'tiles8'), 0x08: ('bg_b', 'bin'),
                0x0C: ('bg_c', 'tiles4'), 0x10: ('bg_d', 'tiles8'), 0x14: ('data_14', 'bin'),
                0x1C: ('data_1c', 'bin'), 0x20: ('data_20', 'bin'), 0x24: ('data_24', 'bin'),
                0x34: ('objects', 'objects')}
for off in range(0x38, 0x74, 4):
    LEVEL_FIELDS[off] = ('data_%02x' % off, 'bin')

# track record fields
TRACK_FIELDS = {0x0C: ('palette', 'pal'), 0x10: ('sky', 'pal'), 0x14: ('map', 'gfx'),
                0x18: ('pal16', 'pal'), 0x1C: ('theme', 'gfx'), 0x20: ('theme_pal', 'pal'),
                0x28: ('extra', 'bin')}

# from the DMA survey (tools/emu): front-end tilesets (offset of the u16 count)
FRONTEND_TILESETS = [(0x081D02, 4), (0x0A698E, 4), (0x0AE810, 4), (0x0AFD52, 8)]
FRONTEND_TILEMAPS = [0x1B885C, 0x1BEF14]

POINTER_FREE = ('pal', 'tiles4', 'tiles8', 'gfx')


def main():
    rom_path, db_path, cfg_path = sys.argv[1:4]
    data = open(rom_path, 'rb').read()
    cfg = parse_cfg(cfg_path)
    rom = ROM(data, cfg)
    db = json.load(open(db_path))
    # pass 1 without exclusions, pass 2 with the pointer-free assets of pass 1
    out = None
    for _ in range(2):
        noptr = [(o, o + s) for o, s, t, n in out if t in POINTER_FREE] if out else []
        with contextlib.redirect_stderr(io.StringIO()):
            g = gen_asm.Gen(rom, db, cfg, set(), {}, [], {}, noptr=noptr)
        out = collect(g, data)
    write(out)


def collect(g, data):
    u32 = lambda o: struct.unpack_from('<I', data, o)[0]  # noqa: E731
    u16 = lambda o: struct.unpack_from('<H', data, o)[0]  # noqa: E731

    assets = {}          # offset -> [name, size, type]

    def add(off, name, typ, size=None):
        if off in assets:
            return assets[off][0]
        assets[off] = [name, size, typ]
        return name

    def ptr(o):
        v = u32(o)
        return v - ROM_BASE if ROM_BASE <= v < ROM_BASE + len(data) else None

    # --- tables themselves (emitted as .s with symbols) ---
    add(LEVELS, 'levels/level_headers', 'sdata', NLEVELS * LEVEL_SIZE)
    add(TRACKS, 'levels/track_records', 'sdata', NTRACKS * TRACK_SIZE)
    add(SPRITES, 'graphics/sprites/sprite_table', 'sdata', NSPRITES * 16)

    # --- levels ---
    for L in range(1, NLEVELS):
        base = LEVELS + L * LEVEL_SIZE
        for off, (fname, typ) in sorted(LEVEL_FIELDS.items()):
            p = ptr(base + off)
            if p is None:
                continue
            if typ == 'pal':
                add(p, 'levels/%02d/%s' % (L, fname), 'pal', 0x200)
            elif typ in ('tiles4', 'tiles8'):
                n = u16(p)
                add(p, 'levels/%02d/%s' % (L, fname), typ, 2 + n * (32 if typ == 'tiles4' else 64))
            else:
                add(p, 'levels/%02d/%s' % (L, fname), typ)
    # --- tracks ---
    for t in range(NTRACKS):
        base = TRACKS + t * TRACK_SIZE
        tid = u32(base)
        if tid == 0:
            break
        for off, (fname, typ) in sorted(TRACK_FIELDS.items()):
            p = ptr(base + off)
            if p is None:
                continue
            size = {'palette': 0x200, 'sky': 0x100, 'pal16': 0x20, 'theme_pal': 0x20}.get(fname)
            add(p, 'levels/tracks/%02x_%s' % (tid, fname), typ, size)
    # --- sprites ---
    for k in range(1, NSPRITES):
        e = SPRITES + 16 * k
        gp, pp = ptr(e), ptr(e + 4)
        if gp is not None:
            add(gp, 'graphics/sprites/%03d' % k, 'gfx')
        if pp is not None:
            add(pp, 'graphics/sprites/%03d' % k, 'pal', 0x20)
    # --- front end ---
    for off, bpp in FRONTEND_TILESETS:
        n = u16(off)
        add(off, 'graphics/frontend/tiles_%06x' % off, 'tiles%d' % bpp, 2 + n * 32 * (bpp // 4))
    for off in FRONTEND_TILEMAPS:
        add(off, 'graphics/frontend/tilemap_%06x' % off, 'gfx', 0x800)

    # --- resolve sizes: an asset ends at the next asset start or data label ---
    bounds = sorted(set(assets) | set(g.dlabel) | {g.code_end, len(data)} |
                    {s for s in range(0x100000, len(data), 0x100000)})
    out = []
    for off in sorted(assets):
        name, size, typ = assets[off]
        k = bisect.bisect_right(bounds, off)
        nxt = bounds[k] if k < len(bounds) else len(data)
        # never run into the next asset
        nxt_asset = min([a for a in assets if a > off] + [len(data)])
        if size is None:
            size = nxt - off
        size = min(size, nxt_asset - off)
        if typ == 'objects':
            # {x, y, z, info*} records with a class byte behind info
            n = 0
            while off + 16 * (n + 1) <= nxt_asset:
                x, y, z, p = struct.unpack_from('<4I', data, off + 16 * n)
                if not (ROM_BASE <= p < ROM_BASE + len(data)) or not (1 <= data[p - ROM_BASE] <= 0x39):
                    break
                n += 1
            size = 16 * n
            if data[off + size:off + size + 16] == bytes(16):
                size += 16          # include the all-zero terminator record
        if off < g.code_end or size <= 0:
            continue
        # binary assets must not contain pointers (they would be frozen)
        has_ptr = any(o in g.dptr for o in range(off - off % 4, off + size, 4) if o >= off)
        if typ == 'bin' and has_ptr:
            typ = 'sdata'
        # palettes/tiles with bit patterns we cannot represent go to bin
        if typ == 'pal' and (size % 2 or any(struct.unpack_from('<H', data, off + 2 * i)[0] & 0x8000
                                             for i in range(size // 2))):
            typ = 'bin'
        if typ in ('tiles4', 'tiles8') and (size - 2) % (32 if typ == 'tiles4' else 64):
            typ = 'bin'
        out.append((off, size, typ, name))
    return out


def write(out):
    # names must be unique: append the offset to duplicates (shared data)
    seen = {}
    lines = ['# Asset manifest: <rom offset> <size> <type> <name>', '# generated by tools/find_assets.py', '']
    for off, size, typ, name in out:
        if name in seen:
            name = '%s_%06x' % (name, off)
        seen[name] = off
        lines.append('0x%06X 0x%06X %-8s %s' % (off, size, typ, name))
    print('\n'.join(lines))
    tot = sum(s for o, s, t, n in out)
    by = {}
    for o, s, t, n in out:
        by[t] = by.get(t, 0) + s
    print('%d assets, %d bytes: %s' % (len(out), tot, ', '.join('%s %d' % kv for kv in sorted(by.items()))),
          file=sys.stderr)


if __name__ == '__main__':
    main()
