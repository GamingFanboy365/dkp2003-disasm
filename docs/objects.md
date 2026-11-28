# Objects

Everything that moves in a race is an object: the racers, items, zingers,
boosters, trackside props, HUD elements, cameras. The code is `object.c`
(`asm/object.s`) and one `act_*.c` file per class.

## Memory

`obj_reset_all` (at the start of each race) clears object RAM and sets up
fixed 0x140-byte objects:

* `gRacerObjects[0..7]`: the 8 racers, in fixed slots at `gObjRacerPool`
  (`0x0200438C`);
* 246 more on `gObjFreeList`, linked through `+0x04`.

`obj_new(class)` pops a free object and stores the class; it prints
"failed to allocate object, class=%i" when none are left.
`obj_spawn_level_object` creates the objects of a level's object list.
`obj_free` queues an object for deletion ("object delete list full").
Live objects are kept on lists: `gObjProcessList` (updated every frame,
`obj_add_process`/`obj_remove_process`), a draw list (`obj_add_draw`,
`obj_remove_draw`) and the hit lists (`obj_add_static_hit`,
`obj_add_vector_hit`, `gObjStaticHitList`).

## Classes

The class table at `0x08713FD0` has 16 bytes per class:
`{ init, act, react, free }` (Thumb function pointers). Class numbers go
up to 0x39 (`CLASS_NUM`; `obj_new` asserts `c < CLASS_NUM`). `init_*` runs
once when the object is created; `act_*` runs every frame; `react_*` runs
when something hits it (`obj_check_hits`); and `free_*` runs when it is
freed. Their names come from the debug strings and the class table
(`tools/class_table.py`).

## Fields

Established from the code (the asserts name some of them):

| Offset | Size | Meaning | Evidence |
|---|---|---|---|
| `+0x00` | u16 | flags (`OV_FLAGS`): `0x10` = `OF_DRAW` | `obj_add_draw` asserts `~OV_FLAGS(o) & OF_DRAW` and tests bit 0x10 |
| `+0x02` | u8 | class | `obj_new` |
| `+0x04` | ptr | next object in a list (free list, process list) | `obj_reset_all`, `obj_new` |
| `+0x24`, `+0x28`, `+0x2C` | s32 | position x, y, z, with 8 fraction bits | `obj_spawn_level_object` stores the object list's x, y, z shifted left by 8 |
| `+0x30`, `+0x34`, `+0x38` | s32 | a second position (follows `+0x24`..), probably last frame's | moves with the position |
| `+0x3C`, `+0x40`, `+0x44` | s32 | velocity x, y, z | `ai_update` writes them from `sin_fx`/`cos_fx`; `planePlayer` for the player |
| `+0x50` | s32 | speed | A (accelerate) raises it; written by `planePlayer` |
| `+0x54` | s32 | heading in the top 16 bits, pitch in the bottom 16 (16-bit angles) | LEFT/RIGHT change the top half, UP/DOWN the bottom; written by `planeControl` |
| `+0x6C`..`+0x80` | s32 | bounding box: x, y, z each minus and plus the hitbox size | `obj_set_hitbox`; moves with the position |
| `+0x4C` | s32 | vertical speed | −0x28 diving (UP), +0x28 climbing (DOWN); written by `plane_vertical_speed` |
| `+0xB0` | s32 | turn rate | LEFT/RIGHT; written by `plane_turn` |
| `+0xB8` | s32 | bank | +0x1F turning left, −0x21 right; written by `plane_bank` |
| `+0x9C` | ptr | the class info record it was made from | `obj_spawn_level_object` |
| `+0xA0` | u32 | racer flags; bit 0 = holds a weapon; `0x2000`, `0x100`, `0x200000` switch the CPU's `ai_wobble` / `ai_ease_offsets`; `0x01000000` = went through a zipper | the zinger-buzz reproduction and fix, `ai_wobble`, `ai_ease_offsets` |
| `+0x108` | u32 | racer weapon slot; weapon type in bits 16+ (3 = red zinger) | the zinger-buzz reproduction |

CPU racers also have a 0x158-byte AI state each (`gAiRacers`, 8 of them),
passed with the object: `ai_update(obj, ai)`. A breakpoint in mGBA shows
racer 2 as `obj = 0x0200460C` (`gObjRacerPool + 2 * 0x140`) with
`ai = 0x0202375C` (`gAiRacers + 2 * 0x158`).

The player's fields were found by holding each button from a saved race
state, comparing the object with a run without input, and then running
`watch <address>` in `tools/emu/dkprun` to find the instruction that writes
the field. UP dives and DOWN climbs (`+0x28` falls with UP), A accelerates,
and B fires.
`tools/emu/stepprof.py` does the same per function: it stops at the
function during a race with a button held and prints what the call
changes.
