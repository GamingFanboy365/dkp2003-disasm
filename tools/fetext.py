#!/usr/bin/env python3
"""
The front end's text: format, decoding and exact re-encoding.

Block (ROM 0x63FFDC, asset text/frontend): six language tables of 183
pointers (gFeTextTables points at them), then the strings.

String:
  u16 n            number of pages
  u16 offs[n - 1]  offset of pages 2..n from the start of the string
  n pages          each a run of character codes ended by 0x4E (pages follow
                   each other directly)
  pad              strings start on even addresses (a 0x00 byte)

Character codes: 0x01 '!', 0x02 ''', 0x04 ',', 0x06 '.', 0x07-0x10 '0'-'9',
0x13 '?', 0x14-0x2D 'A'-'Z', 0x2E-0x47 'a'-'z', 0x4B 'ç', 0x4C 'ñ',
0x4F ' ', 0x50 new line.  Others (0x03, 0x05, 0x11, 0x12, 0x48, 0x49,
0x4A, 0x4D, ...) are written {XX}; "{48}KP{49}" is a spacer in the credits.

Text file (assets/text/frontend.txt): one string per line,
"NNN: text" with \\n = new line and \\p = next page; then each table as
"[table <label>]" followed by the string number of each entry.
"""
import struct

TABLES, ENTRIES = 6, 183
END, SPACE, NEWLINE = 0x4E, 0x4F, 0x50

CHARS = {0x01: '!', 0x02: "'", 0x04: ',', 0x06: '.', 0x13: '?', 0x4B: 'ç', 0x4C: 'ñ', SPACE: ' '}
for i in range(10):
    CHARS[0x07 + i] = chr(ord('0') + i)
for i in range(26):
    CHARS[0x14 + i] = chr(ord('A') + i)
    CHARS[0x2E + i] = chr(ord('a') + i)
CODES = {v: k for k, v in CHARS.items()}


def decode_page(b):
    out = []
    for c in b:
        if c == NEWLINE:
            out.append('\\n')
        elif c in CHARS:
            out.append(CHARS[c])
        else:
            out.append('{%02X}' % c)
    return ''.join(out)


def encode_page(s, where='text'):
    out = bytearray()
    i = 0
    while i < len(s):
        if s.startswith('\\n', i):
            out.append(NEWLINE)
            i += 2
        elif s[i] == '{' and s[i + 3:i + 4] == '}':
            out.append(int(s[i + 1:i + 3], 16))
            i += 4
        elif s[i] in CODES:
            out.append(CODES[s[i]])
            i += 1
        else:
            raise SystemExit('%s: character %r has no code in the game\'s font' % (where, s[i]))
    return bytes(out)


def parse(rom, off, size):
    """-> (tables [(label offset, [string index])], strings [[page text]])"""
    rom_base = 0x08000000
    ptrs = [struct.unpack_from('<I', rom, off + 4 * k)[0] - rom_base for k in range(TABLES * ENTRIES)]
    starts = sorted(set(ptrs))
    strings, end = [], 0
    for p in starts:
        n = struct.unpack_from('<H', rom, p)[0]
        offs = [2 * n] + [struct.unpack_from('<H', rom, p + 2 + 2 * k)[0] for k in range(n - 1)]
        pages = []
        for k in range(n):
            s = p + offs[k]
            e = rom.index(bytes([END]), s)
            pages.append(decode_page(rom[s:e]))
        strings.append(pages)
    index = {p: k for k, p in enumerate(starts)}
    tables = [(off + 4 * ENTRIES * t, [index[ptrs[t * ENTRIES + i]] for i in range(ENTRIES)]) for t in range(TABLES)]
    return tables, strings


def to_text(tables, strings, labels):
    out = ['# Front-end text (tools/fetext.py has the format).',
           '# "NNN: text": \\n = new line, \\p = next page, {XX} = a code with no',
           '# known character.  Characters: A-Z a-z 0-9 ! \' , . ? ç ñ and space.',
           '# Each [table] lists, for each of its 183 entries, a string number.',
           '']
    for k, pages in enumerate(strings):
        out.append('%03d: %s' % (k, '\\p'.join(pages)))
    for (toff, idx), label in zip(tables, labels):
        out.append('')
        out.append('[table %s]' % label)
        for i in range(0, len(idx), 16):
            out.append(' '.join('%03d' % x for x in idx[i:i + 16]))
    return '\n'.join(out) + '\n'


def from_text(text, where='text'):
    strings, tables, cur = {}, [], None
    for ln, line in enumerate(text.split('\n'), 1):
        if not line.strip() or line.startswith('#'):
            continue
        if line.startswith('[table '):
            cur = [line[7:].rstrip(']').strip(), []]
            tables.append(cur)
        elif cur is not None:
            cur[1] += [int(x) for x in line.split()]
        else:
            k, _, s = line.partition(': ')
            strings[int(k)] = [encode_page(p, '%s:%d' % (where, ln)) for p in s.split('\\p')]
    for label, idx in tables:
        if len(idx) != ENTRIES:
            raise SystemExit('%s: table %s has %d entries, not %d' % (where, label, len(idx), ENTRIES))
    return tables, [strings[k] for k in sorted(strings)]


def to_asm(tables, strings, prefix='.Lfetext'):
    out = ['@ generated from assets/text/frontend.txt by tools/assets.py (tools/fetext.py)', '']
    for label, idx in tables:
        out.append('\t.global %s' % label)
        out.append('%s:' % label)
        for i in range(0, len(idx), 4):
            out.append('\t.4byte ' + ', '.join('%s_%03d' % (prefix, x) for x in idx[i:i + 4]))
    for k, pages in enumerate(strings):
        n = len(pages)
        offs, pos = [], 2 * n
        for p in pages[:-1]:
            pos += len(p) + 1
            offs.append(pos)
        out.append('\t.balign 2, 0')
        out.append('%s_%03d:' % (prefix, k))
        out.append('\t.2byte %s' % ', '.join(str(x) for x in [n] + offs))
        body = b''.join(p + bytes([END]) for p in pages)
        for i in range(0, len(body), 16):
            out.append('\t.byte ' + ', '.join('0x%02X' % c for c in body[i:i + 16]))
    return '\n'.join(out) + '\n'
