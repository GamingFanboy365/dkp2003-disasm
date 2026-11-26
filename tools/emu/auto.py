import sys, os, json, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from drv import *

P = 0x0200438C
ZIP = (529408, 2048, 485888)


def make_path(track):
    path = [tuple(p) for p in track]
    # splice zipper: replace the nearest point with the zipper position
    i = min(range(len(path)), key=lambda k: math.dist((path[k][0], path[k][2]), (ZIP[0], ZIP[2])))
    path[i] = ZIP
    return path, i


class Pilot:
    def __init__(self, e, path, look=5):
        self.e, self.path, self.look = e, path, look
        self.idx = 0

    def step(self, n=2, extra=''):
        e = self.e
        x, y, z = e.pos(P)
        # advance index to nearest point (monotonic search window)
        best = self.idx
        bd = 1e18
        for k in range(self.idx, min(len(self.path), self.idx + 40)):
            d = math.dist((x, z), (self.path[k][0], self.path[k][2]))
            if d < bd:
                bd, best = d, k
        self.idx = best
        t = self.path[min(len(self.path) - 1, best + self.look)]
        zd = math.dist((x, z), (ZIP[0], ZIP[2]))
        if getattr(self, 'zi', None) is not None and self.zi - 25 <= best <= self.zi + 1 and zd > 8000:
            t = ZIP
        h16 = (e.r32(P + 0x54) >> 16) & 0xffff
        cur = -math.pi / 2 - (h16 - 0x8000) * 2 * math.pi / 65536
        want = math.atan2(t[2] - z, t[0] - x)
        diff = (want - cur + math.pi) % (2 * math.pi) - math.pi
        k = 'A'
        if diff > 0.06:
            k += '+RIGHT'
        elif diff < -0.06:
            k += '+LEFT'
        if extra:
            k += '+' + extra
        e.run(n, k)
        return (x, y, z), best, diff
