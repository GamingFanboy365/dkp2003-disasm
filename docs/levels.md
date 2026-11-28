# Level data

## Level headers

`0x087146C0`, 34 entries of 0x94 bytes, indexed by level number
(`gGameSetup + 0x86`). The table below says which code reads each field;
the code was found by looking for the `level * 0x94 + field` pattern.
Fields from `+0x38` to `+0x70` come in pairs: one for the normal direction
and one for Reverse (play mode 1). `make extract` names the files
`assets/levels/NN/<name>`.

| Field | Asset name | Read by | Contents |
|---|---|---|---|
| `+0x00` | `palette` | `race_setup_ovl_a`, … | 256-colour BG palette |
| `+0x04`–`+0x10` | `bg_a` … `bg_d` | race setup | tilesets |
| `+0x14`, `+0x1C`–`+0x24` | `data_14`, `data_1c` … | | not known yet |
| `+0x18` | | | a number (1) |
| `+0x34` | `objects` | `game_init` → `obj_spawn_level_object` | object list `{x, y, z, classinfo*}` |
| `+0x38` / `+0x3C` | `ai_path`, `ai_path_rev` (`.s`) | `aiPlayerInit`, `ai_boss_init_1/2`; then `ai_update`, `ai_choose_next_node` | the CPU racers' path of gates (below); in RAM `gAiPathNodes`, `gAiPathLinks`, `gAiPathCount` |
| `+0x40` | `hits` | `hits_find_play_area` ("no hit polygons exist, so play area cannot be determined") | collision polygons |
| `+0x44` / `+0x48` | `edges1`, `edges1_rev` | `playerInit`, `sub_0800567C` | track edges ("not enough edge mask space for %d inside edges") |
| `+0x4C` / `+0x50` | `edges2`, `edges2_rev` | `playerInit`, `sub_0800567C` | track edges |
| `+0x54` / `+0x58` | `camera_ops`, `camera_ops_rev` | `camera_op_set` | camera operations |
| `+0x5C` / `+0x60` | `race_monitor`, `race_monitor_rev` | `init_race_monitor` | data for the lap/position monitor |
| `+0x64` / `+0x68` | `camera`, `camera_rev` | `init_camera` | camera data |
| `+0x6C` / `+0x70` | `autopilot`, `autopilot_rev` | `player_touch_booster_autopilot` | the path the autopilot booster flies |
| `+0x74`, `+0x78`, `+0x8C` | | race monitors, `act_hud_lapcounter` | numbers |
| `+0x7C` | | `init_hud_map` | a number (the map) |
| `+0x80`–`+0x88`, `+0x90` | | `sub_080033C4` (`+0x90`) | numbers |

## AI path (`ai_path`, `ai_path_rev`)

Read by `aiPlayerInit`; "No AI path found, no AI players will be created"
when it is missing. `make extract` writes it as assembly
(`assets/levels/NN/ai_path.s`, `tools/aipath.py`) with the `ai_node` and
`ai_link` macros; the build includes it, so nodes and links can be edited,
added or removed (the format is decoded exactly: every byte of all 53 paths
is accounted for).

```
u16  flags         0, or 0xFFFF in the boss levels
s16  count         number of nodes
     node[count]   0x2C bytes each
     link[...]     {u16 node, u16 weight}
```

Each node is a **gate** across the track:

| Offset | Field | Meaning |
|---|---|---|
| `+0x00` | `x, y, z` | a point on the track, in object-list units |
| `+0x06` | `first` | index of the node's first link |
| `+0x08` | `n` | number of links: more than 1 where the path branches |
| `+0x0A` | `angle` | direction of the track (16-bit angle) |
| `+0x0C` | `a, b, c` | three values 0–255, mostly 0, 50 or 255 (not known yet) |
| `+0x12` | `f0, f1` | flag bytes |
| `+0x14` | `ex, ez` | the other end of the gate |
| `+0x18` | `ox, oz` | offset from `x, z` to the far side of the track |
| `+0x1C` | `nx, nz` | the gate line's normal, length 256 |
| `+0x20` | `d` | `nx·x + nz·z + d = 0` on the gate (checked on every node: within about 10 units). A racer has passed the gate when the sum is negative (`comp_path_gates`, `boss_path_gates`) |
| `+0x24` | `bias` | 32768 plus or minus a multiple of 2500 (an offset; not known yet) |
| `+0x28` | `g0`–`g3` | flag bytes |

The links of node *i* are `link[first .. first + n − 1]`; there are as many
links as the nodes' `n` add up to. A link's weight is 255 when it is the
only way on. At a branch, `racer_ai_drive` picks a link at random with the
weights as odds (25, 55, 125, 200 occur).

The boss levels each have their own copy of a 188-node path, followed by
0x1B14 bytes that nothing points to.

Checked in mGBA: with every node of Steamy Swoop's path moved 300 units
along x, the CPU racers fly about 300 units off to the side, and the player,
who was 5th, is 1st after 20 seconds.

## Cups and courses

`gCourses` (`0x08051D40`) has 48 course records of 0x2C bytes:

| Offset | Meaning |
|---|---|
| `+0x00` | name (front-end text number) |
| `+0x04` | level (the level header number, 1–33) |
| `+0x08` | 1 = the level is run in reverse |
| `+0x0C` | palette |
| `+0x10` | sky gradient |
| `+0x14`, `+0x18` | track map (Rare sprite) and its palette, for the track-select preview |
| `+0x1C`, `+0x20` | theme icon (Rare sprite) and its palette |
| `+0x24`, `+0x28` | number of icons, and their (x, y) positions on the map preview |

Courses 0–15 are the 16 race levels; 16–31 are the same levels in reverse,
under their own names (Steamy Swoop → Monkey Rift, Icy Passage → Tundra
Tumble, …); 32–35 are the battle arenas (levels 21–24); 36–47 are the four
boss courses three times, on levels 17–20, 26–29 and 30–33. Level 25 is in
no course (`docs/unused.txt`).

`gCups` (`0x08051654`) has 8 cups of 6 words: the name, the four course
numbers and a number from 0 to 7 (an order):

| Cup | Courses | Order |
|---|---|---|
| Klap Trap Kup | 0–3 | 0 |
| Kritter Kup | 4–7 | 3 |
| Klump Kup | 8–11 | 6 |
| K.Rool Kup | 12–15 | 7 |
| Dixie Cup | 16–19 | 1 |
| Diddy Cup | 20–23 | 2 |
| Funky Cup | 24–27 | 4 |
| Donkey Cup | 28–31 | 5 |

`cup_start` starts the first race of the cup in `gGameSetup+0x28`. It clears
the eight racers' points (`+0x2C`, 8 halfwords), stores the course
(`+0x84`), its level (`+0x86`) and the reverse flag (`+0x02`), then calls
`game_init`. After each race `cup_next` either starts the next of the four
races (`+0x2A` counts them) and returns 0, or ranks the racers by points.
A player in the top three gets a trophy, 3 − place (4 with 36 points),
kept as the cup's best in `+0x6C + cup`; a gold also sets `+0x78 + cup`.
The save is then written and `cup_next` returns 1. With no trophy it
returns 2.

## Boss races

`game_init` takes the boss branch when `gGameSetup+0` (the mode) is 3: it
calls `ai_boss_init_1` (the boss, class 0x35 `comp_boss`, AI state
`gBossAi`) and `ai_boss_init_2` (the player's plane, class 0x32
`player_boss`, `gPlayerBossAi`). To start one in mGBA from a saved race:
write 3 to `gGameSetup+0`, a boss course and its level to `+0x84`/`+0x86`
(course 36 and level 19 is Boss Bop), then `0x080004B9` (`game_init`) to
`gStateFunc`. START skips the flyby. The boss moves forward while weaving
(`boss_weave`) and bobbing (`boss_bob`) and fires orbs at the player.
