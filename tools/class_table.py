#!/usr/bin/env python3
"""
Name object-class handlers from the class table.

The game keeps a table of 16-byte entries at 0x08713FD0, indexed by object
class (the byte at obj+2):  { init, act, react, free }  (Thumb pointers).
init/act/react are used by obj_initialise / obj_add_process / the hit code,
free by obj_really_free.  Most init_* functions are already named from
__FUNCTION__ strings, so the other three slots of the same class get the
matching suffix.

Usage: class_table.py baserom.gba config/symbols.txt
Prints new "address name" lines (for config/symbols.txt) to stdout.
"""
import sys, struct

TABLE = 0x713FD0
NCLASS = 0x40
SLOTS = ('init', 'act', 'react', 'free')


def main():
    rom = open(sys.argv[1], 'rb').read()
    names = {}
    for l in open(sys.argv[2]):
        p = l.split('#')[0].split()
        if len(p) >= 2:
            names[int(p[0], 16)] = p[1]
    taken = set(names.values())
    out = []
    for c in range(NCLASS):
        ent = struct.unpack_from('<4I', rom, TABLE + 16 * c)
        if not all(v == 0 or (v & 1 and 0x08000000 <= v < 0x08040000) for v in ent):
            break
        init = ent[0] & ~1
        base = None
        if init in names and names[init].startswith('init_'):
            base = names[init][5:]
        for slot, v in zip(SLOTS, ent):
            a = v & ~1
            if not v or a in names:
                continue
            nm = '%s_%s' % (slot, base) if base else '%s_class%02d' % (slot, c)
            if nm in taken:
                nm += '_%02d' % c
            taken.add(nm)
            names[a] = nm
            out.append('0x%08X %s   # class %d %s' % (a, nm, c, slot))
    print('\n'.join(out))


if __name__ == '__main__':
    main()
