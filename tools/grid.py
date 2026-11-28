#!/usr/bin/env python3
"""
Map grids in the level header: {u16 width, u16 height, u16 cell[w * h]}.

  +0x14 ground      the ground under the track, in blocks of 4 x 4 tiles:
                    a cell is the number of a block in gGroundBlocks
                    (0x081136E0, 16 bytes = 16 tile numbers each, shared by
                    every level); ovl_a_render copies the blocks around the
                    camera into the affine BG map (0x06008000), clamping at
                    the map's edges. 32 x 32 to 256 x 256 blocks.
  +0x1C, +0x20, +0x24 horizon_a/b/c   small maps (16..32 x 3..5) that the
                    overlays scroll with wrap-around as the camera turns
                    (ovl_a_stream_map): the horizon; the cells are not plain
                    text-BG entries, so their format is not known yet

make extract writes them as text (assets/levels/NN/<name>.txt: "size W H",
then one row of cells per line) and the ground also as a preview PNG
(<name>_preview.png, drawn with the level's tileset bg_a and palette; not
read back). The build converts the text back.

  grid.py build in.txt out.bin
"""
import struct, sys

GROUND_BLOCKS = 0x1136E0


def size(rom, off):
    w, h = struct.unpack_from('<HH', rom, off)
    return 4 + 2 * w * h


def to_text(rom, off, name):
    w, h = struct.unpack_from('<HH', rom, off)
    cells = struct.unpack_from('<%dH' % (w * h), rom, off + 4)
    out = ['# %s: %d x %d cells (tools/grid.py describes the format)' % (name, w, h), 'size %d %d' % (w, h)]
    for y in range(h):
        out.append(' '.join('%d' % c for c in cells[y * w:(y + 1) * w]))
    return '\n'.join(out) + '\n'


def from_text(text, where='grid'):
    rows, w, h = [], None, None
    for ln, line in enumerate(text.split('\n'), 1):
        line = line.split('#')[0].split()
        if not line:
            continue
        if line[0] == 'size':
            w, h = int(line[1]), int(line[2])
            continue
        row = [int(v) for v in line]
        if w is None or len(row) != w:
            raise SystemExit('%s line %d: expected %s cells' % (where, ln, w))
        rows.append(row)
    if len(rows) != h:
        raise SystemExit('%s: %d rows, size says %d' % (where, len(rows), h))
    return struct.pack('<HH', w, h) + b''.join(struct.pack('<%dH' % w, *r) for r in rows)


def ground_preview(rom, off, tiles, pal):
    """(width, height, pixels, palette) of the ground drawn with tileset
    `tiles` (u16 count + 8bpp tiles) and the 256-colour palette `pal`."""
    w, h = struct.unpack_from('<HH', rom, off)
    nt = struct.unpack_from('<H', rom, tiles)[0]
    W, Hh = w * 32, h * 32
    px = bytearray(W * Hh)
    for by in range(h):
        for bx in range(w):
            b = struct.unpack_from('<H', rom, off + 4 + 2 * (by * w + bx))[0]
            blk = rom[GROUND_BLOCKS + 16 * b:GROUND_BLOCKS + 16 * b + 16]
            for k in range(16):
                t = blk[k]
                if t >= nt:
                    continue
                td = rom[tiles + 2 + 64 * t:tiles + 2 + 64 * t + 64]
                ox, oy = bx * 32 + (k & 3) * 8, by * 32 + (k >> 2) * 8
                for row in range(8):
                    s = (oy + row) * W + ox
                    px[s:s + 8] = td[row * 8:row * 8 + 8]
    cols = []
    for i in range(256):
        c = struct.unpack_from('<H', rom, pal + 2 * i)[0]
        cols.append(((c & 31) * 255 // 31, (c >> 5 & 31) * 255 // 31, (c >> 10 & 31) * 255 // 31))
    return W, Hh, px, cols


if __name__ == '__main__' and sys.argv[1] == 'build':
    open(sys.argv[3], 'wb').write(from_text(open(sys.argv[2]).read(), sys.argv[2]))
