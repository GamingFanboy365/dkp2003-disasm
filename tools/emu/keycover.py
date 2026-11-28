#!/usr/bin/env python3
"""
Which code runs only while a button is held: from a race (Steamy Swoop,
reached with the same menu sequence as repro_zinger_buzz.py), save a state,
then for each button load it, hold the button for 120 frames with coverage
recording on, and compare with holding nothing.

  keycover.py            -> build/emu/kc_<button>.bin, and a report

Found this way: B launches the peashooter (weapon_launch, act_pellet); UP
plays a sound; steering and A change values but run the same code.
"""
import sys, json, os, re, glob
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
os.chdir(os.path.join(HERE, '..', '..'))
from drv import Emu
S='build/emu/'
e=Emu('baserom.gba')
e.run(900)
for k in ('A','A','A','START'):
    e.cmd('tap %s'%k); e.run(120)
e.cmd('tap A'); e.run(180)
for _ in range(24): e.cmd('tap A 4 40')
e.run(700)
e.cmd('save '+S+'race.ss'); e.sync()
for key in ('none','A','B','L','R','LEFT','RIGHT','UP','DOWN','A+B','L+R'):
    e.cmd('load '+S+'race.ss')
    e.cmd('cover '+S+'kc_%s.bin'%key.replace('+','_'))
    e.run(120, '' if key=='none' else key)
    e.cmd('cover off'); e.sync()
e.close()


# report: functions that ran only with each button
db = json.load(open('build/db.json'))
names = {}
for f in glob.glob('asm/*.s'):
    for m in re.finditer(r'^(\w+): @ ([0-9A-F]{8})', open(f).read(), re.M):
        names[int(m.group(2), 16)] = m.group(1)
segs = db['segs']


def vma(o):
    for n, a, b, base in segs:
        if a <= o < b:
            return base + o - a


def ran(path):
    cv = open(path, 'rb').read()
    out = set()
    for o in (int(k) for k in db['funcs']):
        a = vma(o)
        if 0x03003FC8 <= a < 0x03006498:
            continue          # the two ARM overlays share these addresses
        i = (a - 0x08000000) >> 1 if a >= 0x08000000 else 0x800000 + ((a - 0x03000000) >> 1)
        if cv[i >> 3] >> (i & 7) & 1:
            out.add(a)
    return out


base = ran(S + 'kc_none.bin')
for key in ('A', 'B', 'L', 'R', 'LEFT', 'RIGHT', 'UP', 'DOWN', 'A_B', 'L_R'):
    extra = ran(S + 'kc_%s.bin' % key) - base
    print('%-6s %s' % (key, ' '.join(names.get(a, hex(a)) for a in sorted(extra)) or '-'))
