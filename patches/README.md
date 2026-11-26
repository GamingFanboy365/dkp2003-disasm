# Patches

## `fix_sound_loop.ips`: engine-sound loop fix

Apply to the original ROM (SHA1 `0cb385781742c25bf9d4cbeae8e83f7750af48db`).
Result SHA1: `6ecb7b6be5e03444f9ecc8499926109a640bffc7`.

**Symptom:** a racer goes through a zipper and gets hit by an item at the
same moment, and an engine sound starts looping forever on top of the normal
one.

**How engine sounds work:** each engine sound is a one-shot sample. Its
end-of-sample callback sets the racer's sound state from *playing* (9) to
*re-trigger* (8). State 8 then starts a new random engine sample and returns
to 9. CPU racers use the same scheme with states 5→4.

**Bug 1 (root cause):** `gamesfx` has only 4 hardware voices, and a request
that waits too long in the queue times out. A zipper plus a hit queues a
burst of sounds at once: whoosh, character shout, hit sound, "ouch", engine
restart. When a request times out, the update loop calls its end callback
with a stale register (the context of voice #3) instead of the request's
own context (`ROM 0x1F3AE`: `ldr r0,[r6,#0x2c]` → `ldr r0,[r4,#0x3c]`).
For an engine request, that flips *another* racer's state to "re-trigger"
while their engine is still playing.

**Bug 2:** the "re-trigger" state starts the new sample **without stopping
the old handle**, unlike the otherwise identical "restart" state 7. So that
racer ends up with two engine chains. Each chain's end callback re-triggers
the other, and the extra copy never stops. The patch routes re-trigger
through the restart path, which stops first, in all three copies of the
state machine:

| ROM offset | Function | Change |
|---|---|---|
| `0x090BA` | local player (`sub_08009084`) | state 8 → state 7 path |
| `0x09504` | other players (`sub_080094C0`) | state 8 → state 7 path |
| `0x0DE4A` | CPU players (comp player) | state 4 → state 3 path |
| `0x1F3AE` | gamesfx update (`sub_0801F2C4`) | timed-out request gets its own context |

Stopping an already-finished handle is a no-op, so normal engine looping
is unchanged.

Rebuild: `make patch` (needs `baserom.gba`).
