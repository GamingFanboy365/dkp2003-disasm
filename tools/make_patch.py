#!/usr/bin/env python3
"""
Build an IPS patch from an assembly file that uses `.org <rom offset>` to
place code over the original ROM.

Usage: make_patch.py baserom.gba patch.s out.ips [patched.gba]

The source is assembled twice with different fill bytes; only bytes that
come out identical both times are patch bytes.
"""
import sys, os, re, subprocess, tempfile


def assemble(src, fill, td):
    s = re.sub(r'^(\s*\.org\s+[^,\n@]+?)\s*(@.*)?$', r'\1, %d' % fill, src, flags=re.M)
    sp = os.path.join(td, 'p%d.s' % fill)
    op = sp[:-2] + '.o'
    bp = sp[:-2] + '.bin'
    open(sp, 'w').write(s)
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-o', op, sp], check=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '-j', '.text', op, bp], check=True)
    return open(bp, 'rb').read()


def ips(records):
    out = bytearray(b'PATCH')
    for off, data in records:
        assert off < 0x1000000 and off != 0x454f46  # 'EOF'
        while data:
            chunk, data = data[:0xffff], data[0xffff:]
            out += off.to_bytes(3, 'big') + len(chunk).to_bytes(2, 'big') + chunk
            off += len(chunk)
    out += b'EOF'
    return bytes(out)


def main():
    rom_path, src_path, ips_path = sys.argv[1:4]
    rom = bytearray(open(rom_path, 'rb').read())
    src = open(src_path).read()
    with tempfile.TemporaryDirectory() as td:
        a = assemble(src, 0x00, td)
        b = assemble(src, 0xff, td)
    assert len(a) == len(b)
    records = []
    i = 0
    while i < len(a):
        if a[i] == b[i]:
            j = i
            while j < len(a) and a[j] == b[j]:
                j += 1
            records.append((i, a[i:j]))
            i = j
        else:
            i += 1
    for off, data in records:
        old = rom[off:off + len(data)]
        print('0x%06X: %s -> %s' % (off, old.hex(), data.hex()))
        rom[off:off + len(data)] = data
    open(ips_path, 'wb').write(ips(records))
    if len(sys.argv) > 4:
        open(sys.argv[4], 'wb').write(rom)


if __name__ == '__main__':
    main()
