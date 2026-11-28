#!/usr/bin/env python3
"""
Map the front end's state machine: mcp_process(token), called by a screen
when it finishes, picks the next screen from the current state (gMcpState)
and the token, stores the new state and calls that screen's init.

This walks mcp_process with a small Thumb interpreter for every state value
it compares against and tokens 0..7.  Where a branch depends on something
other than the state and token (game progress, settings), both ways are
followed and the condition is shown.

Usage: mcp_map.py baserom.gba build/db.json config/symbols.txt
"""
import sys, struct, json, re
import capstone as cs

MCP = 0x0801E5A4                 # mcp_process
SUBHANDLERS = {0x0801F132}       # called for state 0xE8 and makes its own transitions
STATE = 0x0202DEC8
ROM = 0x08000000


def main():
    rom = open(sys.argv[1], 'rb').read()
    names = {}
    for l in list(open(sys.argv[3])) + list(open(sys.argv[3].replace('symbols.txt', 'ram_symbols.txt'))):
        p = l.split('#')[0].split()
        if len(p) >= 2:
            names[int(p[0], 16)] = p[1]
    md = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_THUMB)
    md.detail = True
    u32 = lambda a: struct.unpack_from('<I', rom, a - ROM)[0]  # noqa: E731

    cache = {}

    def insn(a):
        if a not in cache:
            cache[a] = next(md.disasm(rom[a - ROM:a - ROM + 4], a, 1))
        return cache[a]

    # the state values mcp_process compares with
    states = set()
    a, end = MCP, MCP + 0xA00
    while a < end:
        try:
            i = insn(a)
        except StopIteration:
            a += 2
            continue
        a += i.size
    # collect from a walk with an unknown state instead: record compared values
    compared = set()

    def run(state, token, regs=None, pc=MCP, conds=(), depth=0):
        """-> list of (conds, new_state, screen) leaves"""
        R = dict(regs or {})
        D = dict(R.pop('_desc', {}))     # register -> description of an unknown value
        flags = None
        out = []
        for _ in range(400):
            i = insn(pc)
            mn, ops = i.mnemonic, i.op_str
            nxt = pc + i.size
            if pc == MCP:
                R = {'r0': token}
            elif pc in SUBHANDLERS and depth > 0 and '_entered' not in R:
                R['_entered'] = 1
            m = re.match(r'(r\d+), \[pc, #(0x[0-9a-f]+|\d+)\]$', ops)
            if mn == 'ldr' and m:
                R[m.group(1)] = u32(((pc + 4) & ~3) + int(m.group(2), 0))
            elif mn in ('ldr', 'ldrh', 'ldrb', 'ldrsh') and re.match(r'(r\d+), \[(r\d+), #(.+)\]$', ops):
                d, s_, v = re.match(r'(r\d+), \[(r\d+), #(.+)\]$', ops).groups()
                base = R.get(s_)
                R[d] = None
                D[d] = '[%s+%s]' % (names.get(base, '0x%08X' % base) if base else D.get(s_, '?'), v)
            elif mn == 'ldr' and re.match(r'(r\d+), \[(r\d+)\]$', ops):
                d, s = re.match(r'(r\d+), \[(r\d+)\]$', ops).groups()
                R[d] = state if R.get(s) == STATE else None
                if R[d] is None:
                    D[d] = '[%s]' % (names.get(R.get(s), '0x%08X' % R[s]) if R.get(s) else '?')
            elif mn in ('movs', 'mov') and re.match(r'(r\d+|sb|sl|fp|ip|r8), #(.+)$', ops):
                d, v = re.match(r'(\w+), #(.+)$', ops).groups()
                R[d] = int(v, 0)
            elif mn in ('adds', 'mov') and re.match(r'(\w+), (\w+)(?:, #0)?$', ops):
                d, s = re.match(r'(\w+), (\w+)(?:, #0)?$', ops).groups()
                R[d] = R.get(s)
            elif mn in ('lsls', 'adds', 'subs') and re.match(r'(\w+), (\w+), #(.+)$', ops):
                d, s, v = re.match(r'(\w+), (\w+), #(.+)$', ops).groups()
                x = R.get(s)
                R[d] = None if x is None else (x << int(v, 0) if mn == 'lsls' else
                                               x + int(v, 0) if mn == 'adds' else x - int(v, 0)) & 0xFFFFFFFF
            elif mn in ('adds', 'subs') and re.match(r'(\w+), #(.+)$', ops):
                d, v = re.match(r'(\w+), #(.+)$', ops).groups()
                x = R.get(d)
                R[d] = None if x is None else (x + int(v, 0) if mn == 'adds' else x - int(v, 0)) & 0xFFFFFFFF
            elif mn == 'cmp':
                a_, b_ = [x.strip() for x in ops.split(',')]
                va = R.get(a_)
                vb = int(b_[1:], 0) if b_.startswith('#') else R.get(b_)
                if a_ == 'r2' and vb is not None:
                    compared.add(vb)
                flags = (va, vb, '%s vs %s' % (D.get(a_, a_) if va is None else a_, b_))
            elif mn == 'str' and re.match(r'(\w+), \[(\w+)\]$', ops):
                s, d = re.match(r'(\w+), \[(\w+)\]$', ops).groups()
                if R.get(d) == STATE:
                    R['_new'] = R.get(s)
            elif mn == 'bl':
                t = int(ops[1:], 16)
                n = names.get(t, 'sub_%08X' % t)
                if n.endswith('_init'):
                    out.append((conds, R.get('_new'), n))
                    return out
                if t in SUBHANDLERS:
                    # a handler for some states: walk into it; it ends the dispatch
                    return out + run(state, token, dict(R, _desc=D), t, conds, depth + 1)
                for r in ('r0', 'r1', 'r2', 'r3'):
                    R[r] = None
                D['r0'] = n + '()'
            elif mn == 'b' or (mn.startswith('b') and mn[1:] in ('eq', 'ne', 'gt', 'le', 'lt', 'ge', 'hi', 'ls', 'cs', 'cc')):
                t = int(ops[1:], 16)
                if t == 0x0801E604:          # common return
                    if R.get('_new') is not None:
                        out.append((conds, R.get('_new'), '-'))
                    return out
                if mn == 'b':
                    nxt = t
                else:
                    va, vb, txt = flags
                    cc = mn[1:]
                    if va is None or vb is None:
                        if depth > 6:
                            return out
                        R2 = dict(R, _desc=D)
                        out += run(state, token, R2, t, conds + ('%s %s' % (txt, cc),), depth + 1)
                        out += run(state, token, R2, nxt, conds + ('%s !%s' % (txt, cc),), depth + 1)
                        return out
                    sa = va - (1 << 32) if va & 0x80000000 else va
                    sb = vb - (1 << 32) if vb & 0x80000000 else vb
                    take = {'eq': va == vb, 'ne': va != vb, 'gt': sa > sb, 'le': sa <= sb, 'lt': sa < sb,
                            'ge': sa >= sb, 'hi': va > vb, 'ls': va <= vb, 'cs': va >= vb, 'cc': va < vb}[cc]
                    if take:
                        nxt = t
            elif mn in ('pop', 'bx'):
                return out
            pc = nxt
        return out

    # states: values compared with, plus every new state stored, until stable
    known = set()
    run(-1, 0)
    todo = set(compared)
    table = {}
    while todo - known:
        for st in sorted(todo - known):
            known.add(st)
            for tok in range(8):
                rows = run(st, tok)
                table[(st, tok)] = rows
                todo |= {new for c, new, sc in rows if new is not None}
        todo |= compared
    # which init starts which state (the screen shown while in that state)
    shows = {}
    for rows in table.values():
        for c, new, sc in rows:
            if new is not None and sc != '-':
                shows.setdefault(new, set()).add(sc)
    print('States (the screen each one shows, from the init called on entering it):')
    for st in sorted(known):
        print('  0x%03X  %s' % (st, ', '.join(sorted(shows.get(st, {'(no screen started)'})))))
    print()
    print('Transitions: mcp_process(token) in a state -> new state, screen started')
    for st in sorted(known):
        byrow = {}
        for tok in range(8):
            key = tuple((c, new, sc) for c, new, sc in table.get((st, tok), []))
            byrow.setdefault(key, []).append(tok)
        for key, toks in byrow.items():
            if not key:
                continue
            tk = 'any' if len(toks) == 8 else ','.join(map(str, toks))
            for c, new, sc in key:
                print('  0x%03X  token %-5s -> %-6s %-28s %s' % (st, tk, '0x%03X' % new if new is not None else '?',
                                                            sc, ' and '.join(c)))


if __name__ == '__main__':
    main()
