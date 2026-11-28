# Audio

Rare's audio engine: a hand-written ARM sequencer and mixer that the audio
init copies to IWRAM (`asm/audio_arm.s`, run address `0x03006498`), with
Thumb glue (`asm/audio.s`). The game talks to it through `music_play`,
`audio_halt_tune`, `snd_play` and the `gamesfx_*` layer.

## Samples and instruments

Every sound is described by a 0x44-byte record whose first word is its type:

| Type | Contents |
|---|---|
| `0x20` | one sample: mode, rate, base note, start, length, end (last byte), then volume/envelope bytes (99, 99, 99, 99) and sometimes vibrato values |
| `0x23` | keyboard split: `+0x1C` points to 128 bytes (note → index), `+0x20` to a list of `0x20` records |
| `0x22` | drum kit: the same shape; notes 24–58 are the drums. Note-on replaces the note with the drum record's base note, so each drum plays at its own pitch (a split keeps the played note) |

The mode is 1–4. The mixer (in `audio_arm.s`, where a voice reaches the
record's end) stops the voice in modes 1 and 3, and in modes 2 and 4 moves the
play position back by `length` bytes: those samples loop over their last
`length` bytes. In modes 1 and 3, length is always end − start.

* `gSfxTable` (`0x088502A8`): 256 sound effects, the ids of `snd_play`.
* `gMusicProgramMap` (`0x08850948`): 128 bytes mapping a song's program
  number to one of the 41 music instruments (`0xFF` = none). Programs 0–39
  map to themselves and 127 to the drum kit.
* `gMusicInstruments` (`0x0885010C`): the 41 music instruments.

The 343 samples are 8-bit signed PCM; `make extract` writes them as WAV files
(`assets/audio/samples/`, see the README).

## Music

`gSongTable` (`0x088506A8`) has 28 pointers to song records; the count is
at `0x08BB4F84`.

```
u32 tracks        up to 16 ("AUDIO ERROR, more than 16 tracks in song")
u32 division      ticks per quarter note (0x180 = 384 in every song)
ptr track_list    the start of each track
ptr, ptr          two tables shared by all songs (program -> instrument)
```

A track is a stream of commands, read by `process_tune_ARM` through a
13-entry jump table. It is MIDI with Rare's own encoding:

| Bytes | Meaning |
|---|---|
| `00 t0 t1 t2` | tempo, microseconds per quarter note (24 bits, little-endian) |
| `01 d` / `02 d0 d1` / `03 d0 d1 d2` | wait d ticks (4-byte waits are refused: "midi delta time of 4 bytes unsupported") |
| `05 ch note vel` | note on |
| `06 ch note vel` | note off |
| `07 ch ctrl val` | controller: 1 modulation (vibrato), 7 channel volume, 102 saves the track position, 103 jumps back to it (the song loop), 126/127 mono on/off (not used by the songs) |
| `08 ch prog` | program change: the game's instrument numbers, not General MIDI (`gAudioProgramMap`, then `gAudioChannelInstrument`) |
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

`make extract` also writes `assets/audio/music/dkp.sf2`, a SoundFont of the
41 music instruments built from the game's own samples (`tools/soundfont.py`:
90 samples, with the keyboard splits, the drum kit and the loops of modes 2
and 4). With it, a SoundFont player plays the MIDI files with
the game's sounds, for example
`fluidsynth -ni -F out.wav dkp.sf2 song_00.mid`. It has no envelopes,
vibrato or volume curves, so it is a close preview, not an exact copy of
the engine.

Identified so far (the engine's current song is at `0x03005A78`, checked in
mGBA): song 0 plays in the Steamy Swoop race; song 4 is the front-end
music (language screen and menus, and the debug menu's
`music_play_if_changed(4)`).

## Voices

There are 96 music voices (`gAudioVoices`, `0x02003020`): 16 channels with
6 voices each, fixed to their channel by `reset_all_notes`; and 4 sound
effect voices (`gAudioSfxVoices`, `0x0300632C`, channel −1). The sizes come
from four words at `0x080537C0` (0x1200, 0x120, 0xC0, 4). A voice is 0x30
bytes; `setup_note_ARM` (called by note-on, `snd_play` and the song
loader) sets it up:

| Offset | Meaning |
|---|---|
| `+0x00` | state: `0x10` free, `0x11` playing, `0x12` releasing |
| `+0x01` | sample mode (copied from the record) |
| `+0x02`, `+0x03` | note, velocity |
| `+0x04` | envelope stage (`audio_voice_env`, 7 stages) |
| `+0x06` | channel (signed; −1 = sound effect) |
| `+0x0C`, `+0x10` | play position: byte address and 23-bit fraction |
| `+0x14`, `+0x18`, `+0x1C` | envelope level, step and sustain level |
| `+0x20` | the instrument record |
| `+0x24` | pitch step (`0x10000` = the sample's own rate) |
| `+0x28`, `+0x2C` | where the last mix ended (checked by `audio_voice_advance`) |

When the position reaches the record's end, modes 1 and 3 stop the voice
and modes 2 and 4 jump back by the record's length (the loop).

Note-on (`midicom_note_on`) takes a free voice of the channel, else a
releasing one; a channel in mono mode always uses its first voice. With no
voice left it prints "too many notes on channel N. increase polyphony RAM
or modify tune (perhaps reduce envelope release times)".

## Per frame

`audio_asmprocess` (from the vblank handler when `gModeFlags` bit 14 is set):

1. loads the pending song (`gAudioPendingSong`, set by `music_play`): the
   tempo, division and tables of the song record, the channel defaults;
2. unless the music is paused (`audio_pause`, `gAudioMusicPaused`): runs
   every track with `process_tune_ARM`, moves the vibrato phases on
   (`update_modulation`) and steps the music envelopes
   (`audio_env_music`);
3. counts the sound effect timers down (`update_all_fx_durs`) and steps their
   envelopes (`audio_env_sfx`);
4. mixes (`audio_mix_frame`): every playing or releasing voice, up to
   `gAudioMixLimit` (8), is resampled into a 16-bit buffer with linear
   interpolation (`audio_voice_mix`); the result is clipped to 8 bits into
   one of two output buffers, which `audio_vsync_asm` hands to DMA1 the next
   frame;
5. moves the voices' positions on by one frame (`audio_advance_music`,
   `audio_advance_sfx`).

Timing: `set_new_tempo` stores the tempo (microseconds per quarter note,
`gAudioTempo`) and the length of a frame (60000000 / 3600 = 16666.67 µs,
`gAudioFrameTime`, 24.8 fixed point). A wait of d ticks adds
d × tempo / division microseconds to the track's counter
(`gAudioTrackTime`, 64 bits per track, `div_s64_s32_ARM`); the track runs
again when a frame's time has used it up.

The pitch (`calc_phase_inc`, `audio_calc_pitch`) is the note against the
record's base note, plus the record's fine tune (`+0x34`, in hundredths),
the channel's pitch bend times the record's bend range (`+0x38`) and the
vibrato: a sine table (`0x0802F708`) scaled by the controller 1 depth and
the record's `+0x40`.

`audio_set_playback_freq` accepts 10512, 13379, 18157 and 21024 Hz (176 to 352
samples per frame) and refuses higher rates.

## Errors

`print_text` prints an "AUDIO ERROR, ..." message through `AGBPrintf` and
sets `gAudioErrorFlag`. Most callers then stop at a debug trap
(`swi 0xFF` in Thumb, an undefined instruction in ARM). Only "too many
notes on channel N" carries on: `audio_err_channel_resume` jumps to
`0x0802DFE0`, which is the ROM copy (load address) of the ARM code at
`0x03006C44`, not the IWRAM copy. The sequencer then skips the note and
runs the rest of that call of `process_tune_ARM` from the cartridge. That
works because the ARM code is position-independent, but it is slower. The
disassembly writes that pointer as `__audio_lma_03006C44`, which the linker
script defines relative to the overlay's load address, so it still holds
in a shifted build.

Not used in this build: `music_set_tempo` and the second entry of
`snd_play`, `snd_play_timed` (r3 = frames until the sound is released;
`snd_play` passes 0).

## Names from the 2001 build

The engine is the one in the September 2001 build of Diddy Kong Pilot,
whose ELF keeps its symbols: long runs of the ARM code and of the Thumb glue
are byte-identical (up to 892 bytes in one function), as are the pitch
table (`pitchfreqs_start` there, 4162 bytes) and the error messages. Where a
2003 function starts at the same instruction as a named 2001 function, it
has the 2001 name; `config/symbols.txt` notes the earlier name
(`[2001 name; was ...]`).

| 2001 name | What it does |
|---|---|
| `setup_note_ARM` | set up a voice (note-on, `snd_play`, song loader) |
| `gab_play_note` | mix one voice into the frame (`generate_audio_buffer`) |
| `process_tune_ARM` | run one track's commands |
| `midicom_note_on`, `set_new_tempo` | sequence commands |
| `calc_phase_inc` | a voice's pitch step |
| `div_s64_s32_ARM` | 64 / 32-bit division |
| `audio_asmprocess` | the per-frame step |
| `audio_vsync_asm` | swap the sound buffers |
| `update_modulation`, `update_all_fx_durs` | vibrato phases, sound effect timers |
| `is_fx_still_active`, `audio_fx_pitch_mod`, `audio_fx_volume_mod`, `audio_halt_fx`, `audio_release_fx` | sound effect handles |
| `audio_halt_tune`, `audio_set_fx_vol`, `audio_set_playback_freq` | music stop, volume, mixing rate |
| `reset_all_notes`, `reset_all_fx`, `reset_pitchbend`, `reset_modulation`, `reset_all_monophonic_flags`, `wipe_audio_buff` | init |
| `wait_vbl`, `print_text`, `too_many_notes_on_1_voice_ERR` | helpers and errors |

The IWRAM maths has two more: `ram_atan2` and `ram_divide`. Functions whose
start does not line up with a 2001 symbol keep descriptive names. So do
`audio_hw_stop` (2001's `audio_pause`; this build's `audio_pause` is the
music pause flag) and the cases where two 2003 functions fall on one 2001
routine (`audio_env_*` and `audio_advance_*` on `update_all_notes_ARM` and
`update_all_fx_ARM`).
