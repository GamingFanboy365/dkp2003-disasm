# Patches

## `fix_sound_loop.ips`: endless zinger buzz after a zipper

Apply to the original ROM (SHA1 `0cb385781742c25bf9d4cbeae8e83f7750af48db`).
Result SHA1: `9afa37da01126426461207ab3833116da865020f`.

**Symptom:** a CPU racer's purple zinger gets you around the moment you fly
through a zipper, and a buzzing noise loops for the rest of the race.

**Cause:** a purple zinger (class 22, `act_red_zinger.c`) that is stuck to a
racer runs this every frame (`ROM 0x29A2C`, inside `sub_0802931C`):

```
if (victim.flags & 0x01000000)        // victim went through a zipper
    zinger_destroy(zinger, 0);        // stops the zinger's sounds, state = dying
                                      // BUG: falls through
if (zinger.buzz_handle == -1 && victim is the local player)
    zinger.buzz_handle = play(0xDD);  // "zinger on your plane" loop
```

The destroy call has just set the buzz handle to -1, so the code right after
it starts the loop again. The zinger is already dying, so nothing ever stops
that handle and it buzzes forever. It only happens to the local player,
because only they hear this buzz. The order doesn't matter: the zinger can
latch on first and you then take a zipper, or it can latch on while the
zipper flag is still set.

The blue zinger has the same check but exits after destroying itself, so it
is not affected.

**Fix (24 bytes at `0x29A2C`):** branch past the buzz-start code after the
destroy call. The `== -1` test is shortened to `adds r6,#1; beq` to make
room for the extra branch. No other behaviour changes.

**Verified** in mGBA with scripted input. On the original ROM the orphaned
sound 0xDD (221) was still playing 2,277 frames (about 38 seconds) after the
zinger was gone, when the run ended. On the patched ROM, with identical
inputs, it never starts, and normal zinger buzzes later in the run still play
and stop.

Rebuild: `make patch` (needs `baserom.gba`).

### Not included

While looking for this bug by reading the code, I found one more real defect
that is not patched here, because I could not show it causing anything
audible. In the gamesfx update (`ROM 0x1F3AE`), when a queued sound request
times out, its end callback is called with the context of hardware voice #3
(`ldr r0,[r6,#0x2c]`) instead of the request's own context
(`ldr r0,[r4,#0x3c]`).

## `debug_menu.ips`: boot into the hidden debug menu

Apply to the original ROM. Result SHA1:
`e7db2654a0b2dbf5c014e1f5bc45a7e4469ed4c6`. It can be combined with
`fix_sound_loop.ips`, because the two patches change different bytes.

The game still contains a working debug menu that nothing calls (see
[`docs/debug_menu.md`](../docs/debug_menu.md)). After the logos, the boot
code calls `fe_options_init(1)`, the language screen, with a `bl` at ROM
`0x1EE14`. The patch points that `bl` at `debug_menu_init` instead. The
menu's **New Frontend** item opens the normal title screen, so the rest of
the game stays reachable. Only the language screen is skipped at boot.

Tested in mGBA: it boots to the menu, and every item opens its screen.
