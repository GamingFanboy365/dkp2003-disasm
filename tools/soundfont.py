#!/usr/bin/env python3
"""
Build a SoundFont (SF2) of the game's music instruments, so the MIDI files of
tools/music.py play with the game's own samples.

Music instruments (docs/audio.md): a program number is mapped by the byte
table at 0x08850948 (0xFF = none) to one of 41 instrument records listed at
0x0885010C.  A record is 0x44 bytes; its first word is the type:

  0x20  one sample: mode, rate, base note, start*, length, end* (last byte)
        modes 2 and 4 loop: at the end the mixer jumps back by `length`
        bytes; modes 1 and 3 play once (length = end - start)
  0x23  keyboard split: +0x1C points to 128 bytes (note -> index into the
        list at +0x20), the list holds 0x20 records
  0x22  drum kit: the same shape; note-on replaces the note with the drum's
        base note, so every drum plays at its own pitch

The result is a close preview, not an exact copy of the engine (no envelopes,
vibrato or volume curves).

  soundfont.py baserom.gba out.sf2
"""
import struct, sys, math

ROM_BASE = 0x08000000
PROGRAM_MAP = 0x850948
MUSIC_INSTRUMENTS = 0x85010C


def u32(d, o):
    return struct.unpack_from('<I', d, o)[0]


def record(rom, p):
    return struct.unpack_from('<17i', rom, p - ROM_BASE)


def build(rom):
    samples = {}          # (start, end) -> index
    sdata = bytearray()
    shdr = []

    def sample(rec):
        mode, rate, base, start, length, end = rec[1:7]
        key = (start, end)
        if key not in samples:
            pcm = rom[start - ROM_BASE:end - ROM_BASE + 1]
            s0 = len(sdata) // 2
            sdata.extend(b''.join(struct.pack('<h', (b - 256 if b > 127 else b) << 8) for b in pcm))
            s1 = len(sdata) // 2
            sdata.extend(bytes(46 * 2))                       # SF2 requires 46 zero samples after each
            # the mixer (audio_arm.s, at the end of a voice's sample): modes 2
            # and 4 jump back by `length` bytes, i.e. loop the last `length`
            # bytes before the end; modes 1 and 3 stop the voice
            loop_end = s0 + (end - start)
            loop = (loop_end - length, loop_end) if mode in (2, 4) else (s0, s1)
            samples[key] = len(shdr)
            shdr.append(('s%06X' % (start - ROM_BASE), s0, s1, loop[0], loop[1], rate, 60))
        return samples[key], base, mode in (2, 4)

    insts = []            # (name, [zones]); zone = (lo, hi, sample, root, looped)
    for k in range(41):
        rec = record(rom, u32(rom, MUSIC_INSTRUMENTS + 4 * k))
        zones = []
        if rec[0] == 0x20:
            sid, base, looped = sample(rec)
            zones.append((0, 127, sid, base, looped))
        elif rec[0] in (0x22, 0x23):
            keymap = rom[rec[7] - ROM_BASE:rec[7] - ROM_BASE + 128]
            lst = rec[8] - ROM_BASE
            note = 0
            while note < 128:
                idx = keymap[note]
                hi = note
                while hi + 1 < 128 and keymap[hi + 1] == idx and rec[0] == 0x23:
                    hi += 1
                if idx != 0xFF:
                    sub = record(rom, u32(rom, lst + 4 * idx))
                    if sub[0] == 0x20:
                        sid, base, looped = sample(sub)
                        root = note if rec[0] == 0x22 else base
                        zones.append((note, hi, sid, root, looped))
                note = hi + 1
        insts.append(('inst%02d' % k, zones))

    # presets: every mapped program; the drum kit (program 127) also as bank 128
    presets = []
    for prog in range(128):
        i = rom[PROGRAM_MAP + prog]
        if i != 0xFF:
            presets.append(('prog%03d' % prog, prog, 0, i))
            if prog == 127:
                presets.append(('drums', 0, 128, i))

    def name20(s):
        return s.encode()[:19].ljust(20, b'\0')

    # instrument zones
    ibag, igen = [], []
    inst_rows = []
    for name, zones in insts:
        inst_rows.append((name, len(ibag)))
        for lo, hi, sid, root, looped in zones:
            ibag.append((len(igen), 0))
            igen.append((43, lo | hi << 8))                    # keyRange (must come first)
            igen.append((38, (-3986) & 0xFFFF))                # releaseVolEnv ~0.1 s
            igen.append((58, root))                            # overridingRootKey
            igen.append((54, 1 if looped else 0))              # sampleModes
            igen.append((53, sid))                             # sampleID (must come last)
    inst_rows.append(('EOI', len(ibag)))
    ibag.append((len(igen), 0))
    igen.append((0, 0))

    pbag, pgen, phdr = [], [], []
    for name, prog, bank, inst in presets:
        phdr.append((name, prog, bank, len(pbag)))
        pbag.append((len(pgen), 0))
        pgen.append((41, inst))                                # instrument
    phdr.append(('EOP', 0, 0, len(pbag)))
    pbag.append((len(pgen), 0))
    pgen.append((0, 0))

    def chunk(tag, data):
        return tag + struct.pack('<I', len(data)) + data + (b'\0' if len(data) % 2 else b'')

    def lst(tag, data):
        return chunk(b'LIST', tag + data)

    info = lst(b'INFO', chunk(b'ifil', struct.pack('<HH', 2, 1)) + chunk(b'isng', b'EMU8000\0') +
               chunk(b'INAM', b'Diddy Kong Pilot (2003) music instruments\0'))
    sdta = lst(b'sdta', chunk(b'smpl', bytes(sdata)))
    pdta = b''.join([
        chunk(b'phdr', b''.join(name20(n) + struct.pack('<HHHIII', p, b, z, 0, 0, 0) for n, p, b, z in phdr)),
        chunk(b'pbag', b''.join(struct.pack('<HH', g, m) for g, m in pbag)),
        chunk(b'pmod', bytes(10)),
        chunk(b'pgen', b''.join(struct.pack('<HH', o, a) for o, a in pgen)),
        chunk(b'inst', b''.join(name20(n) + struct.pack('<H', z) for n, z in inst_rows)),
        chunk(b'ibag', b''.join(struct.pack('<HH', g, m) for g, m in ibag)),
        chunk(b'imod', bytes(10)),
        chunk(b'igen', b''.join(struct.pack('<HH', o, a) for o, a in igen)),
        chunk(b'shdr', b''.join(name20(n) + struct.pack('<IIIIIBbHH', s0, s1, l0, l1, rate, pitch, 0, 0, 1)
                                for n, s0, s1, l0, l1, rate, pitch in shdr) +
              name20('EOS') + bytes(26)),
    ])
    body = b'sfbk' + info + sdta + lst(b'pdta', pdta)
    return b'RIFF' + struct.pack('<I', len(body)) + body, len(shdr), len(insts), len(presets)


def main():
    rom = open(sys.argv[1], 'rb').read()
    data, ns, ni, np_ = build(rom)
    open(sys.argv[2], 'wb').write(data)
    print('%s: %d samples, %d instruments, %d presets, %d bytes' % (sys.argv[2], ns, ni, np_, len(data)))


if __name__ == '__main__':
    main()
