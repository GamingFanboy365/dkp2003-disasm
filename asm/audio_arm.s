@ asm/audio_arm.s: ROM 0x02D880-0x02EA0C (rom, VMA 0x0802D880)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.incbin "baserom.gba", 0x2D880, 0x158
	.arm

	.global sub_0802D9D8
	.type sub_0802D9D8, %function
sub_0802D9D8: @ 0802D9D8
	stmdb sp!, {lr}
	ldr fp, _0802E230
	ldr fp, [fp]
	ldr sl, _0802E234
	add sl, sl, fp
	b _0802DA04

	.global sub_0802D9F0
	.type sub_0802D9F0, %function
sub_0802D9F0: @ 0802D9F0
	stmdb sp!, {lr}
	ldr fp, _0802E23C
	ldr fp, [fp]
	ldr sl, _0802E240
	add sl, sl, fp
_0802DA04:
	ldrb r2, [sl, -fp]
	cmp r2, #0x11
	bleq sub_0802DA28
	cmp r2, #0x12
	bleq sub_0802DA28
	subs fp, fp, #0x30
	bgt _0802DA04
	ldm sp!, {lr}
	bx lr

	.global sub_0802DA28
	.type sub_0802DA28, %function
sub_0802DA28: @ 0802DA28
	sub r0, sl, fp
	ldr r7, [r0, #8]
	movs r7, r7
	bne _0802DA44
	push {sl, fp, lr}
	bl sub_0802E8CC
	pop {sl, fp, lr}
_0802DA44:
	ldr r1, _0802E254
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
	ldr r4, _0802E258
	and r1, r2, r4
	lsr r2, r2, #0x17
	orr r2, r2, r3, lsl #9
	ldr r3, [r0, #0x20]
	ldr r3, [r3, #0x18]
	cmp r2, r3
	blt _0802DB10
	ldrb r4, [r0, #1]
	cmp r4, #1
	beq _0802DAE4
	cmp r4, #2
	beq _0802DAC0
	cmp r4, #3
	beq _0802DAD8
	cmp r4, #4
	beq _0802DAC0
	.4byte 0xE7FFFFFF @ debug trap
_0802DAC0:
	ldr r4, [r0, #0x20]
	ldr r4, [r4, #0x14]
_0802DAC8:
	sub r2, r2, r4
	cmp r2, r3
	bge _0802DAC8
	b _0802DB10
_0802DAD8:
	mov r3, #0x10
	strb r3, [r0]
	b _0802DB10
_0802DAE4:
	ldr r3, [r0, #0x20]
	lsr r3, r3, #0x18
	cmp r3, #2
	bne _0802DB04
	ldr r3, _0802E234
	cmp r0, r3
	blt _0802DB04
	b _0802DAD8
_0802DB04:
	mov r3, #0x10
	strb r3, [r8]
	b _0802DB10
_0802DB10:
	ldr r3, [r0, #0x28]
	cmp r3, #0
	beq _0802DB44
	cmp r2, r3
	beq _0802DB28
	.4byte 0xE7FFFFFF @ debug trap
_0802DB28:
	ldr r3, [r0, #0x2c]
	cmp r1, r3
	beq _0802DB38
	.4byte 0xE7FFFFFF @ debug trap
_0802DB38:
	mov r3, #0
	str r3, [r0, #0x28]
	str r3, [r0, #0x2c]
_0802DB44:
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov pc, lr

	.global sub_0802DB50
	.type sub_0802DB50, %function
sub_0802DB50: @ 0802DB50
	stmdb sp!, {lr}
	ldr fp, _0802E230
	ldr fp, [fp]
	ldr sl, _0802E234
	add sl, sl, fp
	b _0802DB7C

	.global sub_0802DB68
	.type sub_0802DB68, %function
sub_0802DB68: @ 0802DB68
	stmdb sp!, {lr}
	ldr fp, _0802E23C
	ldr fp, [fp]
	ldr sl, _0802E240
	add sl, sl, fp
_0802DB7C:
	ldrb r2, [sl, -fp]
	cmp r2, #0x11
	.4byte 0x0B000005 @ bleq #0x802dba0
	cmp r2, #0x12
	.4byte 0x0B000003 @ bleq #0x802dba0
	subs fp, fp, #0x30
	bgt _0802DB7C
	ldm sp!, {lr}
	bx lr
	.byte 0x0B, 0xC0, 0x4A, 0xE0, 0x04, 0x10, 0xDC, 0xE5, 0x07, 0x00, 0x51, 0xE3, 0x06, 0x00, 0x00, 0xBA

	.global sub_0802DBB0
	.type sub_0802DBB0, %function
sub_0802DBB0: @ 0802DBB0
	push {r0, r1, lr}
	ldr r0, _0802E25C
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.incbin "baserom.gba", 0x2DBC4, 0x1F8

	.global sub_0802DDBC
	.type sub_0802DDBC, %function
sub_0802DDBC: @ 0802DDBC
	stmdb sp!, {lr}
	bic r0, r1, #0xff000000
	ldr r2, _0802E268
	str r0, [r2]
	ldr r0, _0802E26C
	mov r1, #0xe10
	bl sub_0802E43C
	lsl r4, r0, #8
	lsl r0, r1, #0x10
	mov r1, #0xe10
	bl sub_0802E43C
	orr r0, r4, r0, lsr #8
	ldr r2, _0802E270
	str r0, [r2]
	ldm sp!, {lr}
	bx lr
	.incbin "baserom.gba", 0x2DDFC, 0x100

	.global sub_0802DEFC
	.type sub_0802DEFC, %function
sub_0802DEFC: @ 0802DEFC
	push {r0, r1, lr}
	ldr r0, _0802E27C
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.incbin "baserom.gba", 0x2DF10, 0x4C

	.global sub_0802DF5C
	.type sub_0802DF5C, %function
sub_0802DF5C: @ 0802DF5C
	push {r0, r1, lr}
	ldr r0, _0802E280
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.incbin "baserom.gba", 0x2DF70, 0xB0

	.global sub_0802E020
	.type sub_0802E020, %function
sub_0802E020: @ 0802E020
	push {r0, r1, lr}
	ldr r0, _0802E294
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.incbin "baserom.gba", 0x2E034, 0x4C

	.global sub_0802E080
	.type sub_0802E080, %function
sub_0802E080: @ 0802E080
	push {r0, r1, lr}
	ldr r0, _0802E298
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x17, 0x00, 0x00, 0xEA, 0x20, 0x00, 0x92, 0xE5
	.byte 0x01, 0x21, 0x90, 0xE7, 0x0C, 0x90, 0x92, 0xE5, 0x0E, 0x00, 0x00, 0xEA, 0x1C, 0x00, 0x92, 0xE5
	.byte 0x04, 0x10, 0xD0, 0xE7, 0xFF, 0x00, 0x51, 0xE3, 0x07, 0x00, 0x00, 0x1A

	.global sub_0802E0C0
	.type sub_0802E0C0, %function
sub_0802E0C0: @ 0802E0C0
	push {r0, r1, lr}
	ldr r0, _0802E298
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.incbin "baserom.gba", 0x2E0D4, 0x90

	.global sub_0802E164
	.type sub_0802E164, %function
sub_0802E164: @ 0802E164
	push {r0, r1, lr}
	ldr r0, _0802E2A0
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.incbin "baserom.gba", 0x2E178, 0xB8
_0802E230:
	.4byte 0x080537C8
_0802E234:
	.4byte 0x0300632C
	.byte 0x18, 0xF0, 0x02, 0x02
_0802E23C:
	.4byte 0x080537C0
_0802E240:
	.4byte 0x02003020
	.byte 0xB1, 0xF2, 0x02, 0x08, 0x74, 0x5A, 0x00, 0x03, 0xB0, 0x37, 0x05, 0x08, 0xB8, 0x37, 0x05, 0x08
_0802E254:
	.4byte 0x0202F008
_0802E258:
	.4byte 0x007FFFFF
_0802E25C:
	.4byte 0x0802FB98
_0802E260:
	.4byte sub_0802F27C
	.byte 0xA4, 0xF6, 0x02, 0x08
_0802E268:
	.4byte 0x03005B08
_0802E26C:
	.4byte 0x03938700
_0802E270:
	.4byte 0x03005B00
	.byte 0x04, 0x5B, 0x00, 0x03, 0x80, 0x5A, 0x00, 0x03
_0802E27C:
	.4byte 0x0802FBE9
_0802E280:
	.4byte 0x0802FC0F
	.byte 0xC4, 0x37, 0x05, 0x08, 0x1C, 0x63, 0x00, 0x03, 0x81, 0xF3, 0x02, 0x08, 0x14, 0x64, 0x00, 0x03
_0802E294:
	.4byte 0x08030506
_0802E298:
	.4byte 0x0803057E
	.byte 0x58, 0x64, 0x00, 0x03
_0802E2A0:
	.4byte 0x0802FBBF
	.incbin "baserom.gba", 0x2E2A4, 0x198

	.global sub_0802E43C
	.type sub_0802E43C, %function
sub_0802E43C: @ 0802E43C
	stmdb sp!, {r1}
	lsl r1, r1, #0x10
	cmp r1, r0
	bgt _0802E450
	.4byte 0xE7FFFFFF @ debug trap
_0802E450:
	ldm sp!, {r1}
	rsb r1, r1, #0
	lsls r1, r1, #0xf
	bne _0802E464
	.4byte 0xE7FFFFFF @ debug trap
_0802E464:
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
	.incbin "baserom.gba", 0x2E4F4, 0x3D8

	.global sub_0802E8CC
	.type sub_0802E8CC, %function
sub_0802E8CC: @ 0802E8CC
	ldr r4, [r0, #0x20]
	ldr r3, [r4, #0x34]
	.4byte 0xE59F71D4 @ ldr r7, [pc, #0x1d4]
	smull r1, r2, r7, r3
	push {r1, r2}
	ldrsb r8, [r0, #6]
	cmp r8, #0
	bmi _0802E8F0
	b _0802E904
_0802E8F0:
	mov r1, #0
	mov r2, #0
	push {r1, r2}
	push {r1, r2}
	b _0802E9D0
_0802E904:
	mov r7, #4
	.4byte 0xE59F61A4 @ ldr r6, [pc, #0x1a4]
	mla r2, r8, r7, r6
	ldr r2, [r2]
	ldr r3, [r2, #0x38]
	mov r7, #0x80000
	mul r3, r7, r3
	ldrsb r7, [r0, #6]
	.4byte 0xE59F818C @ ldr r8, [pc, #0x18c]
	mov r1, #4
	mla r8, r7, r1, r8
	ldr r7, [r8]
	sub r7, r7, #0x2000
	smull r1, r2, r7, r3
	push {r1, r2}
	ldrsb r8, [r0, #6]
	mov r7, #4
	.4byte 0xE59F6164 @ ldr r6, [pc, #0x164]
	mla r2, r8, r7, r6
	ldr r2, [r2]
	ldr r2, [r2, #0x40]
	ldrsb r8, [r0, #6]
	mov r7, #8
	.4byte 0xE59F9154 @ ldr sb, [pc, #0x154]
	mla r8, r7, r8, sb
	mov r1, #0
	mov r2, #0
	ldr sb, [r8]
	cmp sb, #0
	beq _0802E9CC
	ldr r7, [r8, #4]
	lsr r1, r7, #0x10
	sub r7, r7, r1, lsl #16
	.4byte 0xE59F6130 @ ldr r6, [pc, #0x130]
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
	.4byte 0xE59F60F4 @ ldr r6, [pc, #0xf4]
	mla r2, r8, r7, r6
	ldr r2, [r2]
	ldr r2, [r2, #0x40]
	smull r1, r2, sb, r2
_0802E9CC:
	push {r1, r2}
_0802E9D0:
	pop {r1, r2, r3, r7, r8, sb}
	adds r1, r1, r3
	adc r2, r2, r7
	adds r1, r1, r8
	adc r2, r2, sb
	ldr r3, [r4, #0xc]
	ldrb sb, [r0, #5]
	sub r3, sb, r3
	add r3, r3, r2
	.4byte 0xE59F60C8 @ ldr r6, [pc, #0xc8]
	push {r1, r2}
	add r1, r6, r3, lsl #2
	.4byte 0xE59F20C0 @ ldr r2, [pc, #0xc0]
	cmp r1, r2
	bge _0802EA2C
