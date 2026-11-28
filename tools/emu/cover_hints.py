#!/usr/bin/env python3
"""
Find code that ran in mGBA but that the analyzer did not decode, and print
`code <address>` hints for config/dkp.cfg (odd address = Thumb).

  cover_hints.py build/db.json cover1.bin [cover2.bin ...]

Coverage files come from the dkprun `cover` command (DKP_COVER=<file> with
any drv.Emu script).  The start of each run of executed but undecoded
halfwords is a target of a computed jump (straight-line code from decoded
code would already be decoded); the mode is that of the function that
contains it.  Overlays that share a run address (the two ARM overlays at
0x03003FC8) are skipped: an address there can belong to either.
"""
import sys, json, bisect



def main():
    db = json.load(open(sys.argv[1]))
    # ROM ranges that run from RAM: (rom start, rom end, run address); two
    # overlays at the same run address are ambiguous and skipped
    COPIES = [(a, b, v) for n, a, b, v in db['segs'] if n != 'rom']
    shared = {(a, b) for a, b, v in COPIES for a2, b2, v2 in COPIES
              if (a, b) != (a2, b2) and v < v2 + (b2 - a2) and v2 < v + (b - a)}
    covs = [open(p, 'rb').read() for p in sys.argv[2:]]
    insns = {int(k): v for k, v in db['insns'].items()}
    pools = {int(k) for k in db['pools']}
    funcs = sorted((int(k), v['thumb']) for k, v in db['funcs'].items())
    fstarts = [f for f, t in funcs]
    decoded = set()
    for o, (sz, th) in insns.items():
        decoded.update(range(o, o + sz, 2))
    for o in pools:
        decoded.update((o, o + 2))

    def run_addrs(o):
        out = [0x08000000 + o]
        for lo, hi, v in COPIES:
            if lo <= o < hi:
                out.append(v + o - lo)
        return out

    def hit(a):
        i = (a - 0x08000000) >> 1 if a >= 0x08000000 else 0x800000 + ((a - 0x03000000) >> 1)
        return any(c[i >> 3] >> (i & 7) & 1 for c in covs)

    prev = None
    for o in range(0, 0x3EA90, 2):
        if any(a <= o < b for a, b in shared):
            continue
        if o in decoded or not any(hit(a) for a in run_addrs(o)):
            continue
        if prev is not None and o - prev <= 4:
            prev = o
            continue
        prev = o
        k = bisect.bisect_right(fstarts, o) - 1
        thumb = funcs[k][1] if k >= 0 else True
        if not thumb and o & 2:
            continue
        a = next((v + o - lo for lo, hi, v in COPIES if lo <= o < hi), 0x08000000 + o)
        print('code 0x%08X' % (a | thumb))


if __name__ == '__main__':
    main()
