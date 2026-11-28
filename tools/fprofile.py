#!/usr/bin/env python3
"""
Write profile of functions: call every unnamed function in the given asm files
with (obj, ai) of a racer, using a RAM snapshot taken in a race, and list the
fields each call changes (obj+X, ai+X, racerN+X or an address).  Functions
that take other arguments give meaningless results or errors, so this is a
hint for reading the code, not a verdict.

  FCALL_SNAPSHOT=build/emu/race_mem.bin fprofile.py asm/act_comp_player.s ...

The snapshot: drive to a race with tools/emu, stop at ai_update with
`until 0x0800D646`, then `dumpmem`; racer 2 is obj 0x0200460C, ai 0x0202375C.
"""
import sys, re, json, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('FCALL_SNAPSHOT', 'build/emu/race_mem.bin')
from fcall import Machine
OBJ, AI = int(os.environ.get('FPROFILE_OBJ', '0x0200460C'), 0), int(os.environ.get('FPROFILE_AI', '0x0202375C'), 0)
db=json.load(open('build/db.json'))
thumb={int(k):v['thumb'] for k,v in db['funcs'].items()}
files=sys.argv[1:]
names=[]
for f in files:
    for m in re.finditer(r'^(sub_[0-9A-F]{8}): @ ([0-9A-F]{8})',open(f).read(),re.M):
        a=int(m.group(2),16); names.append((m.group(1),a,f))
def where(a):
    if OBJ<=a<OBJ+0x140: return 'obj+%X'%(a-OBJ)
    if AI<=a<AI+0x158: return 'ai+%X'%(a-AI)
    if 0x0200438C<=a<0x0200438C+8*0x140: return 'racer%d+%X'%((a-0x0200438C)//0x140,(a-0x0200438C)%0x140)
    return '%08X'%a
for n,a,f in names:
    o=a-0x08000000
    if o not in thumb: continue
    m=Machine(); w=[]
    try:
        r=m.call(a|thumb[o],OBJ,AI,writes=w,limit=300000)
        ch=[(where(x),hex(old),hex(new)) for x,s,old,new in w if old!=new]
        uniq=list(dict.fromkeys(c[0] for c in ch))
        print('%-14s %-20s ret=%-10s writes:%s'%(n,f[4:],hex(r[0]),' '.join(uniq[:12])))
    except Exception as e:
        print('%-14s %-20s ERR %s'%(n,f[4:],str(e)[:40]))
