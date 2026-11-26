@ Bug fix: endless zinger buzz after a zipper.
@ Build: tools/make_patch.py baserom.gba patches/fix_sound_loop.s out.ips
@ (.org values are ROM offsets.)
	.syntax unified
	.cpu arm7tdmi
	.thumb

@ A purple (red) zinger that is stuck to a racer checks
@    the racer's "went through a zipper" flag and, if set, destroys itself
@    (which stops its sounds) - but then falls through into the code that
@    starts the "zinger on your plane" buzz loop (sound 0xDD) whenever the
@    buzz handle is empty and the victim is the local player.  The zinger
@    is already dying, so nothing ever stops that buzz again.
@    Fix: skip the buzz-start code after the destroy call.  The -1 test is
@    shortened (adds/beq) to make room for the extra branch.
	.org 0x29A2C
	cmp r1, #0
	beq 1f
	adds r0, r7, #0
	movs r1, #0
	bl . + (0x08028DFC - 0x08029A34)
	b . + (0x08029A44 - 0x08029A38)
1:	ldr r0, [sp, #0x44]
	ldr r6, [r0, #0x24]
	adds r6, #1
	beq . + (0x08029AE8 - 0x08029A40)
	mov r8, r8
