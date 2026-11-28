#!/usr/bin/env python3
"""
Sprite animation scripts: decode into assembly with the anim_* macros of
asm/macros.inc (assets/graphics/sprites/anims.s).

A script is a byte string run by anims_update (one player per sprite,
gAnims). A byte below 0xFF shows that frame of the sprite for the current
delay; 0xFF starts a command:

  FF 00 s16   anim_goto target   continue at the s16's address + s16
  FF 01 n     anim_delay n       frames per animation frame
  FF 02       anim_stop          stop (sets flag bit 1)
  FF 03       anim_done          set flag bit 0 (usually before a held last frame)
  FF 04       anim_restart       clear flag bit 1

Scripts start where the sprite table's third word points.  The block also
holds three scripts nothing points to (unused animations).
"""
import struct


def parse(rom, off, size, labels):
    """-> list of lines.  labels: {rom offset: name} of labels that must
    exist (referenced from outside); jump targets get local labels."""
    end = off + size
    items, targets = [], set()
    i = off
    while i < end:
        b = rom[i]
        if b != 0xFF:
            items.append((i, 'frame', b))
            i += 1
            continue
        c = rom[i + 1]
        if c == 0:
            rel = struct.unpack_from('<h', rom, i + 2)[0]
            t = i + 2 + rel
            targets.add(t)
            items.append((i, 'goto', t))
            i += 4
        elif c == 1:
            items.append((i, 'delay', rom[i + 2]))
            i += 3
        elif c in (2, 3, 4):
            items.append((i, {2: 'stop', 3: 'done', 4: 'restart'}[c], None))
            i += 2
        else:
            raise ValueError('unknown animation command %02X at 0x%06X' % (c, i))
    if i != end:
        raise ValueError('animation block does not end on a command boundary')
    names = dict(labels)
    for t in targets:
        names.setdefault(t, '.Lanim_%06X' % t)
    out = ['@ Sprite animation scripts (tools/anim.py has the format); the build',
           '@ includes this file.  Frame numbers, anim_delay, anim_goto, anim_stop,',
           '@ anim_done, anim_restart.', '']
    frames = []

    def flush():
        if frames:
            out.append('\tanim_frames ' + ', '.join(str(f) for f in frames))
            frames.clear()
    starts = {off} | {p + (4 if k == 'goto' else 2) for p, k, v in items if k in ('goto', 'stop')}
    for pos, kind, val in items:
        if pos in starts and pos not in labels and pos < end:
            flush()
            out.append('@ unused: nothing points to this script')
        if pos in names:
            flush()
            if not names[pos].startswith('.L'):
                out.append('\t.global %s' % names[pos])
            out.append('%s:' % names[pos])
        if kind == 'frame':
            frames.append(val)
            continue
        flush()
        if kind == 'goto':
            out.append('\tanim_goto %s' % names[val])
        elif kind == 'delay':
            out.append('\tanim_delay %d' % val)
        else:
            out.append('\tanim_%s' % kind)
        if kind in ('goto', 'stop'):
            out.append('')
    flush()
    return out
