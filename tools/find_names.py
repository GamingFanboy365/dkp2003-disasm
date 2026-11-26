#!/usr/bin/env python3
"""
Recover function names and source-file attribution from debug strings.

The game was built with asserts and debug prints enabled: assert() passes
__FILE__ and __FUNCTION__, and many functions print "%s: ..." with
__FUNCTION__.  For every function we collect the C strings it loads from its
literal pools:
  * a string "src/<name>.c" attributes the function to that source file;
  * an identifier-like string used alongside a "%s" format, and loaded by no
    other function, is taken as the function's own name.

Usage: find_names.py baserom.gba db.json > names.json
"""
import sys, json, re, bisect, collections


def main():
    d = open(sys.argv[1], 'rb').read()
    db = json.load(open(sys.argv[2]))
    funcs = sorted(int(k) for k in db['funcs'])

    def func_of(off):
        i = bisect.bisect_right(funcs, off) - 1
        return funcs[i] if i >= 0 else None

    def cstr(v):
        o = v - 0x08000000
        if not (0 <= o < len(d)):
            return None
        e = d.find(b'\0', o, o + 256)
        if e < 0:
            return None
        s = d[o:e]
        if len(s) < 2 or any((c < 0x20 and c not in (9, 10)) or c > 0x7e for c in s):
            return None
        return s.decode()

    refs = collections.defaultdict(set)
    users = collections.defaultdict(set)
    for k, v in db['pools'].items():
        s = cstr(v)
        if s is None:
            continue
        f = func_of(int(k))
        refs[f].add((v, s))
        users[v].add(f)
    names, files, multi = {}, {}, {}
    for f, ss in refs.items():
        strs = [s for v, s in ss]
        fmt = any('%s' in s for s in strs)
        cands = sorted({s for v, s in ss if re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', s) and len(users[v]) == 1})
        fl = sorted({s for v, s in ss if re.fullmatch(r'src/\w+\.c', s)})
        if fl:
            files[f] = fl
        if fmt and len(cands) == 1:
            names[f] = cands[0]
        elif fmt and len(cands) > 1:
            multi[f] = cands
    # a name must be unique
    cnt = collections.Counter(names.values())
    names = {f: n for f, n in names.items() if cnt[n] == 1}
    out = {'names': {'0x%08X' % (f + 0x08000000): n for f, n in sorted(names.items())},
           'files': {'0x%08X' % (f + 0x08000000): v for f, v in sorted(files.items())},
           'ambiguous': {'0x%08X' % (f + 0x08000000): v for f, v in sorted(multi.items())}}
    json.dump(out, sys.stdout, indent=1)


if __name__ == '__main__':
    main()
