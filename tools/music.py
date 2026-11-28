#!/usr/bin/env python3
"""
The music: Rare's sequence format and conversion to standard MIDI files.

Song table (loaded by audio_update): song count at 0x08BB4F84 (28), pointers to
the song records at 0x088506A8.  A song record is

  u32 tracks          number of tracks (up to 16, "more than 16 tracks in song")
  u32 division        ticks per quarter note (0x180 = 384)
  ptr track_list      the tracks' start addresses
  ptr, ptr            two tables shared by all songs (program -> instrument)

A track is a byte stream of commands (audio_seq_step, 13-entry jump table):

  00 t0 t1 t2       tempo, microseconds per quarter note (24 bits, LE)
  01 d / 02 d0 d1 / 03 d0 d1 d2
                    wait d ticks (1, 2 or 3 bytes, LE; 4 bytes are refused:
                    "midi delta time of 4 bytes unsupported")
  05 ch note vel    note on
  06 ch note vel    note off
  07 ch ctrl val    controller: 1 modulation, 7 volume, 102/103 (loop
                    markers, by their use)
  08 ch prog        program change (the game's instrument numbers, not GM)
  0A ch lsb msb     pitch bend, 14 bits, 0x2000 = centre
  0B                end of track

Every track of the 28 songs parses exactly with this table (215 tracks, from
0x08B7C18C to 0x08BB4F82).  Commands 04, 09 and 0C never occur.

  music.py baserom.gba outdir      write song_NN.mid (format 1)
"""
import struct, sys, os

ROM_BASE = 0x08000000
SONG_COUNT = 0xBB4F84
SONG_TABLE = 0x8506A8
ARGS = {0: 3, 1: 1, 2: 2, 3: 3, 5: 3, 6: 3, 7: 3, 8: 2, 10: 3, 11: 0}


def u32(d, o):
    return struct.unpack_from('<I', d, o)[0]


def songs(rom):
    """-> [(division, [track events])]; an event is (tick, kind, args)."""
    out = []
    for s in range(u32(rom, SONG_COUNT)):
        p = u32(rom, SONG_TABLE + 4 * s) - ROM_BASE
        ntracks, division, tlist = struct.unpack_from('<3I', rom, p)
        tracks = []
        for t in range(ntracks):
            i = u32(rom, tlist - ROM_BASE + 4 * t) - ROM_BASE
            tick, ev = 0, []
            while True:
                c = rom[i]
                if c not in ARGS:
                    raise ValueError('song %d track %d: unknown command %02X at 0x%06X' % (s, t, c, i))
                a = rom[i + 1:i + 1 + ARGS[c]]
                i += 1 + ARGS[c]
                if c in (1, 2, 3):
                    tick += int.from_bytes(a, 'little')
                elif c == 11:
                    ev.append((tick, 'end', None))
                    break
                else:
                    ev.append((tick, c, a))
            tracks.append(ev)
        out.append((division, tracks))
    return out


def vlq(n):
    b = [n & 0x7F]
    n >>= 7
    while n:
        b.append(0x80 | (n & 0x7F))
        n >>= 7
    return bytes(reversed(b))


def to_midi(division, tracks):
    chunks = []
    for ev in tracks:
        data, last = bytearray(), 0
        for tick, kind, a in ev:
            data += vlq(tick - last)
            last = tick
            if kind == 'end':
                data += b'\xFF\x2F\x00'
            elif kind == 0:
                data += b'\xFF\x51\x03' + bytes(reversed(a))      # tempo is big-endian in MIDI
            elif kind == 5:
                data += bytes([0x90 | (a[0] & 15), a[1] & 0x7F, a[2] & 0x7F])
            elif kind == 6:
                data += bytes([0x80 | (a[0] & 15), a[1] & 0x7F, a[2] & 0x7F])
            elif kind == 7:
                data += bytes([0xB0 | (a[0] & 15), a[1] & 0x7F, a[2] & 0x7F])
            elif kind == 8:
                data += bytes([0xC0 | (a[0] & 15), a[1] & 0x7F])
            elif kind == 10:
                v = a[1] | a[2] << 8
                data += bytes([0xE0 | (a[0] & 15), v & 0x7F, (v >> 7) & 0x7F])
        chunks.append(b'MTrk' + struct.pack('>I', len(data)) + bytes(data))
    head = b'MThd' + struct.pack('>IHHH', 6, 1, len(tracks), division)
    return head + b''.join(chunks)


def main():
    rom = open(sys.argv[1], 'rb').read()
    outdir = sys.argv[2]
    os.makedirs(outdir, exist_ok=True)
    for k, (division, tracks) in enumerate(songs(rom)):
        open(os.path.join(outdir, 'song_%02d.mid' % k), 'wb').write(to_midi(division, tracks))
    print('wrote %d songs to %s' % (k + 1, outdir))


if __name__ == '__main__':
    main()
