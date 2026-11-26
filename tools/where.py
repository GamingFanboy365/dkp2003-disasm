#!/usr/bin/env python3
"""Show the generated source lines covering a ROM range.
Usage: where.py <rom_offset_or_address> [length]"""
import sys, re, glob


def main():
    a = int(sys.argv[1], 0) & 0x01FFFFFF
    n = int(sys.argv[2], 0) if len(sys.argv) > 2 else 0x40
    for fn in sorted(glob.glob('asm/*.s') + glob.glob('data/*.s')):
        lines = open(fn).read().split('\n')
        m = re.match(r'@ \S+: ROM 0x([0-9A-F]+)-0x([0-9A-F]+)', lines[0])
        if not m:
            continue
        lo, hi = int(m.group(1), 16), int(m.group(2), 16)
        if not (lo <= a < hi) or not fn.startswith('data/'):
            continue
        pos = lo
        for k, l in enumerate(lines):
            t = l.strip()
            size = 0
            mi = re.match(r'\.incbin "baserom.gba", 0x([0-9A-F]+), 0x([0-9A-F]+)', t)
            if mi:
                pos = int(mi.group(1), 16); size = int(mi.group(2), 16)
            elif t.startswith('.4byte'):
                size = 4
            elif t.startswith('.byte'):
                size = len(t[5:].split(','))
            if size and pos + size > a and pos < a + n:
                print('%s:%d  %06X  %s' % (fn, k + 1, pos, t[:100]))
            elif t.endswith(':') and a <= pos < a + n:
                print('%s:%d  %06X  %s' % (fn, k + 1, pos, t))
            pos += size
        return
    print('not in a data file')


if __name__ == '__main__':
    main()
