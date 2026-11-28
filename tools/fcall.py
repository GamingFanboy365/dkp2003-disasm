#!/usr/bin/env python3
"""
Call a single game function in a CPU emulator (Unicorn) to see what it
computes, e.g. to identify maths helpers:

    fcall.py <addr> [arg ...]          e.g. fcall.py 0x03000138 100 7

The ROM is mapped at 0x08000000. The code that runs from RAM (text32, the
audio engine and ovl_a) is copied to its run address. EWRAM and IWRAM come
from a dkprun `dumpmem` snapshot if one exists (build/emu/mem.bin, or
$FCALL_SNAPSHOT), so functions see real game state.  Memory writes can be
traced (Machine.call(..., writes=[])). Arguments go in r0-r3; the result is r0 (and r1).
Thumb functions need an odd address. AGBPrint, AGBPrintf, AGBPrintFlush and
AGBAssert return at once.

As a module: Machine().call(addr, *args) -> (r0, r1)
"""
import sys, os
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UcError, UC_HOOK_MEM_WRITE
from unicorn.arm_const import UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2, UC_ARM_REG_R3, \
    UC_ARM_REG_SP, UC_ARM_REG_LR

ROOT = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
RET = 0x0E000000          # return address: an unused region; emulation stops there
COPIES = [(0x385FC, 0x3C5C4, 0x03000000), (0x2D834, 0x2EAE0, 0x03006498), (0x3C5C4, 0x3DC1C, 0x03003FC8)]


class Machine:
    def __init__(self, rom=os.path.join(ROOT, 'baserom.gba'), snapshot=os.path.join(ROOT, 'build/emu/mem.bin')):
        snapshot = os.environ.get('FCALL_SNAPSHOT', snapshot)
        d = open(rom, 'rb').read()
        self.uc = uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        uc.mem_map(0x08000000, 0x01000000)
        uc.mem_write(0x08000000, d)
        uc.mem_map(0x02000000, 0x40000)
        uc.mem_map(0x03000000, 0x8000)
        uc.mem_map(0x04000000, 0x1000)          # I/O registers (writes ignored)
        uc.mem_map(0x05000000, 0x1000)
        uc.mem_map(0x06000000, 0x18000)
        uc.mem_map(0x07000000, 0x1000)
        uc.mem_map(RET, 0x1000)
        # the AGBPrint debug output (mGBA's debug port, not mapped here)
        # returns at once
        for a in (0x08032400, 0x0803245C, 0x08032588, 0x08032598):     # AGBPrint, AGBPrintf, AGBPrintFlush, AGBAssert
            uc.mem_write(a, b'\x70\x47')                                # bx lr
        if os.path.exists(snapshot):
            m = open(snapshot, 'rb').read()
            uc.mem_write(0x02000000, m[:0x40000])
            uc.mem_write(0x03000000, m[0x40000:0x48000])
        else:
            for lo, hi, v in COPIES:
                uc.mem_write(v, d[lo:hi])

    def call(self, addr, *args, sp=0x03007E00, limit=2000000, writes=None):
        """writes: a list to collect (address, size, old value, new value) of
        every memory write the call makes (the stack excluded)."""
        uc = self.uc
        hook = None
        if writes is not None:
            def on_write(uc_, access, a, size, value, user):
                if not (sp - 0x400 <= a < sp + 0x100):
                    old = int.from_bytes(bytes(uc_.mem_read(a, size)), 'little')
                    writes.append((a, size, old, value & ((1 << (8 * size)) - 1)))
            hook = uc.hook_add(UC_HOOK_MEM_WRITE, on_write)
        regs = [UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2, UC_ARM_REG_R3]
        for r, v in zip(regs, list(args) + [0] * 4):
            uc.reg_write(r, v & 0xFFFFFFFF)
        uc.reg_write(UC_ARM_REG_SP, sp)
        uc.reg_write(UC_ARM_REG_LR, RET)
        try:
            uc.emu_start(addr, RET, count=limit)
        finally:
            if hook is not None:
                uc.hook_del(hook)
        return uc.reg_read(UC_ARM_REG_R0), uc.reg_read(UC_ARM_REG_R1)


def s32(v):
    return v - (1 << 32) if v & 0x80000000 else v


if __name__ == '__main__':
    m = Machine()
    a = int(sys.argv[1], 0)
    args = [int(x, 0) for x in sys.argv[2:]]
    try:
        r0, r1 = m.call(a, *args)
        print('r0 = %d (0x%08X)  r1 = %d (0x%08X)' % (s32(r0), r0, s32(r1), r1))
    except UcError as e:
        print('error:', e)
