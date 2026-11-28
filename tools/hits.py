#!/usr/bin/env python3
"""
A level's hit polygons (level header +0x40; hits_find_play_area,
hits_floor_type, point_in_poly): the areas of the ground, each with a type.

  u32 count
  s32 min x, max x, min z, max z      the play area (hits_find_play_area keeps
                                      them << 8 for the 32 x 32 grid)
  polygon[count]:
    u8  drag, kind                    hits_floor_type returns them; act_player
                                      lowers the top speed by drag x (7 - item
                                      level) x a constant >> 8 while racing
                                      (0 = none, up to 200); kind goes to
                                      obj+0x144
    s16 x, z                          the first vertex
    s16 min x, max x, min z, max z    the polygon's box
    u16 n                             number of vertices (= edges)
    u32 xmask, zmask                  the grid columns / rows the box covers
                                      (bit c: cell c of 32; cell size =
                                      ((max - min) << 8 >> 5) + 1)
    s16 dx, dz [n]                    vertex i+1 = vertex i - (dx, dz); the
                                      last one leads back to the first

Everything but the play area, the types and the vertices follows from them,
so the text form (assets/levels/NN/hits.txt) is just:

  area <min x> <max x> <min z> <max z>
  poly <drag> <kind>  x,z x,z ...

and `make` builds the binary (every one of the 21 files round-trips exactly).

  hits.py totext <rom> <offset> <name>      print the text form
  hits.py build <in.txt> <out.bin>
"""
import struct, sys


def parse(rom, off):
    n = struct.unpack_from('<I', rom, off)[0]
    area = struct.unpack_from('<4i', rom, off + 4)
    polys = []
    o = off + 0x14
    for _ in range(n):
        typ, kind = rom[o], rom[o + 1]
        sx, sz, _, _, _, _, k = struct.unpack_from('<7h', rom, o + 2)
        pts = [(sx, sz)]
        for j in range(k - 1):
            dx, dz = struct.unpack_from('<hh', rom, o + 0x18 + 4 * j)
            pts.append((pts[-1][0] - dx, pts[-1][1] - dz))
        polys.append((typ, kind, pts))
        o += 0x18 + 4 * k
    return area, polys, o - off


def size(rom, off):
    return parse(rom, off)[2]


def to_text(area, polys, name):
    out = ['# %s: hit polygons (tools/hits.py describes the format)' % name,
           '# area: the play area; poly <drag> <kind> then the vertices x,z in order',
           '', 'area %d %d %d %d' % area, '']
    for i, (typ, kind, pts) in enumerate(polys):
        out.append('poly %d %d  %s   # %d' % (typ, kind, ' '.join('%d,%d' % p for p in pts), i))
    return '\n'.join(out) + '\n'


def from_text(text):
    area, polys = None, []
    for ln, line in enumerate(text.split('\n'), 1):
        line = line.split('#')[0].split()
        if not line:
            continue
        try:
            if line[0] == 'area':
                area = tuple(int(v) for v in line[1:5])
            elif line[0] == 'poly':
                pts = [tuple(int(v) for v in p.split(',')) for p in line[3:]]
                if not pts:
                    raise ValueError('a polygon needs vertices')
                polys.append((int(line[1]), int(line[2]), pts))
            else:
                raise ValueError('unknown line')
        except ValueError as e:
            raise SystemExit('line %d: %s' % (ln, e))
    if area is None:
        raise SystemExit('no "area" line')
    return area, polys


def mask(lo, hi, b0, b1):
    # obj_update_sweep_box's test, in the game's fixed point (<< 8)
    lo, size, b0, b1 = lo << 8, (hi - lo) << 8, b0 << 8, b1 << 8
    cell = (size >> 5) + 1
    m = 0
    for c in range(32):
        if b1 >= lo and b0 <= lo + cell:
            m |= 1 << c
        lo += cell
    return m


def build(area, polys):
    out = bytearray(struct.pack('<I4i', len(polys), *area))
    for typ, kind, pts in polys:
        xs, zs = [p[0] for p in pts], [p[1] for p in pts]
        box = (min(xs), max(xs), min(zs), max(zs))
        out += struct.pack('<BB7h', typ, kind, pts[0][0], pts[0][1], *box, len(pts))
        out += struct.pack('<II', mask(area[0], area[1], box[0], box[1]), mask(area[2], area[3], box[2], box[3]))
        for i, p in enumerate(pts):
            q = pts[(i + 1) % len(pts)]
            out += struct.pack('<hh', p[0] - q[0], p[1] - q[1])
    return bytes(out)


def main():
    if sys.argv[1] == 'totext':
        rom = open(sys.argv[2], 'rb').read()
        area, polys, _ = parse(rom, int(sys.argv[3], 0))
        sys.stdout.write(to_text(area, polys, sys.argv[4]))
    elif sys.argv[1] == 'build':
        open(sys.argv[3], 'wb').write(build(*from_text(open(sys.argv[2]).read())))


if __name__ == '__main__':
    main()
