#!/usr/bin/env python3
"""
Generate reassemblable GNU as sources from the analyzer database.

Usage: gen_asm.py baserom.gba db.json config.cfg outdir

Writes:
  outdir/asm/*.s        code (Thumb/ARM), literal pools, jump tables
  outdir/data/*.s       non-code regions (as .incbin from baserom.gba)
  outdir/ld_script.ld   linker script placing every file at its address
  outdir/objects.mk     ordered object list for the Makefile
"""
import sys, os, json, struct, re, bisect
import capstone as cs

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from analyze import parse_cfg, ROM, ROM_BASE  # noqa: E402

md_t = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_THUMB)
md_a = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_ARM)

SMALL_DATA = 64   # gaps up to this size are emitted as .byte, larger as .incbin


class Gen:
    def __init__(self, rom, db, cfg, raw, names, files, ram_names=None, noptr=(), assets=()):
        self.rom = rom
        self.cfg = cfg
        self.raw = raw                  # set of rom offsets to emit as raw .inst
        self.funcs = {int(k): v for k, v in db['funcs'].items()}
        self.labels = {int(k): v for k, v in db['labels'].items()}
        self.insns = {int(k): tuple(v) for k, v in db['insns'].items()}
        self.pools = {int(k): v for k, v in db['pools'].items()}
        self.jtables = {int(k): v for k, v in db['jtables'].items()}
        self.names = names              # rom offset -> name
        self.files = files              # list of (rom_offset, filename) split points
        self.code_end = max([cfg['code_end'] or 0] + [b for a, b in cfg.get('arm_areas', [])]
                            + [s.rom_end for s in rom.segs if s.name != 'rom'])
        # all item starts (for checking label placement)
        self.item_start = set(self.insns) | set(self.pools)
        for o, j in self.jtables.items():
            for k in range(j['count']):
                self.item_start.add(o + 4 * k)
        self.sym = {}                   # rom offset -> symbol name
        for o, f in self.funcs.items():
            self.sym[o] = self.func_name(o)
        for o in self.labels:
            if o not in self.sym and o in self.item_start:
                # a named code label (a second entry point, a resume point)
                self.sym[o] = self.names[o] if o in self.names and o in self.insns else '_%s' % self.vtag(o)
        for o in self.pools:
            if o not in self.sym:
                self.sym[o] = '_%s' % self.vtag(o)
        for o in self.jtables:
            if o not in self.sym:
                self.sym[o] = '_%s' % self.vtag(o)
        self.globals = set(self.funcs)
        self.lma_refs = {}      # linker symbol -> (overlay, label): pointers into a load image
        self.ram_names = ram_names or {}
        # ROM start of each overlay image -> linker symbol for its load address
        self.overlay_lma = {s.rom_start: '__%s_lma' % s.name for s in rom.segs if s.name != 'rom'}
        self.dlabel = {}
        self.dptr = {}
        self.assets = sorted(assets)          # (offset, size, type, name)
        # regions known to hold no pointers (graphics, palettes)
        self.noptr = sorted(list(noptr) + [(o, o + s) for o, s, t, n in self.assets
                                           if t in ('pal', 'tiles4', 'tiles8', 'gfx', 'rsprite', 'sample')])
        self.scan_data()
        # named data (config/symbols.txt) replaces gUnk_ labels
        for o in self.dlabel:
            if o in self.names and o not in self.funcs:
                self.dlabel[o] = self.names[o]
        self.asset_at = {a[0]: a for a in self.assets}
        # instrument definitions {start*, length, end*}: length == end - start
        # is written symbolically so a sample can change size
        self.derived = {}
        # literal pools of code that copies an overlay: a word equal to the
        # overlay's size, in a function that also loads the overlay's ROM
        # address, becomes __<overlay>_size
        self.pool_sym = {}
        fstarts = sorted(self.funcs)
        owner = lambda o: fstarts[bisect.bisect_right(fstarts, o) - 1]  # noqa: E731
        for sg in rom.segs:
            if sg.name == 'rom':
                continue
            users = {owner(o) for o, v in self.pools.items() if v == ROM_BASE + sg.rom_start}
            for o, v in self.pools.items():
                if v == sg.rom_end - sg.rom_start and owner(o) in users:
                    self.pool_sym[o] = '__%s_size' % sg.name
        # a word just before an overlay image holding its size (the copy code
        # reads it) becomes __<overlay>_size
        for sg in rom.segs:
            if sg.name != 'rom' and sg.rom_start >= 4 and rom.u32(sg.rom_start - 4) == sg.rom_end - sg.rom_start:
                self.derived[sg.rom_start - 4] = '__%s_size' % sg.name
        samples = {a[0]: a[1] for a in self.assets if a[2] == 'sample'}
        for o, (kind, t) in self.dptr.items():
            nx = self.dptr.get(o + 8)
            if kind == 'data' and t in samples and nx and nx[0] == 'data' and \
                    nx[1] == t + samples[t] - 1 and self.rom.u32(o + 4) == samples[t] - 1:
                # <sample>_len is defined next to the sample (size - 1)
                self.derived[o + 4] = '%s_len' % self.dlabel[t]
        self.class_names = {}
        self.file_of = None
        self.verified = None
        self.to_verify = {}

    def vma(self, off):
        return self.rom.seg_of_rom(off).to_vma(off)

    def vtag(self, off):
        """Address part of a generated label: the run address, prefixed with
        the overlay name when another overlay runs at the same addresses."""
        seg = self.rom.seg_of_rom(off)
        v = seg.to_vma(off)
        if any(o is not seg and o.name != 'rom' and o.has_vma(v) for o in self.rom.segs):
            return '%s_%08X' % (seg.name, v)
        return '%08X' % v

    def func_name(self, o):
        if o in self.names:
            return self.names[o]
        n = self.funcs[o].get('name')
        if n:
            return n
        return 'sub_%s' % self.vtag(o)

    def target_sym(self, seg, vma, want_thumb):
        """Symbol for a code address in segment seg, or in the one other
        segment that runs at that address (calls between ROM and RAM code);
        None if unknown or ambiguous (two overlays at the same address)."""
        if not seg.has_vma(vma):
            segs = [s for s in self.rom.segs if s.has_vma(vma)]
            if len(segs) != 1:
                return None
            seg = segs[0]
        off = seg.to_rom(vma)
        if off in self.sym and off in self.insns:
            return self.sym[off]
        return None

    def value_expr(self, val):
        """Expression for a 32-bit data word (pool / jump table entry)."""
        if 0x03000000 <= val < 0x03008000:
            segs = [s for s in self.rom.segs if s.name != 'rom' and s.has_vma(val & ~1)]
            if len(segs) > 1:
                segs = []       # overlays sharing a run address: ambiguous
        elif ROM_BASE <= val < ROM_BASE + 0x2000000:
            segs = [s for s in self.rom.segs if s.name == 'rom' and s.has_vma(val & ~1)]
        else:
            segs = []
        if True:
            if segs:
                seg = segs[0]
                off = seg.to_rom(val & ~1)
                if off in self.funcs:
                    th = self.funcs[off]['thumb']
                    if th and (val & 1):
                        return self.sym[off]
                    if not th and not (val & 1):
                        return self.sym[off]
                elif off in self.sym and off in self.insns and not (val & 1):
                    return self.sym[off]
                elif off in self.sym and off in self.insns and (val & 1) and self.insns[off][1]:
                    return self.sym[off] + '+1'
                elif off in self.sym and off in self.item_start and not (val & 1):
                    return self.sym[off]          # jump table / literal pool address
        if ROM_BASE <= val < ROM_BASE + self.rom.size:
            off = val - ROM_BASE
            if off in self.overlay_lma:
                return self.overlay_lma[off]
            # a pointer into an overlay's load image (its ROM copy): relative
            # to the overlay's load address, so it follows the overlay
            seg = self.rom.seg_of_rom(off)
            if seg.name != 'rom' and off in self.sym and off in self.insns and seg.rom_start in self.sym:
                # (the linker script defines it: as cannot subtract labels
                # of another file)
                name = '%s_%08X' % (self.overlay_lma[seg.rom_start], seg.to_vma(off))
                self.lma_refs[name] = (seg.name, self.sym[off])
                return name
            if off in self.dlabel:
                return self.dlabel[off]
        if val in self.ram_names:
            return self.ram_names[val]
        return '0x%08X' % val

    # -- data labels / pointers ---------------------------------------------
    def scan_data(self):
        """Label ROM data that code refers to, and find pointer words in data
        (function pointers, and data pointers that sit in tables or point at
        already-labelled data) so they can be emitted symbolically."""
        rom = self.rom
        covered = bytearray(self.code_end)
        for o, (sz, th) in self.insns.items():
            covered[o:o + sz] = b'\x01' * sz
        for o in self.pools:
            covered[o:o + 4] = b'\x01' * 4
        for o, j in self.jtables.items():
            covered[o:o + 4 * j['count']] = b'\x01' * (4 * j['count'])
        overlays = [(s.rom_start, s.rom_end) for s in rom.segs if s.name != 'rom']

        def is_data(off):
            if any(a <= off < b for a, b in overlays):
                return False
            return off >= self.code_end or not covered[off]

        def add_label(off):
            if off not in self.dlabel and off not in self.overlay_lma:
                self.dlabel[off] = 'gUnk_%08X' % (ROM_BASE + off)

        vals = list(self.pools.values()) + [rom.u32(o + 4 * k) for o, j in self.jtables.items() for k in range(j['count'])]
        for v in vals:
            if ROM_BASE <= v < ROM_BASE + rom.size and is_data(v - ROM_BASE):
                add_label(v - ROM_BASE)
        # candidate pointer words in data
        fptr, cand = {}, {}
        words = struct.unpack_from('<%dI' % (rom.size // 4), rom.d, 0)
        thumb_funcs = {o for o, f in self.funcs.items() if f['thumb'] and rom.seg_of_rom(o).name == 'rom'}
        lo, hi = ROM_BASE, ROM_BASE + rom.size
        for i, w in enumerate(words):
            o = 4 * i
            if not (lo <= w < hi):
                continue
            # (words inside overlay images are fine as long as they are not
            # part of decoded code: undecoded literal pools live there too)
            if o < self.code_end and covered[o:o + 4].count(1):
                continue
            t = w - ROM_BASE
            if self.noptr:
                k = bisect.bisect_right(self.noptr, (o, 1 << 62)) - 1
                if k >= 0 and self.noptr[k][0] <= o < self.noptr[k][1]:
                    continue
            if w & 1 and (t - 1) in thumb_funcs:
                fptr[o] = t - 1
            elif is_data(t):
                cand[o] = t
        # Data->data pointers.  Graphics full of palette index 8 produce many
        # 0x08xxxxxx look-alikes, so be conservative: accept a word if its target
        # is referenced directly by code, or if it is part of a run of >= 3
        # candidates with all-different targets that are either all 4-aligned
        # or strictly increasing and close together (string tables).
        code_refs = set(self.dlabel)
        accepted = {}

        def accept_segments(run):
            # split a run of adjacent candidates into maximal segments that are
            # either all 4-aligned with distinct targets, or strictly increasing
            # with small steps (string tables); keep segments of length >= 3
            for ok_pair in (lambda a, b: a % 4 == 0 and b % 4 == 0 and a != b,
                            lambda a, b: 0 < b - a < 0x10000):
                seg = [run[0]]
                for x in run[1:] + [None]:
                    if x is not None and ok_pair(cand[seg[-1]], cand[x]) and \
                            (cand[x] not in {cand[y] for y in seg}):
                        seg.append(x)
                        continue
                    if len(seg) >= 3:
                        for y in seg:
                            accepted[y] = cand[y]
                    seg = [x] if x is not None else []

        run = []
        for o in sorted(cand) + [None]:
            if run and (o is None or o != run[-1] + 4):
                accept_segments(run)
                run = []
            if o is not None:
                run.append(o)
        for o, t in cand.items():
            # target referenced by code; the word itself is a variable whose
            # address code takes (e.g. newlib's _impure_ptr); or a pointer to
            # something within 4KB of itself (linked structures, malloc bins)
            # ... or a word in an undecoded gap of the code area (literal pools
            # of code the analyzer could not trace, e.g. the ARM audio engine)
            if t in code_refs or o in code_refs or 0 < abs(t - o) < 0x1000 or o < self.code_end:
                accepted[o] = t
        # pointers embedded in sparse structs (e.g. sound-bank entries): a
        # 4-aligned target within 64KB, a word with four different bytes (pixel
        # data repeats bytes), and another candidate within 32 bytes
        cs = sorted(cand)
        for k, o in enumerate(cs):
            t = cand[o]
            if o in accepted or t % 4 or abs(t - o) >= 0x10000:
                continue
            if len(set(struct.pack('<I', t + ROM_BASE))) != 4:
                continue
            if (k > 0 and o - cs[k - 1] <= 32) or (k + 1 < len(cs) and cs[k + 1] - o <= 32):
                accepted[o] = t
        # sample definitions: (start, length, end): two pointers 8 bytes apart
        # with a small integer between them and end a little after start
        # (a definition of a known sample asset -- start and end match it
        # exactly -- is accepted whatever the bytes of the pointer look like)
        sample_end = {a[0]: a[0] + a[1] - 1 for a in self.assets if a[2] == 'sample'}
        for o, t in cand.items():
            if o + 8 in cand and words[(o + 4) // 4] < 0x1000000 and 0 < cand[o + 8] - t < 0x20000 \
                    and (len(set(struct.pack('<I', words[o // 4]))) == 4 or sample_end.get(t) == cand[o + 8]):
                accepted[o] = t
                accepted[o + 8] = cand[o + 8]
        # strided tables (arrays of structs with one pointer field, e.g. level
        # object lists {classinfo*, x, y, z}): >= 3 candidates at a constant
        # stride of 8..32 bytes, words with four different bytes, and targets
        # non-decreasing in small steps
        distinct = lambda o: len(set(struct.pack('<I', words[o // 4]))) == 4
        for stride in (8, 12, 16, 20, 24, 28, 32):
            for o in sorted(cand):
                if o in accepted or (o - stride) in cand or not distinct(o):
                    continue
                chain = [o]
                while (chain[-1] + stride) in cand and distinct(chain[-1] + stride) and \
                        0 <= cand[chain[-1] + stride] - cand[chain[-1]] < 0x10000:
                    chain.append(chain[-1] + stride)
                if len(chain) >= 3:
                    for x in chain:
                        accepted[x] = cand[x]
                    continue
                # unordered variant (e.g. sprite tables {frames*, palette*, 0, 0}):
                # needs >= 4 entries, all with 4-aligned targets
                chain = [o]
                while (chain[-1] + stride) in cand and distinct(chain[-1] + stride) and \
                        cand[chain[-1] + stride] % 4 == 0 and cand[o] % 4 == 0:
                    chain.append(chain[-1] + stride)
                if len(chain) >= 4:
                    for x in chain:
                        accepted[x] = cand[x]
        # fields of a struct whose other pointers were accepted: a candidate
        # (four different bytes, or a 4-aligned target) next to >= 2 accepted
        # pointers within 16 bytes is accepted too; repeat until nothing changes
        changed = True
        while changed:
            changed = False
            for o, t in cand.items():
                if o in accepted or (len(set(struct.pack('<I', t + ROM_BASE))) != 4 and t % 4):
                    continue
                near = sum(1 for d in (-16, -12, -8, -4, 4, 8, 12, 16) if (o + d) in accepted)
                if near >= 2:
                    accepted[o] = t
                    changed = True
        for t in accepted.values():
            add_label(t)
        for o, t in fptr.items():
            self.dptr[o] = ('func', t)
        for o, t in accepted.items():
            self.dptr[o] = ('data', t)
        # a label must not fall inside a pointer word
        for o in list(self.dptr):
            if any((o + k) in self.dlabel for k in (1, 2, 3)):
                del self.dptr[o]
        print('data labels: %d, symbolic pointers in data: %d (%d function, %d data)' % (
            len(self.dlabel), len(self.dptr), sum(1 for v in self.dptr.values() if v[0] == 'func'),
            sum(1 for v in self.dptr.values() if v[0] == 'data')), file=sys.stderr)

    # -- extracted assets -----------------------------------------------------
    ASSET_SOURCE = {'pal': '.pal', 'tiles4': '.png', 'tiles8': '.png', 'rsprite': '.png', 'sample': '.wav',
                    'gfx': '.bin', 'bin': '.bin',
                    'objects': '.s', 'sdata': '.s', 'text': '.txt', 'anim': '.s', 'aipath': '.s', 'checkpoints': '.s', 'hits': '.txt', 'edges': '.s', 'points': '.s'}

    def emit_asset(self, out, off):
        end = self.emit_asset_body(out, off)
        # an edited asset can change size: keep what follows on the alignment
        # it had in the ROM (up to 16), e.g. a pointer table after a script
        # block (no padding in the matching build)
        a = min(end & -end, 16)
        if a > 1:
            out.append('\t.balign %d' % a)
        return end

    def emit_asset_body(self, out, off):
        o, size, typ, name = self.asset_at[off]
        if typ == 'text':
            # generated by tools/assets.py from the .txt; defines its own labels
            # (the language tables), so nothing inside is labelled here
            out.append('\t.include "build/assets/%s.s"   @ from assets/%s.txt' % (name, name))
            return off + size
        if typ == 'anim':
            # assets/<name>.s defines the labels of the scripts itself
            out.append('\t.include "assets/%s.s"' % name)
            return off + size
        base = self.dlabel.get(off, '.Lasset_%06X' % off)
        if off not in self.dlabel:
            out.append('%s:' % base)
        if typ in ('objects', 'sdata', 'aipath', 'checkpoints', 'edges', 'points'):
            out.append('\t.include "assets/%s.s"' % name)
        else:
            out.append('\t.incbin "build/assets/%s.bin"   @ from assets/%s%s' % (name, name, self.ASSET_SOURCE[typ]))
        # labels that point inside the asset; for samples, the last byte (the
        # instrument definitions' inclusive end pointer) follows the real end
        end_label = None
        if typ == 'sample' and (off + size - 1) in self.dlabel:
            end_label = '.Lasset_end_%06X' % off
            out.append('%s:' % end_label)
        if end_label and off in self.dlabel:
            out.append('\t.global %s_len' % base)
            out.append('\t.set %s_len, %s - %s - 1' % (base, end_label, base))
        for lo in range(off + 1, off + size):
            if lo in self.dlabel:
                out.append('\t.global %s' % self.dlabel[lo])
                if end_label and lo == off + size - 1:
                    out.append('\t.set %s, %s - 1' % (self.dlabel[lo], end_label))
                else:
                    out.append('\t.set %s, %s + 0x%X' % (self.dlabel[lo], base, lo - off))
        return off + size

    def asset_text(self, off):
        """Assembly source for an 'objects' or 'sdata' asset (written by
        tools/assets.py extract; it contains the bytes of the ROM)."""
        o, size, typ, name = self.asset_at[off]
        rom = self.rom
        lines = ['@ %s: ROM 0x%06X, 0x%X bytes (extracted from baserom.gba by tools/assets.py)' % (name, off, size), '']
        if typ == 'objects':
            lines += ['@ level object list: x, y, z, class info (first byte = object class)', '']
            for k in range(size // 16):
                r = off + 16 * k
                x, y, z, p = struct.unpack_from('<4i', rom.d, r)
                if (x, y, z, p) == (0, 0, 0, 0):
                    lines.append('\tlevel_objects_end')
                    continue
                info = self.dptr_expr(r + 12) if (r + 12) in self.dptr else '0x%08X' % (p & 0xffffffff)
                cls = rom.d[(p & 0xffffffff) - ROM_BASE]
                lines.append('\tlevel_object %6d, %6d, %6d, %s   @ class %d %s' % (
                    x, y, z, info, cls, self.class_names.get(cls, '')))
            return lines
        # generic: words (symbolic where they are pointers), bytes at the edges
        k = off
        while k < off + size:
            if k % 4 == 0 and k + 4 <= off + size:
                if k in self.dptr:
                    lines.append('\t.4byte %s' % self.dptr_expr(k))
                else:
                    lines.append('\t.4byte 0x%08X' % rom.u32(k))
                k += 4
            else:
                lines.append('\t.byte 0x%02X' % rom.d[k])
                k += 1
        return lines

    def dptr_expr(self, o):
        kind, t = self.dptr[o]
        if kind == 'func':
            return self.sym[t]
        return self.dlabel[t]

    # -- instruction formatting ---------------------------------------------
    def fmt_insn(self, off, seg):
        size, thumb = self.insns[off]
        a = seg.to_vma(off)
        b = self.rom.d[off:off + size]
        if off in self.raw:
            return self.raw_insn(off, size, thumb)
        if thumb and (struct.unpack('<H', b[:2])[0] & 0xf800) == 0xe800:
            return '\t.2byte 0x%04X @ debug trap' % struct.unpack('<H', b[:2])[0]
        if not thumb and struct.unpack('<I', b)[0] == 0xe7ffffff:
            return '\t.4byte 0xE7FFFFFF @ debug trap'
        md = md_t if thumb else md_a
        ins = list(md.disasm(b, a, 1))
        if not ins:
            return self.raw_insn(off, size, thumb)
        i = ins[0]
        mn, op = i.mnemonic, i.op_str
        name = mn
        # branches
        m = re.match(r'^(b|bl|b[a-z]{2}|bl[a-z]{2})$', mn)
        if m and op.startswith('#'):
            tgt = int(op[1:], 16)
            s = self.target_sym(seg, tgt, thumb)
            if s is None:
                return self.raw_insn(off, size, thumb)
            return '\t%s %s' % (mn, s)
        # pc-relative loads
        mm = re.match(r'^(.*), \[pc, #(-?0x[0-9a-f]+|-?\d+)\]$', op)
        if mm and mn.startswith('ldr'):
            disp = int(mm.group(2), 0)
            ea = (((a + 4) & ~3) + disp) if thumb else (a + 8 + disp)
            if seg.has_vma(ea):
                po = seg.to_rom(ea)
                if po in self.sym and po in self.item_start and (self.file_of is None or self.file_of(po) == self.file_of(off)):
                    return '\t%s %s, %s' % (mn, mm.group(1), self.sym[po])
            return self.raw_insn(off, size, thumb)
        if mm is None and '[pc' in op and mn.startswith('ldr'):
            return self.raw_insn(off, size, thumb)
        if mn == 'adr':
            r, imm = op.split(', ')
            op = '%s, pc, %s' % (r, imm)
            mn = 'add'
        txt = '%s %s' % (mn, op) if op else mn
        if self.verified is not None:
            key = (thumb, txt)
            if self.verified.get(key) != bytes(b):
                return self.raw_insn(off, size, thumb)
        else:
            self.to_verify.setdefault((thumb, txt), set()).add(bytes(b))
        return '\t' + txt

    def raw_insn(self, off, size, thumb):
        b = self.rom.d[off:off + size]
        md = md_t if thumb else md_a
        ins = list(md.disasm(b, self.vma(off), 1))
        txt = ('%s %s' % (ins[0].mnemonic, ins[0].op_str)) if ins else '?'
        if thumb and size == 4:
            h1, h2 = struct.unpack('<HH', b)
            return '\t.2byte 0x%04X, 0x%04X @ %s' % (h1, h2, txt)
        if thumb:
            return '\t.2byte 0x%04X @ %s' % (struct.unpack('<H', b)[0], txt)
        return '\t.4byte 0x%08X @ %s' % (struct.unpack('<I', b)[0], txt)

    # -- file emission ------------------------------------------------------
    def emit_range(self, out, seg, start, end):
        """Emit [start,end) of segment seg."""
        off = start
        mode = None
        rom = self.rom
        while off < end:
            if off in self.dlabel:
                out.append('\t.global %s' % self.dlabel[off])
                out.append('%s:' % self.dlabel[off])
            if off in self.asset_at:
                off = self.emit_asset(out, off)
                continue
            if off in self.dptr:
                out.append('\t.4byte %s' % self.dptr_expr(off))
                off += 4
                continue
            if off in self.derived:
                out.append('\t.4byte %s' % self.derived[off])
                off += 4
                continue
            # labels
            if off in self.sym and off in self.item_start:
                s = self.sym[off]
                if off in self.funcs:
                    th = self.funcs[off]['thumb']
                    if mode != th:
                        out.append('\t.thumb' if th else '\t.arm')
                        mode = th
                    out.append('')
                    out.append('\t.global %s' % s)
                    if th:
                        out.append('\t.thumb_func')
                    out.append('\t.type %s, %%function' % s)
                    out.append('%s: @ %08X' % (s, seg.to_vma(off)))
                else:
                    if s in self.global_labels:
                        out.append('\t.global %s' % s)
                    out.append('%s:' % s)
            if off in self.insns:
                size, th = self.insns[off]
                if mode != th:
                    out.append('\t.thumb' if th else '\t.arm')
                    mode = th
                out.append(self.fmt_insn(off, seg))
                off += size
                continue
            if off in self.pools:
                out.append('\t.4byte %s' % self.pool_sym.get(off, self.value_expr(self.pools[off])))
                off += 4
                continue
            if off in self.jtables:
                j = self.jtables[off]
                for k in range(j['count']):
                    o2 = off + 4 * k
                    if k and o2 in self.sym:
                        out.append('%s:' % self.sym[o2])
                    out.append('\t.4byte %s' % self.value_expr(rom.u32(o2)))
                off += 4 * j['count']
                continue
            # data gap: up to the next item, label or pointer
            k = bisect.bisect_right(self.breaks, off)
            nxt = min(end, self.breaks[k]) if k < len(self.breaks) else end
            n = nxt - off
            if n > SMALL_DATA:
                out.append('\t.incbin "baserom.gba", 0x%X, 0x%X' % (off, n))
            else:
                bs = rom.d[off:nxt]
                for k in range(0, n, 16):
                    out.append('\t.byte ' + ', '.join('0x%02X' % x for x in bs[k:k + 16]))
            off = nxt

    def compute_global_labels(self, file_of):
        """Branch labels referenced from another file must be global."""
        self.global_labels = set()
        for off, (size, th) in self.insns.items():
            seg = self.rom.seg_of_rom(off)
            b = self.rom.d[off:off + size]
            md = md_t if th else md_a
            ins = list(md.disasm(b, seg.to_vma(off), 1))
            if not ins:
                continue
            i = ins[0]
            if re.match(r'^(b|bl|b[a-z]{2}|bl[a-z]{2})$', i.mnemonic) and i.op_str.startswith('#'):
                tgt = int(i.op_str[1:], 16)
                if seg.has_vma(tgt):
                    to = seg.to_rom(tgt)
                    if file_of(to) != file_of(off) and to in self.sym:
                        self.global_labels.add(self.sym[to])
        for po, val in list(self.pools.items()) + [(o + 4 * k, self.rom.u32(o + 4 * k)) for o, j in self.jtables.items() for k in range(j['count'])]:
            e = self.value_expr(val)
            base = e.split('+')[0]
            if not base.startswith('0x'):
                self.global_labels.add(base)
        for ovl, label in self.lma_refs.values():
            self.global_labels.add(label)

    def verify_encodings(self, tmpdir):
        """Assemble every distinct label-free instruction text once and keep
        only those whose encoding matches the original bytes."""
        import subprocess
        # collect
        self.verified = None
        self.to_verify = {}
        for off in sorted(self.insns):
            seg = self.rom.seg_of_rom(off)
            self.fmt_insn(off, seg)
        items = [(k, v) for k, v in self.to_verify.items() if len(v) == 1]
        ok = {}
        for thumb in (True, False):
            its = [(k, v) for k, v in items if k[0] == thumb]
            src = ['\t.syntax unified', '\t.cpu arm7tdmi', '\t.thumb' if thumb else '\t.arm']
            line_of = {}
            for n, ((th, txt), v) in enumerate(its):
                src.append('\t.org %d' % (n * 8))
                src.append('\t' + txt)
                line_of[len(src)] = n
            sp = os.path.join(tmpdir, 'verify_%s.s' % ('t' if thumb else 'a'))
            op = sp[:-2] + '.o'
            bp = sp[:-2] + '.bin'
            open(sp, 'w').write('\n'.join(src) + '\n')
            bad = set()
            for _ in range(20):
                r = subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-o', op, sp], capture_output=True, text=True)
                if r.returncode == 0:
                    break
                for l in r.stderr.splitlines():
                    m = re.match(r'.*:(\d+): Error', l)
                    if m:
                        ln = int(m.group(1))
                        bad.add(ln)
                lines = open(sp).read().split('\n')
                for ln in bad:
                    if not lines[ln - 1].startswith('\t@'):
                        lines[ln - 1] = '\t@' + lines[ln - 1]
                open(sp, 'w').write('\n'.join(lines))
            subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', op, bp], check=True)
            out = open(bp, 'rb').read()
            for n, ((th, txt), v) in enumerate(its):
                exp = next(iter(v))
                got = out[n * 8:n * 8 + len(exp)]
                if got == exp and n not in {line_of.get(x) for x in bad}:
                    ok[(th, txt)] = exp
        self.verified = ok
        nbad = len(self.to_verify) - len(ok)
        print('encoding check: %d distinct, %d fall back to raw' % (len(self.to_verify), nbad), file=sys.stderr)

    def generate(self, outdir):
        rom = self.rom
        import tempfile
        with tempfile.TemporaryDirectory() as td:
            self.verify_encodings(td)
        # split points: segment boundaries + configured file splits (must be 4-aligned)
        cuts = {}
        for s in rom.segs:
            if s.rom_start < self.code_end:
                cuts[s.rom_start] = None
        cuts[self.code_end] = None
        for o in range(0x100000, rom.size, 0x100000):
            # never cut through an extracted asset: move the cut past it
            moved = True
            while moved:
                moved = False
                for (ao, asz, at, an) in self.assets:
                    if ao < o < ao + asz:
                        o = (ao + asz + 255) & ~255
                        moved = True
            cuts.setdefault(o, None)
        for (o, fn) in self.files:
            assert o % 4 == 0, hex(o)
            cuts[o] = fn
        if not self.files:
            # automatic split: at an aligned function start every ~16KB
            last = 0
            for o in sorted(self.funcs):
                if o % 4 == 0 and o - last >= 0x4000 and o < self.code_end:
                    cuts.setdefault(o, None)
                    last = o
                if o in cuts:
                    last = o
        pts = sorted(cuts)
        chunks = []
        for k, p in enumerate(pts):
            e = pts[k + 1] if k + 1 < len(pts) else rom.size
            seg = rom.seg_of_rom(p)
            e = min(e, seg.rom_end)
            if p >= e:
                continue
            fn = cuts[p]
            if p >= self.code_end:
                fn = fn or 'data/data_%08X.s' % (ROM_BASE + p)
            else:
                fn = fn or 'asm/code_%08X.s' % seg.to_vma(p)
            chunks.append((p, e, seg, fn))
        # chunks may be cut further at segment ends
        def file_of(off):
            for (p, e, seg, fn) in chunks:
                if p <= off < e:
                    return fn
            return None
        self.file_of = file_of
        self.compute_global_labels(file_of)
        self.breaks = sorted(set(self.insns) | set(self.pools) | set(self.jtables) | set(self.dlabel)
                             | set(self.dptr) | {o for o in self.sym if o in self.item_start} | set(self.asset_at)
                             | set(self.derived))
        objs = []
        for (p, e, seg, fn) in chunks:
            out = ['@ %s: ROM 0x%06X-0x%06X (%s, VMA 0x%08X)' % (fn, p, e, seg.name, seg.to_vma(p)), '',
                   '\t.include "asm/macros.inc"', '']
            sect = '.text' if seg.name == 'rom' else '.' + seg.name
            out.append('\t.section %s, "ax", %%progbits' % sect)
            # Data keeps the alignment it had in the original ROM (some readers,
            # e.g. the intro movie, round addresses up to 16 bytes), so that a
            # build with resized code still lays it out on the same boundaries.
            align = 4
            if p >= self.code_end:
                while align < 256 and p % (align * 2) == 0:
                    align *= 2
            out.append('\t.balign %d' % align)
            out.append('')
            self.emit_range(out, seg, p, e)
            path = os.path.join(outdir, fn)
            os.makedirs(os.path.dirname(path), exist_ok=True)
            open(path, 'w').write('\n'.join(out) + '\n')
            objs.append((fn, seg, p, e))
        # linker script
        # Sections are laid out one after another (no fixed addresses), so code
        # and data can grow or shrink; overlays get their own VMA and load right
        # after the preceding ROM section.
        ld = ['/* generated by tools/gen_asm.py */', 'OUTPUT_ARCH(arm)', 'ENTRY(_start)', '']
        for a, n in sorted(self.ram_names.items()):
            ld.append('%s = 0x%08X;' % (n, a))
        ld += ['', 'SECTIONS', '{']
        groups = []
        for (fn, seg, p, e) in objs:
            if groups and groups[-1][0] is seg.name and seg.name == 'rom' and groups[-1][1] == 'rom':
                groups[-1][2].append(fn)
            elif groups and groups[-1][1] == seg.name and seg.name != 'rom' and groups[-1][3] is seg:
                groups[-1][2].append(fn)
            else:
                groups.append([seg.name, seg.name, [fn], seg])
        prev = None
        for k, (_, name, fns, seg) in enumerate(groups):
            sect = '.text' if name == 'rom' else '.' + name
            body = ' '.join('build/%s.o(%s)' % (fn[:-2], sect) for fn in fns)
            osec = '.rom%d' % k if name == 'rom' else '.' + name
            if prev is None:
                ld.append('\t%s 0x%08X : { %s }' % (osec, ROM_BASE, body))
            else:
                lma = 'LOADADDR(%s) + SIZEOF(%s)' % (prev, prev)
                vma = lma if name == 'rom' else '0x%08X' % seg.vma
                ld.append('\t%s %s : AT(%s) { %s }' % (osec, vma, lma, body))
            if name != 'rom':
                ld.append('\t__%s_lma = LOADADDR(%s);' % (name, osec))
                ld.append('\t__%s_size = SIZEOF(%s);' % (name, osec))
                for sym_, (ovl, label) in sorted(self.lma_refs.items()):
                    if ovl == name:
                        ld.append('\t%s = LOADADDR(%s) + (%s - ADDR(%s));' % (sym_, osec, label, osec))
            prev = osec
        ld += ['', '\t/DISCARD/ : { *(.ARM.attributes) *(.comment) }', '}']
        open(os.path.join(outdir, 'ld_script.ld'), 'w').write('\n'.join(ld) + '\n')
        mk = ['# generated by tools/gen_asm.py', 'OBJS := \\']
        mk += ['\tbuild/%s.o \\' % fn[:-2] for (fn, seg, p, e) in objs]
        mk.append('')
        open(os.path.join(outdir, 'objects.mk'), 'w').write('\n'.join(mk) + '\n')
        # map of instruction -> file for the fixup loop
        return objs


def load_assets(path):
    """config/assets.txt: <offset> <size> <type> <name>"""
    out = []
    if os.path.exists(path):
        for l in open(path):
            p = l.split('#')[0].split()
            if len(p) == 4:
                out.append((int(p[0], 0), int(p[1], 0), p[2], p[3]))
    return out


def load_list(path):
    s = set()
    if os.path.exists(path):
        for l in open(path):
            l = l.split('#')[0].strip()
            if l:
                s.add(int(l, 0))
    return s


def make_gen(rom_path, db_path, cfg_path):
    """Build the generator (analysis of code, data labels and pointers)."""
    data = open(rom_path, 'rb').read()
    cfg = parse_cfg(cfg_path)
    rom = ROM(data, cfg)
    db = json.load(open(db_path))
    cdir = os.path.dirname(cfg_path)
    raw = load_list(os.path.join(cdir, 'raw_insns.txt'))
    names = {}
    np = os.path.join(cdir, 'symbols.txt')
    if os.path.exists(np):
        for l in open(np):
            l = l.split('#')[0].split()
            if len(l) >= 2:
                # "<overlay>:<address>" names code in one of the overlays
                # that share a run address (ovl_a, ovl_b)
                if ':' in l[0]:
                    ovl, a = l[0].split(':')
                    a = int(a, 0)
                    seg = [sg for sg in rom.segs if sg.name == ovl][0]
                else:
                    a = int(l[0], 0)
                    seg = rom.seg_of_vma(a & ~1)
                names[seg.to_rom(a & ~1)] = l[1]
    files = []
    fp = os.path.join(cdir, 'files.txt')
    if os.path.exists(fp):
        for l in open(fp):
            l = l.split('#')[0].split()
            if len(l) >= 2:
                files.append((int(l[0], 0), l[1]))
    ram = {}
    rp = os.path.join(cdir, 'ram_symbols.txt')
    if os.path.exists(rp):
        for l in open(rp):
            l = l.split('#')[0].split()
            if len(l) >= 2:
                ram[int(l[0], 0)] = l[1]
    return Gen(rom, db, cfg, raw, names, files, ram, assets=load_assets(os.path.join(cdir, 'assets.txt')))


def main():
    rom_path, db_path, cfg_path, outdir = sys.argv[1:5]
    g = make_gen(rom_path, db_path, cfg_path)
    g.generate(outdir)


if __name__ == '__main__':
    main()
