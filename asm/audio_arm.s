@ asm/audio_arm.s: ROM 0x02D834-0x02EAE0 (audio, VMA 0x03006498)

	.include "asm/macros.inc"

	.section .audio, "ax", %progbits
	.balign 4

	.arm

	.global audio_voice_start
	.type audio_voice_start, %function
audio_voice_start: @ 03006498
	stmdb sp!, {lr}
	strb r3, [r5, #3]
	str r1, [r5, #0x24]
	strb r7, [r5, #1]
	strb r4, [r5, #2]
	strb sb, [r5, #5]
	ldr r1, [r2, #0x10]
	str r1, [r5, #0xc]
	mov r1, #0
	str r1, [r5, #0x28]
	str r1, [r5, #0x2c]
	str r1, [r5, #0x10]
	strb r1, [r5, #4]
	str r1, [r5, #0x14]
	str r2, [r5, #0x20]
	mov r8, #0x11
	strb r8, [r5]
	ldm sp!, {lr}
	bx lr

	.global audio_mix_frame
	.type audio_mix_frame, %function
audio_mix_frame: @ 030064E4
	sub sp, sp, #0x24
	str lr, [sp, #8]
	ldr r5, _03006E8C
	str r5, [sp, #4]
	ldr r1, _03006E90
	ldr r1, [r1]
	str r1, [sp, #0x10]
	ldr r2, _03006E94
	ldr r2, [r2]
	ldr r0, _03006E98
	add r0, r0, r2
_03006510:
	ldrb r5, [r0, -r2]
	cmp r5, #0x11
	bleq audio_mix_voice_cb
	subs r2, r2, #0x30
	bgt _03006510
	ldr r2, _03006E94
	ldr r2, [r2]
_0300652C:
	ldrb r5, [r0, -r2]
	cmp r5, #0x12
	bleq audio_mix_voice_cb
	subs r2, r2, #0x30
	bgt _0300652C
	ldr r0, _03006E9C
	ldr r1, [r0]
	cmp r1, #1
	beq _03006590
	ldr r2, _03006EA0
	ldr r2, [r2]
	ldr r0, _03006EA4
	add r0, r0, r2
_03006560:
	ldrb r5, [r0, -r2]
	cmp r5, #0x11
	bleq audio_mix_voice_cb
	subs r2, r2, #0x30
	bgt _03006560
	ldr r2, _03006EA0
	ldr r2, [r2]
_0300657C:
	ldrb r5, [r0, -r2]
	cmp r5, #0x12
	bleq audio_mix_voice_cb
	subs r2, r2, #0x30
	bgt _0300657C
_03006590:
	ldr r0, [sp, #0x10]
	ldr r1, _03006E90
	ldr r1, [r1]
	cmp r0, r1
	bne _030065B0
	ldr r0, _03006EA8
	add lr, pc, #0
	bx r0
_030065B0:
	ldr r0, _03006EAC
	ldr r2, [r0]
	ldr r1, _03006EB0
	cmp r2, #0
	bne _030065C8
	ldr r1, _03006EB4
_030065C8:
	ldr r1, [r1]
	ldr r0, _03006E8C
	ldr r2, _03006EB8
	ldr r2, [r2]
_030065D8:
	ldrsh r3, [r0], #2
	cmp r3, #0x7f
	movgt r3, #0x7f
	bgt _030065F0
	cmn r3, #0x80
	mvnlt r3, #0x7f
_030065F0:
	strb r3, [r1], #1
	subs r2, r2, #1
	bne _030065D8
	ldr lr, [sp, #8]
	add sp, sp, #0x24
	bx lr

	.global audio_mix_voice_cb
	.type audio_mix_voice_cb, %function
audio_mix_voice_cb: @ 03006608
	str lr, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	sub r0, r0, r2
	ldr r5, [sp, #4]
	bl audio_voice_mix
	ldr r1, [sp, #0x10]
	subs r1, r1, #1
	str r1, [sp, #0x10]
	beq _030065B0
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr pc, [sp, #0xc]

	.global audio_advance_sfx
	.type audio_advance_sfx, %function
audio_advance_sfx: @ 0300663C
	stmdb sp!, {lr}
	ldr fp, _03006E94
	ldr fp, [fp]
	ldr sl, _03006E98
	add sl, sl, fp
	b _03006668

	.global audio_advance_music
	.type audio_advance_music, %function
audio_advance_music: @ 03006654
	stmdb sp!, {lr}
	ldr fp, _03006EA0
	ldr fp, [fp]
	ldr sl, _03006EA4
	add sl, sl, fp
_03006668:
	ldrb r2, [sl, -fp]
	cmp r2, #0x11
	bleq audio_voice_advance
	cmp r2, #0x12
	bleq audio_voice_advance
	subs fp, fp, #0x30
	bgt _03006668
	ldm sp!, {lr}
	bx lr

	.global audio_voice_advance
	.type audio_voice_advance, %function
audio_voice_advance: @ 0300668C
	sub r0, sl, fp
	ldr r7, [r0, #8]
	movs r7, r7
	bne _030066A8
	push {sl, fp, lr}
	bl audio_voice_pitch
	pop {sl, fp, lr}
_030066A8:
	ldr r1, _03006EB8
	ldr r1, [r1]
	ldr r2, [r0, #0x10]
	ldr r3, [r0, #0xc]
	mov r6, #0
	str r6, [r0, #8]
	ldr r6, [r0, #0x24]
	umull r4, r5, r6, r7
	lsr r7, r4, #0x10
	add r7, r7, r5, lsl #16
	orr r2, r2, r3, lsl #23
	lsr r3, r3, #9
	umlal r2, r3, r7, r1
	ldr r4, _03006EBC
	and r1, r2, r4
	lsr r2, r2, #0x17
	orr r2, r2, r3, lsl #9
	ldr r3, [r0, #0x20]
	ldr r3, [r3, #0x18]
	cmp r2, r3
	blt _03006774
	ldrb r4, [r0, #1]
	cmp r4, #1
	beq _03006748
	cmp r4, #2
	beq _03006724
	cmp r4, #3
	beq _0300673C
	cmp r4, #4
	beq _03006724
	.4byte 0xE7FFFFFF @ debug trap
_03006724:
	ldr r4, [r0, #0x20]
	ldr r4, [r4, #0x14]
_0300672C:
	sub r2, r2, r4
	cmp r2, r3
	bge _0300672C
	b _03006774
_0300673C:
	mov r3, #0x10
	strb r3, [r0]
	b _03006774
_03006748:
	ldr r3, [r0, #0x20]
	lsr r3, r3, #0x18
	cmp r3, #2
	bne _03006768
	ldr r3, _03006E98
	cmp r0, r3
	blt _03006768
	b _0300673C
_03006768:
	mov r3, #0x10
	strb r3, [r8]
	b _03006774
_03006774:
	ldr r3, [r0, #0x28]
	cmp r3, #0
	beq _030067A8
	cmp r2, r3
	beq _0300678C
	.4byte 0xE7FFFFFF @ debug trap
_0300678C:
	ldr r3, [r0, #0x2c]
	cmp r1, r3
	beq _0300679C
	.4byte 0xE7FFFFFF @ debug trap
_0300679C:
	mov r3, #0
	str r3, [r0, #0x28]
	str r3, [r0, #0x2c]
_030067A8:
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov pc, lr

	.global audio_env_sfx
	.type audio_env_sfx, %function
audio_env_sfx: @ 030067B4
	stmdb sp!, {lr}
	ldr fp, _03006E94
	ldr fp, [fp]
	ldr sl, _03006E98
	add sl, sl, fp
	b _030067E0

	.global audio_env_music
	.type audio_env_music, %function
audio_env_music: @ 030067CC
	stmdb sp!, {lr}
	ldr fp, _03006EA0
	ldr fp, [fp]
	ldr sl, _03006EA4
	add sl, sl, fp
_030067E0:
	ldrb r2, [sl, -fp]
	cmp r2, #0x11
	bleq audio_voice_env
	cmp r2, #0x12
	bleq audio_voice_env
_030067F4:
	subs fp, fp, #0x30
	bgt _030067E0
	ldm sp!, {lr}
	bx lr

	.global audio_voice_env
	.type audio_voice_env, %function
audio_voice_env: @ 03006804
	sub ip, sl, fp
	ldrb r1, [ip, #4]
	cmp r1, #7
	blt _03006830
	push {r0, r1, lr}
	ldr r0, _03006EC0
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0xFF, 0xFF, 0xFF, 0xE7
_03006830:
	add r2, pc, #4
	ldr r0, [r2, r1, lsl #2]
	add pc, r0, r2
	.byte 0x1C, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x04, 0x01, 0x00, 0x00
	.byte 0x44, 0x01, 0x00, 0x00, 0x54, 0x01, 0x00, 0x00, 0x9C, 0x01, 0x00, 0x00
_03006858:
	ldr r3, [ip, #0x20]
	ldr r1, [r3, #0x24]
	rsb r2, r1, #0x63
	lsl r0, r2, #5
	mov r1, #0x63
	bl audio_udiv
	movs r0, r0
	beq _030068C0
	mov r1, r0
	mov r0, #0x8000
	add r1, r1, #1
	bl audio_udiv
	lsl r1, r1, #4
	lsl r0, r0, #4
	str r1, [ip, #0x14]
	str r0, [ip, #0x18]
	mov r0, #1
	strb r0, [ip, #4]
	ldrb r1, [ip]
	cmp r1, #0x12
	beq _03006990
	ldr r1, [ip, #0x18]
	ldr r2, [ip, #0x14]
	add r1, r1, r2
	cmp r1, #0x80000
	blt _030068CC
_030068C0:
	mov r1, #2
	strb r1, [ip, #4]
	mov r1, #0x80000
_030068CC:
	str r1, [ip, #0x14]
	sub pc, pc, #0xe4
_030068D4:
	ldr r3, [ip, #0x20]
	ldr r0, [r3, #0x2c]
	lsl r0, r0, #7
	mov r1, #0x63
	bl audio_udiv
	lsl r4, r0, #8
	lsl r0, r1, #8
	mov r1, #0x63
	bl audio_udiv
	orr r0, r4, r0
	lsl r1, r0, #4
	str r1, [ip, #0x1c]
	rsb r0, r0, #0x8000
	ldr r1, [r3, #0x28]
	ldr r2, _03006EC8
	ldrb r1, [r2, r1]
	movs r1, r1
	beq _03006964
	add r1, r1, #1
	bl audio_udiv
	lsl r0, r0, #4
	str r0, [ip, #0x18]
	ldr r0, [ip, #0x14]
	sub r0, r0, r1, lsl #4
	str r0, [ip, #0x14]
	mov r1, #3
	strb r1, [ip, #4]
	ldrb r1, [ip]
	cmp r1, #0x12
	beq _03006990
	ldr r1, [ip, #0x18]
	ldr r2, [ip, #0x14]
	ldr r3, [ip, #0x1c]
	sub r1, r2, r1
	cmp r1, r3
	bgt _03006970
_03006964:
	mov r1, #4
	strb r1, [ip, #4]
	ldr r1, [ip, #0x1c]
_03006970:
	cmp r1, #0x1000
	blt _030069E8
	str r1, [ip, #0x14]
	sub pc, pc, #0x190
_03006980:
	ldrb r1, [ip]
	cmp r1, #0x12
	beq _03006990
	sub pc, pc, #0x1a0
_03006990:
	ldr r3, [ip, #0x20]
	ldr r0, [ip, #0x14]
	ldr r1, [r3, #0x30]
	ldr r2, _03006EC8
	ldrb r1, [r2, r1]
	movs r1, r1
	beq _030069E8
	lsr r0, r0, #4
	add r1, r1, #1
	bl audio_udiv
	lsls r0, r0, #4
	beq _030069E8
	str r0, [ip, #0x18]
	ldr r0, [ip, #0x14]
	sub r0, r0, r1, lsl #4
	str r0, [ip, #0x14]
	mov r1, #6
	strb r1, [ip, #4]
	ldr r1, [ip, #0x18]
	ldr r2, [ip, #0x14]
	subs r1, r2, r1
	bgt _030069F0
_030069E8:
	mov r1, #0x10
	strb r1, [ip]
_030069F0:
	str r1, [ip, #0x14]
	sub pc, pc, #0x208
_030069F8:
	bic r2, fp, #3
	ldm r2, {r1, r3}
	and r2, fp, #3
	lsls r2, r2, #3
	lsrne r1, r1, r2
	rsbne r2, r2, #0x20
	orrne r1, r1, r3, lsl r2
	add fp, fp, #3
	bl audio_set_tempo
	add pc, pc, #0x398

	.global audio_set_tempo
	.type audio_set_tempo, %function
audio_set_tempo: @ 03006A20
	stmdb sp!, {lr}
	bic r0, r1, #0xff000000
	ldr r2, _03006ECC
	str r0, [r2]
	ldr r0, _03006ED0
	mov r1, #0xe10
	bl audio_udiv
	lsl r4, r0, #8
	lsl r0, r1, #0x10
	mov r1, #0xe10
	bl audio_udiv
	orr r0, r4, r0, lsr #8
	ldr r2, _03006ED4
	str r0, [r2]
	ldm sp!, {lr}
	bx lr
_03006A60:
	ldr r5, _03006ED8
	ldr r5, [r5]
	ldrb r1, [fp], #1
	ldr r0, _03006ECC
	ldr r2, [r0]
	mul r1, r2, r1
	mov r0, #0
	mov r2, r5
	bl audio_udiv64
	lsl r4, r1, #8
	lsl r0, r0, #0x10
	mov r1, r5
	bl audio_udiv
	orr r1, r4, r0, lsr #8
	mov r2, #0
	ldr r5, [sp]
	ldr r0, _03006EDC
	add r0, r0, r5, lsl #3
	ldm r0, {r3, r4}
	adds r1, r3, r1
	adcs r2, r4, r2
	stm r0, {r1, r2}
	add pc, pc, #0x330
_03006ABC:
	ldr r5, _03006ED8
	ldr r5, [r5]
	ldrb r0, [fp], #1
	ldrb r1, [fp], #1
	orr r1, r0, r1, lsl #8
	ldr r0, _03006ECC
	ldr r2, [r0]
	umull r1, r0, r2, r1
	mov r2, r5
	bl audio_udiv64
	lsr r6, r1, #0x18
	lsl r4, r1, #8
	lsl r0, r0, #0x10
	mov r1, r5
	bl audio_udiv
	orr r1, r4, r0, lsr #8
	mov r2, r6
	ldr r5, [sp]
	ldr r0, _03006EDC
	add r0, r0, r5, lsl #3
	ldm r0, {r3, r4}
	adds r1, r3, r1
	adcs r2, r4, r2
	stm r0, {r1, r2}
	add pc, pc, #0x2cc
	.byte 0x03, 0x20, 0xCB, 0xE3, 0x0A, 0x00, 0x92, 0xE8, 0x03, 0x20, 0x0B, 0xE2, 0x82, 0x21, 0xB0, 0xE1
	.byte 0x31, 0x12, 0xA0, 0x11, 0x20, 0x20, 0x62, 0x12, 0x13, 0x12, 0x81, 0x11, 0x03, 0xB0, 0x8B, 0xE2
	.byte 0xFF, 0x14, 0xC1, 0xE3, 0x80, 0x03, 0x9F, 0xE5, 0x00, 0x20, 0x90, 0xE5, 0x92, 0x11, 0x80, 0xE0
	.byte 0x80, 0x53, 0x9F, 0xE5, 0x00, 0x50, 0x95, 0xE5, 0x05, 0x00, 0x50, 0xE1, 0x06, 0x00, 0x00, 0xBA

	.global audio_err_delta_big
	.type audio_err_delta_big, %function
audio_err_delta_big: @ 03006B60
	push {r0, r1, lr}
	ldr r0, _03006EE0
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.incbin "baserom.gba", 0x2DF10, 0x4C

	.global audio_err_delta_4
	.type audio_err_delta_4, %function
audio_err_delta_4: @ 03006BC0
	push {r0, r1, lr}
	ldr r0, _03006EE4
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0xFF, 0xFF, 0xFF, 0xE7

	.global audio_cmd_note_on
	.type audio_cmd_note_on, %function
audio_cmd_note_on: @ 03006BDC
	ldrb r1, [fp], #1
	ldr r4, _03006EE8
	ldr r4, [r4]
	ldr r3, _03006EA4
	add r3, r3, r4
	mla r5, r1, r4, r3
	ldr r2, _03006EE8
	ldr r2, [r2]
	ldr r0, _03006EEC
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _03006C50
_03006C0C:
	ldrb r0, [r5, -r2]
	cmp r0, #0x10
	beq _03006C50
	subs r2, r2, #0x30
	bgt _03006C0C
	ldr r2, _03006EE8
	ldr r2, [r2]
_03006C28:
	ldrb r0, [r5, -r2]
	cmp r0, #0x12
	beq _03006C50
	subs r2, r2, #0x30
	bgt _03006C28
	ldr r0, _03006EF0
	bx r0
	.global _03006C44
_03006C44:
	ldrb r4, [fp], #1
	ldrb r0, [fp], #1
	b _03006D64
_03006C50:
	sub r5, r5, r2
	ldrb r4, [fp], #1
	mov sb, r4
	mov r7, #4
	ldr r6, _03006EF4
	mla r2, r1, r7, r6
	ldr r2, [r2]
	stmdb sp!, {r2}
	and r2, r2, #0xf000000
	cmp r2, #0x8000000
	beq _03006CA8
	cmp r2, #0x2000000
	beq _03006CA8
	push {r0, r1, lr}
	ldr r0, _03006EF8
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x04, 0x00, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x2E, 0x00, 0x00, 0xEA
_03006CA8:
	ldm sp!, {r2}
	ldr r7, [r2]
	cmp r7, #0x20
	beq _03006D50
	cmp r7, #0x21
	beq _03006D50
	cmp r7, #0x22
	beq _03006CD4
	cmp r7, #0x23
	beq _03006D14
	.4byte 0xE7FFFFFF @ debug trap
_03006CD4:
	ldr r0, [r2, #0x1c]
	ldrb r1, [r0, r4]
	cmp r1, #0xff
	bne _03006D04
	push {r0, r1, lr}
	ldr r0, _03006EFC
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x17, 0x00, 0x00, 0xEA
_03006D04:
	ldr r0, [r2, #0x20]
	ldr r2, [r0, r1, lsl #2]
	ldr sb, [r2, #0xc]
	b _03006D50
_03006D14:
	ldr r0, [r2, #0x1c]
	ldrb r1, [r0, r4]
	cmp r1, #0xff
	bne _03006D44
	push {r0, r1, lr}
	ldr r0, _03006EFC
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x07, 0x00, 0x00, 0xEA
_03006D44:
	ldr r0, [r2, #0x20]
	ldr r2, [r0, r1, lsl #2]
	b _03006D50
_03006D50:
	ldr r7, [r2, #4]
	ldrb r3, [fp], #1
	add r3, r3, #1
	mov r1, #0x10000
	bl audio_voice_start
_03006D64:
	add pc, pc, #0x50

	.global audio_seq_step
	.type audio_seq_step, %function
audio_seq_step: @ 03006D68
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov r0, #0
	str r0, [sp, #8]
	mvn r0, #0
	str r0, [sp]
	b _03006E1C
_03006D84:
	str r0, [sp]
	ldr r4, _03006EDC
	add r4, r4, r0, lsl #3
	ldr r1, _03006ED4
	ldm r4, {r2, r3}
	ldr r5, [r1]
	subs r2, r2, r5
	sbcs r3, r3, #0
	stm r4, {r2, r3}
	bpl _03006E1C
	ldr fp, _03006F00
	ldr r0, [sp]
	ldr fp, [fp, r0, lsl #2]
_03006DB8:
	add ip, pc, #0x98
_03006DBC:
	ldrb r0, [fp], #1
	cmp r0, #0xd
	blt _03006DE4
	push {r0, r1, lr}
	ldr r0, _03006F04
	add lr, pc, #4
	ldr r1, _03006EC4
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0xFF, 0xFF, 0xFF, 0xE7
_03006DE4:
	ldr r0, [ip, r0, lsl #2]
	add pc, r0, ip
	.byte 0xFF, 0xFF, 0xFF, 0xE7
_03006DF0:
	ldr r0, [sp]
	ldr r1, _03006F08
	ldr r1, [r1, r0, lsl #3]
	cmp r1, #0
	bmi _03006E08
	b _03006E0C
_03006E08:
	b _03006DB8
_03006E0C:
	mov r0, r0
_03006E10:
	ldr r0, [sp]
	ldr r2, _03006F00
	str fp, [r2, r0, lsl #2]
_03006E1C:
	ldr r1, _03006F0C
	ldr r1, [r1]
	ldr r0, [sp]
	adds r0, r0, #1
	cmp r0, r1
	bne _03006D84
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _03006E4C
	ldr r0, _03006F10
	mvn r1, #0
	str r1, [r0]
_03006E4C:
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.byte 0xA0, 0xFB, 0xFF, 0xFF, 0x08, 0xFC, 0xFF, 0xFF, 0x64, 0xFC, 0xFF, 0xFF, 0xC8, 0xFC, 0xFF, 0xFF
	.byte 0x68, 0xFD, 0xFF, 0xFF, 0x84, 0xFD, 0xFF, 0xFF, 0xBC, 0x00, 0x00, 0x00, 0x18, 0x01, 0x00, 0x00
	.byte 0xBC, 0x01, 0x00, 0x00, 0x08, 0x02, 0x00, 0x00, 0x10, 0x02, 0x00, 0x00, 0x2C, 0x02, 0x00, 0x00
	.byte 0x40, 0x02, 0x00, 0x00
_03006E8C:
	.4byte gAudioMixBuf
_03006E90:
	.4byte gAudioMixLimit
_03006E94:
	.4byte gAudioSfxVoiceBytes
_03006E98:
	.4byte gAudioSfxVoices
_03006E9C:
	.4byte gAudioMusicPaused
_03006EA0:
	.4byte gAudioMusicVoiceBytes
_03006EA4:
	.4byte gAudioVoices
_03006EA8:
	.4byte audio_clear_mix
_03006EAC:
	.4byte gAudioBufFlip
_03006EB0:
	.4byte gAudioOutBufA
_03006EB4:
	.4byte gAudioOutBufB
_03006EB8:
	.4byte gAudioFrameSamples
_03006EBC:
	.4byte 0x007FFFFF
_03006EC0:
	.4byte gUnk_0802FB98
_03006EC4:
	.4byte audio_error
_03006EC8:
	.4byte gAudioEnvRates
_03006ECC:
	.4byte gAudioTempo
_03006ED0:
	.4byte 0x03938700
_03006ED4:
	.4byte gAudioFrameTime
_03006ED8:
	.4byte gAudioDivision
_03006EDC:
	.4byte gAudioTrackTime
_03006EE0:
	.4byte gUnk_0802FBE9
_03006EE4:
	.4byte gUnk_0802FC0F
_03006EE8:
	.4byte gAudioChannelVoiceBytes
_03006EEC:
	.4byte gAudioChannelMono
_03006EF0:
	.4byte audio_err_channel_full
_03006EF4:
	.4byte gAudioChannelInstrument
_03006EF8:
	.4byte gUnk_08030506
_03006EFC:
	.4byte gUnk_0803057E
_03006F00:
	.4byte 0x03006458
_03006F04:
	.4byte gUnk_0802FBBF
_03006F08:
	.4byte 0x03005A84
_03006F0C:
	.4byte 0x0300640C
_03006F10:
	.4byte gAudioSong
_03006F14:
	ldrb r1, [fp], #1
	ldrb r6, [fp], #1
	ldrb r7, [fp], #1
	ldr r4, _0300731C
	ldr r4, [r4]
	ldr r3, _03007320
	add r3, r3, r4
	mla r5, r1, r4, r3
	ldr r2, _0300731C
	ldr r2, [r2]
_03006F3C:
	ldrb r0, [r5, -r2]
	cmp r0, #0x11
	bleq audio_voice_release
	subs r2, r2, #0x30
	bgt _03006F3C
	b _03006F6C

	.global audio_voice_release
	.type audio_voice_release, %function
audio_voice_release: @ 03006F54
	sub r0, r5, r2
	ldrb r1, [r0, #2]
	cmp r1, r6
	bxne lr
	mov r1, #0x12
	strb r1, [r0]
_03006F6C:
	sub pc, pc, #0x1b8
_03006F70:
	ldrb r1, [fp], #1
	ldrb r2, [fp], #1
	ldrb r3, [fp], #1
	cmp r2, #1
	beq _03006FB0
	cmp r2, #7
	beq _03006FC4
	cmp r2, #0x66
	beq _03006FD0
	cmp r2, #0x67
	beq _03006FE0
	cmp r2, #0x7e
	beq _03006FF0
	cmp r2, #0x7f
	beq _03007000
	b _03007010
_03006FB0:
	ldr r5, _03007324
	mov r2, #8
	mla r5, r1, r2, r5
	str r3, [r5]
	b _03007010
_03006FC4:
	ldr r5, _03007328
	strb r3, [r5, r1]
	b _03007010
_03006FD0:
	ldr r4, [sp]
	ldr r5, _0300732C
	str fp, [r5, r4, lsl #2]
	b _03007010
_03006FE0:
	ldr r4, [sp]
	ldr r5, _0300732C
	ldr fp, [r5, r4, lsl #2]
	b _03007010
_03006FF0:
	ldr r5, _03007330
	mov r3, #1
	strb r3, [r5, r1]
	b _03007010
_03007000:
	ldr r5, _03007330
	mov r3, #0
	strb r3, [r5, r1]
	b _03007010
_03007010:
	sub pc, pc, #0x25c
_03007014:
	ldrb r1, [fp], #1
	ldrb r3, [fp], #1
	cmp r1, #0x10
	blt _03007028
	.4byte 0xE7FFFFFF @ debug trap
_03007028:
	ldr r2, _03007334
	ldr r2, [r2]
	ldrb r2, [r2, r3]
	cmp r2, #0xff
	bne _03007040
	.4byte 0xE7FFFFFF @ debug trap
_03007040:
	ldr r3, _03007338
	ldr r3, [r3]
	ldr r4, [r3, r2, lsl #2]
	ldr r8, _0300733C
	mov r2, #4
	mla r8, r2, r1, r8
	str r4, [r8]
	sub pc, pc, #0x2a8
	.byte 0x02, 0xB0, 0x8B, 0xE2, 0x2B, 0xFE, 0x4F, 0xE2
_03007068:
	ldrb r3, [fp], #1
	ldrb r0, [fp], #1
	ldrb r1, [fp], #1
	orr r1, r0, r1, lsl #8
	ldr r2, _03007340
	str r1, [r2, r3, lsl #2]
	sub pc, pc, #0x2cc
_03007084:
	sub fp, fp, #1
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	sub pc, pc, #0x28c
	.byte 0xFF, 0xFF, 0xFF, 0xE7, 0xBA, 0xFF, 0x4F, 0xE2

	.global audio_udiv
	.type audio_udiv, %function
audio_udiv: @ 030070A0
	stmdb sp!, {r1}
	lsl r1, r1, #0x10
	cmp r1, r0
	bgt _030070B4
	.4byte 0xE7FFFFFF @ debug trap
_030070B4:
	ldm sp!, {r1}
	rsb r1, r1, #0
	lsls r1, r1, #0xf
	bne _030070C8
	.4byte 0xE7FFFFFF @ debug trap
_030070C8:
	adds r0, r1, r0
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adcs r0, r1, r0, lsl #1
	rsblo r0, r1, r0
	adc r0, r0, r0
	lsr r1, r0, #0x10
	bic r0, r0, r1, lsl #16
	bx lr

	.global audio_udiv64
	.type audio_udiv64, %function
audio_udiv64: @ 03007158
	cmp r0, r2
	blt _03007164
	.4byte 0xE7FFFFFF @ debug trap
_03007164:
	movs r3, r2
	bne _03007170
	.4byte 0xE7FFFFFF @ debug trap
_03007170:
	rsbpl r2, r2, #0
	lsr r3, r3, #1
	eors r3, r3, r0, asr #1
	bpl _03007188
	rsbs r1, r1, #0
	rsc r0, r0, #0
_03007188:
	adds r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	adcs r0, r2, r0, lsl #1
	rsblo r0, r2, r0
	adcs r1, r1, r1
	lsls r3, r3, #1
	rsbmi r1, r1, #0
	rsbhs r0, r0, #0
	bx lr
_0300731C:
	.4byte gAudioChannelVoiceBytes
_03007320:
	.4byte gAudioVoices
_03007324:
	.4byte gAudioChannels
_03007328:
	.4byte gAudioChannelVolume
_0300732C:
	.4byte gAudioLoopPos
_03007330:
	.4byte gAudioChannelMono
_03007334:
	.4byte gAudioProgramMap
_03007338:
	.4byte gAudioInstrumentList
_0300733C:
	.4byte gAudioChannelInstrument
_03007340:
	.4byte gAudioPitchBend

	.global audio_voice_mix
	.type audio_voice_mix, %function
audio_voice_mix: @ 03007344
	str lr, [sp, #0x1c]
	str r0, [sp, #0x20]
	bl audio_voice_pitch
	str r7, [r0, #8]
	ldrsb r6, [r0, #6]
	cmp r6, #0
	ldr r1, _030076F8
	bmi _03007368
	ldr r1, _030076FC
_03007368:
	ldr r4, [r1]
	bmi _03007384
	ldr r3, _03007700
	ldrb r3, [r3, r6]
	add r3, r3, #1
	mul r4, r3, r4
	lsr r4, r4, #7
_03007384:
	ldrb r3, [r0, #3]
	mul r4, r3, r4
	lsr r4, r4, #7
	ldr sb, [r0, #0x14]
	mul r4, sb, r4
	lsr r4, r4, #0x13
	ldr r6, [r0, #0x24]
	umull sb, sl, r6, r7
	lsr r7, sb, #0x10
	add r7, r7, sl, lsl #16
	mov r6, #0
	mov r3, #0
	ldr sb, _03007704
	ldr sb, [sb]
	add sb, r5, sb, lsl #1
	ldr r6, [r0, #0x10]
	ldr sl, [r0, #0x20]
	ldr sl, [sl, #0x18]
	ldr r0, [r0, #0xc]
	ldr fp, _03007708
	ldr r3, _0300770C
	ldr r3, [r3]
	ldr r8, [sp, #0x10]
	cmp r3, r8
	bne _03007428
_030073E8:
	ldrsb r1, [r0]
	ldrsb r2, [r0, #1]
	sub r2, r2, r1
	mul r3, r6, r2
	add r1, r1, r3, asr #23
	mul r2, r1, r4
	asr r2, r2, #7
	strh r2, [r5], #2
	add r6, r6, r7
	add r0, r0, r6, lsr #23
	and r6, r6, fp
	cmp r0, sl
	blge audio_voice_mix_end
	cmp r5, sb
	bne _030073E8
	b _03007518
_03007428:
	ldrsb r1, [r0]
	ldrsb r2, [r0, #1]
	sub r2, r2, r1
	mul r3, r6, r2
	add r1, r1, r3, asr #23
	mul r2, r1, r4
	ldrsh r1, [r5]
	add r1, r1, r2, asr #7
	strh r1, [r5], #2
	add r6, r6, r7
	add r0, r0, r6, lsr #23
	and r6, r6, fp
	cmp r0, sl
	blge audio_voice_mix_end
	ldrsb r1, [r0]
	ldrsb r2, [r0, #1]
	sub r2, r2, r1
	mul r3, r6, r2
	add r1, r1, r3, asr #23
	mul r2, r1, r4
	ldrsh r1, [r5]
	add r1, r1, r2, asr #7
	strh r1, [r5], #2
	add r6, r6, r7
	add r0, r0, r6, lsr #23
	and r6, r6, fp
	cmp r0, sl
	blge audio_voice_mix_end
	cmp r5, sb
	bne _03007428
	b _03007518

	.global audio_voice_mix_end
	.type audio_voice_mix_end, %function
audio_voice_mix_end: @ 030074A4
	ldr r8, [sp, #0x20]
	ldrb r3, [r8, #1]
	cmp r3, #1
	beq _030074D0
	cmp r3, #2
	beq _03007508
	cmp r3, #3
	beq _030074FC
	cmp r3, #4
	beq _03007508
	.4byte 0xE7FFFFFF @ debug trap
_030074D0:
	ldr r3, [r8, #0x20]
	lsr r3, r3, #0x18
	cmp r3, #2
	bne _030074F0
	ldr r3, _03007710
	cmp r8, r3
	blt _030074F0
	b _030074FC
_030074F0:
	mov r3, #0x10
	strb r3, [r8]
	b _03007528
_030074FC:
	mov r3, #0x10
	strb r3, [r8]
	b _03007528
_03007508:
	ldr r3, [r8, #0x20]
	ldr r3, [r3, #0x14]
	sub r0, r0, r3
	bx lr
_03007518:
	mov r1, r0
	ldr r0, [sp, #0x20]
	str r1, [r0, #0x28]
	str r6, [r0, #0x2c]
_03007528:
	ldr lr, [sp, #0x1c]
	bx lr

	.global audio_voice_pitch
	.type audio_voice_pitch, %function
audio_voice_pitch: @ 03007530
	ldr r4, [r0, #0x20]
	ldr r3, [r4, #0x34]
	ldr r7, _03007714
	smull r1, r2, r7, r3
	push {r1, r2}
	ldrsb r8, [r0, #6]
	cmp r8, #0
	bmi _03007554
	b _03007568
_03007554:
	mov r1, #0
	mov r2, #0
	push {r1, r2}
	push {r1, r2}
	b _03007634
_03007568:
	mov r7, #4
	ldr r6, _03007718
	mla r2, r8, r7, r6
	ldr r2, [r2]
	ldr r3, [r2, #0x38]
	mov r7, #0x80000
	mul r3, r7, r3
	ldrsb r7, [r0, #6]
	ldr r8, _0300771C
	mov r1, #4
	mla r8, r7, r1, r8
	ldr r7, [r8]
	sub r7, r7, #0x2000
	smull r1, r2, r7, r3
	push {r1, r2}
	ldrsb r8, [r0, #6]
	mov r7, #4
	ldr r6, _03007718
	mla r2, r8, r7, r6
	ldr r2, [r2]
	ldr r2, [r2, #0x40]
	ldrsb r8, [r0, #6]
	mov r7, #8
	ldr sb, _03007720
	mla r8, r7, r8, sb
	mov r1, #0
	mov r2, #0
	ldr sb, [r8]
	cmp sb, #0
	beq _03007630
	ldr r7, [r8, #4]
	lsr r1, r7, #0x10
	sub r7, r7, r1, lsl #16
	ldr r6, _03007724
	add r6, r6, r1, lsl #2
	ldm r6, {r1, r2}
	sub r2, r2, r1
	smull r6, r7, r2, r7
	lsl r7, r7, #0x10
	add r7, r7, r6, lsr #16
	add r1, r1, r7
	add sb, sb, #1
	mul sb, r1, sb
	ldrsb r8, [r0, #6]
	mov r7, #4
	ldr r6, _03007718
	mla r2, r8, r7, r6
	ldr r2, [r2]
	ldr r2, [r2, #0x40]
	smull r1, r2, sb, r2
_03007630:
	push {r1, r2}
_03007634:
	pop {r1, r2, r3, r7, r8, sb}
	adds r1, r1, r3
	adc r2, r2, r7
	adds r1, r1, r8
	adc r2, r2, sb
	ldr r3, [r4, #0xc]
	ldrb sb, [r0, #5]
	sub r3, sb, r3
	add r3, r3, r2
	ldr r6, _03007728
	push {r1, r2}
	add r1, r6, r3, lsl #2
	ldr r2, _0300772C
	cmp r1, r2
	bge _03007690
	push {r0, r1, lr}
	ldr r0, _03007730
	add lr, pc, #4
	ldr r1, _03007734
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x3F, 0x30, 0xE0, 0xE3, 0x09, 0x00, 0x00, 0xEA
_03007690:
	ldr r2, _03007738
	cmp r1, r2
	blt _030076B8
	push {r0, r1, lr}
	ldr r0, _0300773C
	add lr, pc, #4
	ldr r1, _03007734
	bx r1

	.global audio_calc_pitch
	.type audio_calc_pitch, %function
audio_calc_pitch: @ 030076B0
	pop {r0, r1, lr}
	mov r3, #0x3e
_030076B8:
	pop {r1, r2}
	add r2, r6, r3, lsl #2
	ldm r2, {r3, r7}
	sub r2, r7, r3
	umull sb, sl, r1, r2
	add r7, r3, sl
	ldr r1, _03007740
	ldr r1, [r1]
	ldr r2, [r4, #8]
	umull r8, sb, r1, r2
	lsr r8, r8, #0xe
	add r8, r8, sb, lsl #18
	umull sl, r4, r7, r8
	lsr sl, sl, #0x18
	orr r7, sl, r4, lsl #8
	bx lr
_030076F8:
	.4byte gAudioSfxVolume
_030076FC:
	.4byte gAudioMusicVolume
_03007700:
	.4byte gAudioChannelVolume
_03007704:
	.4byte gAudioFrameSamples
_03007708:
	.4byte 0x007FFFFF
_0300770C:
	.4byte gAudioMixLimit
_03007710:
	.4byte gAudioSfxVoices
_03007714:
	.4byte 0x028F5C29
_03007718:
	.4byte gAudioChannelInstrument
_0300771C:
	.4byte gAudioPitchBend
_03007720:
	.4byte gAudioChannels
_03007724:
	.4byte gAudioVibratoTable
_03007728:
	.4byte gUnk_0802F5A4
_0300772C:
	.4byte gUnk_0802F4A4
_03007730:
	.4byte gUnk_0802FB4B
_03007734:
	.4byte audio_error
_03007738:
	.4byte gUnk_0802F6A0
_0300773C:
	.4byte gUnk_0802FB71
_03007740:
	.4byte 0x0202F004
