import re,sys,collections
def summarize(path):
    prev=None; out=[]
    starts={}; lastseen={}
    for l in open(path):
        f=int(l.split()[0])
        for v,a,id_,snd,fl,cb,ctx in re.findall(r'v(\d) a=(\d+) id=(\d+) snd=(\d+) fl=(\w+) cb=(\w+) ctx=(\w+)',l):
            if a=='1':
                starts.setdefault(id_,(f,int(snd),v)); lastseen[id_]=f
    return starts,lastseen,f
if __name__=='__main__':
    for p in sys.argv[1:]:
        st,ls,end=summarize(p)
        print(p.split('/')[-1],'last frame',end)
        for id_,(f0,snd,v) in sorted(st.items(),key=lambda x:x[1][0]):
            dur=ls[id_]-f0
            flag='  <-- still playing at end' if ls[id_]==end else ''
            print('   id %3s snd %3d voice %s start %5d dur %5d%s'%(id_,snd,v,f0,dur,flag))
