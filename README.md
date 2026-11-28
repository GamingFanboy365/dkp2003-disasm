# Diddy Kong Pilot (2003 build) — disassembly

A matching disassembly of the 2003 prototype build of Rare's *Diddy Kong Pilot*
for the Game Boy Advance.  `make compare` rebuilds a ROM that is byte-identical
to the original.

| | |
|---|---|
| Header title / code / maker | `DK-PILOT` / `RARE` / `01` (logo area is not the Nintendo logo — prototype) |
| Size | 12,277,472 bytes |
| SHA1 | `0cb385781742c25bf9d4cbeae8e83f7750af48db` |

## Building

You need GNU binutils for ARM (`arm-none-eabi-as`, `-ld`, `-objcopy`; on
Debian/Ubuntu: `apt install binutils-arm-none-eabi`), Python 3 and your own
copy of the ROM. The tools that regenerate the asm also need
`pip install capstone`, and `tools/fcall.py` needs `pip install unicorn`.

```sh
cp /path/to/your/rom.gba baserom.gba   # never committed (see .gitignore)
make extract                           # once: writes the game's assets into assets/
make compare                           # -> dkp.gba: OK
```

`make extract` writes graphics, palettes, level data and audio samples into `assets/` as
editable files (below). Like the ROM, they are generated locally and never
committed. The remaining non-code bytes are still pulled from `baserom.gba`
with `.incbin`.

## Assets: graphics, levels and audio

`config/assets.txt` lists 1396 assets (about 9.5 MB, three quarters of the ROM)
found from the game's own tables: the level headers at `0x087146C0`, the track
records at `0x08051D40`, the sprite table at `0x08713650`, the instrument
definitions of the sound bank, and front-end graphics found with an mGBA DMA
survey. `tools/find_assets.py` builds the list; it holds only
offsets, sizes and types.

| Type | Files | Format |
|---|---|---|
| Palettes (171) | `*.pal` | JASC-PAL (RGB), editable in most graphics editors |
| Tilesets (34) | `*.png` | indexed PNG, 16 tiles per row; pixel value = colour index. 256-colour level tilesets are shown in their level palette |
| Object lists (22) | `levels/NN/objects.s` | one `level_object x, y, z, classinfo` per object, with the class name, then `level_objects_end` |
| Tables (7) | `*.s` | level headers, track records, sprite table, with symbolic pointers |
| Sprites (418) | `*.png` + `*.json` | Rare's sprite containers, decoded (below): one indexed PNG sprite sheet per set, colour 0 transparent, in the set's palette |
| Audio samples (343) | `*.wav` | 8-bit mono PCM at the sample's own rate (8000–48000 Hz) |
| Front-end text (1) | `text/frontend.txt` | all menu and dialogue text, one string per line, plus the six language tables (below) |
| Tilemaps (2) | `*.bin` | front-end BG tilemaps |
| Other (399) | `*.bin` | level data blocks, named by the code that reads them (AI path, collision, track edges, cameras, …; see [`docs/levels.md`](docs/levels.md)); their formats are mostly not decoded yet |

Layout:
```
assets/levels/NN/            33 levels: palette.pal, bg_a/bg_c/bg_d.png (tilesets),
                             objects.s, ai_path.bin, hits.bin, edges*.bin, camera*.bin,
                             autopilot*.bin, ... (docs/levels.md: which code reads each),
                             data_XX.bin for fields whose use is not known yet
assets/levels/tracks/        48 track records: sky gradients, palettes, map/theme sprites (PNG)
assets/levels/level_headers.s, track_records.s
assets/graphics/sprites/     sprite sheets NNN.png + NNN.json (sprite table entry NNN),
                             NNN_2.png, NNN_3.png, … (sets stored right after it: the
                             smaller level-of-detail versions), NNN_palette.pal,
                             sprite_table.s
assets/graphics/frontend/    menu tilesets (PNG) and tilemaps
assets/audio/samples/        NNN_<rate>hz.wav, in ROM order
```

Edit a file and run `make`: `tools/assets.py build` converts the changed
assets into `build/assets/*.bin`, and the data files `.incbin` or `.include`
them. Because the build is shiftable (below), assets can also change size.
Object lists can grow, for example. Level 05 is Steamy Swoop, and adding

```
	level_object    712,      8,    700, gUnk_087C6524   @ class 20 booster
```

to `assets/levels/05/objects.s` puts an extra zipper on the start straight.
This was tested in mGBA: it appears and boosts the plane. When adding tiles
or palette entries, update the asset's size in `config/assets.txt` too.

### Rare's sprite format

Every sprite in the game uses one container format: the character planes and
their smaller level-of-detail versions, items, zingers, the zippers, trackside
objects, HUD portraits and the track minimaps. It is decoded at run time by
`rspr_queue_frame`/`rspr_upload_frames` in IWRAM, straight into sprite VRAM with DMA.
`tools/rare_sprite.py` documents it:

* a header (frame-table offset, `0x16`, size/16, bounding boxes, animation
  data), then a table of frame offsets in 16-byte units, ending with 0;
* frames, each 16-byte aligned: a `u16` tile count (bit 15 = stored raw), then
  RLE over 16-bit units: `0x80|n-1` copies n halfwords, `(b<<8)|n-1` fills n
  halfwords with byte b, `0` ends;
* the result is 4bpp tiles in 1D sprite order.

Rare's encoder is greedy: a run of 2 or more equal halfwords whose two bytes
are equal becomes a fill, of up to 128; everything else is copied. Re-encoding
with that rule reproduces all 418 containers byte for byte, so the PNGs are
the real source and edits rebuild correctly. Each sheet holds 16 frames per
row; a frame is drawn from its tile count (64 tiles = 64×64, 16 = 32×32, …).
Frames made of several hardware sprites (for example 72 = 64 + 4 + 4 tiles)
show their extra pieces beside the main one. The `.json` keeps the header
bytes and per-frame tile counts, which the PNG must match.

Tested in mGBA: swapping two colours in `graphics/sprites/051.png` (the
zipper) gives a recoloured zipper in the race.

### Audio samples

Rare's sound bank describes each instrument with a 0x44-byte record that holds
the sample rate, the base note (60), and the sample's start pointer, its
length and its last byte. The 343 samples these records point at are 8-bit
signed PCM. They are extracted as unsigned 8-bit WAV files, which any audio
editor opens. A sample can be replaced with one of a different length (mono,
8-bit PCM; resample to the rate in its file name): the record's start, length
and end fields are symbols (`<label>` and `<label>_len`), so they follow.
Tested by halving the length of `000_11025hz.wav`. The record's fields
changed to match (length 7375 → 3687) and the ROM still built.

Music sequences, which follow the samples in the ROM, are not decoded yet.

### Front-end text

All of the front end's text, including the big menu titles, Cranky's
dialogue and the credits, is in one block at `0x63FFDC`. It holds six
language tables of 183 entries, then the strings. `make extract` writes it to
`assets/text/frontend.txt`, one string per line:

```
000: CHARACTERS
145: ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{11}.{05}
```

`\n` starts a new line and `\p` a new page (Cranky's speeches have several).
`{XX}` is a code whose character is not known. The font has A–Z, a–z, 0–9,
`! ' , . ?`, ç, ñ and space. Each `[table]` lists the string number of each
entry; in this build most entries of all six languages point at the English
strings. Strings can change length: the page offsets, padding and table
pointers are recomputed (`tools/fetext.py`). Tested in mGBA: renaming
"CHARACTERS" to "KHARAKTERS" and "Diddy Kong" to "Diddy Kong Jr" changes the
character-select screen.

### Modding: the build is shiftable

Code and data can grow or shrink: the linker places every file right after
the previous one (no fixed addresses), and references are symbols rather than
numbers:
* branches, calls, jump tables and literal pools point at labels;
* ROM data referenced by code has a `gUnk_08XXXXXX` label;
* pointers stored inside data (function tables, string tables, level object
  lists, sprite tables, sound-bank samples and lengths, newlib data) are emitted as
  `.4byte symbol`;
* known RAM variables are named (`config/ram_symbols.txt`);
* code copied to RAM (`text32`, the audio engine and the two ARM overlays) is
  assembled at its run address in its own section. The copy code uses the
  linker symbols `__<name>_lma` and `__audio_size`, and calls between ROM,
  `text32` and the overlays are symbolic;
* data files keep their original alignment, which the intro movie and the
  sine table rely on.

This is checked in mGBA with `tools/emu/shift_test.sh`. It inserts padding
into an asm file and requires the shifted ROM to play exactly like the
original: identical screens from power-on through the menus to the race start,
then an identical 40-second gameplay run (racing, CPU items, zipper, sound).
It passes for 4 bytes after `act_hud.s`, 12 bytes after `object.s` and 52
bytes after `game.s`.

## Layout

```
asm/            Code, split per original source file (names from __FILE__ strings)
data/           Non-code regions (currently .incbin from baserom.gba)
config/dkp.cfg  Analyzer hints: memory map, entry points, code/data areas
config/symbols.txt  Function names (address name)
config/files.txt    Source-file split points (ROM offset, file)
config/assets.txt   Asset manifest (offset, size, type, name)
assets/             Extracted graphics/levels (generated by make extract; not committed)
tools/          analyzer + asm generator (Python 3 + capstone)
ld_script.ld, objects.mk   generated: place every object at its original address
```

### What's in the ROM

| ROM offset | Address | Contents |
|---|---|---|
| `0x000000` | `0x08000000` | `crt0`: ARM start-up, IWRAM veneers (`asm/crt0.s`) |
| `0x000114` | `0x08000114` | Game code, Thumb, gcc (`main.c`, `game.c`, `object.c`, about 55 `act_*.c` actors, `fe_*` front end, `weapon*.c`, …) |
| `0x02D834` | **`0x03006498`** | Rare's audio engine, hand-written ARM MIDI/sample driver (`asm/audio_arm.s`). The audio init copies it to IWRAM; its size word sits just before it (`__audio_size`) |
| `0x02EAE0` | `0x0802EAE0` | Thumb glue for the audio engine (`asm/audio.s`) |
| `0x02F4A4` | `0x0802F4A4` | Audio rodata (tables, "AUDIO ERROR…" messages) |
| `0x03222C` | `0x0803222C` | Nintendo AGBPrint debug library (`AGBPrintInit`, `AGBPrintf`, `AGBAssert`, …) |
| `0x0325DC` | `0x080325DC` | newlib libc (`vsprintf`, …) |
| `0x0385FC` | **`0x03000000`** | `text32`: ARM code copied to IWRAM at boot (`IntrMain`, fast division, …), 0x3FC8 bytes (`asm/iwram.s`) |
| `0x03C5C4` | **`0x03003FC8`** | two ARM overlays that `game_init` copies to IWRAM right after `text32`: `ovl_a` (`asm/ovl_a.s`, `0x3C5C4`–`0x3DC1C`, normal races) or `ovl_b` (`asm/ovl_b.s`, `0x3DC1C`–`0x3EA90`, when bit 13 of the mode flags at `0x0300566C` is set). They run at the same address, so their labels carry the overlay name (`sub_ovl_b_03003FC8`). `ovl_a` ends exactly at `0x03005620`, where IWRAM variables begin (the IRQ handler pointer), so it cannot grow |
| `0x03EA90` | `0x0803EA90` | rodata (sine table, strings, tables) followed by graphics, level, movie and audio data (`data/`) |

Boot order (from `AgbMain`): DMA-clear RAM, copy `text32` to IWRAM, install
the IRQ handler at `0x03007FFC`, `AGBPrintInit`, then print
`Diddy Kong Pilot - %i` and the section sizes.  The build still contains
asserts (`ASSERTION FAILED FILE=[%s] FUNC=[%s] LINE=[%i] EXP=[%s]`) that
print through AGBPrint and then hit an undefined-instruction trap
(`0xEFFF` in Thumb, `0xE7FFFFFF` in ARM).  These traps are marked
`@ debug trap` in the asm.

### Names

900 functions are disassembled and 532 have real names:
* most were recovered automatically from the `__FUNCTION__` strings passed to
  asserts and debug prints (`tools/find_names.py`), e.g. `AgbMain`,
  `game_process`, `obj_add_process`, `planeControl`, `init_banana`,
  `react_booster`, `weaponManager`;
* the remaining `act_*`/`react_*`/`free_*` handlers come from the object class
  table at `0x08713FD0` (`tools/class_table.py`);
* the rest were identified by hand: the `gamesfx_*` sound API, the
  engine-sound state machines, zinger functions, the debug menu, the
  front-end screens' `*_process` functions and their flow controller
  `mcp_process`;
* the C runtime: newlib's semihosting layer (`_read`, `_write`, `_sbrk`, …)
  from the ARM semihosting operation numbers; stdio, `printf`, `_dtoa_r`,
  malloc and the string functions from the call graph; and libgcc's integer
  division and software floating point (`fp-bit.c`). The compare functions
  confirm the order: they return 1, 1, −1, −1, 1, 1 for NaN, which is
  `eq, ne, gt, ge, lt, le`;
* Nintendo's EEPROM library, version `EEPROM_V122` (its version string sits
  in the ROM next to its type tables), and the audio engine's Thumb glue and
  link-cable code. These are named from the hardware registers they use;
* the fixed-point maths in IWRAM (`sin_fx`, `cos_fx`, `tan_fx`, `atan2_fx`,
  `isqrt`, `udiv`, `umod`). These were identified by calling them in a CPU
  emulator with `tools/fcall.py`, which runs any game function on chosen
  arguments, with RAM taken from an mGBA snapshot.

The rest are `sub_XXXXXXXX`.

File boundaries are taken from the first function in each region that
references a given `src/*.c` string, so a few functions near a boundary may
be in the neighbouring file.  `frontend.s` and `eeprom.s` cover code with no
`__FILE__` references, and are named after the functions they contain.

## Regenerating

The asm is produced by a recursive-descent analyzer:

```sh
tools/regen.sh      # analyze -> name -> generate (overwrites asm/ and data/)
make compare
```

* `tools/analyze.py` traces Thumb and ARM code from the entry points.  It
  follows branches, `bl` calls, `ldr`+`bx` veneers, agbcc jump tables and far
  jumps (`bl` back into the same function).  It validates speculative function
  candidates (pointer tables, `push {…, lr}` prologues) and rolls them back if
  they decode badly.
* `tools/gen_asm.py` emits GNU as sources.  Every distinct instruction text is
  re-assembled once and compared with the original bytes; the few that gas
  encodes differently are emitted as raw `.2byte`/`.4byte` with the
  disassembly in a comment.

Hints such as new entry points or data ranges go in `config/dkp.cfg`, names
in `config/symbols.txt` (functions and data), and file splits in
`config/files.txt`.

Code that is only reached through computed jumps (mostly in the ARM audio
engine) is found by running the game. `tools/emu/cover_hints.py` reads mGBA
coverage files (see `tools/emu/README.md`). It prints a `code <address>` line
for each place that ran but was not decoded, and `dkp.cfg` keeps those lines.
The analyzer traces each one as part of the function around it. With the
current hints, every instruction that ran in the test sessions (boot, menus,
a race, and each debug-menu screen) is decoded.

## Unused content

[`docs/unused.txt`](docs/unused.txt) lists everything in the ROM that the game
never uses, with offsets, sizes and names only. `tools/unused.py` generates it.
It walks a reference graph of the whole ROM from the entry point. The graph
counts calls, branches, literal pools, pointers in data, raw branch
encodings in undecoded bytes, and the RAM overlays. The result is checked
against an mGBA run that records every executed instruction. Highlights:

* a debug menu (Level, Player, Cups scoreboard, Flyby, Edit Flyby, New
  Frontend, Cup Win, Volume, Play Mode). Its track list uses older track names
  plus four `Newtest` placeholders. It draws over a title background that
  nothing else loads: a beach with the winged logo, extracted to
  `assets/graphics/debug_menu/` (`beach_preview.png` is the whole screen).
  It still works: `patches/debug_menu.ips` boots into it, and
  [`docs/debug_menu.md`](docs/debug_menu.md) describes every item;
* level 25: a header with palette, tilesets, data and an object list, but no
  track data. A stub track record for it (id 0) follows the 48 real ones;
* the credits screen, a cup-win screen and a second "spot screen", which
  nothing calls;
* actors with no class-table entry: an intro sequence (plane, Diddy, Kong,
  pilot), a banana and a null actor;
* 88 functions in all (about 11.5 KB, many from newlib) and about 110 KB of
  data.

```sh
python3 tools/unused.py baserom.gba build/db.json config/dkp.cfg \
    --cover build/emu/cover_race.bin > docs/unused.txt
python3 tools/unused.py baserom.gba build/db.json config/dkp.cfg --why 0x4FA64
```

The coverage file comes from `DKP_COVER=build/emu/cover_race.bin python3
tools/emu/repro_zinger_buzz.py`. `--why` explains why a block counts as
used or unused.

## Objects

[`docs/objects.md`](docs/objects.md) describes the object system: the
0x140-byte objects (8 racer slots plus 246 others), their lists, the class
table and the fields established so far.

## Front-end flow

[`docs/frontend_states.md`](docs/frontend_states.md) maps the front end's
state machine (`mcp_process`, `gMcpState`). It lists every screen state and
where each screen's result leads, as `tools/mcp_map.py` reads them from the
code.

## Patches and play-testing

`patches/` has a bug-fix IPS for the endless zinger buzz you get when a CPU
racer's purple zinger hits you as you take a zipper, and an IPS that boots
into the hidden debug menu. `tools/emu/` has the
headless mGBA harness that reproduces it from power-on and verifies the fix.

## Status / TODO

* Data pointers are found with heuristics, because 8bpp graphics are full of
  words that look like ROM addresses. The test covers the boot movie, the menus
  and one track (Steamy Swoop) including items and sound; other tracks, boss
  and battle modes, and the credits have not been played in a shifted build
  yet. If something breaks there, `tools/where.py <addr>` shows how a ROM
  address is emitted, and the `trace` command in `tools/emu/dkprun` finds the
  first instruction where two builds diverge.
* A few areas are still emitted as bytes: undecoded parts of the ARM audio
  engine (computed `sub pc, pc, #imm` dispatch) and some small gaps.
* Decode the remaining level data blocks (`data_XX.bin`).
* Music sequences are still `.incbin` from `baserom.gba`.
