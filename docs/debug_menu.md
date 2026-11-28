# The hidden debug menu

The 2003 build still contains a debug menu. No code or data in the game
refers to it (see [`unused.txt`](unused.txt)), but it still works. Boot into
it with [`patches/debug_menu.ips`](../patches/debug_menu.ips), or start it
from an emulator: at the language screen, write `0x0800271D` (Thumb address
of `debug_menu_init`) to `gStateFunc` at `0x03005670`. The main loop calls
whatever function that variable holds once per frame.

Unlike the rest of the front end, it draws over its own background: the
beach title screen with the winged logo. Nothing else in this build loads
that background. It also plays song 4.
`make extract` writes the background to `assets/graphics/debug_menu/`
(`beach_preview.png` shows the whole screen).

## Items

UP/DOWN move the cursor, a sprite square in the left column.

| Row | Item | Keys | What it does |
|---|---|---|---|
| 0 | **Level** *nn - name* | A / B | next / previous of 20 entries (wraps). The names are older track titles (`00 - Icy Passage` … `15 - Frantic Beach`) plus four placeholders, `20 - Newtest` … `23 - Newtest` |
| | | START | `game_init`; with the last entry it first sets `gGameSetup.mode` to 6. In mGBA this gave a camera flyby of Steamy Swoop whatever level was selected, so the menu's level value (`gGameSetup + 0x86`) seems unused by now |
| 1 | **Player** *name* | A / B | changes the local player's character (`gGameSetup + 4 + 2 × player`), 9 names: Klap Trap, Dixie, Diddy, Kritter, Funky, DK, Klump, K. Rool, Cranky |
| 2 | **Cups scoreboard** | A, B or START | `fe_cups_scoreboard_init`: the FINAL TIMES table |
| 3 | **Flyby** | A, B or START | `game_init` with the current setup: a camera flyby of the track |
| 4 | **Edit Flyby** | A, B or START | sets the play mode to 3 (or 4 if Reverse), then `game_init`. This is presumably the editor for the flyby camera paths |
| 5 | **New Frontend** | A, B or START | `fe_title_init`: the normal front end, which suggests the debug menu was the "old" front end |
| 6 | **Cup Win** | A, B or START | `fe_cups_win_init`: a cup podium scene (the racers' planes on a podium under a banner). Nothing else calls it: when a cup is won, the game uses `fe_cups_win2_init` (a plane towing a FINISHED banner, then the racers flying past) and `fe_cups_trophy_init` (KONGRATULATIONS / You won) instead. Its "CONGRATULATIONS" banner is garbled, and that is in the data itself (see below) |
| 7 | **Volume** *n* | LEFT / RIGHT | −4 … 4. Sets the music and effect volumes from `gDbgVolumeTable` and plays test sound 0x4E |
| 8 | **Play Mode** *Normal/Reverse* | A / B | `gGameSetup + 2`: 0 Normal, 1 Reverse |

## Code and data

| Address | Name | |
|---|---|---|
| `0x0800271C` | `debug_menu_init` | stores `gStateFunc = debug_menu_process`, calls `dbg_setup_screen` and `music_play_if_changed(4)`, prints the item names |
| `0x080027F0` | `debug_menu_process` | once per frame: cursor, then the table above (a 9-way jump table on `gDbgMenuRow`) |
| `0x080025D8` | `dbg_setup_screen` | DMA: palette `0x053850`, background tiles `0x05F694` (8bpp, BG1), map `0x1B8044` (BG1), font `0x03062A` (4bpp, BG0) |
| `0x080023E8` | `dbg_putc` | one character into the BG0 map at (`gDbgCursorX`, `gDbgCursorY`); handles tab/backspace, wraps at 30 columns |
| `0x08002490` | `dbg_draw_values` | prints the current level, player, volume and play mode |
| `0x08002AE8` | `dbg_putnum` | prints a number (recursive) |
| `0x0884CF4C` | `gDbgMenuItems`, `gDbgMenuItemCount` | 9 item-name pointers, then the count |
| `0x0884CF74` | `gDbgTrackNames`, `gDbgTrackCount` | 20 track-name pointers, then the count |
| `0x0884CFC8` | `gDbgVolumeTable` | volume steps |
| `0x0884D00C` | `gDbgCharacterNames` | 9 character-name pointers |
| `0x020185A0` | `gDbgVolume`, `gDbgTestSound`, `gDbgMenuRow` | RAM |

Two of its loads read past the end of their data. The map DMA copies 0x800
bytes, but the map is 32×20 (0x500), so the last 0x300 bytes come from the
next block (level 06 data). They land off-screen. The font DMA copies 8 KB,
but only 224 glyphs (up to `0x3222C`) are stored there. The last 32 "glyphs"
are AGBPrint library code and are never drawn.

## The podium scene's banner is broken in the ROM

The cup-win podium (`fe_cups_win_init`) draws its three background layers
straight from the ROM: 4bpp tiles from `0x09950E` (676 tiles) and 32×32 maps
from `0x1B9C6C`, `0x1BA170` and `0x1BA674`. Nothing is built at run time.
Rendered from those bytes, the "CONGRATULATIONS" banner is garbled tile by
tile: each 8×8 tile holds part of a letter, but the parts don't line up.
Shifting every tile number by a constant doesn't fix it (the original
numbering joins best), so the tiles aren't simply offset. The map seems to
point at tiles from a different version of the tileset, as if the tileset
was rebuilt after the map was made. The rest of the scene (jungle, podium)
looks right. Either way, the scene could not have shipped in this state.
That may be part of why the game uses the FINISHED banner and the trophy
screen instead, but nothing in the ROM says so.
