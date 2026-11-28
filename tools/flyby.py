#!/usr/bin/env python3
"""
A level's flyby camera path (level header +0x54, +0x58 for Reverse and the
flyby editor's mode 4): camera_op_set(1) hands it to cam_path_load, and
cam_path_eval flies the camera along it as a cubic spline (the course
flyby before a race, the debug menu's Flyby).

  s16 count
  point[count], 12 bytes:
    s16 x, y, z       camera position (object-list units; cam_path_load
                      shifts them << 8)
    s16 pitch, yaw    camera angles (16-bit)
    s16 speed         128 normally (cam_path_append uses 0x80 too)
  s16 0               padding

make extract writes it as assembly with the flyby_point macro.
"""
import struct


def size(rom, off):
    return 4 + 12 * struct.unpack_from('<h', rom, off)[0]


def to_asm(rom, off, name):
    n = struct.unpack_from('<h', rom, off)[0]
    out = ['@ %s: flyby camera path (tools/flyby.py describes the format)' % name, '',
           '\t.2byte %d   @ count' % n, '', '@\t\t      x,    y,     z,  pitch,    yaw, speed']
    for i in range(n):
        x, y, z, pitch, yaw, speed = struct.unpack_from('<6h', rom, off + 2 + 12 * i)
        out.append('\tflyby_point %5d, %4d, %5d, %6d, %6d, %3d   @ %d' % (x, y, z, pitch, yaw, speed, i))
    out += ['', '\t.2byte 0   @ padding']
    return out
