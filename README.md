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
Debian/Ubuntu: `apt install binutils-arm-none-eabi`) and your own copy of the
ROM.

```sh
cp /path/to/your/rom.gba baserom.gba   # never committed (see .gitignore)
make compare                           # -> dkp.gba: OK
```

Graphics, levels, audio data and other non-code bytes are still pulled from
`baserom.gba` with `.incbin`, so the ROM is required to build.

## Layout

```
asm/            Code, split per original source file (names from __FILE__ strings)
data/           Non-code regions (currently .incbin from baserom.gba)
config/dkp.cfg  Analyzer hints: memory map, entry points, code/data areas
config/symbols.txt  Function names (address name)
config/files.txt    Source-file split points (ROM offset, file)
tools/          analyzer + asm generator (Python 3 + capstone)
ld_script.ld, objects.mk   generated: place every object at its original address
```

### What's in the ROM

| ROM offset | Address | Contents |
|---|---|---|
| `0x000000` | `0x08000000` | `crt0`: ARM start-up, IWRAM veneers (`asm/crt0.s`) |
| `0x000114` | `0x08000114` | Game code, Thumb, gcc (`main.c`, `game.c`, `object.c`, about 55 `act_*.c` actors, `fe_*` front end, `weapon*.c`, …) |
| `0x02D880` | `0x0802D880` | Rare's audio engine: hand-written ARM MIDI/sample driver (`asm/audio_arm.s`) plus Thumb glue (`asm/audio.s`) |
| `0x02F4A4` | `0x0802F4A4` | Audio rodata (tables, "AUDIO ERROR…" messages) |
| `0x03222C` | `0x0803222C` | Nintendo AGBPrint debug library (`AGBPrintInit`, `AGBPrintf`, `AGBAssert`, …) |
| `0x0325DC` | `0x080325DC` | newlib libc (`vsprintf`, …) |
| `0x0385FC` | **`0x03000000`** | `text32`: ARM code copied to IWRAM at boot (`IntrMain`, fast division, …), 0x3FC8 bytes (`asm/iwram.s`) |
| `0x03C5C4` | `0x0803C5C4` | ARM code run from ROM (`asm/arm_rom.s`) |
| `0x03EC00` | `0x0803EC00` | rodata (strings, tables) followed by graphics and level data (`data/`) |

Boot order (from `AgbMain`): DMA-clear RAM, copy `text32` to IWRAM, install
the IRQ handler at `0x03007FFC`, `AGBPrintInit`, then print
`Diddy Kong Pilot - %i` and the section sizes.  The build still contains
asserts (`ASSERTION FAILED FILE=[%s] FUNC=[%s] LINE=[%i] EXP=[%s]`) that
print through AGBPrint and then hit an undefined-instruction trap
(`0xEFFF` in Thumb, `0xE7FFFFFF` in ARM).  These traps are marked
`@ debug trap` in the asm.

### Names

879 functions are disassembled.  187 have real names: most were recovered
automatically from the `__FUNCTION__` strings passed to asserts and debug
prints (`tools/find_names.py`), e.g. `AgbMain`, `game_process`,
`obj_add_process`, `planeControl`, `init_banana`, `react_booster`,
`weaponManager`.  The rest are `sub_XXXXXXXX`.

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
in `config/symbols.txt`, and file splits in `config/files.txt`.

## Status / TODO

* Some areas are still emitted as bytes or `.incbin`: parts of the ARM audio
  engine (computed `sub pc, pc, #imm` dispatch), a few unresolved gaps, and
  all data.
* Pool constants that point into rodata or RAM are still raw numbers, so the
  code is not yet shiftable.
* Split rodata and graphics out of `baserom.gba` into real files.
