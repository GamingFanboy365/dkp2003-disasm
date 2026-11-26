#!/usr/bin/env python3
"""
Reproduce the "endless zinger buzz" bug (see patches/README.md) from power-on.

  boot -> menus (English, Single Player, Cups, Diddy, Klap Trap Kup, Race)
       -> autopilot through lap 1 of Steamy Swoop
       -> every CPU racer is given a purple (red) zinger; one homes on you
       -> the player is nudged so the zipper is taken just as the zinger strikes
       -> log the 4 gamesfx voices for ~40 s and look for a stuck sound 0xDD

Usage: repro_zinger_buzz.py [rom.gba]     (default: ../../baserom.gba)
Needs the dkprun harness (see tools/emu/README.md).  Exit status 1 if the
stuck buzz is present, 0 if not.
"""
import sys, os, math, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from drv import Emu, S
from auto import Pilot, make_path, P
import analyze_vlog

HERE = os.path.dirname(os.path.abspath(__file__))
PDA = 0x02021E18
BUZZ = 0xDD


def main():
    rom = os.path.abspath(sys.argv[1]) if len(sys.argv) > 1 else os.path.join(HERE, '..', '..', 'baserom.gba')
    os.makedirs(S, exist_ok=True)
    tag = os.path.splitext(os.path.basename(rom))[0]
    tr = json.load(open(os.path.join(HERE, 'comp_tracks.json')))
    path, zi = make_path(tr['0x200474c'])
    e = Emu(rom)
    # --- menus (frame-exact sequence) ---
    e.run(900)
    for k in ('A', 'A', 'A', 'START'):
        e.cmd('tap %s' % k); e.run(120)
    e.cmd('tap A'); e.run(180)
    for _ in range(24):
        e.cmd('tap A 4 40')
    e.run(300)
    # --- lap 1 up to frame 600 ---
    pl = Pilot(e, path); pl.zi = zi
    for f in range(0, 601, 2):
        pl.step()
        if pl.idx >= len(path) - 8:
            pl.idx = 0
    # --- give every CPU racer a red (purple) zinger ---
    pl = Pilot(e, path); pl.zi = zi; pl.idx = 60
    for a, c, p in e.objs():
        if c == 2:
            w = e.r32(a + 0x108)
            e.poke(a + 0x108, (w & 0xffff) | (3 << 16))      # weapon slot = red zinger
            e.poke(a + 0xa0, e.r32(a + 0xa0) | 1)           # "has weapon"
    for f in range(600, 701, 2):
        pl.step()
    pl = Pilot(e, path); pl.zi = zi; pl.idx = 95
    for f in range(700, 785, 2):
        pl.step()
    # --- nudge forward so the zipper is entered as the zinger strikes ---
    pl = Pilot(e, path); pl.zi = zi; pl.idx = 125
    x, y, z = e.pos(P)
    h16 = (e.r32(P + 0x54) >> 16) & 0xffff
    cur = -math.pi / 2 - (h16 - 0x8000) * 2 * math.pi / 65536
    e.poke(P + 0x24, int(x + 4000 * math.cos(cur)))
    e.poke(P + 0x2c, int(z + 4000 * math.sin(cur)))
    vlog = os.path.join(S, 'vlog_%s.txt' % tag)
    e.cmd('vlog ' + vlog)
    ev = []
    pb, ph = e.peek(PDA + 0x24)[0], e.peek(PDA + 0x54)[0]
    for f in range(784, 784 + 2400, 2):
        pl.step()
        if pl.idx >= len(path) - 8:
            pl.idx = 0
        b, h = e.peek(PDA + 0x24)[0], e.peek(PDA + 0x54)[0]
        if b != pb: ev.append((f, 'boost', pb, b)); pb = b
        if h != ph: ev.append((f, 'hit', ph, h)); ph = h
    e.cmd('vlog off'); e.sync(); e.close()
    print('events:', ev[:6])
    starts, last, end = analyze_vlog.summarize(vlog)
    stuck = [(i, s) for i, s in starts.items() if s[1] == BUZZ and last[i] == end]
    for i, (f0, snd, v) in sorted(starts.items(), key=lambda t: t[1][0]):
        if snd == BUZZ:
            print('  sound 0xDD id %s: frames %d..%d%s' % (i, f0, last[i], '  STILL PLAYING' if last[i] == end else ''))
    if stuck:
        print('RESULT: endless zinger buzz PRESENT (%s)' % rom)
        return 1
    print('RESULT: no stuck zinger buzz (%s)' % rom)
    return 0


if __name__ == '__main__':
    sys.exit(main())
