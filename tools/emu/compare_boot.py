#!/usr/bin/env python3
"""
Play the same inputs on two ROMs from power-on to the start of a race
(English -> Single Player -> Cups -> Diddy -> Klap Trap Kup -> Race) and
compare screenshots every N frames.

Usage: compare_boot.py a.gba b.gba [step]      exit 1 on the first difference
"""
import sys, os, subprocess, tempfile
from PIL import Image, ImageChops

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, '..', '..'))
DKPRUN = os.environ.get('DKPRUN', os.path.join(ROOT, 'build', 'emu', 'dkprun'))


def inputs():
    ev = [(900, '')]
    for k in ('A', 'A', 'A', 'START'):
        ev += [(4, k), (8, ''), (120, '')]
    ev += [(4, 'A'), (8, ''), (180, '')]
    for _ in range(24):
        ev += [(4, 'A'), (40, '')]
    ev += [(300, '')]
    for n, k in ev:
        for _ in range(n):
            yield k


def run(rom, outdir, tag, step):
    lines, shots = [], []
    for f, k in enumerate(inputs(), 1):
        lines.append('run 1 %s' % k)
        if f % step == 0:
            p = os.path.join(outdir, '%s_%05d.png' % (tag, f))
            lines.append('shot ' + p)
            shots.append((f, p))
    subprocess.run([DKPRUN, rom], input='\n'.join(lines) + '\n', text=True, check=True, capture_output=True)
    return shots


def main():
    a, b = sys.argv[1], sys.argv[2]
    step = int(sys.argv[3]) if len(sys.argv) > 3 else 30
    with tempfile.TemporaryDirectory() as td:
        sa = run(a, td, 'a', step)
        sb = run(b, td, 'b', step)
        for (f, pa), (_, pb) in zip(sa, sb):
            if ImageChops.difference(Image.open(pa).convert('RGB'), Image.open(pb).convert('RGB')).getbbox():
                print('screens differ first at frame %d' % f)
                return 1
    print('screens identical at every %d frames up to frame %d (race start)' % (step, sa[-1][0]))
    return 0


if __name__ == '__main__':
    sys.exit(main())
