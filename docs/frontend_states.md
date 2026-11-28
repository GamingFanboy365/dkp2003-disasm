# Front-end flow: the mcp state machine

Every front-end screen ends by calling `mcp_process(token)` (ROM
`0x0801E5A4`). The token is the screen's result, for example 0 = back and
1 = OK. `mcp_process` looks at the current state in `gMcpState`
(`0x0202DEC8`), stores the next state and calls the next screen's
`*_init`. That init installs its own `*_process` in `gStateFunc`.
`tools/mcp_map.py` reads the transitions out of the code: it walks
`mcp_process` with a small Thumb interpreter for every state and tokens 0–7.
Where a branch depends on game data (progress, settings), it follows both
ways and prints the condition. A few transitions it cannot resolve, such as
states set by code outside `mcp_process`, are shown as `?` or are missing.

## The states

| States | What they are |
|---|---|
| `0x00A`, `0x032` | boot: the logo movie (`fe_movie`), then the language screen |
| `0x064` | title screen (`fe_title`) |
| `0x190`, `0x19A` | language/options (`fe_options`), back to the title |
| `0x0C8` | the mode menu (`fe_spotscreen`): token 1 → cups, token 2 → time trial |
| `0x0D1`–`0x0DB` | **cups**: `0xD2` character select → `0xD3` cups → `0xD4` race → `0xD5` scoreboard → (cup won) `0xD6` FINISHED banner (`fe_cups_win2`). `0xDA` Cranky → `0xD9` boss race. `0xDB`/`0xD1` retry |
| `0x0DC`–`0x0E0` | **time trial**: character select → tracks → race → time sheet → name entry |
| `0x0E6`–`0x0EB` | another single-player path: character select → tracks → Cranky → race (`0xE8`, which has its own handler, `sub_0801F132`). No transition shown here leads into `0xE6`, so it is entered from elsewhere |
| `0x12C` | a second mode menu (another `fe_spotscreen`) with three choices (`0x136`, `0x140`, `0x14A`). This is probably multiplayer |
| `0x136`–`0x13A` | its cups path. Here the FINISHED banner (`0x13A`) goes straight back to the cups screen, with no trophy |
| `0x140`–`0x142`, `0x14A`–`0x14C` | its two other paths: character select → tracks → race |
| `0x85D`, `0x85E`, `0x87B`, `0x88F`, `0x890` | **endings**: `0x85D` trophy screen (`fe_cups_trophy`) → `0x85E` credits (`fe_credits_screen`) → `0xD8` Cranky → cups. `0x87B` boss win (`fe_boss_win`) → `0xD8`. `0x88F` → mode menu, `0x890` → title |
| `0xFFFF` | → title |

Winning a single-player cup therefore runs `0xD5` scoreboard → `0xD6`
FINISHED banner → `0x85D` trophy ("KONGRATULATIONS / You won") → `0x85E`
credits → `0xD8` Cranky → `0xD3` cups.

The numbers form groups: boot and title below `0x200`, single-player modes
from `0xC8` (200), the second mode menu from `0x12C` (300), and every reward
or ending screen at `0x85D` (2141) and above. So the trophy screen's number
is not an outlier; it is the first of the ending screens. The unused podium
(`fe_cups_win_init`) has no state at all. Only the debug menu can start it
(see [`debug_menu.md`](debug_menu.md)).

## Full table (`tools/mcp_map.py`)

```
States (the screen each one shows, from the init called on entering it):
  0x000  (no screen started)
  0x005  (no screen started)
  0x00A  (no screen started)
  0x032  (no screen started)
  0x064  fe_title_init
  0x0C8  fe_spotscreen_init
  0x0D1  fe_retry_init
  0x0D2  fe_characterselect_init
  0x0D3  fe_cups_init
  0x0D4  game_init
  0x0D5  fe_cups_scoreboard_init
  0x0D6  fe_cups_win2_init
  0x0D7  fe_cranky_init
  0x0D8  fe_cranky_init
  0x0D9  game_init
  0x0DA  fe_cranky_init
  0x0DB  fe_cranky_init
  0x0DC  fe_characterselect_init
  0x0DD  fe_tracks_init
  0x0DE  game_init
  0x0DF  fe_tracks_timesheet_init
  0x0E0  fe_name_init
  0x0E6  fe_characterselect_init
  0x0E7  fe_tracks_init
  0x0E8  game_init
  0x0EA  fe_cranky_init
  0x0EB  fe_cranky_init
  0x12C  fe_spotscreen_init
  0x136  fe_characterselect_init
  0x137  fe_cups_init
  0x138  (no screen started)
  0x139  fe_cups_scoreboard_init
  0x13A  fe_cups_win2_init
  0x140  fe_characterselect_init
  0x141  fe_tracks_init
  0x142  game_init
  0x14A  fe_characterselect_init
  0x14B  fe_tracks_init
  0x14C  game_init
  0x190  fe_options_init
  0x19A  (no screen started)
  0x85D  fe_cups_trophy_init
  0x85E  fe_credits_screen_init
  0x87B  fe_boss_win_init
  0x88F  (no screen started)
  0x890  (no screen started)
  0xFFFF  (no screen started)

Transitions: mcp_process(token) in a state -> new state, screen started
  0x00A  token any   -> ?      fe_movie_init                
  0x032  token any   -> 0x190  fe_options_init              
  0x064  token 1     -> 0x190  fe_options_init              
  0x0C8  token 1     -> 0x0D2  fe_characterselect_init      
  0x0C8  token 2     -> 0x0DC  fe_characterselect_init      
  0x0D1  token 0     -> 0x0C8  fe_spotscreen_init           
  0x0D1  token 1     -> 0x0D4  game_init                    AGBPrintf() vs #0 le
  0x0D1  token 1     -> 0x0D4  game_init                    AGBPrintf() vs #0 !le
  0x0D2  token 0     -> 0x0C8  fe_spotscreen_init           
  0x0D2  token 1     -> 0x0D3  fe_cups_init                 
  0x0D3  token 0     -> 0x0D2  fe_characterselect_init      
  0x0D3  token 1     -> 0x0D7  fe_cranky_init               r1 vs #1 eq
  0x0D3  token 1     -> 0x0D7  fe_cranky_init               r1 vs #1 !eq and r1 vs #0 eq
  0x0D3  token 1     -> 0x0D4  -                            r1 vs #1 !eq and r1 vs #0 !eq
  0x0D3  token 2     -> 0x0DA  fe_cranky_init               
  0x0D4  token 0     -> 0x0D3  fe_cups_init                 
  0x0D4  token 1     -> 0x0D5  fe_cups_scoreboard_init      
  0x0D4  token 2     -> ?      game_init                    AGBPrintf() vs #0 le
  0x0D4  token 2     -> ?      game_init                    AGBPrintf() vs #0 !le
  0x0D5  token 0     -> 0x0D6  fe_cups_win2_init            sub_0801E410() vs #1 eq
  0x0D5  token 0     -> 0x0D3  fe_cups_init                 sub_0801E410() vs #1 !eq and sub_0801E410() vs #1 gt and sub_0801E410() vs #2 eq
  0x0D5  token 0     -> 0x0D4  -                            sub_0801E410() vs #1 !eq and sub_0801E410() vs #1 !gt and sub_0801E410() vs #0 eq
  0x0D5  token 1     -> 0x0DB  fe_cranky_init               r3 vs #0 eq and r3 vs #0 eq
  0x0D5  token 1     -> 0x0DB  fe_cranky_init               r3 vs #0 eq and r3 vs #0 !eq
  0x0D5  token 1     -> 0x0DB  fe_cranky_init               r3 vs #0 !eq
  0x0D6  token any   -> 0x85D  fe_cups_trophy_init          
  0x0D7  token any   -> 0x0D4  -                            
  0x0D8  token any   -> 0x0D3  fe_cups_init                 
  0x0D9  token 0     -> 0x0D3  fe_cups_init                 
  0x0D9  token 1     -> 0x87B  fe_boss_win_init             
  0x0D9  token 2     -> ?      game_init                    
  0x0DA  token any   -> 0x0D9  game_init                    
  0x0DB  token any   -> 0x0D1  fe_retry_init                
  0x0DC  token 0     -> 0x0C8  fe_spotscreen_init           
  0x0DC  token 1     -> 0x0DD  fe_tracks_init               
  0x0DD  token 0     -> 0x0DC  fe_characterselect_init      
  0x0DD  token 1     -> 0x0DE  game_init                    
  0x0DE  token 0     -> 0x0DD  fe_tracks_init               
  0x0DE  token 1     -> 0x0DF  fe_tracks_timesheet_init     
  0x0DE  token 2     -> 0x0DE  game_init                    
  0x0DF  token 0     -> 0x0DD  fe_tracks_init               
  0x0DF  token 1     -> 0x0E0  fe_name_init                 
  0x0E0  token any   -> 0x0DD  fe_tracks_init               
  0x0E6  token 0     -> 0x0C8  fe_spotscreen_init           
  0x0E6  token 1     -> 0x0E7  fe_tracks_init               
  0x0E7  token 0     -> 0x0E6  fe_characterselect_init      
  0x0E7  token 1     -> 0x0EA  fe_cranky_init               
  0x0E8  token 0     -> 0x0E7  fe_tracks_init               
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 eq and [0x000000FA] vs #5 gt and [0x000000FA] vs #0 eq and [0x000000FA] vs r1 eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 eq and [0x000000FA] vs #5 gt and [0x000000FA] vs #0 eq and [0x000000FA] vs r1 !eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 eq and [0x000000FA] vs #5 gt and [0x000000FA] vs #0 !eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 eq and [0x000000FA] vs #5 !gt and [0x000000FA] vs #0 eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 eq and [0x000000FA] vs #5 !gt and [0x000000FA] vs #0 !eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 !eq and [0x000000FA] vs #5 gt and [0x000000FA] vs #0 eq and [0x000000FA] vs r1 eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 !eq and [0x000000FA] vs #5 gt and [0x000000FA] vs #0 eq and [0x000000FA] vs r1 !eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 !eq and [0x000000FA] vs #5 gt and [0x000000FA] vs #0 !eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 !eq and [0x000000FA] vs #5 !gt and [0x000000FA] vs #0 eq
  0x0E8  token 1     -> 0x0EB  fe_cranky_init               r2 vs #0 !eq and [0x000000FA] vs #5 !gt and [0x000000FA] vs #0 !eq
  0x0E8  token 2,3,4,5,6,7 -> ?      game_init                    
  0x0EA  token any   -> 0x0E8  game_init                    
  0x0EB  token any   -> 0x0E7  fe_tracks_init               
  0x12C  token 0     -> 0x064  fe_title_init                
  0x12C  token 1     -> 0x136  fe_characterselect_init      
  0x12C  token 2     -> 0x140  fe_characterselect_init      
  0x12C  token 3     -> 0x14A  fe_characterselect_init      
  0x136  token 0     -> 0x12C  fe_spotscreen_init           
  0x136  token 1     -> 0x137  fe_cups_init                 
  0x137  token 0     -> 0x136  fe_characterselect_init      
  0x137  token 1     -> 0x138  -                            
  0x138  token 0     -> 0x137  fe_cups_init                 
  0x138  token 1     -> 0x139  fe_cups_scoreboard_init      
  0x138  token 2     -> ?      game_init                    
  0x139  token any   -> 0x13A  fe_cups_win2_init            sub_0801E410() vs #1 eq
  0x139  token any   -> 0x137  fe_cups_init                 sub_0801E410() vs #1 !eq and sub_0801E410() vs #1 gt and sub_0801E410() vs #2 eq
  0x139  token any   -> 0x138  -                            sub_0801E410() vs #1 !eq and sub_0801E410() vs #1 !gt and sub_0801E410() vs #0 eq
  0x13A  token any   -> 0x137  fe_cups_init                 
  0x140  token 0     -> 0x12C  fe_spotscreen_init           
  0x140  token 1     -> 0x141  fe_tracks_init               
  0x141  token 0     -> 0x140  fe_characterselect_init      
  0x141  token 1     -> 0x142  game_init                    
  0x142  token 0,1   -> 0x141  fe_tracks_init               
  0x142  token 2     -> 0x142  game_init                    
  0x142  token 3,4,5,6,7 -> ?      game_init                    
  0x14A  token 0     -> 0x12C  fe_spotscreen_init           
  0x14A  token 1,2,3,4,5,6,7 -> 0x14B  fe_tracks_init               
  0x14B  token 0     -> 0x14A  fe_characterselect_init      
  0x14B  token 1     -> 0x14C  game_init                    
  0x14B  token 2,3,4,5,6,7 -> ?      game_init                    
  0x14C  token 0,1   -> 0x14B  fe_tracks_init               
  0x14C  token 2,3,4,5,6,7 -> ?      game_init                    
  0x190  token any   -> 0x064  fe_title_init                
  0x19A  token any   -> 0x064  fe_title_init                
  0x85D  token any   -> 0x85E  fe_credits_screen_init       
  0x85E  token any   -> 0x0D8  fe_cranky_init               
  0x87B  token any   -> 0x0D8  fe_cranky_init               
  0x88F  token any   -> 0x0C8  fe_spotscreen_init           
  0x890  token any   -> 0x064  fe_title_init                
  0xFFFF  token any   -> 0x064  fe_title_init                
```
