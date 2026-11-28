#!/usr/bin/env python3
"""
A level's track edges (level header +0x44 inside, +0x48 outside, +0x4C /
+0x50 the same for Reverse; playerInit, player_track_edges): the walls
that keep the planes on the track. The battle arenas have only an outside
edge. playerInit refuses more than 99 inside edges ("not enough edge mask
space for %d inside edges").

  u32 count
  edge[count], 13 words:
    s32 nx, nz, d       the edge's line: normal (length 256) and constant
    s32 cx, cz, cd      a second line across the edge (at its corner)
    s32 x0, z0, x1, z1  the segment, << 8 (each edge starts where the one
                        before ended)
    s32 dx, dz          the segment's direction, 16.16 (length 65536)
    u16 next, prev      the neighbouring edges (a loop)

make extract writes them as assembly with the track_edge macro (points in
whole units; the macro shifts them).
"""
import struct


def size(rom, off):
    return 4 + 52 * struct.unpack_from('<I', rom, off)[0]


def to_asm(rom, off, name):
    n = struct.unpack_from('<I', rom, off)[0]
    out = ['@ %s: track edges (tools/edges.py describes the format)' % name, '',
           '\t.4byte %d   @ count' % n, '',
           '@\t\t     x0,    z0,    x1,    z1,   nx,   nz,        d,   cx,   cz,        cd,     dx,     dz, next, prev']
    for i in range(n):
        w = struct.unpack_from('<12i', rom, off + 4 + 52 * i)
        nxt, prv = struct.unpack_from('<HH', rom, off + 4 + 52 * i + 48)
        x0, z0, x1, z1 = (v >> 8 for v in w[6:10])
        out.append('\ttrack_edge %5d, %5d, %5d, %5d, %4d, %4d, %8d, %4d, %4d, %9d, %6d, %6d, %3d, %3d   @ %d'
                   % (x0, z0, x1, z1, w[0], w[1], w[2], w[3], w[4], w[5], w[10], w[11], nxt, prv, i))
    return out
