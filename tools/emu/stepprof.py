#!/usr/bin/env python3
"""
What a player function changes in a real race: load the saved race state
(build/emu/race.ss, written by keycover.py), hold a button, stop at the
function's entry, snapshot the player's object (obj, 0x0200438C), data
(pd, 0x02021E18) and input block (in, 0x02004224), run until it returns
and print what changed.

  stepprof.py LEFT,UP 0x08005E3C 0x08006238 ...

$STEPPROF_STATE picks another saved state, $STEPPROF_MAX the number of
instructions to search for the function (default 3000000, about 10 frames).

Used to name plane_bank, plane_pitch_input and plane_vertical_speed.
"""
import sys, re, os
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
os.chdir(os.path.join(HERE, '..', '..'))
from drv import Emu
O,P,C=0x0200438C,0x02021E18,0x02004224
e=Emu('baserom.gba')
def regs():
    e.cmd('regs'); l=e.p.stdout.readline()
    return {k:int(v,16) for k,v in re.findall(r'(\w+)=([0-9a-f]+)',l)}
def snap(): return e.peek(O,0x50)+e.peek(P,0x82)+e.peek(C,8)
def where(i):
    if i<0x50: return 'obj+%X'%(i*4)
    if i<0xD2: return 'pd+%X'%((i-0x50)*4)
    return 'in+%X'%((i-0xD2)*4)
FN = {a: int(a, 16) for a in sys.argv[2:]}
for key in sys.argv[1].split(','):
    for nm,a in FN.items():
        e.load(os.environ.get('STEPPROF_STATE', 'build/emu/race.ss')); e.cmd('run 2 %s'%key)
        e.cmd('until 0x%x %s'%(a+2, os.environ.get('STEPPROF_MAX', '3000000'))); l=e.p.stdout.readline()
        if 'timeout' in l: print(key,nm,'not reached'); continue
        r=regs(); before=snap()
        e.cmd('until 0x%x 3000000'%((r['lr']&~1)+2)); e.p.stdout.readline()
        after=snap()
        d=[where(i)+':%x->%x'%(x,y) for i,(x,y) in enumerate(zip(before,after)) if x!=y]
        print('%-5s %-10s args r0=%x r1=%x r2=%x  %s'%(key,nm,r['r0'],r['r1'],r['r2'],' '.join(d)[:230]))
e.close()
