@ Bug fix: infinite / duplicated engine-sound loop, triggered when lots of
@ sounds are requested at once (e.g. zipper + item hit at the same time).
@ Build: tools/make_patch.py baserom.gba patches/fix_sound_loop.s out.ips
@ (.org values are ROM offsets and must be in increasing order.)
	.syntax unified
	.cpu arm7tdmi
	.thumb

@ 1) Local-player engine state 8 ("re-trigger sample") jumped straight to the
@    play call without stopping the previous handle.  Route it through state
@    7, which stops the old handle first and is otherwise identical.
	.org 0x090BA
	b . + (0x08009232 - 0x080090BA)

@ 2) Same for the non-local player sound state machine.
	.org 0x09504
	beq . + (0x080095FA - 0x08009504)

@ 3) Same for computer players (their re-trigger state is 4; 3 = stop+play).
	.org 0x0DE4A
	b . + (0x0800E056 - 0x0800DE4A)

@ 4) gamesfx update: when a queued sound request timed out before getting a
@    voice, its end callback was called with the context of hardware voice
@    #3 (stale r6) instead of the request's own context (+0x3C).  For engine
@    sounds that flips some *other* racer's state to "re-trigger", starting a
@    second, self-perpetuating copy of their engine loop.
	.org 0x1F3AE
	ldr r0, [r4, #0x3c]
