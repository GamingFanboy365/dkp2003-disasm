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
`obj_free` queues an object on `gObjDeleteList` ("object delete list
full"); `obj_flush_deletes` frees the queued objects every frame, and
`obj_free_all` frees everything at the end of a race.
Live objects are kept on lists: `gObjProcessList` (updated every frame,
`obj_add_process`/`obj_remove_process`), two draw lists (`gObjDrawList`, `gObjDrawList2`; `obj_add_draw`,
`obj_remove_draw`), drawn by `obj_draw_all` in IWRAM, and the hit lists (`obj_add_static_hit`,
`obj_add_vector_hit`, `gObjStaticHitList`).

## Sprites

`obj_setup_sprite(obj, sprite, flags)` gives an object a sprite slot in
`gSprites` (256 slots of 0x18 bytes, `spr_init`) and stores its number in
`obj+0x5A`. The slot gets the graphics (a Rare sprite container) and the
palette of entry `sprite` of the sprite table (`0x08713650`). With flag 0x10
a second slot is chained to it through `gSpriteNext`: the object's shadow,
sprite table entry 43, a flat grey oval, marked with 0x80 in `+0x06`.
`spr_set_shadow_size` makes the shadow 3/4 of the sprite's size, and
`spr_hide_shadow` removes it (collected Kong letters and silver coins).
`spr_free_chain` returns the slots, and `spr_release_anim` drops the
slot's animation player.

Animations run in `gAnims`, 128 players of 0x20 bytes: a script pointer
(`+0x00`), the current frame (`+0x08`), a timer (`+0x0C`), the position in
the script (`+0x10`), the frame delay (`+0x14`) and a user count (`+0x1C`).
`anims_update` counts each timer down; when it runs out, the next script
byte is either a frame number or 0xFF followed by a command (0–4). In
double-speed mode the delays are halved. `anims_clear` empties the table and
`anim_get(slot, owner, script)` gives a sprite slot a player (sprites of
the same object running the same script share one). The script comes from
the sprite table's third word; 40 of the 152 entries have one.

Script bytes (`tools/anim.py`, `make extract` writes them to
`assets/graphics/sprites/anims.s` with the `anim_*` macros):

| Bytes | Macro | Meaning |
|---|---|---|
| `n` (< 0xFF) | `anim_frames n` | show frame n for the current delay |
| `FF 00 s16` | `anim_goto label` | continue at the address of the s16 plus s16 |
| `FF 01 n` | `anim_delay n` | frames per animation frame |
| `FF 02` | `anim_stop` | stop |
| `FF 03` | `anim_done` | set flag bit 0 (before a held last frame) |
| `FF 04` | `anim_restart` | clear flag bit 1 (set by `anim_stop`) |

A typical script plays frames 0–4, marks itself done and loops on frame 5.
Three scripts in the block are not used by any sprite. The object then goes
on one of the two draw lists, linked through `obj+0x0C`/`+0x10`.

## Particles

Sparks and debris are not objects but particles: `gParticles`, 64 entries
of 0x20 bytes (`x, y, z, vx, vy, vz, life, flags`). `particle_new` takes a
free one; `particles_update` (every other frame, from `game_process`) moves
them, counts their life down by 2 and frees them when it runs out. Flag
0x400 adds gravity and 0x800 makes them bounce off the ground. Their
graphics are sprite table entry 42, small sparks, debris and stars in
several colours. The pellet, the zingers and the player make them.

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
| `+0x84`, `+0x88`, `+0x8C` | s32 | position before this frame's move | `obj_update_sweep_box` and the swept hit tests (`hit_test_spheres`, `hit_test_cylinders`, `hit_test_vectors`) go from here to `+0x24` |
| `+0x64`, `+0x68` | u32 | which of 32 x and 32 z grid cells the swept box covers | `obj_update_sweep_box`; a quick reject before the hit tests |
| `+0x5C`, `+0x5E` | u16 | hitbox radius and height | `obj_set_hitbox`, `hit_test_cylinders` |
| `+0x4C` | s32 | vertical speed | −0x28 diving (UP), +0x28 climbing (DOWN); written by `plane_vertical_speed` |
| `+0xB0` | s32 | turn rate | LEFT/RIGHT; written by `plane_turn` |
| `+0xB8` | s32 | bank | +0x1F turning left, −0x21 right; written by `plane_bank` |
| `+0x0C`, `+0x10` | ptr | draw list links | `obj_setup_sprite` |
| `+0x5A` | u16 | sprite slot in `gSprites` | `obj_setup_sprite` |
| `+0x9C` | ptr | the class info record it was made from | `obj_spawn_level_object` |
| `+0xA0` | u32 | racer flags; bit 0 = holds a weapon; `0x80` hit; `0x1000` invincible (`racer_start_invincible`; hits are ignored while `0x1180` is set); `0x8000` finished (`racer_finish`); `0x40000` out of a battle; `0x2000`, `0x100`, `0x200000` switch `ai_wobble`/`plane_wobble` and `ai_ease_offsets`/`plane_ease_offsets`; `0x800000` on autopilot (`plane_autopilot`); `0x01000000` = went through a zipper | the zinger-buzz reproduction and fix, `ai_wobble`, `ai_ease_offsets` |
| `+0xA8` | u32 | racer state: 2 = finished | `racer_finish`; `act_player` then calls `racer_ai_drive` |
| `+0xFE` | u16 | invincibility timer: 300 frames and more with the item level | `racer_start_invincible` |
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

## Stunts and boosts

The player's racer data (`gRacerData`, 0x208 bytes per racer, passed to
`planeControl`/`planePlayer` as the second argument) has two state fields,
mapped by holding buttons in mGBA from a saved race (screenshots of each):

| `pd+0x54` | Stunt | Started by | Handler |
|---|---|---|---|
| 0 | none | | `plane_vertical_speed` |
| 1 | barrel roll | L + LEFT/RIGHT | `plane_roll` (`+0x58` roll speed, `+0x5C` angle; about 40 frames) |
| 2 | loop | L + DOWN | `plane_loop` |
| 3 | knocked down | `player_hit` | `plane_hit_tumble` |
| 4 | spin | `player_hit_spin` | `plane_spin` |
| 5 | automatic stunt | a blue booster (`+0x78`) during boost stage 2 | `plane_booster_stunt` |

L + UP and R with a direction do nothing in this build.

`pd+0x24` is the boost (`plane_boost_update`): 1 through the booster ring,
2, 3 with the flame trail (the `turbo` object, class 0x25), 4 at the end.

The input block (`0x02004224`) holds the keys at `+0` (held) and `+2`
(new), the steering at `+4` (−0x100 left, 0x100 right) and the pitch at `+8`
(0x100 down).
