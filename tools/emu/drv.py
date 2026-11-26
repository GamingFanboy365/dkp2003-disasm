"""Frame-stepping driver for the dkprun mGBA harness."""
import subprocess, struct, math, os

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, '..', '..'))
S = os.environ.get('DKP_EMU_DIR', os.path.join(ROOT, 'build', 'emu'))
PD = 0x02021E18      # player data array, stride 0x208
PROC_HEAD = 0x02004374


def s32(v):
    return v - (1 << 32) if v & 0x80000000 else v


class Emu:
    def __init__(self, rom=os.path.join(ROOT, 'baserom.gba')):
        self.p = subprocess.Popen([os.environ.get('DKPRUN', os.path.join(S, 'dkprun')), rom], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                  text=True, bufsize=1)
        self.frame = 0

    def cmd(self, c):
        self.p.stdin.write(c + '\n')
        self.p.stdin.flush()

    def peek(self, a, n=1):
        self.cmd('peek 0x%x %d' % (a, n))
        line = self.p.stdout.readline()
        return [int(x, 16) for x in line.split(':')[1].split()]

    def r32(self, a):
        return self.peek(a)[0]

    def run(self, n=1, keys=''):
        self.cmd('run %d %s' % (n, keys))
        self.frame += n

    def load(self, f):
        self.cmd('load ' + f)

    def save(self, f):
        self.cmd('save ' + f)

    def shot(self, f):
        self.cmd('shot ' + f)

    def poke(self, a, v):
        self.cmd('poke 0x%x 0x%x' % (a, v & 0xffffffff))

    def sync(self):
        self.peek(0x02000000)

    def objs(self, head=PROC_HEAD, nxt=4):
        out = []
        a = self.r32(head)
        n = 0
        while a and n < 200:
            w = self.peek(a, 12)
            cls = (w[0] >> 16) & 0xff
            pos = tuple(s32(x) for x in self.peek(a + 0x24, 3))
            out.append((a, cls, pos))
            a = self.peek(a + nxt)[0]
            n += 1
        return out

    def pos(self, a):
        return tuple(s32(x) for x in self.peek(a + 0x24, 3))

    def close(self):
        self.p.stdin.close()
        self.p.wait()
