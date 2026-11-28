# Headless mGBA harness

Scripted play-testing used to reproduce and verify `patches/fix_sound_loop.ips`.

## Build

You need an mGBA source checkout (tested with current `master`) and libpng/zlib.

```sh
cmake -S /path/to/mgba -B build/mgba -G Ninja -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_QT=OFF -DBUILD_SDL=OFF -DBUILD_SHARED=OFF -DBUILD_STATIC=ON \
  -DUSE_FFMPEG=OFF -DUSE_LUA=OFF -DUSE_SQLITE3=OFF -DUSE_ELF=OFF \
  -DUSE_DISCORD_RPC=OFF -DUSE_EDITLINE=OFF -DUSE_LIBZIP=OFF -DUSE_MINIZIP=OFF \
  -DUSE_EPOXY=OFF -DBUILD_GL=OFF -DBUILD_GLES2=OFF -DBUILD_GLES3=OFF -DM_CORE_GB=OFF
ninja -C build/mgba
mkdir -p build/emu
DEFS=$(grep -m1 "DEFINES = " build/mgba/build.ninja | sed 's/.*DEFINES = //')
gcc -O2 -std=c11 $DEFS -o build/emu/dkprun tools/emu/dkprun.c \
  -I/path/to/mgba/include -Ibuild/mgba/include build/mgba/libmgba.a \
  -lpng -lz -llzma -lfreetype -lm -lpthread
```

The `-D` defines must match the library's, or `struct mCore` has a different
layout and the program crashes.

## Use

```sh
python3 tools/emu/repro_zinger_buzz.py baserom.gba     # exit 1: bug present
python3 tools/emu/repro_zinger_buzz.py dkp_fixed.gba   # exit 0: fixed
```

It takes about 2 minutes per ROM.

| File | Purpose |
|---|---|
| `dkprun.c` | Harness: reads commands on stdin: `run N KEYS`, `tap`, `peek`, `poke`, `str`, `save`/`load` states, `shot x.png`, `vlog` (per-frame dump of the gamesfx voices and pending queue), `regs`, `step N`, `until PC`, `trace FILE N` (pc, r0–r3, r6, r12, lr per instruction), `log on/off` (mGBA log, e.g. DMA sources), `watch ADDR [MAX]` (run until the word at ADDR changes and print the instruction that wrote it), `cover FILE` / `cover off` (single-step every frame and record each executed instruction address in a bitmap: 1 bit per halfword, 16 MB of ROM then 32 KB of IWRAM; written on `cover off`). |
| `drv.py` | Python wrapper; walks the object process list (`0x02004374`). |
| `auto.py` | Autopilot: follows a recorded CPU racing line, with a forced waypoint (the zipper). |
| `comp_tracks.json` | CPU racer positions recorded on Steamy Swoop, used as the racing line. |
| `repro_zinger_buzz.py` | Full repro from power-on. |
| `compare_boot.py` | Plays two ROMs from power-on to race start and compares screenshots. |
| `shift_test.sh` | Inserts padding into an asm file and checks the shifted ROM plays identically. |
| `analyze_vlog.py` | Lists every sound in a voice log and flags ones still playing at the end. |

Useful RAM, from the disassembly:

| Address | What |
|---|---|
| `0x0200438C` | Player object; position at `+0x24/+0x28/+0x2C`, heading (16-bit) at `+0x56`, weapon at `+0x10A` |
| `0x02021E18` | Per-racer data, stride `0x208`: `+0x24` boost state, `+0x54` hit state, `+0x198` engine-sound state |
| `0x0200434C` | Racer object table (index → object) |
| `0x02004374` / `0x02004378` | Object process list (next `+4`) / static-hit list (next `+0x14`) |
| `0x0202DECC` | gamesfx: 4 hardware voices, stride `0x30` |
| `0x0202E38C` | gamesfx: pending request list |
| `0x08713FD0` | Object class table: `{init, act, react, free}` per class |

Weapon slot values: 1/2/9 = yellow zinger, 3/4 = red (purple) zinger,
5 = TNT barrel, 7 = lightning, 8 = blue zinger. Press B to fire.

Code coverage: set `DKP_COVER=<file>` and any script that uses `drv.Emu`
records the code it executes, e.g.
`DKP_COVER=build/emu/cover_race.bin python3 tools/emu/repro_zinger_buzz.py`.
`tools/unused.py --cover` uses this file. Recording does not change the
emulation: the repro gives the same result with and without it.
`cover_hints.py build/db.json <cover files>` turns coverage into `code`
hints for `config/dkp.cfg`: code that ran but that the analyzer did not
decode. Add its output, run `tools/regen.sh`, and repeat until it prints
nothing.
`keycover.py` finds code that runs only while a button is held during a
race: it records coverage from a saved state once per button and compares
with no input. B, for example, runs `weapon_launch` and the pellet object.
