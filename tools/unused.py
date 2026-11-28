#!/usr/bin/env python3
"""
List code and data in the ROM that the game never uses (docs/unused.txt).

Method: build a reference graph over the whole ROM and walk it from the
entry point.

  nodes   functions (from the analyzer), data blocks (each gUnk_ label or
          asset start up to the next one), and one node per entry of the
          level-header and track-record tables
  edges   code -> symbols named in its asm (calls, branches, literal pools),
          plus raw Thumb/ARM bl/b encodings and address words inside each
          function's bytes (undecoded parts included), mapped through the
          IWRAM overlay and the IWRAM copy of the audio engine;
          data -> the pointers gen_asm found in it;
          track record -> the level it uses
  roots   _start, plus every function that ran in the mGBA coverage files
          given with --cover (a safety net for references the static scan
          cannot see; each one is reported)

Whatever is not reached is unused.  Reachable code can still be dead at run
time (a debug flag that is never set), and data read through a computed index
(a table's later entries) belongs to the block that holds the table, so this
list is a lower bound for data and an upper bound only where noted.

The report lists offsets, sizes and short descriptions (names, and short
debug strings that identify a block), no game content.

Usage: unused.py baserom.gba build/db.json config/dkp.cfg [--cover f.bin ...] > docs/unused.txt
       unused.py ... --why <rom offset>     explain why a block is (not) used
"""
import sys, os, re, glob, struct, bisect, io, contextlib, collections

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import gen_asm  # noqa: E402
from analyze import ROM_BASE  # noqa: E402

LEVELS, LEVEL_SIZE, NLEVELS = 0x7146C0, 0x94, 34
TRACKS, TRACK_SIZE, NTRACKS = 0x51D40, 0x2C, 48
IWRAM_LMA, IWRAM_END = 0x385FC, 0x3C5C4
AUDIO_LMA, AUDIO_END = 0x2D834, 0x2EAE0
# code copied to RAM before it runs: (rom start, rom end, run address).
# text32 is copied at boot; the audio engine by the audio init; game_init
# copies one of two ARM overlays (sub_08000CB8 / sub_08001020) to the same
# place right after text32, so an address there may mean either.
OVERLAYS = [(IWRAM_LMA, IWRAM_END, 0x03000000),
            (AUDIO_LMA, AUDIO_END, 0x03006498),
            (0x3C5C4, 0x3DC1C, 0x03003FC8),
            (0x3DC1C, 0x3EA90, 0x03003FC8)]
ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))


def main():
    args = sys.argv[1:]
    covers = []
    while '--cover' in args:
        i = args.index('--cover')
        covers.append(args[i + 1])
        del args[i:i + 2]
    why = []
    while '--why' in args:
        i = args.index('--why')
        why.append(int(args[i + 1], 16))
        del args[i:i + 2]
    rom_path, db_path, cfg_path = args[:3]
    with contextlib.redirect_stderr(io.StringIO()):
        g = gen_asm.make_gen(rom_path, db_path, cfg_path)
    global OVERLAYS
    OVERLAYS = [(sg.rom_start, sg.rom_end, sg.vma) for sg in g.rom.segs if sg.name != 'rom']
    data = g.rom.d
    size = len(data)
    u32 = lambda o: struct.unpack_from('<I', data, o)[0]  # noqa: E731

    # ---------------------------------------------------------------- nodes
    funcs = set(g.funcs)
    assets = {a[0]: a for a in g.assets}
    # labels inside an asset (code pointing past a tile count, say) are part
    # of that asset; the bytes after an asset up to the next label are a
    # block of their own
    spans = sorted((a[0], a[0] + a[1]) for a in g.assets)
    def inside_asset(o):
        k = bisect.bisect_right(spans, (o, 1 << 62)) - 1
        return k >= 0 and spans[k][0] < o < spans[k][1]
    tables = {LEVELS + L * LEVEL_SIZE for L in range(NLEVELS)} | {TRACKS + t * TRACK_SIZE for t in range(NTRACKS + 1)}
    starts = set(funcs) | {o for o in g.dlabel if not inside_asset(o)} | set(assets) | tables
    starts |= {e for s, e in spans}
    starts |= {g.code_end, IWRAM_LMA, IWRAM_END, 0x3EA90}
    starts = sorted(starts)
    ends = {s: e for s, e in zip(starts, starts[1:] + [size])}

    def owner(off):
        k = bisect.bisect_right(starts, off) - 1
        return starts[k] if k >= 0 else None

    def addr_to_offs(a):
        # bit 0 is the Thumb bit only on code addresses; data can be odd
        if a & 1 and addr_to_offs(a - 1) and addr_to_offs(a - 1)[0] in funcs:
            return addr_to_offs(a - 1)
        if ROM_BASE <= a < ROM_BASE + size:
            return [a - ROM_BASE]
        return [lo + a - v for lo, hi, v in OVERLAYS if v <= a < v + hi - lo]

    def addr_to_off(a):
        r = addr_to_offs(a)
        return r[0] if r else None

    def vma(off):
        for lo, hi, v in OVERLAYS:
            if lo <= off < hi and v < ROM_BASE:
                return v + off - lo
        return ROM_BASE + off

    edges = collections.defaultdict(set)

    def link(src, off):
        if off is None or not 0 <= off < size:
            return
        t = owner(off)
        if t is not None and t != src:
            edges[src].add(t)

    def link_addr(src, a):
        for o in addr_to_offs(a):
            link(src, o)

    # ------------------------------------------------- code -> asm symbols
    # symbol -> ROM offset, from the generator's own tables (labels in two
    # overlays can share a run address, so addresses alone are ambiguous)
    sym_off = {g.func_name(o): o for o in funcs}
    for o, n in g.sym.items():
        sym_off.setdefault(n, o)
    sym_off.update({v: k for k, v in g.dlabel.items()})
    sym_off.update({v: k for k, v in g.overlay_lma.items()})

    def sym_to_off(name):
        if name in sym_off:
            return sym_off[name]
        m = re.fullmatch(r'(?:gUnk|sub|_)_?([0-9A-F]{8})', name)
        return addr_to_off(int(m.group(1), 16)) if m else None

    for f in glob.glob(os.path.join(ROOT, 'asm', '*.s')):
        cur = None
        for line in open(f):
            m = re.match(r'^(\w+):\s*@ ([0-9A-F]{8})', line)
            if m:
                o = sym_off.get(m.group(1))
                if o in funcs:
                    cur = o
                continue
            if cur is None or line.lstrip().startswith(('.global', '.type', '.thumb_func', '.size')):
                continue
            code = line.split('@')[0]
            for name in re.findall(r'\b([A-Za-z_]\w*)\b', code):
                o = sym_to_off(name)
                if o is not None:
                    link(cur, o)

    # ---------------------- code -> raw branches and address words (all bytes)
    for f in sorted(funcs):
        e = ends[f]
        base = vma(f)
        thumb = g.funcs[f]['thumb']
        if thumb:
            for o in range(f, e - 2, 2):
                h1, h2 = struct.unpack_from('<HH', data, o)
                if h1 >> 11 == 0x1E and h2 >> 11 in (0x1F, 0x1D):
                    d = ((h1 & 0x7FF) << 12) | ((h2 & 0x7FF) << 1)
                    if d & 0x400000:
                        d -= 0x800000
                    link_addr(f, base + (o - f) + 4 + d)
        else:
            for o in range(f - f % 4, e - 3, 4):
                w = u32(o)
                if (w >> 25) & 7 == 5 and w >> 28 != 0xF:
                    d = w & 0xFFFFFF
                    if d & 0x800000:
                        d -= 0x1000000
                    link_addr(f, base + (o - f) + 8 + 4 * d)
        for o in range(f + (-f % 4), e - 3, 4):
            w = u32(o)
            if (ROM_BASE <= w < ROM_BASE + size) or (0x03000000 <= w < 0x03008000):
                link_addr(f, w)

    # ------------------------------------------------------ data -> pointers
    for o, (kind, t) in g.dptr.items():
        link(owner(o), t)

    # raw words in other data that point exactly at a block start (pointers
    # gen_asm left as bytes); pointer-free asset types are skipped
    nostart = set(starts)
    for a in sorted(starts):
        if a in funcs or (a in assets and assets[a][2] in ('pal', 'tiles4', 'tiles8', 'gfx', 'rsprite', 'sample')):
            continue
        if a < g.code_end and a not in g.dlabel:
            continue
        for o in range(a + (-a % 4), ends[a] - 3, 4):
            w = u32(o)
            if ROM_BASE <= w < ROM_BASE + size and (w - ROM_BASE) in nostart and not (w & 1 and (w - 1 - ROM_BASE) in funcs):
                link(a, w - ROM_BASE)
            elif w & 1 and ROM_BASE <= w < ROM_BASE + size and (w - 1 - ROM_BASE) in funcs:
                link(a, w - 1 - ROM_BASE)

    # sprite containers stored back to back (level-of-detail versions) are
    # reached by stepping over the previous one, not through a pointer
    rs = sorted((a[0], a[0] + a[1], a[3]) for a in g.assets if a[2] == 'rsprite')
    for (s0, e0, n0), (s1, e1, n1) in zip(rs, rs[1:]):
        if s1 == e0 and n1.startswith(n0.rsplit('_', 1)[0] if re.search(r'_\d+$', n0) else n0):
            edges[s0].add(s1)

    # ------------------------------------------ tables: one node per entry
    used_levels = {}
    for t in range(NTRACKS):
        rec = TRACKS + t * TRACK_SIZE
        tid, lvl = u32(rec), u32(rec + 4)
        if tid == 0:
            break
        edges[TRACKS].add(rec)                 # all track records are live
        edges[rec].add(LEVELS + lvl * LEVEL_SIZE)
        used_levels.setdefault(lvl, []).append(tid)

    # ------------------------------------------------------------- walk
    roots = {0}
    cover_roots = {}
    for path in covers:
        cv = open(path, 'rb').read()
        for byte in (k for k, v in enumerate(cv) if v):
            for i in (8 * byte + bit for bit in range(8) if cv[byte] >> bit & 1):
                a = 0x08000000 + 2 * i if i < 0x800000 else 0x03000000 + 2 * (i - 0x800000)
                for o in addr_to_offs(a):
                    if o in funcs:
                        cover_roots[o] = path

    def walk(rs):
        seen, todo = set(), list(rs)
        while todo:
            n = todo.pop()
            if n in seen:
                continue
            seen.add(n)
            todo += edges.get(n, ())
        return seen

    static = walk(roots)
    live = walk(roots | set(cover_roots))
    only_dynamic = sorted(f for f in cover_roots if f not in static)

    if why:
        back = collections.defaultdict(set)
        for a, ts in edges.items():
            for t in ts:
                back[t].add(a)
        for o in why:
            n = owner(o)
            print('0x%06X: block 0x%06X-0x%06X %s, %s; referenced by %s' % (
                o, n, ends[n], 'function' if n in funcs else 'data', 'live' if n in live else 'DEAD',
                ', '.join('0x%06X%s' % (r, '' if r in live else '(dead)') for r in sorted(back[n])) or 'nothing'))
        return

    # fall-through: a "function" entered by running off the end of the one
    # before it (no return between them) is part of that function
    insn_offs = sorted(g.insns)

    def falls_into(f):
        # entered by running off the end of the code before it: the last
        # instruction before f does not end the flow (e.g. an error path
        # after a conditional branch in a handler reached by a computed jump)
        k = bisect.bisect_left(insn_offs, f) - 1
        if k < 0:
            return False
        o = insn_offs[k]
        size, thumb = g.insns[o]
        if o + size != f or thumb != g.funcs[f]['thumb']:
            return False
        return not ends_with_exit(o, f)

    def ends_with_exit(p, f):
        # last decoded instruction of p before f
        ins = [o for o in g.insns if p <= o < f]
        if not ins:
            return True
        o = max(ins)
        sz = g.insns[o][0]
        if o + sz < f:          # pool / padding / undecoded bytes in between
            return True
        if sz == 2:
            h = struct.unpack_from('<H', data, o)[0]
            return (h & 0xFF00) == 0xBD00 or (h & 0xFF87) == 0x4700 or (h & 0xF800) == 0xE000 or h == 0xEFFF
        w = u32(o)
        if w >> 28 != 0xE and w != 0xE7FFFFFF:
            return False            # conditional: may fall through
        return (w & 0x0FFFFFF0) == 0x012FFF10 or (w >> 24) & 0xF == 0xA or (w & 0x0E108000) == 0x08108000 or \
            (w & 0x0FFFF000) == 0x01A0F000 or w == 0xE7FFFFFF

    # ------------------------------------------------------------ report
    fsz = lambda o: ends[o] - o  # noqa: E731

    def label(o):
        if o in g.names:
            return g.names[o]
        if o in funcs:
            return g.func_name(o)
        if o in assets:
            return assets[o][3]
        return 'gUnk_%08X' % vma(o)

    file_of = {}
    for f in glob.glob(os.path.join(ROOT, 'asm', '*.s')):
        for m in re.finditer(r'^(\w+):\s*@ ([0-9A-F]{8})', open(f).read(), re.M):
            file_of[sym_off.get(m.group(1))] = os.path.basename(f)

    def text_of(o, n=40):
        e = min(ends[o], o + 200)
        t = data[o:e].split(b'\0')[0]
        if len(t) >= 3 and all(32 <= c < 127 or c in (9, 10) for c in t):
            t = t.decode().replace('\n', '\\n').strip()
            return t if len(t) <= n else t[:n - 3] + '...'
        return None

    def padding(o):
        return o not in g.dlabel and o not in assets and fsz(o) < 16 and not any(data[o:ends[o]])

    dead_funcs = [f for f in sorted(funcs) if f not in live and not falls_into(f)]
    dead_data = [o for o in starts if o not in live and o not in funcs and fsz(o) > 0 and
                 (o >= 0x3EA90 or o in g.dlabel) and not padding(o)]

    # a dead block right after a used one may be that block's tail (read by
    # index or offset): uncertain, and so is a run of blocks continuing it
    # unless something unused points at it directly (then it is a block of
    # its own); repeat until nothing changes
    back = collections.defaultdict(set)
    for a, ts in edges.items():
        for t in ts:
            back[t].add(a)
    dead_func_set = set(dead_funcs)
    sure_set = set()
    while True:
        sure, maybe = [], []
        for o in dead_data:
            k = bisect.bisect_left(starts, o)
            prev = starts[k - 1] if k else None
            own = o in assets or o in tables or text_of(o) or back[o] & (dead_func_set | sure_set)
            cont = prev is not None and ends[prev] == o and (prev in live or prev in maybe)
            (sure if own or not cont else maybe).append(o)
        if set(sure) == sure_set:
            break
        sure_set = set(sure)
    maybe_set = set(maybe)

    # group dead code with the dead data it uses (uncertain blocks link
    # groups, e.g. a pointer table, but are only listed in section 5)
    dead = set(dead_funcs) | set(sure) | maybe_set
    parent = {n: n for n in dead}

    def find(n):
        while parent[n] != n:
            parent[n] = parent[parent[n]]
            n = parent[n]
        return n
    for n in dead:
        for t in edges.get(n, ()):
            if t in dead:
                parent[find(n)] = find(t)
    groups = collections.defaultdict(list)
    for n in dead:
        groups[find(n)].append(n)
    groups = sorted(groups.values(), key=lambda ns: -sum(fsz(n) for n in ns))

    out = []
    w = out.append
    w('Unused code and data in Diddy Kong Pilot (2003 build)')
    w('=' * 54)
    w('')
    w('Generated by tools/unused.py; its header describes the method.  Offsets')
    w('are ROM offsets (add 0x08000000 for the address); code that runs from')
    w('IWRAM is listed at its run-time address.  Only offsets, sizes, names and')
    w('short identifying debug strings are listed, no game content.')
    w('')
    w('"Unused" means that nothing the game can reach from power-on refers to')
    w('it: no call, branch or pointer, also counting raw bytes the disassembly')
    w('has not decoded yet.')
    if covers:
        w('The result was checked against an mGBA run that records the executed')
        w('code (boot, intro movie, menus and 40 s of racing with items on Steamy')
        w('Swoop); none of the functions listed here ran.  The run is in')
        w('tools/emu (DKP_COVER=<file> repro_zinger_buzz.py).')
    w('')
    w('Summary')
    w('-------')
    w('  %5d functions never called                  %8d bytes' % (len(dead_funcs), sum(fsz(f) for f in dead_funcs)))
    w('  %5d data blocks never referenced            %8d bytes' % (len(sure), sum(fsz(o) for o in sure)))
    w('  %5d blocks possibly unused (section 5)      %8d bytes' % (len(maybe), sum(fsz(o) for o in maybe)))
    lv_unused = [L for L in range(1, NLEVELS) if L not in used_levels and u32(LEVELS + L * LEVEL_SIZE)]
    w('  unused level: %s; a debug menu; the credits screen; a cup-win screen;' % ', '.join('%d' % L for L in lv_unused))
    w('  a second spot screen; intro, banana and null actors')
    w('')

    # --- 1. features
    w('1. Unused features')
    w('------------------')
    w('  Dead code together with the data only it uses.')
    w('')
    for ns in groups:
        ns = [n for n in ns if n not in maybe_set]
        if not ns:
            continue
        fs = [n for n in sorted(ns) if n in funcs]
        ds = [n for n in sorted(ns) if n not in funcs]
        tot = sum(fsz(n) for n in ns)
        note = [NOTES[n] for n in sorted(ns) if n in NOTES]
        if not fs and tot < 1024 and not note:
            continue
        if fs and all(file_of.get(f) == 'libc.s' for f in fs) and not note:
            note = ['newlib (libc) code that was linked in but is never called']
        noted = [n for n in sorted(ns) if n in NOTES and n in funcs]
        head = label(noted[0]) if noted else label(fs[0]) if fs else ('level 25' if any(n in NOTES and 'level 25' in NOTES[n] for n in ns) else label(ds[0]))
        w('  %s: %d function(s), %d data block(s), %d bytes' % (head, len(fs), len(ds), tot))
        for t in note[:1]:
            for line in wrap(t, 70):
                w('      ' + line)
        if fs:
            for line in wrap('functions: ' + ', '.join(label(f) for f in fs), 70):
                w('      ' + line)
        strs = [t for t in (text_of(d) for d in ds) if t]
        if strs:
            for line in wrap('strings: ' + ', '.join('"%s"' % t for t in strs[:12]) + (' ...' if len(strs) > 12 else ''), 70):
                w('      ' + line)
        w('')

    # --- 2. levels and tracks
    w('2. Levels and tracks')
    w('--------------------')
    w('  Level headers at 0x%06X (%d x 0x%X bytes), track records at 0x%06X' % (LEVELS, NLEVELS, LEVEL_SIZE, TRACKS))
    w('  (%d x 0x%X).  Each track record names its level.' % (NTRACKS, TRACK_SIZE))
    for L in range(NLEVELS):
        hdr = LEVELS + L * LEVEL_SIZE
        if L in used_levels:
            continue
        if not any(data[hdr:hdr + LEVEL_SIZE]):
            w('  level %2d (0x%06X): empty slot, all zero' % (L, hdr))
            continue
        w('  level %2d (0x%06X): no track record uses it.  The header fills in the' % (L, hdr))
        w('     palette, tilesets, data blocks and object list, but none of the')
        w('     track fields from +0x38 on (probably an unfinished course).  It')
        w('     points to:')
        for k in range(0, LEVEL_SIZE, 4):
            p = u32(hdr + k)
            if not ROM_BASE <= p < ROM_BASE + size:
                continue
            o = owner(p - ROM_BASE)
            extra = ''
            if o in assets and assets[o][2] == 'objects':
                extra = ' (%d objects)' % (assets[o][1] // 16 - (not any(data[o + assets[o][1] - 16:o + assets[o][1]])))
            w('       +0x%02X  %06X  %-26s %s%s' % (k, p - ROM_BASE, label(o), 'also used elsewhere' if o in live else 'unused', extra))
        stub = TRACKS + NTRACKS * TRACK_SIZE
        if u32(stub + 4) == L:
            w('     A stub track record for it follows the %d real ones at 0x%06X:' % (NTRACKS, stub))
            w('     track id 0, level %d, a palette (0x%06X), every other field zero.' % (L, u32(stub + 12) - ROM_BASE))
    w('  The debug menu\'s track list (pointer table 0x84CF74) has 20 names: the 16')
    w('  tracks and four placeholders, "20 - Newtest" to "23 - Newtest".  No level')
    w('  or track record exists for those four.')
    w('')

    # --- 3. code
    w('3. Functions never called')
    w('-------------------------')
    w('  %-9s %6s  %-24s %s' % ('address', 'bytes', 'file', 'name'))
    for f in dead_funcs:
        w('  %08X  %6d  %-24s %s' % (vma(f), fsz(f), file_of.get(f, '?'), label(f)))
    w('')

    # --- 4. data
    w('4. Data never referenced')
    w('------------------------')
    w('  A block runs from its label (or asset start) to the next one.')
    w('  %-8s %8s  %-36s %s' % ('offset', 'bytes', 'name', 'notes'))
    for o in sure:
        notes = []
        if o in assets:
            notes.append(assets[o][2])
        if o in tables:
            notes.append('table entry')
        t = text_of(o)
        if t:
            notes.append('text "%s"' % t)
        elif not any(data[o:ends[o]]):
            notes.append('all zero')
        if o in NOTES:
            notes.append(NOTES[o].split(':')[0])
        w('  %06X   %8d  %-36s %s' % (o, fsz(o), label(o), ', '.join(notes)))
    w('')

    w('5. Possibly unused')
    w('------------------')
    w('  Unreferenced blocks that directly follow a used one.  They may be the')
    w('  rest of that block, read by index (later entries of a table) or by an')
    w('  offset, so they are not certain.  Adjacent blocks are merged.')
    w('  %-8s %8s  %s' % ('offset', 'bytes', 'follows'))
    runs = []
    for o in maybe:
        if runs and runs[-1][1] == o:
            runs[-1][1] = ends[o]
            runs[-1][2] += 1
        else:
            runs.append([o, ends[o], 1])
    for a, e, n in runs:
        k = bisect.bisect_left(starts, a)
        w('  %06X   %8d  %s%s%s' % (a, e - a, label(starts[k - 1]), ' (%d blocks)' % n if n > 1 else '',
                                   ': ' + NOTES[a] if a in NOTES else ''))
    w('')

    # --- 6. audio
    w('6. Audio sample data that no instrument uses')
    w('--------------------------------------------')
    w('  Gaps between the samples that no instrument record points into (not')
    w('  checked to be sound; music sequence data follows the last sample).')
    smp = sorted((a[0], a[0] + a[1]) for a in g.assets if a[2] == 'sample')
    gaps = [(e0, s1) for (s0, e0), (s1, e1) in zip(smp, smp[1:]) if s1 - e0 >= 256]
    if not gaps:
        w('  None: the %d samples (0x%06X-0x%06X) follow each other without gaps.' % (len(smp), smp[0][0], smp[-1][1]))
    for (s0, e0), (s1, e1) in zip(smp, smp[1:]):
        if s1 - e0 >= 256:
            w('  %06X   %8d  between samples %s and %s' % (
                e0, s1 - e0, label(s0).split('/')[-1], label(s1).split('/')[-1]))
    w('')

    # --- 7. padding
    w('7. Large zero/0xFF areas (1 KB or more)')
    w('---------------------------------------')
    free, inside = [], []
    for m in re.finditer(rb'(\x00{1024,}|\xff{1024,})', data):
        o, e = m.start(), m.end()
        blocks, k = [], owner(o)
        while k is not None and k < e:
            blocks.append(k)
            k = ends[k] if ends[k] < size else None
        used = [b for b in blocks if b in live]
        if not used:
            free.append((o, e - o, data[o]))
        elif not any(b in assets and assets[b][2] == 'sample' for b in used):
            inside.append((o, e - o, data[o], used))
    w('  Not inside any used block (free space):')
    for o, n, b in free:
        w('  %06X   %8d  0x%02X' % (o, n, b))
    w('  Inside used blocks (empty map layers or reserved space, still data;')
    w('  silence inside samples is left out):')
    for o, n, b, used in inside:
        w('  %06X   %8d  0x%02X in %s' % (o, n, b, ', '.join(label(u) for u in used)))
    w('')

    # --- 8. notes
    w('8. Notes on the analysis')
    w('------------------------')
    w('  * Code copied to RAM is mapped to its run-time address: text32 at')
    w('    0x03000000, the audio engine at 0x03006498, and two ARM overlays')
    w('    (0x03C5C4 and 0x03DC1C in ROM) that game_init copies to 0x03003FC8.')
    w('  * Sprite level-of-detail sets stored after a sprite (NNN_2, ...) are')
    w('    reached by stepping over the previous container, not by a pointer;')
    w('    the trace in mGBA shows the decoder reading them.')
    if only_dynamic:
        w('  * Reached in mGBA but not found by the static scan (kept as used):')
        for f in only_dynamic:
            w('      %08X  %s' % (vma(f), label(f)))
    print('\n'.join(out))
    print('%d dead functions, %d unused data blocks, %d possibly unused, %d found only by coverage' % (
        len(dead_funcs), len(sure), len(maybe), len(only_dynamic)), file=sys.stderr)


def wrap(text, width):
    import textwrap
    return textwrap.wrap(text, width, break_on_hyphens=False)


# hand-written descriptions, keyed by ROM offset of a function or block
NOTES = {
    0x00271C: 'a debug menu (debug_menu_init): Level, Player, Cups scoreboard, '
              'Flyby, Edit Flyby, New Frontend, Cup Win, Volume and Play Mode, with '
              'a 20-entry track list under older track names and a 9-character '
              'list.  It plays song 4 and shows its own title background (a beach '
              'with the winged logo, graphics/debug_menu/), which nothing else '
              'loads.  Its "Cup Win" item opens the cup-win screen '
              '(fe_cups_win_init), which nothing else uses either; that podium '
              'scene\'s banner tiles are garbled in the ROM.  To see it in '
              'mGBA, write 0x0800271D to gStateFunc (0x03005670) at the language '
              'screen, or apply patches/debug_menu.ips; see docs/debug_menu.md.',
    0x052580: 'level 25, an unfinished course: its header, a stub track record, '
              'tilesets, data blocks and object list (section 2)',
    0x0144A0: 'the credits screen: fe_credits_init and its graphics; nothing calls it',
    0x01D094: 'a second "spot screen" front-end screen that is never entered',
    0x013154: 'actors for an intro sequence (plane, Diddy, Kong, pilot); no class '
              'table entry points to their init functions',
    0x0112B4: 'a banana actor; no class table entry points to it',
    0x00F5E0: 'a "null" actor; no class table entry points to it',
    0x00F790: 'a react handler for a lava flame actor that is not in the class table',
    0x032598: "Nintendo's AGBAssert; the game prints asserts with its own code",
    0x7494F0: 'a sprite container no sprite table entry points to; its frames do '
              'not decode with the format all other sprite sets use',
    0x05BE50: 'follows level 25\'s palette; several other level palettes are '
              'followed by a block like it, so it is probably more palette data '
              'for level 25',
    0xBB52AC: 'newlib malloc bin headers; malloc reaches them from its state by index',
}

if __name__ == '__main__':
    main()
