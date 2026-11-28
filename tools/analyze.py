#!/usr/bin/env python3
"""
Static code/data analyzer for the Diddy Kong Pilot (2003 build) GBA ROM.

Performs recursive-descent disassembly of Thumb and ARM code (including the
IWRAM overlay that crt0 copies to 0x03000000), discovering functions, branch
labels, literal pools and jump tables.  The result is written to a JSON
database consumed by gen_asm.py.

Usage: analyze.py baserom.gba config.cfg out.json
"""
import sys, struct, json, re
import capstone as cs

ROM_BASE = 0x08000000

# ---------------------------------------------------------------------------
# Memory map
# ---------------------------------------------------------------------------
class Seg:
    def __init__(self, name, rom_start, rom_end, vma):
        self.name, self.rom_start, self.rom_end, self.vma = name, rom_start, rom_end, vma
    def has_vma(self, a):
        return self.vma <= a < self.vma + (self.rom_end - self.rom_start)
    def to_rom(self, a):
        return a - self.vma + self.rom_start
    def to_vma(self, off):
        return off - self.rom_start + self.vma


class ROM:
    def __init__(self, data, cfg):
        self.d = data
        self.size = len(data)
        self.segs = []
        ov = cfg['overlays']
        cur = 0
        for (name, rs, re_, vma) in sorted(ov, key=lambda x: x[1]):
            if rs > cur:
                self.segs.append(Seg('rom', cur, rs, ROM_BASE + cur))
            self.segs.append(Seg(name, rs, re_, vma))
            cur = re_
        self.segs.append(Seg('rom', cur, self.size, ROM_BASE + cur))

    def seg_of_vma(self, a, hint=None):
        if hint is not None and hint.has_vma(a):
            return hint
        for s in self.segs:
            if s.has_vma(a):
                return s
        return None

    def seg_of_rom(self, off):
        for s in self.segs:
            if s.rom_start <= off < s.rom_end:
                return s
        return None

    def u16(self, off):
        return struct.unpack_from('<H', self.d, off)[0]

    def u32(self, off):
        return struct.unpack_from('<I', self.d, off)[0]


# ---------------------------------------------------------------------------
# Instruction validity (ARMv4T)
# ---------------------------------------------------------------------------
THUMB_OK = set('''lsl lsr asr add sub mov cmp and eor adc sbc ror tst rsb neg cmn orr mul bic mvn
bx ldr str strh strb ldrh ldrb ldrsb ldrsh push pop stm ldm b bl svc adr trap'''.split())
ARM_OK = set('''and eor sub rsb add adc sbc rsc tst teq cmp cmn orr mov bic mvn mul mla umull umlal
smull smlal ldr str ldrb strb ldrh strh ldrsb ldrsh ldrt strt ldrbt strbt ldm stm ldmda ldmdb ldmib
stmda stmdb stmib push pop swp swpb b bl bx mrs msr svc cdp ldc stc mcr mrc lsl lsr asr ror rrx nop trap'''.split())

md_t = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_THUMB)
md_t.detail = True
md_a = cs.Cs(cs.CS_ARCH_ARM, cs.CS_MODE_ARM)
md_a.detail = True

AL = cs.arm.ARM_CC_AL
REG_PC = cs.arm.ARM_REG_PC
REG_LR = cs.arm.ARM_REG_LR


class Trap:
    """Pseudo instruction for the 0xE8xx-0xEFxx undefined opcodes."""
    size = 2
    operands = []
    cc = AL
    mnemonic = '.2byte'
    op_str = ''
    def __init__(self, a):
        self.address = a
    def insn_name(self):
        return 'trap'


class ArmTrap(Trap):
    size = 4
    mnemonic = '.4byte'


def decode(rom, off, vma, thumb):
    """Decode one instruction at ROM offset `off` (address `vma`).
    Returns capstone insn or None if invalid for ARMv4T."""
    if thumb:
        if off + 2 > rom.size:
            return None
        hw = rom.u16(off)
        if (hw & 0xf800) == 0xf000:  # BL prefix
            if off + 4 > rom.size or (rom.u16(off + 2) & 0xf800) != 0xf800:
                return None
            buf = rom.d[off:off + 4]
        elif (hw & 0xf800) == 0xe800:
            return Trap(vma)  # undefined on v4T; used by the game as a debug trap after asserts
        elif (hw & 0xe000) == 0xe000 and (hw & 0xf800) != 0xe000:
            return None  # Thumb-2 32-bit prefix: invalid on v4T
        else:
            buf = rom.d[off:off + 2]
        insns = list(md_t.disasm(buf, vma, 1))
        if not insns:
            return None
        i = insns[0]
        name = i.insn_name()
        if name not in THUMB_OK:
            return None
        if name == 'bx' and (hw & 0x87) != 0:
            return None
        if hw == 0xdf00 and False:
            return None
        # hi-register ops with both low regs are UNPREDICTABLE on v4T (add/mov/cmp)
        if (hw & 0xfc00) == 0x4400 and (hw & 0x0300) != 0x0300 and (hw & 0xc0) == 0:
            return None
        return i
    else:
        if off + 4 > rom.size or (off & 3):
            return None
        w = rom.u32(off)
        if (w >> 28) == 0xf:
            return None  # unconditional space: invalid on v4
        if w == 0xe7ffffff:
            return ArmTrap(vma)
        insns = list(md_a.disasm(rom.d[off:off + 4], vma, 1))
        if not insns:
            return None
        i = insns[0]
        name = i.insn_name()
        if name not in ARM_OK:
            return None
        return i


# ---------------------------------------------------------------------------
# Database
# ---------------------------------------------------------------------------
CODE_T, CODE_A, POOL, JTBL = 'T', 'A', 'P', 'J'


class DB:
    def __init__(self):
        self.kind = {}        # rom offset -> (kind, start_off)   for every byte
        self.insn_at = {}     # rom offset -> (size, thumb)
        self.funcs = {}       # rom offset -> {'thumb':bool, 'name':str|None}
        self.labels = {}      # rom offset -> thumb(bool)  (branch targets)
        self.pools = {}       # rom offset -> value
        self.jtables = {}     # rom offset -> {'count':n, 'thumb':bool}
        self.far_jumps = set()


class Unit:
    """Uncommitted results of tracing one function (for rollback)."""
    def __init__(self):
        self.kind = {}
        self.insn_at = {}
        self.labels = {}
        self.pools = {}
        self.jtables = {}
        self.calls = []       # (vma, thumb, seg) function candidates
        self.ptrs = []        # pool values
        self.ok = True
        self.why = ''


class Analyzer:
    def __init__(self, rom, cfg):
        self.rom = rom
        self.cfg = cfg
        self.db = DB()
        self.log = []
        self.code_limit = cfg.get('code_end') or rom.size
        self.arm_areas = cfg.get('arm_areas', [])
        self.noreturn = set()

    def allowed(self, seg, off, thumb):
        if seg.name != 'rom':
            return True
        if off < self.code_limit:
            return True
        for (s, e) in self.arm_areas:
            if s <= off < e:
                return True
        return False

    # -- claims -----------------------------------------------------------
    def claim(self, u, off, size, kind):
        for b in range(off, off + size):
            ex = self.db.kind.get(b) or u.kind.get(b)
            if ex is not None:
                if ex == (kind, off):
                    continue
                return False
        for b in range(off, off + size):
            u.kind[b] = (kind, off)
        return True

    def is_claimed(self, u, off):
        return off in self.db.kind or off in u.kind

    def known_func(self, off):
        return off in self.db.funcs

    # -- tracing ------------------------------------------------------------
    def trace(self, vma, thumb, seg=None, speculative=False, cap=20000, func_start=None):
        rom = self.rom
        seg = rom.seg_of_vma(vma, seg)
        u = Unit()
        if seg is None:
            u.ok, u.why = False, 'no seg'
            return u
        start = seg.to_rom(vma)
        if (thumb and (start & 1)) or (not thumb and (start & 3)):
            u.ok, u.why = False, 'misaligned'
            return u
        work = [(start, {})]
        seen = set()
        self._seen = seen
        self._start = start if func_start is None else func_start
        n = 0
        while work:
            off, regs = work.pop()
            regs = dict(regs)   # reg -> known constant value (from pc-rel load)
            prev = None
            first = True
            while True:
                if off in seen:
                    break
                k = self.db.kind.get(off)
                if k is not None:
                    if k == ((CODE_T if thumb else CODE_A), off):
                        if speculative and not first and off in self.db.funcs and off != start:
                            u.ok, u.why = False, 'falls through into function %x' % off
                            return u
                        break  # merges with existing code
                    if k[0] == 'P' and prev is not None and prev.insn_name() == 'bl' and not speculative:
                        # a literal pool right after a bl: the bl is a far
                        # jump (it never returns)
                        break
                    u.ok, u.why = False, 'conflict at %x with %s' % (off, k)
                    return u
                if not (seg.rom_start <= off < seg.rom_end) or not self.allowed(seg, off, thumb):
                    u.ok, u.why = False, 'ran out of segment at %x' % off
                    return u
                seen.add(off)
                n += 1
                if n > cap:
                    u.ok, u.why = False, 'too long'
                    return u
                a = seg.to_vma(off)
                i = decode(rom, off, a, thumb)
                if i is None:
                    if prev is not None and prev.insn_name() == 'bl':
                        tgt = prev.operands[0].imm
                        to_ = seg.to_rom(tgt) if seg.has_vma(tgt) else -1
                        if tgt in self.noreturn or not speculative or (thumb and 0 < tgt - a < 0x1000) \
                                or (thumb and self._start <= to_ <= off):
                            # call to a function that never returns
                            self.noreturn.add(tgt)
                            seen.discard(off)
                            break
                    u.ok, u.why = False, 'invalid insn at %x' % off
                    return u
                if not self.claim(u, off, i.size, CODE_T if thumb else CODE_A):
                    u.ok, u.why = False, 'overlap at %x' % off
                    return u
                u.insn_at[off] = (i.size, thumb)
                r = self.step(u, seg, off, a, i, thumb, regs, prev, work, speculative)
                if r is False:
                    return u
                prev = i
                first = False
                if r is None:
                    break
                off = r
        return u

    def pool_load(self, u, seg, a, i, thumb, size=4):
        """Return (pool_rom_off, value) for pc-relative loads or None."""
        ops = i.operands
        if len(ops) < 2 or ops[1].type != cs.arm.ARM_OP_MEM:
            return None
        m = ops[1].mem
        if m.base != REG_PC or m.index != 0:
            return None
        disp = m.disp
        if thumb:
            ea = ((a + 4) & ~3) + disp
        else:
            ea = a + 8 + disp  # capstone gives signed disp
            if getattr(ops[1], 'subtracted', False):
                ea = a + 8 - disp
        po = seg.to_rom(ea) if seg.has_vma(ea) else None
        if po is None:
            return None
        if size == 4:
            if po & 3:
                return None
            return po, self.rom.u32(po)
        return po, None

    def step(self, u, seg, off, a, i, thumb, regs, prev, work, spec):
        """Process one instruction.  Return next rom offset, None to end block,
        or False on fatal (u.ok set False)."""
        name = i.insn_name()
        nxt = off + i.size
        ops = i.operands
        cc = i.cc
        # --- pc-relative loads
        if name in ('ldr', 'ldrh', 'ldrb', 'ldrsh', 'ldrsb') and len(ops) >= 2 and ops[1].type == cs.arm.ARM_OP_MEM and ops[1].mem.base == REG_PC:
            sz = {'ldr': 4, 'ldrh': 2, 'ldrsh': 2, 'ldrb': 1, 'ldrsb': 1}[name]
            r = self.pool_load(u, seg, a, i, thumb, 4 if sz == 4 else 0)
            if r is not None:
                po, val = r
                if sz == 4:
                    if not self.claim(u, po, 4, POOL):
                        u.ok, u.why = False, 'pool conflict at %x' % po
                        return False
                    u.pools[po] = val
                    u.ptrs.append(val)
                    dst = ops[0].reg
                    if dst == REG_PC:
                        # ldr pc, =target
                        self.add_target(u, val & ~1, bool(val & 1), call=False)
                        return None if cc == AL else nxt
                    regs[dst] = val
            return nxt
        if name == 'ldr' and len(ops) == 2 and ops[1].type == cs.arm.ARM_OP_MEM and ops[1].mem.index != 0:
            m = ops[1].mem
            for r_ in (m.base, m.index):
                if isinstance(regs.get(r_), int):
                    regs[ops[0].reg] = ('jt', regs[r_])
                    return nxt
        if name == 'cmp' and len(ops) == 2 and ops[1].type == cs.arm.ARM_OP_IMM:
            regs['cmp'] = ops[1].imm
        # --- branches
        if name == 'b':
            tgt = ops[0].imm
            to = seg.to_rom(tgt) if seg.has_vma(tgt) else None
            if to is None:
                u.ok, u.why = False, 'branch out of seg %x' % tgt
                return False
            if self.known_func(to):
                pass  # tail call
            else:
                u.labels[to] = thumb
                work.append((to, regs))
            return nxt if cc != AL else None
        if name == 'bl':
            tgt = ops[0].imm
            to = seg.to_rom(tgt) if seg.has_vma(tgt) else None
            if thumb and to is not None and self._start < to <= off and not self.known_func(to):
                # agbcc far jump: "bl" back into this same function
                u.labels[to] = thumb
                u.far = getattr(u, 'far', set()) | {to}
                return None
            u.calls.append((tgt, thumb, seg))
            return nxt
        if name == 'bx':
            r = ops[0].reg
            is_call = prev is not None and prev.insn_name() in ('mov', 'add') and len(prev.operands) >= 2 \
                and prev.operands[0].reg == REG_LR and prev.operands[1].type == cs.arm.ARM_OP_REG \
                and prev.operands[1].reg == REG_PC
            if isinstance(regs.get(r), int):
                v = regs[r]
                self.add_target(u, v & ~1, bool(v & 1), call=True)
            if is_call or cc != AL:
                return nxt
            return None
        # --- writes to pc
        writes_pc = False
        if name in ('pop', 'ldm', 'ldmda', 'ldmdb', 'ldmib'):
            for o in ops:
                if o.type == cs.arm.ARM_OP_REG and o.reg == REG_PC:
                    writes_pc = True
        elif len(ops) >= 1 and ops[0].type == cs.arm.ARM_OP_REG and ops[0].reg == REG_PC and name not in ('cmp', 'cmn', 'tst', 'teq', 'str', 'strh', 'strb', 'push', 'stm'):
            writes_pc = True
            # jump table?
            jt = self.jump_table(u, seg, off, a, i, thumb, regs)
            if jt is False:
                return False
            if jt:
                return None if cc == AL else nxt
            if name == 'mov' and len(ops) == 2 and ops[1].type == cs.arm.ARM_OP_REG and ops[1].reg == REG_LR:
                return None if cc == AL else nxt
            if name in ('sub', 'mov') and len(ops) >= 2 and ops[1].type == cs.arm.ARM_OP_REG and ops[1].reg == REG_LR:
                return None if cc == AL else nxt
            if name == 'mov' and len(ops) == 2 and ops[1].type == cs.arm.ARM_OP_REG and isinstance(regs.get(ops[1].reg), int):
                v = regs[ops[1].reg]
                self.add_target(u, v & ~1, bool(v & 1) if thumb else False, call=False)
                return None if cc == AL else nxt
            if name == 'ldr':
                return None if cc == AL else nxt
            if name in ('add', 'sub') and len(ops) == 3 and ops[1].type == cs.arm.ARM_OP_REG and ops[1].reg == REG_PC \
                    and ops[2].type == cs.arm.ARM_OP_IMM and not thumb:
                tgt = a + 8 + (ops[2].imm if name == 'add' else -ops[2].imm)
                if seg.has_vma(tgt):
                    to = seg.to_rom(tgt)
                    u.labels[to] = thumb
                    work.append((to, {}))
                    return None if cc == AL else nxt
            if spec:
                u.ok, u.why = False, 'unresolved pc write at %x' % off
                return False
            self.log.append('unresolved pc write at %08x (%s %s)' % (a, i.mnemonic, i.op_str))
            return None if cc == AL else nxt
        if writes_pc:
            return None if cc == AL else nxt
        if name == 'svc':
            return nxt
        # track simple register kills
        for o in ops[:1]:
            if o.type == cs.arm.ARM_OP_REG and o.reg in regs and name not in ('str', 'strh', 'strb', 'cmp', 'cmn', 'tst', 'push', 'stm'):
                del regs[o.reg]
        if name in ('mov',) and len(ops) == 2 and ops[1].type == cs.arm.ARM_OP_REG and ops[1].reg in regs:
            regs[ops[0].reg] = regs[ops[1].reg]
        if name == 'adr' or (name == 'add' and len(ops) == 3 and ops[1].type == cs.arm.ARM_OP_REG and ops[1].reg == REG_PC and ops[2].type == cs.arm.ARM_OP_IMM):
            base = ((a + 4) & ~3) if thumb else a + 8
            imm = ops[-1].imm
            regs[ops[0].reg] = base + imm
        return nxt

    def add_target(self, u, vma, thumb, call):
        u.calls.append((vma | (1 if thumb else 0), thumb, None, 'ptr'))

    def jump_table(self, u, seg, off, a, i, thumb, regs):
        """Detect agbcc/gcc jump tables ending in mov pc,rX / ldr pc,[pc,rX,lsl#2]."""
        rom = self.rom
        name = i.insn_name()
        ops = i.operands
        if not thumb and name == 'ldr' and ops[1].type == cs.arm.ARM_OP_MEM and ops[1].mem.base == REG_PC and ops[1].mem.index != 0:
            # ldrls pc, [pc, rX, lsl #2]; b default; table
            tbl = a + 8
            count = self.find_bound(seg, off, thumb, ops[1].mem.index)
            if count is None:
                return None
            return self.add_jt(u, seg, seg.to_rom(tbl), count, thumb)
        if not thumb and name == 'add' and len(ops) == 3 and ops[1].type == cs.arm.ARM_OP_REG and ops[1].reg == REG_PC \
                and ops[2].type == cs.arm.ARM_OP_REG:
            count = self.find_bound(seg, off, thumb, None)
            if count is None:
                # computed jump into straight-line code (e.g. unrolled division)
                for t in (off + 4, off + 8):
                    u.labels[t] = False
                    u.calls.append(('jt', t, False, seg))
                return True
            # pc+8 is the first table entry (a branch); pc+4 is the default branch
            work_targets = [off + 4] + [off + 8 + 4 * k for k in range(count)]
            for t in work_targets:
                u.labels[t] = False
                u.calls.append(('jt', t, False, seg))
            return True
        if thumb and name == 'mov' and ops[1].type == cs.arm.ARM_OP_REG:
            # look back for ldr rT, =table
            back = []
            o = off - 2
            for _ in range(8):
                ins = decode(rom, o, seg.to_vma(o), True)
                if ins is None:
                    break
                back.append((o, ins))
                o -= 2
            tbl = None
            for (o2, ins) in back:
                if ins.insn_name() == 'ldr' and ins.operands[1].type == cs.arm.ARM_OP_MEM and ins.operands[1].mem.base == REG_PC:
                    r = self.pool_load(u, seg, seg.to_vma(o2), ins, True)
                    if r:
                        tbl = r[1]
                    break
            count = None
            if tbl is None and isinstance(regs.get(ops[1].reg), tuple) and 'cmp' in regs:
                tbl = regs[ops[1].reg][1]
                count = regs['cmp'] + 1
            if tbl is None or not seg.has_vma(tbl):
                return None
            if count is None:
                count = self.find_bound(seg, off, thumb, None)
            if count is None:
                return None
            return self.add_jt(u, seg, seg.to_rom(tbl), count, thumb)
        return None

    def find_bound(self, seg, off, thumb, reg):
        rom = self.rom
        step = 2 if thumb else 4
        o = off - step
        for _ in range(16):
            ins = decode(rom, o, seg.to_vma(o), thumb)
            if ins is None:
                return None
            if ins.insn_name() == 'cmp' and ins.operands[1].type == cs.arm.ARM_OP_IMM:
                return ins.operands[1].imm + 1
            o -= step
        return None

    def add_jt(self, u, seg, to, count, thumb):
        if to & 3 or count <= 0 or count > 1024:
            return None
        if not self.claim(u, to, 4 * count, JTBL):
            u.ok, u.why = False, 'jtable conflict at %x' % to
            return False
        u.jtables[to] = {'count': count, 'thumb': thumb}
        for k in range(count):
            t = self.rom.u32(to + 4 * k)
            if not seg.has_vma(t & ~1):
                u.ok, u.why = False, 'bad jt entry'
                return False
            tr = seg.to_rom(t & ~1)
            u.labels[tr] = thumb
            u.calls.append(('jt', tr, thumb, seg))
        return True

    def commit(self, u, entry_off, thumb, name=None):
        db = self.db
        db.kind.update(u.kind)
        db.insn_at.update(u.insn_at)
        db.labels.update(u.labels)
        db.pools.update(u.pools)
        db.jtables.update(u.jtables)
        if entry_off not in db.funcs:
            db.funcs[entry_off] = {'thumb': thumb, 'name': name}
        elif name:
            db.funcs[entry_off]['name'] = name

    # -- driver -------------------------------------------------------------
    def run_unit(self, vma, thumb, seg=None, spec=False, name=None, queue=None):
        seg2 = self.rom.seg_of_vma(vma & ~1, seg)
        if seg2 is None:
            return False
        off = seg2.to_rom(vma & ~1)
        if off in self.db.funcs:
            return True
        k = self.db.kind.get(off)
        if k is not None:
            if k == ((CODE_T if thumb else CODE_A), off):
                # already code (reached by branch) -> promote to function
                self.db.funcs[off] = {'thumb': thumb, 'name': name}
                return True
            return False
        u = self.trace(vma & ~1, thumb, seg2, spec)
        u.start = off
        # jump-table targets need tracing as part of this unit
        done_jt = set()
        while u.ok:
            more = [c for c in u.calls if c[0] == 'jt' and c[1] not in done_jt]
            if not more:
                break
            for (_, tr, th, sg) in more:
                done_jt.add(tr)
                if tr in u.insn_at or tr in self.db.insn_at:
                    continue
                self.trace_into(u, sg.to_vma(tr), th, sg, spec)
                if not u.ok:
                    break
        self.last_why = u.why
        if not u.ok:
            if not spec:
                self.log.append('FAILED %s func %08x: %s' % ('thumb' if thumb else 'arm', vma, u.why))
            return False
        self.commit(u, off, thumb, name)
        for c in u.calls:
            if c[0] == 'jt':
                continue
            if len(c) == 4:  # pointer target from ldr/bx
                v, th, sg, _ = c
                queue.append((v & ~1, th, None, False))
            else:
                v, th, sg = c
                queue.append((v, th, sg, False))
        return True

    def trace_into(self, u, vma, thumb, seg, spec):
        """Continue tracing additional entry (jump table target) into unit u."""
        u2 = self.trace(vma, thumb, seg, spec, func_start=u.start)
        # trace() doesn't see u's claims; merge carefully
        for b, k in u2.kind.items():
            if b in u.kind and u.kind[b] != k:
                u.ok, u.why = False, 'jt merge conflict'
                return
        if not u2.ok:
            # may be because it ran into u's own code? trace() checks only db
            u.ok, u.why = False, 'jt target: ' + u2.why
            return
        for attr in ('kind', 'insn_at', 'labels', 'pools', 'jtables'):
            getattr(u, attr).update(getattr(u2, attr))
        u.calls += u2.calls
        u.ptrs += u2.ptrs

    def add_code(self, vma, thumb, queue):
        """Trace code at vma as part of the function that contains it."""
        seg = self.rom.seg_of_vma(vma)
        if seg is None:
            return 'no segment'
        off = seg.to_rom(vma)
        if off in self.db.insn_at:
            return 'already code'
        # the containing function's start lets trace() see far jumps (bl
        # back into the same function)
        fs = max([f for f in self.db.funcs if f <= off] or [off])
        u = self.trace(vma, thumb, seg, False, func_start=fs)
        if not u.ok:
            return u.why
        db = self.db
        db.kind.update(u.kind)
        db.insn_at.update(u.insn_at)
        db.labels.update(u.labels)
        db.labels[off] = thumb
        db.pools.update(u.pools)
        db.jtables.update(u.jtables)
        for c in u.calls:
            if c[0] == 'jt':
                continue
            if len(c) == 4:
                queue.append((c[0] & ~1, c[1], None, False))
            else:
                queue.append((c[0], c[1], c[2], False))
        return None

    def drain(self, queue, spec):
        while queue:
            v, th, sg, sp = queue.pop()
            self.run_unit(v, th, sg, spec or sp, None, queue)


def arm_prologue(w):
    return (w & 0xffff4000) == 0xe92d4000 or w == 0xe52de004 or w == 0xe1a0c00d


def parse_cfg(path):
    cfg = {'overlays': [], 'entries': [], 'names': {}, 'data': [], 'code_end': None, 'jtables': []}
    for line in open(path):
        line = line.split('#')[0].strip()
        if not line:
            continue
        p = line.split()
        k = p[0]
        if k == 'overlay':
            cfg['overlays'].append((p[1], int(p[2], 0), int(p[3], 0), int(p[4], 0)))
        elif k in ('thumb_func', 'arm_func'):
            cfg['entries'].append((int(p[1], 0), k == 'thumb_func', p[2] if len(p) > 2 else None))
        elif k == 'arm_area':
            cfg.setdefault('arm_areas', []).append((int(p[1], 0), int(p[2], 0)))
        elif k == 'code_end':
            cfg['code_end'] = int(p[1], 0)
        elif k == 'data':
            cfg['data'].append((int(p[1], 0), int(p[2], 0)))
        elif k == 'name':
            cfg['names'][int(p[1], 0)] = p[2]
        elif k == 'code':
            # code inside a function that tracing cannot reach (computed jumps);
            # odd address = Thumb
            cfg.setdefault('code', []).append(int(p[1], 0))
    return cfg


def main():
    rom_path, cfg_path, out_path = sys.argv[1:4]
    data = open(rom_path, 'rb').read()
    cfg = parse_cfg(cfg_path)
    rom = ROM(data, cfg)
    an = Analyzer(rom, cfg)
    if cfg['code_end']:
        an.code_limit = cfg['code_end']
    # mark explicit data ranges as claimed
    for (s, e) in cfg['data']:
        for b in range(s, e):
            an.db.kind[b] = ('D', s)

    q = []
    for (v, th, nm) in cfg['entries']:
        q.append((v, th, None, False))
        an.run_unit(v, th, None, False, nm, q)
        an.drain(q, False)
    print('phase1 (entries): %d funcs' % len(an.db.funcs), file=sys.stderr)

    def scan_pointers(pass_name):
        """Treat pool words / aligned data words that look like Thumb code
        pointers as speculative function entries."""
        added = 0
        cands = set()
        for po, val in list(an.db.pools.items()):
            cands.add(val)
        # data words anywhere outside code: require a plausible function start
        for off in range(0, rom.size - 3, 4):
            if off in an.db.kind:
                continue
            w = rom.u32(off)
            if w & 1 and ROM_BASE <= w < ROM_BASE + an.code_limit:
                hw = rom.u16((w & ~1) - ROM_BASE)
                if (hw & 0xfe00) == 0xb400 or hw == 0x4770:
                    cands.add(w)
        for val in sorted(cands):
            if not (val & 1):
                seg = rom.seg_of_vma(val)
                if seg is None or (val & 3):
                    continue
                off = seg.to_rom(val)
                if off in an.db.funcs or off in an.db.kind:
                    continue
                if not an.allowed(seg, off, False):
                    continue
                w = rom.u32(off)
                if not arm_prologue(w):
                    continue
                q = []
                if an.run_unit(val, False, seg, True, None, q):
                    added += 1
                    an.drain(q, True)
                continue
            seg = rom.seg_of_vma(val & ~1)
            if seg is None:
                continue
            if seg.name == 'rom' and (val & ~1) - ROM_BASE >= an.code_limit:
                continue
            off = seg.to_rom(val & ~1)
            if off in an.db.funcs:
                continue
            q = []
            if an.run_unit(val & ~1, True, seg, True, None, q):
                added += 1
                an.drain(q, True)
        print('%s: +%d funcs (%d total)' % (pass_name, added, len(an.db.funcs)), file=sys.stderr)
        return added

    while scan_pointers('pointer scan'):
        pass

    # prologue scan in gaps: push {..., lr}
    def gap_scan():
        added = 0
        off = 0xc0
        lim = max([an.code_limit] + [s.rom_end for s in rom.segs if s.name != 'rom'] + [b for a, b in an.arm_areas])
        while off < lim:
            if off in an.db.kind:
                off += 1
                continue
            if off & 1:
                off += 1
                continue
            hw = rom.u16(off)
            seg = rom.seg_of_rom(off)
            arm_ok = (off & 3) == 0 and an.allowed(seg, off, False)
            if arm_ok and arm_prologue(rom.u32(off)):
                q = []
                if an.run_unit(seg.to_vma(off), False, seg, True, None, q):
                    added += 1
                    an.drain(q, True)
            elif ((hw & 0xff00) == 0xb500 or ((hw & 0xf800) == 0x4800 and (rom.u16(off + 2) & 0xff87) == 0x4700
                    and ((hw >> 8) & 7) == ((rom.u16(off + 2) >> 3) & 7))) and an.allowed(seg, off, True):
                q = []
                if an.run_unit(seg.to_vma(off), True, seg, True, None, q):
                    added += 1
                    an.drain(q, True)
            off += 2
        print('gap scan: +%d funcs (%d total)' % (added, len(an.db.funcs)), file=sys.stderr)
        return added
    while gap_scan():
        while scan_pointers('pointer scan'):
            pass

    # code hints (from mGBA coverage, tools/emu/cover_hints.py)
    n = 0
    for v in cfg.get('code', []):
        q = []
        why = an.add_code(v & ~1, bool(v & 1), q)
        if why and why != 'already code':
            an.log.append('code hint %08x: %s' % (v, why))
        elif not why:
            n += 1
        an.drain(q, False)
    print('code hints: +%d traced' % n, file=sys.stderr)

    if len(sys.argv) > 4:
        # debug: explain why tracing an address fails (against final state)
        for x in sys.argv[4:]:
            v = int(x, 16); th = bool(v & 1)
            an.last_why = ''
            ok = an.run_unit(v & ~1, th, None, True, None, [])
            print('%s: ok=%s %s' % (x, ok, an.last_why))
    out = {
        'funcs': {str(k): v for k, v in an.db.funcs.items()},
        'labels': {str(k): v for k, v in an.db.labels.items()},
        'insns': {str(k): v for k, v in an.db.insn_at.items()},
        'pools': {str(k): v for k, v in an.db.pools.items()},
        'jtables': {str(k): v for k, v in an.db.jtables.items()},
        'segs': [(s.name, s.rom_start, s.rom_end, s.vma) for s in rom.segs],
        'log': an.log,
    }
    json.dump(out, open(out_path, 'w'))
    for l in an.log[:50]:
        print(l, file=sys.stderr)
    print('log lines: %d' % len(an.log), file=sys.stderr)


if __name__ == '__main__':
    main()
