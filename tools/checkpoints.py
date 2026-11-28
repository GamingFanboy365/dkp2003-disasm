#!/usr/bin/env python3
"""
A level's checkpoints (level header +0x5C, +0x60 for Reverse; read by
init_race_monitor, race_check_checkpoint, race_update_progress).

  u32 count
  checkpoint[count], 16 bytes:
    s16 x, z        a point on the line (object-list units)
    s16 next, prev  the checkpoints after and before it (a loop)
    s16 nx, nz      the line's normal, length 256
    s32 d           nx * x + nz * z + d = 0 on the line

Checkpoint 0 is the start/finish line. A racer starts with checkpoint 0's
`prev` as its last one (obj+0x11A), so the next line to cross is the finish.
It passes a line when nx * x + nz * z + d changes sign between last frame's
position and this frame's (race_check_checkpoint); race_update_progress
turns the checkpoints into laps. The battle arenas have none.

make extract writes them as assembly with the `checkpoint` macro.
"""
import struct


def size(rom, off):
    return 4 + 16 * struct.unpack_from('<I', rom, off)[0]


def to_asm(rom, off, name):
    n = struct.unpack_from('<I', rom, off)[0]
    out = ['@ %s: checkpoint lines (tools/checkpoints.py describes the format)' % name, '',
           '\t.4byte %d   @ count' % n, '',
           '@\t\t   x,     z, next, prev,   nx,   nz,        d']
    for i in range(n):
        x, z, nxt, prv, nx, nz, d = struct.unpack_from('<4h2hi', rom, off + 4 + 16 * i)
        out.append('\tcheckpoint %5d, %5d, %3d, %3d, %4d, %4d, %8d   @ %d%s'
                   % (x, z, nxt, prv, nx, nz, d, i, ' (start/finish)' if i == 0 else ''))
    return out
