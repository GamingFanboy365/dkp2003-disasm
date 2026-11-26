@ asm/act_pause.s: ROM 0x012BA4-0x012EA4 (rom, VMA 0x08012BA4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global act_pause
	.thumb_func
	.type act_pause, %function
act_pause: @ 08012BA4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	sub sp, #8
	cmp r6, #0
	bne _08012BB0
	b _08012D5C
_08012BB0:
	ldr r7, _08012D74
	ldr r4, [r7]
	movs r5, #2
	ands r4, r5
	cmp r4, #0
	bne _08012BBE
	b _08012D02
_08012BBE:
	adds r5, r6, #0
	adds r5, #0xa0
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _08012BCA
	b _08012CD6
_08012BCA:
	cmp r0, #1
	ble _08012BD0
	b _08012CAA
_08012BD0:
	cmp r0, #0
	beq _08012BDC
_08012BD4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08012BDC:
	adds r2, r6, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r4, #0x18
	muls r4, r1, r4
	ldr r3, _08012D78
	ldrb r1, [r5, #1]
	adds r4, #8
	strh r1, [r3, r4]
	ldr r4, _08012D7C
	ldrh r2, [r4]
	movs r3, #0x40
	ands r3, r2
	adds r7, r4, #0
	cmp r3, #0
	beq _08012C7C
	cmp r1, #0
	beq _08012C7C
	adds r2, r1, #0
	adds r2, #0xff
	movs r1, #0xa
	movs r3, #0x80
	strb r2, [r5, #1]
	str r1, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #0
	movs r0, #0xc0
	bl sub_0801FCAC
_08012C1A:
	ldrh r3, [r4]
	movs r1, #9
	ands r1, r3
	cmp r1, #0
	beq _08012BD4
	ldrb r4, [r5, #1]
	cmp r4, #1
	beq _08012C60
	cmp r4, #2
	beq _08012C58
	adds r0, r6, #0
	bl obj_destroy_sprite
	ldrb r1, [r5]
	ldr r0, _08012D74
	str r1, [r0]
	bl sub_0802F0E2
	bl sub_080200F8
	movs r2, #0xa
	str r2, [sp]
	movs r2, #0x80
	movs r3, #0
	movs r1, #0x7f
	lsls r2, r2, #9
	movs r0, #0xd7
	str r3, [sp, #4]
	bl sub_0801FCAC
	b _08012BD4
_08012C58:
	movs r0, #0xa
	movs r2, #0x80
	str r0, [sp]
	b _08012C66
_08012C60:
	movs r2, #0xa
	str r2, [sp]
	movs r2, #0x80
_08012C66:
	movs r3, #0
	movs r1, #0x7f
	lsls r2, r2, #9
	movs r0, #0xcb
	str r3, [sp, #4]
	bl sub_0801FCAC
	strb r4, [r5, #2]
	bl sub_080035F8
	b _08012BD4
_08012C7C:
	ldrh r3, [r7]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08012C1A
	ldrb r2, [r5, #1]
	adds r1, r2, #0
	cmp r1, #1
	bhi _08012C1A
	adds r0, r2, #1
	movs r4, #0x80
	movs r2, #0xa
	strb r0, [r5, #1]
	str r2, [sp]
	movs r3, #0
	lsls r2, r4, #9
	movs r0, #0xc0
	movs r1, #0x7f
	str r3, [sp, #4]
	bl sub_0801FCAC
	adds r4, r7, #0
	b _08012C1A
_08012CAA:
	cmp r0, #2
	beq _08012CB0
	b _08012BD4
_08012CB0:
	ldr r1, _08012D80
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	beq _08012CFC
	ldr r0, [r1]
	movs r3, #1
	orrs r0, r3
	str r0, [r1]
	adds r0, r6, #0
	bl obj_destroy_sprite
	ldrb r2, [r5]
	str r2, [r7]
	bl sub_0802F0E2
	b _08012BD4
_08012CD6:
	ldr r1, _08012D80
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	beq _08012CFC
	ldr r0, [r1]
	movs r3, #0x10
	orrs r0, r3
	str r0, [r1]
	adds r0, r6, #0
	bl obj_destroy_sprite
	ldrb r1, [r5]
	str r1, [r7]
	bl sub_0802F0E2
	b _08012BD4
_08012CFC:
	bl sub_08003478
	b _08012BD4
_08012D02:
	ldr r2, _08012D80
	ldr r0, [r2]
	movs r1, #0x40
	bics r1, r0
	cmp r1, #0
	bne _08012D10
	b _08012BD4
_08012D10:
	ldr r2, _08012D7C
	ldrh r0, [r2]
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08012D1E
	b _08012BD4
_08012D1E:
	bl sub_0802F0DA
	bl sub_080200C0
	movs r1, #0xa
	movs r3, #0x80
	str r1, [sp]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #0
	movs r0, #0xd7
	str r4, [sp, #4]
	bl sub_0801FCAC
	adds r0, r6, #0
	movs r1, #0x2c
	movs r2, #3
	bl obj_setup_sprite
	ldr r1, [r7]
	adds r0, r6, #0
	adds r0, #0xa0
	movs r2, #8
	strb r1, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	rsbs r0, r2, #0
	ands r1, r0
	orrs r1, r5
	str r1, [r7]
	b _08012BD4
_08012D5C:
	ldr r0, _08012D84
	ldr r1, _08012D88
	str r0, [sp]
	ldr r2, _08012D8C
	ldr r0, _08012D90
	movs r3, #0x23
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012BB0
_08012D74:
	.4byte 0x02004348
_08012D78:
	.4byte 0x02018F34
_08012D7C:
	.4byte 0x0300565E
_08012D80:
	.4byte 0x0300566C
_08012D84:
	.4byte 0x08050CAC
_08012D88:
	.4byte 0x08050CB8
_08012D8C:
	.4byte 0x08050CC8
_08012D90:
	.4byte 0x08050CD4

	.global init_pause
	.thumb_func
	.type init_pause, %function
init_pause: @ 08012D94
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08012DBE
_08012D9E:
	ldr r1, _08012DB4
	movs r0, #0xf0
	strh r1, [r4]
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	add sp, #4
	b _08012DB8
	.byte 0x00, 0x00
_08012DB4:
	.4byte 0x00001003
_08012DB8:
	pop {r4}
	pop {r0}
	bx r0
_08012DBE:
	ldr r0, _08012DD8
	ldr r1, _08012DDC
	str r0, [sp]
	ldr r2, _08012DE0
	ldr r0, _08012DE4
	movs r3, #0x1a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012D9E
	.byte 0x00, 0x00
_08012DD8:
	.4byte 0x08050CAC
_08012DDC:
	.4byte 0x08050CB8
_08012DE0:
	.4byte 0x08050D10
_08012DE4:
	.4byte 0x08050CD4

	.global sub_08012DE8
	.thumb_func
	.type sub_08012DE8, %function
sub_08012DE8: @ 08012DE8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xa0
	ldr r3, [r4]
	cmp r3, #1
	beq _08012E48
	cmp r3, #1
	bgt _08012E14
	cmp r3, #0
	beq _08012E04
_08012DFE:
	pop {r4, r5}
	pop {r0}
	bx r0
_08012E04:
	movs r0, #1
	str r0, [r4]
	bl sub_08000B14
	lsrs r1, r0, #0xb
	adds r1, #0x20
	str r1, [r4, #4]
	b _08012DFE
_08012E14:
	cmp r3, #2
	bne _08012DFE
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r3, #0x18
	muls r3, r1, r3
	ldr r0, _08012E98
	adds r3, #8
	ldrh r1, [r0, r3]
	ldr r0, _08012E9C
	ands r0, r1
	lsls r1, r0, #5
	ldr r2, _08012EA0
	adds r1, #0x18
	ldr r0, [r2, r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012DFE
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #0
	bl obj_destroy_sprite
	b _08012DFE
_08012E48:
	ldr r3, [r4, #4]
	cmp r3, #0
	ble _08012E54
	subs r3, #1
	str r3, [r4, #4]
	b _08012DFE
_08012E54:
	movs r0, #2
	str r0, [r4]
	bl sub_08000B14
	lsrs r3, r0, #0xc
	lsls r2, r3, #1
	adds r1, r2, r3
	lsrs r3, r1, #4
	cmp r3, #0
	beq _08012E6C
	cmp r3, #1
	beq _08012E94
_08012E6C:
	movs r1, #0x5b
_08012E6E:
	adds r4, r5, #0
	movs r2, #0x23
	adds r0, r5, #0
	adds r4, #0x5a
	bl obj_setup_sprite
	ldrh r1, [r4]
	movs r0, #0x18
	adds r4, r1, #0
	muls r4, r0, r4
	bl sub_08000B14
	ldr r2, _08012E98
	adds r4, #8
	lsrs r1, r0, #0xa
	adds r1, #0x30
	adds r4, r4, r2
	strh r1, [r4, #2]
	b _08012DFE
_08012E94:
	movs r1, #0x5c
	b _08012E6E
_08012E98:
	.4byte 0x02018F34
_08012E9C:
	.4byte 0x00007FFF
_08012EA0:
	.4byte 0x0201AA4C
