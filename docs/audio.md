# Audio

Rare's audio engine: a hand-written ARM sequencer and mixer that the audio
init copies to IWRAM (`asm/audio_arm.s`, run address `0x03006498`), with
Thumb glue (`asm/audio.s`). The game talks to it through `music_play`,
`music_stop`, `snd_play` and the `gamesfx_*` layer.

## Samples and instruments

`gInstrumentTable` (`0x088502A8`) holds 256 pointers to 0x44-byte
instrument records: the sample rate, the base note (60), and the sample's
start, length and last byte. The 343 samples are 8-bit signed PCM;
`make extract` writes them as WAV files (`assets/audio/samples/`, see
the README).

## Music

`gSongTable` (`0x088506A8`) has 28 pointers to song records; the count is
at `0x08BB4F84`.

```
u32 tracks        up to 16 ("AUDIO ERROR, more than 16 tracks in song")
u32 division      ticks per quarter note (0x180 = 384 in every song)
ptr track_list    the start of each track
ptr, ptr          two tables shared by all songs (program -> instrument)
```

A track is a stream of commands, read by `audio_seq_step` through a
13-entry jump table. It is MIDI with Rare's own encoding:

| Bytes | Meaning |
|---|---|
| `00 t0 t1 t2` | tempo, microseconds per quarter note (24 bits, little-endian) |
| `01 d` / `02 d0 d1` / `03 d0 d1 d2` | wait d ticks (4-byte waits are refused: "midi delta time of 4 bytes unsupported") |
| `05 ch note vel` | note on |
| `06 ch note vel` | note off |
| `07 ch ctrl val` | controller: 1 modulation, 7 volume, 102 and 103 (by their use, loop markers) |
| `08 ch prog` | program change: the game's instrument numbers, not General MIDI |
| `0A ch lsb msb` | pitch bend, 14 bits, 0x2000 = centre |
| `0B` | end of track |

All 215 tracks of the 28 songs parse exactly with this table (the data runs
from `0x08B7C18C` to `0x08BB4F82`); commands 04, 09 and 0C are not used.

`make extract` converts the songs to standard MIDI files
(`assets/audio/music/song_NN.mid`, format 1, one MIDI track per game track),
with `tools/music.py`. A MIDI player will play them with General MIDI
instruments, so the notes, rhythm and tempo are the game's but the sounds
are not. The songs are 2 seconds (jingles) to 94 seconds long, at 60 to
160 BPM. The MIDI files are a view: the build still uses the original
sequence data.

Identified so far (the engine's current song is at `0x03005A78`, checked in
mGBA): song 0 plays in the Steamy Swoop race; song 4 is the front-end
music (language screen and menus, and the debug menu's
`music_play_if_changed(4)`).
