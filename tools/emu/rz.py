import sys, os,json,math,re,collections
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from auto import *
tr=json.load(open(os.path.join(HERE, 'comp_tracks.json')))
path,zi=make_path(tr['0x200474c'])
PDA=0x02021E18
def trial(delta, rom=os.path.join(ROOT, 'baserom.gba'), vlog=None, tail=0, shots=None, state='rz_f786.ss'):
    e=Emu(rom); e.load(S+'/st/'+state)
    pl=Pilot(e,path); pl.zi=zi; pl.idx=125
    x,y,z=e.pos(P)
    h16=(e.r32(P+0x54)>>16)&0xffff; cur=-math.pi/2-(h16-0x8000)*2*math.pi/65536
    if delta:
        e.poke(P+0x24,int(x+delta*math.cos(cur))); e.poke(P+0x2c,int(z+delta*math.sin(cur)))
    f=784; ev=[]; pb=e.peek(PDA+0x24)[0]; ph=e.peek(PDA+0x54)[0]
    if vlog: e.cmd('vlog '+vlog)
    while f<840+tail:
        pl.step(); f+=2
        if pl.idx>=len(path)-8: pl.idx=0
        b=e.peek(PDA+0x24)[0]; h=e.peek(PDA+0x54)[0]
        if b!=pb: ev.append((f,'boost',pb,b)); pb=b
        if h!=ph: ev.append((f,'hit',ph,h)); ph=h
        if shots and f in shots: e.shot(shots[f])
    if vlog: e.cmd('vlog off')
    e.sync(); e.close()
    return ev
if __name__=='__main__':
    for d in [int(x) for x in sys.argv[1:]]:
        print('delta',d,trial(d)[:4],flush=True)
