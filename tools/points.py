#!/usr/bin/env python3
"""
Point lists in the level header: the autopilot booster's path (+0x6C, +0x70
Reverse; player_touch_booster_autopilot, plane_autopilot) and the race
camera's points (+0x64, +0x68 Reverse; init_camera).

  u32 count
  point[count], 12 bytes:
    s16 x, y, z     a point (object-list units)
    s16 next        the next point (the camera's lists loop; an autopilot
                    path runs to its end)
    s16 a, b        two small values (a: 0..9 for the camera, 0..9 along an
                    autopilot path; b almost always 0); not known yet

make extract writes them as assembly with the path_point macro.
"""
import struct


def size(rom, off):
    return 4 + 12 * struct.unpack_from('<I', rom, off)[0]


def to_asm(rom, off, name):
    n = struct.unpack_from('<I', rom, off)[0]
    out = ['@ %s: points (tools/points.py describes the format)' % name, '',
           '\t.4byte %d   @ count' % n, '', '@\t\t     x,    y,     z, next, a, b']
    for i in range(n):
        x, y, z, nxt, a, b = struct.unpack_from('<6h', rom, off + 4 + 12 * i)
        out.append('\tpath_point %5d, %4d, %5d, %3d, %d, %d   @ %d' % (x, y, z, nxt, a, b, i))
    return out
