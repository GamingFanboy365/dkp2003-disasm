@ asm/act_turbo.s: ROM 0x02BD24-0x02BED4 (rom, VMA 0x0802BD24)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_turbo
	.thumb_func
	.type init_turbo, %function
init_turbo: @ 0802BD24
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	sub sp, #4
	cmp r7, #0
	bne _0802BD30
	b _0802BE00
_0802BD30:
	ldr r0, _0802BD60
	adds r4, r7, #0
	strh r0, [r7]
	adds r4, #0xa0
	ldr r3, [r4, #0xc]
	cmp r3, #0
	beq _0802BDF4
	cmp r3, #1
	beq _0802BDEE
	cmp r3, #2
	beq _0802BDE2
_0802BD46:
	adds r2, r7, #0
	adds r2, #0x5a
	ldrh r5, [r2]
	movs r0, #0x18
	muls r0, r5, r0
	ldr r3, _0802BD68
	ldr r5, [r4, #8]
	ldr r6, _0802BD64
	adds r1, r0, r3
	ldr r0, _0802BD6C
	strh r6, [r1, #0xa]
	b _0802BD70
	.byte 0x00, 0x00
_0802BD60:
	.4byte 0x00000001
_0802BD64:
	.4byte 0x0000001E
_0802BD68:
	.4byte 0x02018F34
_0802BD6C:
	.4byte 0x0200434C
_0802BD70:
	lsls r6, r5, #2
	ldr r5, [r0, r6]
	adds r1, r5, #0
	adds r1, #0x56
	movs r2, #0
	ldrsh r6, [r1, r2]
	ldr r4, _0802BE18
	adds r0, r6, #0
	bl _call_via_r4
	adds r2, r0, #0
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r1, _0802BE1C
	adds r0, r6, #0
	bl _call_via_r1
	movs r2, #0x96
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	lsls r1, r2, #2
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r4, #0
	muls r0, r1, r0
	ldr r3, [r5, #0x24]
	asrs r2, r2, #0xc
	asrs r1, r0, #0xc
	subs r0, r3, r2
	str r0, [r7, #0x24]
	ldr r0, [r5, #0x28]
	str r0, [r7, #0x28]
	ldr r2, [r5, #0x2c]
	subs r0, r2, r1
	str r0, [r7, #0x2c]
	bl sub_08000B14
	ldr r2, [r5, #0x3c]
	asrs r3, r0, #9
	adds r1, r2, r3
	str r1, [r7, #0x3c]
	bl sub_08000B14
	ldr r2, [r5, #0x40]
	asrs r3, r0, #9
	adds r1, r2, r3
	str r1, [r7, #0x40]
	bl sub_08000B14
	ldr r2, [r5, #0x44]
	asrs r3, r0, #9
	adds r1, r2, r3
	str r1, [r7, #0x44]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802BDE2:
	adds r0, r7, #0
	movs r1, #0x3b
	movs r2, #0x23
	bl obj_setup_sprite
	b _0802BD46
_0802BDEE:
	adds r0, r7, #0
	movs r1, #0x3a
	b _0802BDF8
_0802BDF4:
	adds r0, r7, #0
	movs r1, #0x39
_0802BDF8:
	movs r2, #0x23
	bl obj_setup_sprite
	b _0802BD46
_0802BE00:
	ldr r0, _0802BE20
	ldr r1, _0802BE24
	str r0, [sp]
	ldr r2, _0802BE28
	ldr r0, _0802BE2C
	movs r3, #0x26
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802BD30
_0802BE18:
	.4byte sub_03000134
_0802BE1C:
	.4byte sub_03000138
_0802BE20:
	.4byte 0x080530F0
_0802BE24:
	.4byte 0x080530FC
_0802BE28:
	.4byte 0x0805310C
_0802BE2C:
	.4byte 0x08053118

	.global act_turbo
	.thumb_func
	.type act_turbo, %function
act_turbo: @ 0802BE30
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802BE9C
_0802BE3A:
	ldr r0, [r4, #0x3c]
	ldr r2, _0802BEB4
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r3, [r4, #0x40]
	asrs r0, r1, #0x10
	adds r1, r3, #0
	muls r1, r2, r1
	ldr r3, [r4, #0x44]
	muls r2, r3, r2
	ldr r3, [r4, #0x24]
	adds r3, r3, r0
	str r3, [r4, #0x24]
	ldr r3, [r4, #0x28]
	asrs r1, r1, #0x10
	str r0, [r4, #0x3c]
	str r1, [r4, #0x40]
	adds r0, r3, r1
	ldr r1, [r4, #0x2c]
	asrs r2, r2, #0x10
	str r0, [r4, #0x28]
	adds r0, r1, r2
	str r2, [r4, #0x44]
	str r0, [r4, #0x2c]
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r3, #0x18
	muls r3, r1, r3
	ldr r0, _0802BEB8
	adds r3, #8
	ldrh r1, [r0, r3]
	ldr r0, _0802BEBC
	ands r0, r1
	lsls r1, r0, #5
	ldr r2, _0802BEC0
	adds r1, #0x18
	ldr r0, [r2, r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802BE94
	adds r0, r4, #0
	bl sub_08001FE8
_0802BE94:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0802BE9C:
	ldr r0, _0802BEC4
	ldr r1, _0802BEC8
	str r0, [sp]
	ldr r2, _0802BECC
	ldr r0, _0802BED0
	movs r3, #0x56
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802BE3A
_0802BEB4:
	.4byte 0x0000DDDD
_0802BEB8:
	.4byte 0x02018F34
_0802BEBC:
	.4byte 0x00007FFF
_0802BEC0:
	.4byte 0x0201AA4C
_0802BEC4:
	.4byte 0x080530F0
_0802BEC8:
	.4byte 0x080530FC
_0802BECC:
	.4byte 0x08053154
_0802BED0:
	.4byte 0x08053118
