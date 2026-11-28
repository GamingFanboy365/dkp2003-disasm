@ asm/audio_arm.s: ROM 0x02D880-0x02EA0C (rom, VMA 0x0802D880)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

_0802D880:
	.arm
	sub sp, sp, #0x24
	str lr, [sp, #8]
	ldr r5, _0802E228
	str r5, [sp, #4]
	ldr r1, _0802E22C
	ldr r1, [r1]
	str r1, [sp, #0x10]
	ldr r2, _0802E230
	ldr r2, [r2]
	ldr r0, _0802E234
	add r0, r0, r2
_0802D8AC:
	ldrb r5, [r0, -r2]
	cmp r5, #0x11
	bleq sub_0802D9A4
	subs r2, r2, #0x30
	bgt _0802D8AC
	ldr r2, _0802E230
	ldr r2, [r2]
_0802D8C8:
	ldrb r5, [r0, -r2]
	cmp r5, #0x12
	bleq sub_0802D9A4
	subs r2, r2, #0x30
	bgt _0802D8C8
	ldr r0, _0802E238
	ldr r1, [r0]
	cmp r1, #1
	beq _0802D92C
	ldr r2, _0802E23C
	ldr r2, [r2]
	ldr r0, _0802E240
	add r0, r0, r2
_0802D8FC:
	ldrb r5, [r0, -r2]
	cmp r5, #0x11
	bleq sub_0802D9A4
	subs r2, r2, #0x30
	bgt _0802D8FC
	ldr r2, _0802E23C
	ldr r2, [r2]
_0802D918:
	ldrb r5, [r0, -r2]
	cmp r5, #0x12
	bleq sub_0802D9A4
	subs r2, r2, #0x30
	bgt _0802D918
_0802D92C:
	ldr r0, [sp, #0x10]
	ldr r1, _0802E22C
	ldr r1, [r1]
	cmp r0, r1
	bne _0802D94C
	ldr r0, _0802E244
	add lr, pc, #0
	bx r0
_0802D94C:
	ldr r0, _0802E248
	ldr r2, [r0]
	ldr r1, _0802E24C
	cmp r2, #0
	bne _0802D964
	ldr r1, _0802E250
_0802D964:
	ldr r1, [r1]
	ldr r0, _0802E228
	ldr r2, _0802E254
	ldr r2, [r2]
_0802D974:
	ldrsh r3, [r0], #2
	cmp r3, #0x7f
	movgt r3, #0x7f
	bgt _0802D98C
	cmn r3, #0x80
	mvnlt r3, #0x7f
_0802D98C:
	strb r3, [r1], #1
	subs r2, r2, #1
	bne _0802D974
	ldr lr, [sp, #8]
	add sp, sp, #0x24
	bx lr

	.global sub_0802D9A4
	.type sub_0802D9A4, %function
sub_0802D9A4: @ 0802D9A4
	str lr, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	sub r0, r0, r2
	ldr r5, [sp, #4]
	bl sub_0802E6E0
	ldr r1, [sp, #0x10]
	subs r1, r1, #1
	str r1, [sp, #0x10]
	beq _0802D94C
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr pc, [sp, #0xc]

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
	bleq _0802DBA0
	cmp r2, #0x12
	bleq _0802DBA0
_0802DB90:
	subs fp, fp, #0x30
	bgt _0802DB7C
	ldm sp!, {lr}
	bx lr
_0802DBA0:
	sub ip, sl, fp
	ldrb r1, [ip, #4]
	cmp r1, #7
	blt _0802DBCC

	.global sub_0802DBB0
	.type sub_0802DBB0, %function
sub_0802DBB0: @ 0802DBB0
	push {r0, r1, lr}
	ldr r0, _0802E25C
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0xFF, 0xFF, 0xFF, 0xE7
_0802DBCC:
	add r2, pc, #4
	ldr r0, [r2, r1, lsl #2]
	add pc, r0, r2
	.byte 0x1C, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x04, 0x01, 0x00, 0x00
	.byte 0x44, 0x01, 0x00, 0x00, 0x54, 0x01, 0x00, 0x00, 0x9C, 0x01, 0x00, 0x00
_0802DBF4:
	ldr r3, [ip, #0x20]
	ldr r1, [r3, #0x24]
	rsb r2, r1, #0x63
	lsl r0, r2, #5
	mov r1, #0x63
	bl sub_0802E43C
	movs r0, r0
	beq _0802DC5C
	mov r1, r0
	mov r0, #0x8000
	add r1, r1, #1
	bl sub_0802E43C
	lsl r1, r1, #4
	lsl r0, r0, #4
	str r1, [ip, #0x14]
	str r0, [ip, #0x18]
	mov r0, #1
	strb r0, [ip, #4]
	ldrb r1, [ip]
	cmp r1, #0x12
	beq _0802DD2C
	ldr r1, [ip, #0x18]
	ldr r2, [ip, #0x14]
	add r1, r1, r2
	cmp r1, #0x80000
	blt _0802DC68
_0802DC5C:
	mov r1, #2
	strb r1, [ip, #4]
	mov r1, #0x80000
_0802DC68:
	str r1, [ip, #0x14]
	sub pc, pc, #0xe4
_0802DC70:
	ldr r3, [ip, #0x20]
	ldr r0, [r3, #0x2c]
	lsl r0, r0, #7
	mov r1, #0x63
	bl sub_0802E43C
	lsl r4, r0, #8
	lsl r0, r1, #8
	mov r1, #0x63
	bl sub_0802E43C
	orr r0, r4, r0
	lsl r1, r0, #4
	str r1, [ip, #0x1c]
	rsb r0, r0, #0x8000
	ldr r1, [r3, #0x28]
	ldr r2, _0802E264
	ldrb r1, [r2, r1]
	movs r1, r1
	beq _0802DD00
	add r1, r1, #1
	bl sub_0802E43C
	lsl r0, r0, #4
	str r0, [ip, #0x18]
	ldr r0, [ip, #0x14]
	sub r0, r0, r1, lsl #4
	str r0, [ip, #0x14]
	mov r1, #3
	strb r1, [ip, #4]
	ldrb r1, [ip]
	cmp r1, #0x12
	beq _0802DD2C
	ldr r1, [ip, #0x18]
	ldr r2, [ip, #0x14]
	ldr r3, [ip, #0x1c]
	sub r1, r2, r1
	cmp r1, r3
	bgt _0802DD0C
_0802DD00:
	mov r1, #4
	strb r1, [ip, #4]
	ldr r1, [ip, #0x1c]
_0802DD0C:
	cmp r1, #0x1000
	blt _0802DD84
	str r1, [ip, #0x14]
	sub pc, pc, #0x190
_0802DD1C:
	ldrb r1, [ip]
	cmp r1, #0x12
	beq _0802DD2C
	sub pc, pc, #0x1a0
_0802DD2C:
	ldr r3, [ip, #0x20]
	ldr r0, [ip, #0x14]
	ldr r1, [r3, #0x30]
	ldr r2, _0802E264
	ldrb r1, [r2, r1]
	movs r1, r1
	beq _0802DD84
	lsr r0, r0, #4
	add r1, r1, #1
	bl sub_0802E43C
	lsls r0, r0, #4
	beq _0802DD84
	str r0, [ip, #0x18]
	ldr r0, [ip, #0x14]
	sub r0, r0, r1, lsl #4
	str r0, [ip, #0x14]
	mov r1, #6
	strb r1, [ip, #4]
	ldr r1, [ip, #0x18]
	ldr r2, [ip, #0x14]
	subs r1, r2, r1
	bgt _0802DD8C
_0802DD84:
	mov r1, #0x10
	strb r1, [ip]
_0802DD8C:
	str r1, [ip, #0x14]
	sub pc, pc, #0x208
_0802DD94:
	bic r2, fp, #3
	ldm r2, {r1, r3}
	and r2, fp, #3
	lsls r2, r2, #3
	lsrne r1, r1, r2
	rsbne r2, r2, #0x20
	orrne r1, r1, r3, lsl r2
	add fp, fp, #3
	bl sub_0802DDBC
	add pc, pc, #0x398

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
_0802DDFC:
	ldr r5, _0802E274
	ldr r5, [r5]
	ldrb r1, [fp], #1
	ldr r0, _0802E268
	ldr r2, [r0]
	mul r1, r2, r1
	mov r0, #0
	mov r2, r5
	bl sub_0802E4F4
	lsl r4, r1, #8
	lsl r0, r0, #0x10
	mov r1, r5
	bl sub_0802E43C
	orr r1, r4, r0, lsr #8
	mov r2, #0
	ldr r5, [sp]
	ldr r0, _0802E278
	add r0, r0, r5, lsl #3
	ldm r0, {r3, r4}
	adds r1, r3, r1
	adcs r2, r4, r2
	stm r0, {r1, r2}
	add pc, pc, #0x330
_0802DE58:
	ldr r5, _0802E274
	ldr r5, [r5]
	ldrb r0, [fp], #1
	ldrb r1, [fp], #1
	orr r1, r0, r1, lsl #8
	ldr r0, _0802E268
	ldr r2, [r0]
	umull r1, r0, r2, r1
	mov r2, r5
	bl sub_0802E4F4
	lsr r6, r1, #0x18
	lsl r4, r1, #8
	lsl r0, r0, #0x10
	mov r1, r5
	bl sub_0802E43C
	orr r1, r4, r0, lsr #8
	mov r2, r6
	ldr r5, [sp]
	ldr r0, _0802E278
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
	.byte 0x03, 0x40, 0xBD, 0xE8, 0xFF, 0xFF, 0xFF, 0xE7
_0802DF78:
	ldrb r1, [fp], #1
	ldr r4, _0802E284
	ldr r4, [r4]
	ldr r3, _0802E240
	add r3, r3, r4
	mla r5, r1, r4, r3
	ldr r2, _0802E284
	ldr r2, [r2]
	ldr r0, _0802E288
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0802DFEC
_0802DFA8:
	ldrb r0, [r5, -r2]
	cmp r0, #0x10
	beq _0802DFEC
	subs r2, r2, #0x30
	bgt _0802DFA8
	ldr r2, _0802E284
	ldr r2, [r2]
_0802DFC4:
	ldrb r0, [r5, -r2]
	cmp r0, #0x12
	beq _0802DFEC
	subs r2, r2, #0x30
	bgt _0802DFC4
	ldr r0, _0802E28C
	bx r0
	.global gUnk_0802DFE0
gUnk_0802DFE0:
	.byte 0x01, 0x40, 0xDB, 0xE4, 0x01, 0x00, 0xDB, 0xE4, 0x44, 0x00, 0x00, 0xEA
_0802DFEC:
	sub r5, r5, r2
	ldrb r4, [fp], #1
	mov sb, r4
	mov r7, #4
	ldr r6, _0802E290
	mla r2, r1, r7, r6
	ldr r2, [r2]
	stmdb sp!, {r2}
	and r2, r2, #0xf000000
	cmp r2, #0x8000000
	beq _0802E044
	cmp r2, #0x2000000
	beq _0802E044

	.global sub_0802E020
	.type sub_0802E020, %function
sub_0802E020: @ 0802E020
	push {r0, r1, lr}
	ldr r0, _0802E294
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x04, 0x00, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x2E, 0x00, 0x00, 0xEA
_0802E044:
	ldm sp!, {r2}
	ldr r7, [r2]
	cmp r7, #0x20
	beq _0802E0EC
	cmp r7, #0x21
	beq _0802E0EC
	cmp r7, #0x22
	beq _0802E070
	cmp r7, #0x23
	beq _0802E0B0
	.4byte 0xE7FFFFFF @ debug trap
_0802E070:
	ldr r0, [r2, #0x1c]
	ldrb r1, [r0, r4]
	cmp r1, #0xff
	bne _0802E0A0

	.global sub_0802E080
	.type sub_0802E080, %function
sub_0802E080: @ 0802E080
	push {r0, r1, lr}
	ldr r0, _0802E298
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x17, 0x00, 0x00, 0xEA
_0802E0A0:
	ldr r0, [r2, #0x20]
	ldr r2, [r0, r1, lsl #2]
	ldr sb, [r2, #0xc]
	b _0802E0EC
_0802E0B0:
	ldr r0, [r2, #0x1c]
	ldrb r1, [r0, r4]
	cmp r1, #0xff
	bne _0802E0E0

	.global sub_0802E0C0
	.type sub_0802E0C0, %function
sub_0802E0C0: @ 0802E0C0
	push {r0, r1, lr}
	ldr r0, _0802E298
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0x01, 0x30, 0xDB, 0xE4, 0x07, 0x00, 0x00, 0xEA
_0802E0E0:
	ldr r0, [r2, #0x20]
	ldr r2, [r0, r1, lsl #2]
	b _0802E0EC
_0802E0EC:
	ldr r7, [r2, #4]
	ldrb r3, [fp], #1
	add r3, r3, #1
	mov r1, #0x10000
	bl sub_0802D834
	add pc, pc, #0x50
_0802E104:
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov r0, #0
	str r0, [sp, #8]
	mvn r0, #0
	str r0, [sp]
	b _0802E1B8
_0802E120:
	str r0, [sp]
	ldr r4, _0802E278
	add r4, r4, r0, lsl #3
	ldr r1, _0802E270
	ldm r4, {r2, r3}
	ldr r5, [r1]
	subs r2, r2, r5
	sbcs r3, r3, #0
	stm r4, {r2, r3}
	bpl _0802E1B8
	ldr fp, _0802E29C
	ldr r0, [sp]
	ldr fp, [fp, r0, lsl #2]
_0802E154:
	add ip, pc, #0x98
_0802E158:
	ldrb r0, [fp], #1
	cmp r0, #0xd
	blt _0802E180

	.global sub_0802E164
	.type sub_0802E164, %function
sub_0802E164: @ 0802E164
	push {r0, r1, lr}
	ldr r0, _0802E2A0
	add lr, pc, #4
	ldr r1, _0802E260
	bx r1
	.byte 0x03, 0x40, 0xBD, 0xE8, 0xFF, 0xFF, 0xFF, 0xE7
_0802E180:
	ldr r0, [ip, r0, lsl #2]
	add pc, r0, ip
	.byte 0xFF, 0xFF, 0xFF, 0xE7
_0802E18C:
	ldr r0, [sp]
	ldr r1, _0802E2A4
	ldr r1, [r1, r0, lsl #3]
	cmp r1, #0
	bmi _0802E1A4
	b _0802E1A8
_0802E1A4:
	b _0802E154
_0802E1A8:
	mov r0, r0
_0802E1AC:
	ldr r0, [sp]
	ldr r2, _0802E29C
	str fp, [r2, r0, lsl #2]
_0802E1B8:
	ldr r1, _0802E2A8
	ldr r1, [r1]
	ldr r0, [sp]
	adds r0, r0, #1
	cmp r0, r1
	bne _0802E120
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _0802E1E8
	ldr r0, _0802E2AC
	mvn r1, #0
	str r1, [r0]
_0802E1E8:
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	.byte 0xA0, 0xFB, 0xFF, 0xFF, 0x08, 0xFC, 0xFF, 0xFF, 0x64, 0xFC, 0xFF, 0xFF, 0xC8, 0xFC, 0xFF, 0xFF
	.byte 0x68, 0xFD, 0xFF, 0xFF, 0x84, 0xFD, 0xFF, 0xFF, 0xBC, 0x00, 0x00, 0x00, 0x18, 0x01, 0x00, 0x00
	.byte 0xBC, 0x01, 0x00, 0x00, 0x08, 0x02, 0x00, 0x00, 0x10, 0x02, 0x00, 0x00, 0x2C, 0x02, 0x00, 0x00
	.byte 0x40, 0x02, 0x00, 0x00
_0802E228:
	.4byte 0x03005F8C
_0802E22C:
	.4byte 0x0202EFF8
_0802E230:
	.4byte gUnk_080537C8
_0802E234:
	.4byte 0x0300632C
_0802E238:
	.4byte 0x0202F018
_0802E23C:
	.4byte gUnk_080537C0
_0802E240:
	.4byte 0x02003020
_0802E244:
	.4byte sub_0802F2B0
_0802E248:
	.4byte 0x03005A74
_0802E24C:
	.4byte gUnk_080537B0
_0802E250:
	.4byte gUnk_080537B8
_0802E254:
	.4byte 0x0202F008
_0802E258:
	.4byte 0x007FFFFF
_0802E25C:
	.4byte gUnk_0802FB98
_0802E260:
	.4byte sub_0802F27C
_0802E264:
	.4byte gUnk_0802F6A4
_0802E268:
	.4byte 0x03005B08
_0802E26C:
	.4byte 0x03938700
_0802E270:
	.4byte 0x03005B00
_0802E274:
	.4byte 0x03005B04
_0802E278:
	.4byte 0x03005A80
_0802E27C:
	.4byte gUnk_0802FBE9
_0802E280:
	.4byte gUnk_0802FC0F
_0802E284:
	.4byte gUnk_080537C4
_0802E288:
	.4byte 0x0300631C
_0802E28C:
	.4byte sub_0802F380
_0802E290:
	.4byte 0x03006414
_0802E294:
	.4byte gUnk_08030506
_0802E298:
	.4byte gUnk_0803057E
_0802E29C:
	.4byte 0x03006458
_0802E2A0:
	.4byte gUnk_0802FBBF
_0802E2A4:
	.4byte 0x03005A84
_0802E2A8:
	.4byte 0x0300640C
_0802E2AC:
	.4byte 0x03005A78
_0802E2B0:
	ldrb r1, [fp], #1
	ldrb r6, [fp], #1
	ldrb r7, [fp], #1
	ldr r4, _0802E6B8
	ldr r4, [r4]
	ldr r3, _0802E6BC
	add r3, r3, r4
	mla r5, r1, r4, r3
	ldr r2, _0802E6B8
	ldr r2, [r2]
_0802E2D8:
	ldrb r0, [r5, -r2]
	cmp r0, #0x11
	bleq sub_0802E2F0
	subs r2, r2, #0x30
	bgt _0802E2D8
	b _0802E308

	.global sub_0802E2F0
	.type sub_0802E2F0, %function
sub_0802E2F0: @ 0802E2F0
	sub r0, r5, r2
	ldrb r1, [r0, #2]
	cmp r1, r6
	bxne lr
	mov r1, #0x12
	strb r1, [r0]
_0802E308:
	sub pc, pc, #0x1b8
_0802E30C:
	ldrb r1, [fp], #1
	ldrb r2, [fp], #1
	ldrb r3, [fp], #1
	cmp r2, #1
	beq _0802E34C
	cmp r2, #7
	beq _0802E360
	cmp r2, #0x66
	beq _0802E36C
	cmp r2, #0x67
	beq _0802E37C
	cmp r2, #0x7e
	beq _0802E38C
	cmp r2, #0x7f
	beq _0802E39C
	b _0802E3AC
_0802E34C:
	ldr r5, _0802E6C0
	mov r2, #8
	mla r5, r1, r2, r5
	str r3, [r5]
	b _0802E3AC
_0802E360:
	ldr r5, _0802E6C4
	strb r3, [r5, r1]
	b _0802E3AC
_0802E36C:
	ldr r4, [sp]
	ldr r5, _0802E6C8
	str fp, [r5, r4, lsl #2]
	b _0802E3AC
_0802E37C:
	ldr r4, [sp]
	ldr r5, _0802E6C8
	ldr fp, [r5, r4, lsl #2]
	b _0802E3AC
_0802E38C:
	ldr r5, _0802E6CC
	mov r3, #1
	strb r3, [r5, r1]
	b _0802E3AC
_0802E39C:
	ldr r5, _0802E6CC
	mov r3, #0
	strb r3, [r5, r1]
	b _0802E3AC
_0802E3AC:
	sub pc, pc, #0x25c
_0802E3B0:
	ldrb r1, [fp], #1
	ldrb r3, [fp], #1
	cmp r1, #0x10
	blt _0802E3C4
	.4byte 0xE7FFFFFF @ debug trap
_0802E3C4:
	ldr r2, _0802E6D0
	ldr r2, [r2]
	ldrb r2, [r2, r3]
	cmp r2, #0xff
	bne _0802E3DC
	.4byte 0xE7FFFFFF @ debug trap
_0802E3DC:
	ldr r3, _0802E6D4
	ldr r3, [r3]
	ldr r4, [r3, r2, lsl #2]
	ldr r8, _0802E6D8
	mov r2, #4
	mla r8, r2, r1, r8
	str r4, [r8]
	sub pc, pc, #0x2a8
	.byte 0x02, 0xB0, 0x8B, 0xE2, 0x2B, 0xFE, 0x4F, 0xE2
_0802E404:
	ldrb r3, [fp], #1
	ldrb r0, [fp], #1
	ldrb r1, [fp], #1
	orr r1, r0, r1, lsl #8
	ldr r2, _0802E6DC
	str r1, [r2, r3, lsl #2]
	sub pc, pc, #0x2cc
_0802E420:
	sub fp, fp, #1
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	sub pc, pc, #0x28c
	.byte 0xFF, 0xFF, 0xFF, 0xE7, 0xBA, 0xFF, 0x4F, 0xE2

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

	.global sub_0802E4F4
	.type sub_0802E4F4, %function
sub_0802E4F4: @ 0802E4F4
	cmp r0, r2
	blt _0802E500
	.4byte 0xE7FFFFFF @ debug trap
_0802E500:
	movs r3, r2
	bne _0802E50C
	.4byte 0xE7FFFFFF @ debug trap
_0802E50C:
	rsbpl r2, r2, #0
	lsr r3, r3, #1
	eors r3, r3, r0, asr #1
	bpl _0802E524
	rsbs r1, r1, #0
	rsc r0, r0, #0
_0802E524:
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
_0802E6B8:
	.4byte gUnk_080537C4
_0802E6BC:
	.4byte 0x02003020
_0802E6C0:
	.4byte 0x0300628C
_0802E6C4:
	.4byte 0x0300630C
_0802E6C8:
	.4byte 0x03007884
_0802E6CC:
	.4byte 0x0300631C
_0802E6D0:
	.4byte 0x03006410
_0802E6D4:
	.4byte 0x03006454
_0802E6D8:
	.4byte 0x03006414
_0802E6DC:
	.4byte 0x0300624C

	.global sub_0802E6E0
	.type sub_0802E6E0, %function
sub_0802E6E0: @ 0802E6E0
	str lr, [sp, #0x1c]
	str r0, [sp, #0x20]
	bl sub_0802E8CC
	str r7, [r0, #8]
	ldrsb r6, [r0, #6]
	cmp r6, #0
	.4byte 0xE59F1394 @ ldr r1, [pc, #0x394]
	bmi _0802E704
	.4byte 0xE59F1390 @ ldr r1, [pc, #0x390]
_0802E704:
	ldr r4, [r1]
	bmi _0802E720
	.4byte 0xE59F3388 @ ldr r3, [pc, #0x388]
	ldrb r3, [r3, r6]
	add r3, r3, #1
	mul r4, r3, r4
	lsr r4, r4, #7
_0802E720:
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
	.4byte 0xE59F9348 @ ldr sb, [pc, #0x348]
	ldr sb, [sb]
	add sb, r5, sb, lsl #1
	ldr r6, [r0, #0x10]
	ldr sl, [r0, #0x20]
	ldr sl, [sl, #0x18]
	ldr r0, [r0, #0xc]
	.4byte 0xE59FB330 @ ldr fp, [pc, #0x330]
	.4byte 0xE59F3330 @ ldr r3, [pc, #0x330]
	ldr r3, [r3]
	ldr r8, [sp, #0x10]
	cmp r3, r8
	bne _0802E7C4
_0802E784:
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
	blge sub_0802E840
	cmp r5, sb
	bne _0802E784
	b _0802E8B4
_0802E7C4:
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
	blge sub_0802E840
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
	blge sub_0802E840
	cmp r5, sb
	bne _0802E7C4
	b _0802E8B4

	.global sub_0802E840
	.type sub_0802E840, %function
sub_0802E840: @ 0802E840
	ldr r8, [sp, #0x20]
	ldrb r3, [r8, #1]
	cmp r3, #1
	beq _0802E86C
	cmp r3, #2
	beq _0802E8A4
	cmp r3, #3
	beq _0802E898
	cmp r3, #4
	beq _0802E8A4
	.4byte 0xE7FFFFFF @ debug trap
_0802E86C:
	ldr r3, [r8, #0x20]
	lsr r3, r3, #0x18
	cmp r3, #2
	bne _0802E88C
	.4byte 0xE59F3228 @ ldr r3, [pc, #0x228]
	cmp r8, r3
	blt _0802E88C
	b _0802E898
_0802E88C:
	mov r3, #0x10
	strb r3, [r8]
	b _0802E8C4
_0802E898:
	mov r3, #0x10
	strb r3, [r8]
	b _0802E8C4
_0802E8A4:
	ldr r3, [r8, #0x20]
	ldr r3, [r3, #0x14]
	sub r0, r0, r3
	bx lr
_0802E8B4:
	mov r1, r0
	ldr r0, [sp, #0x20]
	str r1, [r0, #0x28]
	str r6, [r0, #0x2c]
_0802E8C4:
	ldr lr, [sp, #0x1c]
	bx lr

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
