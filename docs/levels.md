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
| `+0x38` / `+0x3C` | `ai_path`, `ai_path_rev` | `aiPlayerInit`, `ai_boss_init_1/2` | the CPU racers' path (below) |
| `+0x40` | `hits` | `sub_080139F0` ("init_hits: no hit polygons exist") | collision polygons |
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
when it is missing.

```
u16  ?            (0 in Steamy Swoop)
s16  count        number of nodes (41 in Steamy Swoop)
     node[count]  0x2C bytes each
     link[count]  { u16 next, u16 alternative }   (0xFF = none): the path can branch
```

A node is 22 `s16` values. Established so far:

| Index | Meaning |
|---|---|
| 0, 1, 2 | x, y, z: same units and range as the level's object positions |
| 3 | node number |
| 10, 11 | a second point (x, z) beside the node |
| 14, 15 | between −256 and 256: probably a direction |
| 4–9, 12, 13, 16–18 | not known yet (small counts, flags 0/255, angles) |
| 19–21 | always 0 |
