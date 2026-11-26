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
import sys, os, json, struct, re
import capstone as cs

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from analyze import parse_cfg, ROM, ROM_BASE  # noqa: E402

md_t = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_THUMB)
md_a = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_ARM)

SMALL_DATA = 64   # gaps up to this size are emitted as .byte, larger as .incbin


class Gen:
    def __init__(self, rom, db, cfg, raw, names, files):
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
                self.sym[o] = '_%08X' % self.vma(o)
        for o in self.pools:
            if o not in self.sym:
                self.sym[o] = '_%08X' % self.vma(o)
        for o in self.jtables:
            if o not in self.sym:
                self.sym[o] = '_%08X' % self.vma(o)
        self.globals = set(self.funcs)
        self.file_of = None
        self.verified = None
        self.to_verify = {}

    def vma(self, off):
        return self.rom.seg_of_rom(off).to_vma(off)

    def func_name(self, o):
        if o in self.names:
            return self.names[o]
        n = self.funcs[o].get('name')
        if n:
            return n
        return 'sub_%08X' % self.vma(o)

    def target_sym(self, seg, vma, want_thumb):
        """Symbol for a code address within segment seg, or None."""
        if not seg.has_vma(vma):
            return None
        off = seg.to_rom(vma)
        if off in self.sym and off in self.insns:
            return self.sym[off]
        return None

    def value_expr(self, val):
        """Expression for a 32-bit data word (pool / jump table entry)."""
        if 0x03000000 <= val < 0x03008000:
            segs = [s for s in self.rom.segs if s.name == 'iwram' and s.has_vma(val & ~1)]
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
        return '0x%08X' % val

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
                out.append('\t.4byte %s' % self.value_expr(self.pools[off]))
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
            # data gap: up to next item
            nxt = off + 1
            while nxt < end and nxt not in self.insns and nxt not in self.pools and nxt not in self.jtables \
                    and not (nxt in self.sym and nxt in self.item_start):
                nxt += 1
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
        objs = []
        for (p, e, seg, fn) in chunks:
            out = ['@ %s: ROM 0x%06X-0x%06X (%s, VMA 0x%08X)' % (fn, p, e, seg.name, seg.to_vma(p)), '',
                   '\t.include "asm/macros.inc"', '']
            sect = '.text' if seg.name == 'rom' else '.' + seg.name
            out.append('\t.section %s, "ax", %%progbits' % sect)
            out.append('\t.balign 4')
            out.append('')
            if p >= self.code_end:
                out.append('\t.incbin "baserom.gba", 0x%X, 0x%X' % (p, e - p))
            else:
                self.emit_range(out, seg, p, e)
            path = os.path.join(outdir, fn)
            os.makedirs(os.path.dirname(path), exist_ok=True)
            open(path, 'w').write('\n'.join(out) + '\n')
            objs.append((fn, seg, p, e))
        # linker script
        ld = ['/* generated by tools/gen_asm.py */', 'OUTPUT_ARCH(arm)', 'ENTRY(_start)', '', 'SECTIONS', '{']
        for (fn, seg, p, e) in objs:
            o = 'build/' + fn[:-2] + '.o'
            sect = '.text' if seg.name == 'rom' else '.' + seg.name
            secname = 's_%06X' % p
            ld.append('\t%s 0x%08X : AT(0x%08X) { %s(%s) }' % (secname, seg.to_vma(p), ROM_BASE + p, o, sect))
        ld += ['', '\t/DISCARD/ : { *(.ARM.attributes) *(.comment) }', '}']
        open(os.path.join(outdir, 'ld_script.ld'), 'w').write('\n'.join(ld) + '\n')
        mk = ['# generated by tools/gen_asm.py', 'OBJS := \\']
        mk += ['\tbuild/%s.o \\' % fn[:-2] for (fn, seg, p, e) in objs]
        mk.append('')
        open(os.path.join(outdir, 'objects.mk'), 'w').write('\n'.join(mk) + '\n')
        # map of instruction -> file for the fixup loop
        return objs


def load_list(path):
    s = set()
    if os.path.exists(path):
        for l in open(path):
            l = l.split('#')[0].strip()
            if l:
                s.add(int(l, 0))
    return s


def main():
    rom_path, db_path, cfg_path, outdir = sys.argv[1:5]
    data = open(rom_path, 'rb').read()
    cfg = parse_cfg(cfg_path)
    rom = ROM(data, cfg)
    db = json.load(open(db_path))
    raw = load_list(os.path.join(os.path.dirname(cfg_path), 'raw_insns.txt'))
    names = {}
    files = []
    np = os.path.join(os.path.dirname(cfg_path), 'symbols.txt')
    if os.path.exists(np):
        for l in open(np):
            l = l.split('#')[0].split()
            if len(l) >= 2:
                a = int(l[0], 0)
                seg = rom.seg_of_vma(a & ~1)
                names[seg.to_rom(a & ~1)] = l[1]
    fp = os.path.join(os.path.dirname(cfg_path), 'files.txt')
    if os.path.exists(fp):
        for l in open(fp):
            l = l.split('#')[0].split()
            if len(l) >= 2:
                files.append((int(l[0], 0), l[1]))
    g = Gen(rom, db, cfg, raw, names, files)
    g.generate(outdir)


if __name__ == '__main__':
    main()
