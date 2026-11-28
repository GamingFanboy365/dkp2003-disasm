#!/usr/bin/env python3
"""
Rare's sprite container format (Diddy Kong Pilot), decode and exact re-encode.

Used by every sprite set in the sprite table (characters, items, trackside
objects, HUD) and by the track 'map' and 'theme' graphics.  Decoded at run
time by the IWRAM routines rspr_queue_frame (0x03000A80) and rspr_upload_frames (0x03000898)
(upload queued frames to sprite VRAM with DMA).

Container (all values little-endian):
  +0x00  u16  offset of the frame table (from the container start)
  +0x02  u16  0x0016
  +0x04  u16  container size / 16, or 0
  +0x06  ...  header data up to the frame table (bounding boxes, animation
              data; kept verbatim)
  table  u16  per frame: offset of the frame from the table, in 16-byte units;
              0 ends the table.  Zero-padded to a 16-byte boundary.
  frames, each zero-padded to a 16-byte boundary:
         u16  header: bits 0-9 = tile count, bit 15 = raw (tiles follow as is)
         then (not raw) a stream of 16-bit units:
           c & 0x80:  copy the next (c & 0x7F) + 1 halfwords
           else:      fill (c & 0x7F) + 1 halfwords with the byte c >> 8
           0x0000:    end
  The output is 4bpp tile data in sprite-VRAM (1D) order.

Re-encoding: Rare's encoder is greedy -- a run of >= 2 identical halfwords
whose two bytes are equal becomes a fill (max 128), everything else is copied
(max 128 per literal).  A few frames were encoded differently; their run
layout is recorded in the metadata and reused as long as it still fits the
pixels, so unedited sets re-encode to exactly the original bytes.
"""
import struct

TILE = 32


def u16(b, o):
    return struct.unpack_from('<H', b, o)[0]


# ---------------------------------------------------------------- decode --
def decode_stream(b, p):
    out = bytearray()
    runs = []
    while True:
        c = u16(b, p)
        p += 2
        if c == 0:
            break
        k = (c & 0x7F) + 1
        if c & 0x80:
            out += b[p:p + 2 * k]
            p += 2 * k
            runs.append(('L', k))
        else:
            out += bytes([c >> 8]) * (2 * k)
            runs.append(('F', k))
    return bytes(out), runs, p


def parse(b):
    """Container bytes -> dict with header, frames (tile data) and hints."""
    ft = u16(b, 0)
    if u16(b, 2) != 0x16 or ft < 6 or ft >= len(b):
        raise ValueError('not a sprite container')
    offs = []
    first = None
    k = 0
    while first is None or ft + 2 * k < first:
        o = u16(b, ft + 2 * k)
        if o == 0:
            break
        a = ft + o * 16
        first = a if first is None else min(first, a)
        offs.append(a)
        k += 1
    frames, end = [], 0
    for a in offs:
        h = u16(b, a)
        n = h & 0x3FF
        if h & 0x8000:
            data, runs, e = b[a + 2:a + 2 + n * TILE], None, a + 2 + n * TILE
        else:
            data, runs, e = decode_stream(b, a + 2)
        if len(data) != n * TILE:
            raise ValueError('frame size mismatch')
        frames.append({'header': h, 'data': data, 'runs': runs})
        end = max(end, e)
    size = (end + 15) & ~15
    meta = {'header': b[:ft].hex(), 'size_field': u16(b, 4) != 0, 'frames': []}
    for f in frames:
        m = {'tiles': f['header'] & 0x3FF}
        if f['header'] & ~0x3FF:
            m['flags'] = f['header'] & ~0x3FF
        if f['runs'] is not None and f['runs'] != greedy_runs(f['data']):
            m['runs'] = ''.join('%s%d,' % r for r in f['runs']).rstrip(',')
        meta['frames'].append(m)
    return meta, [f['data'] for f in frames], size


# ---------------------------------------------------------------- encode --
def halfwords(data):
    return list(struct.unpack('<%dH' % (len(data) // 2), data))


def greedy_runs(data):
    hw = halfwords(data)
    n, i, runs, lit = len(hw), 0, [], 0

    def flush():
        nonlocal lit
        while lit:
            k = min(lit, 128)
            runs.append(('L', k))
            lit -= k
    while i < n:
        h, j = hw[i], i
        while j < n and hw[j] == h:
            j += 1
        if (h & 0xFF) == (h >> 8) and j - i >= 2:
            flush()
            r = j - i
            while r:
                k = min(r, 128)
                runs.append(('F', k))
                r -= k
            i = j
        else:
            lit += 1
            i += 1
    flush()
    return runs


def runs_fit(runs, data):
    hw = halfwords(data)
    p = 0
    for t, k in runs:
        if not 1 <= k <= 128 or p + k > len(hw):
            return False
        if t == 'F':
            h = hw[p]
            if (h & 0xFF) != (h >> 8) or any(x != h for x in hw[p:p + k]):
                return False
        p += k
    return p == len(hw)


def encode_stream(data, runs):
    hw = halfwords(data)
    out, p = bytearray(), 0
    for t, k in runs:
        if t == 'F':
            out += struct.pack('<H', ((hw[p] & 0xFF) << 8) | (k - 1))
        else:
            out += struct.pack('<H', 0x80 | (k - 1))
            out += struct.pack('<%dH' % k, *hw[p:p + k])
        p += k
    return bytes(out) + b'\0\0'


def build(meta, frames):
    hdr = bytearray(bytes.fromhex(meta['header']))
    ft = len(hdr)
    n = len(frames)
    pos = (ft + 2 * n + 15) & ~15
    table, body = [], bytearray()
    for m, data in zip(meta['frames'], frames):
        flags = m.get('flags', 0)
        if flags & 0x8000:
            enc = struct.pack('<H', flags | m['tiles']) + data
        else:
            runs = None
            if 'runs' in m:
                rr = [(x[0], int(x[1:])) for x in m['runs'].split(',')]
                if runs_fit(rr, data):
                    runs = rr
            enc = struct.pack('<H', flags | m['tiles']) + encode_stream(data, runs or greedy_runs(data))
        table.append((pos + len(body) - ft) // 16)
        body += enc + bytes(-len(enc) % 16)
    out = hdr + struct.pack('<%dH' % n, *table)
    out += bytes(pos - len(out)) + body
    if meta['size_field']:
        struct.pack_into('<H', out, 4, len(out) // 16)
    return bytes(out)


# ---------------------------------------------------------------- layout --
def pieces(tiles):
    """Split a frame's tiles into square sprite pieces (side in pixels)."""
    out = []
    for side, cnt in ((64, 64), (32, 16), (16, 4), (8, 1)):
        while tiles >= cnt:
            out.append((side, cnt))
            tiles -= cnt
    return out


def frame_size(tiles):
    ps = pieces(tiles)
    return sum(s for s, c in ps), max([s for s, c in ps] + [8])


def sheet_layout(tile_counts, per_row=16):
    cw = max(frame_size(t)[0] for t in tile_counts)
    ch = max(frame_size(t)[1] for t in tile_counts)
    per_row = max(1, min(per_row, 1024 // cw, len(tile_counts)))
    rows = (len(tile_counts) + per_row - 1) // per_row
    return cw, ch, per_row, rows


def to_pixels(tile_counts, frames):
    """Frames (4bpp tile data) -> sheet (w, h, pixel indices)."""
    cw, ch, per_row, rows = sheet_layout(tile_counts)
    w, h = cw * per_row, ch * rows
    px = [0] * (w * h)
    for i, (n, data) in enumerate(zip(tile_counts, frames)):
        ox, oy = (i % per_row) * cw, (i // per_row) * ch
        t = 0
        for side, cnt in pieces(n):
            per = side // 8
            for k in range(cnt):
                tx, ty = ox + (k % per) * 8, oy + (k // per) * 8
                tb = data[(t + k) * TILE:(t + k + 1) * TILE]
                for y in range(8):
                    for x in range(8):
                        byte = tb[y * 4 + x // 2]
                        px[(ty + y) * w + tx + x] = (byte >> 4) if x & 1 else (byte & 15)
            t += cnt
            ox += side
    return w, h, px


def from_pixels(tile_counts, w, h, px, path='sheet'):
    cw, ch, per_row, rows = sheet_layout(tile_counts)
    if (w, h) != (cw * per_row, ch * rows):
        raise SystemExit('%s: expected a %dx%d image' % (path, cw * per_row, ch * rows))
    frames = []
    for i, n in enumerate(tile_counts):
        ox, oy = (i % per_row) * cw, (i // per_row) * ch
        out = bytearray()
        for side, cnt in pieces(n):
            per = side // 8
            for k in range(cnt):
                tx, ty = ox + (k % per) * 8, oy + (k // per) * 8
                for y in range(8):
                    row = px[(ty + y) * w + tx:(ty + y) * w + tx + 8]
                    if max(row) > 15:
                        raise SystemExit('%s: colour index > 15' % path)
                    out += bytes(row[2 * j] | (row[2 * j + 1] << 4) for j in range(4))
            ox += side
        frames.append(bytes(out))
    return frames
