#!/usr/bin/env python3
"""
The CPU racers' path in a level (level header +0x38, +0x3C for Reverse):
format, exact size, and the assembly text `make extract` writes
(assets/levels/NN/ai_path.s, built with the ai_* macros of asm/macros.inc).

  u16 flags          0, or 0xFFFF in the boss levels
  s16 count          number of nodes
  node[count]        0x2C bytes each
  link[...]          {u16 node, u16 weight}; node i owns the links
                     first .. first + n - 1 (sum of n entries in all)

A node is a gate across the track (aiPlayerInit, ai_choose_next_node,
comp_path_gates, boss_path_gates, racer_ai_drive):

  +0x00  s16 x, y, z     a point on the track (object-list units)
  +0x06  u16 first       index of its first link
  +0x08  u16 n           number of next nodes (more than 1 = the path branches)
  +0x0A  s16 angle       direction of the track (16-bit angle)
  +0x0C  u16 a, b, c     three values 0..255 (mostly 0, 50 or 255)
  +0x12  u8  f0, f1      flags (0/1)
  +0x14  s16 ex, ez      the other end of the gate (the gate runs from x, z to ex, ez)
  +0x18  s16 ox, oz      offset from x, z to the far side of the track
  +0x1C  s16 nx, nz      the gate line's normal (length 256)
  +0x20  s32 d           nx * x + nz * z + d = 0 on the gate line; a racer is
                         past the gate when the sum is negative
  +0x24  u32 bias        32768 +- a multiple of 2500 (an offset; meaning not known)
  +0x28  u8  g0..g3      flags (0/1)

A link's weight is 255 when it is the only way on; at a branch the weights
(25, 55, 125, 200, ...) are the odds racer_ai_drive picks it with.
"""
import struct


def size(rom, off):
    """Exact size in bytes of the path at ROM offset off."""
    _, n = struct.unpack_from('<Hh', rom, off)
    if n <= 0:
        return 4
    nl = max(struct.unpack_from('<HH', rom, off + 4 + 0x2C * i + 6)[0] +
             struct.unpack_from('<HH', rom, off + 4 + 0x2C * i + 6)[1] for i in range(n))
    return 4 + 0x2C * n + 4 * nl


def to_asm(rom, off, name):
    flags, n = struct.unpack_from('<Hh', rom, off)
    out = ['@ %s: the CPU racers\' path (tools/aipath.py describes the format)' % name, '',
           '\tai_path_header 0x%04X, %d' % (flags, n), '',
           '@\t\tx, y, z, first link, links, angle, a, b, c, f0, f1, ex, ez, ox, oz, nx, nz, d, bias, g0, g1, g2, g3']
    nl = 0
    for i in range(n):
        o = off + 4 + 0x2C * i
        x, y, z, first, cnt, ang, a, b, c = struct.unpack_from('<3h2Hh3H', rom, o)
        f0, f1 = rom[o + 0x12], rom[o + 0x13]
        ex, ez, ox, oz, nx, nz = struct.unpack_from('<6h', rom, o + 0x14)
        d, bias = struct.unpack_from('<iI', rom, o + 0x20)
        g = rom[o + 0x28:o + 0x2C]
        out.append('\tai_node %5d, %4d, %5d, %3d, %d, %6d, %3d, %3d, %3d, %d, %d, %5d, %5d, %5d, %5d, %4d, %4d, %8d, %5d, %d, %d, %d, %d   @ %d'
                   % (x, y, z, first, cnt, ang, a, b, c, f0, f1, ex, ez, ox, oz, nx, nz, d, bias, g[0], g[1], g[2], g[3], i))
        nl = max(nl, first + cnt)
    out += ['', '@\t\tnode, weight']
    for k in range(nl):
        node, w = struct.unpack_from('<HH', rom, off + 4 + 0x2C * n + 4 * k)
        out.append('\tai_link %3d, %3d   @ %d' % (node, w, k))
    return out
