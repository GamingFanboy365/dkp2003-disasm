@ asm/act_bossweapon.s: ROM 0x02CA98-0x02D338 (rom, VMA 0x0802CA98)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_bossweapon
	.thumb_func
	.type init_bossweapon, %function
init_bossweapon: @ 0802CA98
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _0802CB30
_0802CAA2:
	ldr r4, _0802CADC
	strh r4, [r5]
	adds r4, r5, #0
	adds r4, #0xa0
	ldr r1, [r4]
	ldr r2, _0802CAE4
	lsls r0, r1, #2
	ldr r1, [r2, r0]
	adds r0, r5, #0
	movs r2, #3
	bl obj_setup_sprite
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r0, #0x18
	muls r0, r1, r0
	ldr r3, _0802CAE8
	adds r1, r0, r3
	ldr r0, _0802CAE0
	strh r0, [r1, #0xa]
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0x38]
	bl multi_lfsr_next
	b _0802CAEC
_0802CADC:
	.4byte 0x00000001
_0802CAE0:
	.4byte 0x00000000
_0802CAE4:
	.4byte gUnk_0884FEFC
_0802CAE8:
	.4byte 0x02018F34
_0802CAEC:
	lsrs r1, r0, #0xc
	str r1, [r4, #0x20]
	bl multi_lfsr_next
	lsrs r2, r0, #0xc
	str r2, [r4, #0x24]
	bl multi_lfsr_next
	lsrs r3, r0, #0xc
	str r3, [r4, #0x28]
	bl multi_lfsr_next
	lsrs r1, r0, #7
	str r1, [r4, #0x2c]
	bl multi_lfsr_next
	lsrs r2, r0, #7
	str r2, [r4, #0x30]
	bl multi_lfsr_next
	movs r1, #0x96
	lsrs r3, r0, #7
	lsls r0, r1, #1
	str r3, [r4, #0x34]
	str r0, [r4, #0x3c]
	ldr r1, _0802CB4C
	ldr r2, [r1]
	str r2, [r4, #0x40]
	adds r2, #1
	str r2, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_0802CB30:
	ldr r0, _0802CB50
	movs r4, #0xb9
	str r0, [sp]
	ldr r1, _0802CB54
	ldr r0, _0802CB58
	ldr r2, _0802CB5C
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802CAA2
	.byte 0x00, 0x00
_0802CB4C:
	.4byte 0x0202EC4C
_0802CB50:
	.4byte gUnk_08053668
_0802CB54:
	.4byte gUnk_08053674
_0802CB58:
	.4byte gUnk_0805368C
_0802CB5C:
	.4byte gUnk_080536C8

	.global act_bossweapon
	.thumb_func
	.type act_bossweapon, %function
act_bossweapon: @ 0802CB60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	sub sp, #0x14
	cmp r7, #0
	bne _0802CB72
	b _0802CFBE
_0802CB72:
	adds r0, r7, #0
	adds r6, r7, #0
	adds r0, #0x5a
	adds r6, #0xa0
	ldrh r1, [r0]
	ldr r0, [r6, #4]
	mov sl, r0
	cmp r0, #1
	bne _0802CB86
	b _0802CEA4
_0802CB86:
	cmp r0, #1
	ble _0802CB8C
	b _0802CE08
_0802CB8C:
	cmp r0, #0
	bne _0802CB92
	b _0802CD22
_0802CB92:
	movs r2, #0x84
	adds r1, r2, r7
_0802CB96:
	adds r5, r7, #0
	adds r4, r7, #0
	mov r8, r1
_0802CB9C:
	adds r5, #0x88
	adds r4, #0x8c
_0802CBA0:
	ldr r2, [r7, #0x24]
	mov r0, r8
	str r2, [r0]
	ldr r1, [r7, #0x28]
	str r1, [r5]
	ldr r0, [r7, #0x2c]
	str r0, [r4]
	ldr r2, [r7, #0x24]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x28]
	str r2, [r7, #0x30]
	adds r2, r2, r3
	ldr r3, [r7, #0x40]
	ldr r0, [r7, #0x2c]
	str r1, [r7, #0x34]
	str r2, [r7, #0x24]
	adds r2, r1, r3
	ldr r1, [r7, #0x44]
	str r2, [r7, #0x28]
	adds r2, r0, r1
	str r0, [r7, #0x38]
	str r2, [r7, #0x2c]
	adds r0, r7, #0
	ldr r1, _0802CE54
	bl _call_via_r1
	ldr r2, [r6, #4]
	cmp r2, #1
	beq _0802CBE8
_0802CBDA:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802CBE8:
	ldr r0, _0802CE58
	adds r0, #0x8c
	ldr r4, [r0]
	cmp r4, #7
	beq _0802CC28
	ldr r1, _0802CE5C
	ldr r0, [r6, #0x40]
	ldr r3, [r1]
	cmp r3, r0
	beq _0802CC18
_0802CBFC:
	ldr r4, _0802CE60
_0802CBFE:
	ldr r0, [r6, #0xc]
	lsls r2, r0, #2
	ldr r1, [r4, r2]
	adds r0, r1, #0
	adds r0, #0xa0
	ldr r1, [r0, #8]
	cmp r1, #3
	beq _0802CBDA
	adds r0, r7, #0
	movs r1, #0
	bl sub_0802C9C8
	b _0802CBDA
_0802CC18:
	movs r2, #1
	rsbs r4, r2, #0
	adds r0, r7, #0
	str r4, [r1]
	adds r0, #0xec
	bl gamesfx_stop
	b _0802CBFC
_0802CC28:
	ldr r4, [r6]
	ldr r1, _0802CE64
	lsls r5, r4, #2
	ldr r2, [r1, r5]
	mov r8, r1
	movs r1, #1
	rsbs r5, r1, #0
	cmp r2, r5
	beq _0802CBFC
	ldr r3, [r7, #0x24]
	ldr r4, _0802CE68
	movs r2, #0xa0
	adds r0, r3, r4
	lsls r4, r2, #7
	adds r1, r3, r4
	ldr r3, _0802CE6C
	ldr r2, [r3]
	ldr r3, _0802CE70
	ldr r3, [r3]
	bl sub_0802C42C
	str r0, [r6, #0x44]
	ldr r2, [r7, #0x2c]
	ldr r1, _0802CE68
	adds r0, r2, r1
	adds r1, r2, r4
	ldr r4, _0802CE74
	ldr r2, [r4]
	ldr r4, _0802CE78
	ldr r3, [r4]
	bl sub_0802C42C
	ldr r2, _0802CE7C
	str r0, [r6, #0x48]
	ldr r1, [r2]
	ldr r4, _0802CE60
	lsls r2, r1, #2
	ldr r1, [r4, r2]
	ldr r3, [r6, #0x44]
	ldr r2, [r1, #0x64]
	ands r3, r2
	cmp r3, #0
	beq _0802CD06
	ldr r2, [r1, #0x68]
	ands r2, r0
	cmp r2, #0
	beq _0802CD06
	ldr r2, [r1, #0x24]
	ldr r3, [r7, #0x24]
	subs r0, r2, r3
	ldr r2, [r1, #0x28]
	ldr r3, [r7, #0x28]
	ldr r1, [r1, #0x2c]
	subs r2, r2, r3
	ldr r3, [r7, #0x2c]
	subs r1, r1, r3
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r0, #0
	adds r0, r3, r2
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r0, r2
	asrs r2, r1, #0xc
	movs r1, #0x80
	lsls r0, r1, #8
	str r2, [r6, #0x50]
	cmp r2, r0
	bhi _0802CCF0
	ldr r0, _0802CE5C
	ldr r1, [r0]
	cmp r1, r5
	bne _0802CBFE
	ldr r3, [r6]
	mov r2, r8
	lsls r1, r3, #2
	ldr r3, [r2, r1]
	ldr r2, [r6, #0x40]
	str r2, [r0]
	ldr r2, _0802CE80
	ldr r0, [r2, r1]
	ldr r2, _0802CE84
	str r0, [sp]
	ldr r0, [r2, r1]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xa
	movs r0, #0
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, _0802CE88
	ldr r0, _0802CE8C
	adds r2, r7, #0
	bl gamesfx_play_cb
	str r0, [r6, #0x4c]
	b _0802CBFE
_0802CCF0:
	ldr r1, _0802CE5C
	ldr r0, [r6, #0x40]
	ldr r3, [r1]
	cmp r3, r0
	bne _0802CBFE
	adds r0, r7, #0
	str r5, [r1]
	adds r0, #0xec
	bl gamesfx_stop
	b _0802CBFE
_0802CD06:
	ldr r1, _0802CE5C
	ldr r0, [r6, #0x40]
	ldr r3, [r1]
	cmp r3, r0
	beq _0802CD12
	b _0802CBFE
_0802CD12:
	movs r2, #1
	rsbs r4, r2, #0
	adds r0, r7, #0
	str r4, [r1]
	adds r0, #0xec
	bl gamesfx_stop
	b _0802CBFC
_0802CD22:
	movs r4, #0x18
	muls r1, r4, r1
	ldr r5, [r6]
	ldr r0, _0802CE90
	adds r1, #8
	adds r4, r1, r0
	lsls r2, r5, #3
	ldr r0, _0802CE94
	adds r2, #4
	ldr r5, [r0, r2]
	ldrh r3, [r4, #2]
	lsls r2, r5, #2
	adds r5, r3, r2
	ldr r2, [r6, #0xc]
	strh r5, [r4, #2]
	ldr r5, _0802CE60
	lsls r3, r2, #2
	ldr r2, [r5, r3]
	ldr r5, [r2, #0x3c]
	str r5, [r7, #0x3c]
	ldr r5, [r2, #0x40]
	str r5, [r7, #0x40]
	ldr r5, [r2, #0x44]
	str r5, [r7, #0x44]
	ldr r1, [r6]
	lsls r2, r1, #3
	ldrh r5, [r4, #2]
	ldr r4, [r0, r2]
	cmp r5, r4
	blt _0802CDFC
	movs r5, #1
	movs r4, #0x14
	str r5, [r6, #4]
	str r4, [r6, #8]
	ldr r2, [r7, #0x24]
	str r2, [r6, #0x14]
	ldr r0, [r7, #0x28]
	str r0, [r6, #0x18]
	ldr r1, [r7, #0x2c]
	str r1, [r6, #0x1c]
	ldr r5, [r7, #0x24]
	movs r3, #0x84
	adds r0, r3, r7
	str r5, [r7, #0x30]
	str r5, [r0]
	ldr r4, [r7, #0x28]
	adds r5, r7, #0
	adds r5, #0x88
	str r4, [r7, #0x34]
	str r4, [r5]
	ldr r2, [r7, #0x2c]
	mov r8, r0
	adds r4, r7, #0
	movs r0, #0x80
	lsls r1, r0, #3
	movs r3, #0xa0
	adds r4, #0x8c
	str r2, [r7, #0x38]
	adds r0, r7, #0
	str r2, [r4]
	str r1, [sp]
	movs r2, #0
	lsls r1, r3, #3
	movs r3, #0
	bl sub_08001C28
	adds r0, r7, #0
	bl obj_add_vector_hit
	ldr r2, _0802CE7C
	ldr r0, [r6, #0xc]
	ldr r1, [r2]
	cmp r0, r1
	beq _0802CDDA
_0802CDB6:
	movs r3, #0x7f
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	movs r3, #0x9b
	bl gamesfx_play_at
	b _0802CBA0
_0802CDDA:
	ldr r0, _0802CE58
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #7
	bne _0802CDB6
	mov r1, sl
	movs r2, #0xa
	movs r3, #0x80
	str r2, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x9b
	bl gamesfx_play
	b _0802CBA0
_0802CDFC:
	movs r4, #0x84
	adds r3, r4, r7
	adds r5, r7, #0
	adds r4, r7, #0
	mov r8, r3
	b _0802CB9C
_0802CE08:
	mov r2, sl
	cmp r2, #2
	beq _0802CE1A
	movs r1, #0x84
	adds r3, r1, r7
	adds r5, r7, #0
	adds r4, r7, #0
	mov r8, r3
	b _0802CB9C
_0802CE1A:
	movs r2, #0x18
	muls r2, r1, r2
	ldr r0, _0802CE90
	adds r2, #8
	ldrh r1, [r0, r2]
	ldr r0, _0802CE98
	ands r0, r1
	lsls r1, r0, #5
	ldr r2, _0802CE9C
	adds r1, #0x18
	ldr r0, [r2, r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802CE48
	adds r0, r7, #0
	bl obj_free
	ldr r1, _0802CEA0
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	b _0802CBDA
_0802CE48:
	movs r1, #0x84
	adds r2, r1, r7
	adds r5, r7, #0
	adds r4, r7, #0
	mov r8, r2
	b _0802CB9C
_0802CE54:
	.4byte sub_03003750
_0802CE58:
	.4byte gGameSetup
_0802CE5C:
	.4byte 0x0202EC50
_0802CE60:
	.4byte gRacerObjects
_0802CE64:
	.4byte gUnk_0884FF3C
_0802CE68:
	.4byte 0xFFFFB000
_0802CE6C:
	.4byte 0x02004284
_0802CE70:
	.4byte 0x0200428C
_0802CE74:
	.4byte 0x02004290
_0802CE78:
	.4byte 0x02004298
_0802CE7C:
	.4byte gLocalPlayerIndex
_0802CE80:
	.4byte gUnk_0884FF7C
_0802CE84:
	.4byte gUnk_0884FF9C
_0802CE88:
	.4byte sub_0802C950
_0802CE8C:
	.4byte sub_0802D128
_0802CE90:
	.4byte 0x02018F34
_0802CE94:
	.4byte gUnk_0884FFFC
_0802CE98:
	.4byte 0x00007FFF
_0802CE9C:
	.4byte 0x0201AA4C
_0802CEA0:
	.4byte 0x0202EC54
_0802CEA4:
	ldr r3, [r6, #0x38]
	cmp r3, #0xff
	bgt _0802CEAE
	adds r3, #8
	str r3, [r6, #0x38]
_0802CEAE:
	ldr r1, [r6, #0x1c]
	ldr r3, [r6, #0x58]
	ldr r2, [r6, #0x14]
	ldr r0, [r6, #0x54]
	adds r5, r1, r3
	adds r4, r2, r0
	str r5, [r6, #0x1c]
	ldr r0, [r6, #0x2c]
	ldr r5, [r6, #0x10]
	adds r2, r0, #0
	muls r2, r5, r2
	lsls r1, r2, #0x10
	ldr r2, _0802CFD8
	str r4, [r6, #0x14]
	mov sl, r2
	asrs r0, r1, #0x10
	bl _call_via_r10
	ldr r1, [r6, #0x20]
	lsls r2, r0, #0x10
	ldr r0, [r6, #0x30]
	asrs r3, r2, #0x10
	muls r1, r3, r1
	adds r2, r0, #0
	muls r2, r5, r2
	asrs r3, r1, #4
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	mov r8, r3
	bl _call_via_r10
	ldr r1, [r6, #0x24]
	lsls r2, r0, #0x10
	ldr r0, [r6, #0x34]
	asrs r3, r2, #0x10
	muls r1, r3, r1
	adds r2, r0, #0
	muls r2, r5, r2
	asrs r3, r1, #4
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	ldr r5, _0802CFDC
	mov sl, r3
	bl _call_via_r5
	ldr r1, [r6, #0x28]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	muls r1, r3, r1
	asrs r0, r1, #4
	ldr r1, [r6, #0x38]
	mov r5, r8
	muls r5, r1, r5
	mov r2, sl
	muls r2, r1, r2
	asrs r3, r5, #8
	adds r5, r1, #0
	muls r5, r0, r5
	ldr r0, [r6, #0x5c]
	mov lr, r3
	asrs r3, r2, #8
	asrs r2, r5, #8
	mov r5, lr
	muls r5, r0, r5
	adds r1, r5, #0
	ldr r5, [r6, #0x60]
	muls r5, r2, r5
	mov sl, r3
	asrs r3, r1, #0xc
	ldr r2, [r7, #0x24]
	mov ip, r3
	add r4, ip
	subs r1, r4, r2
	str r1, [r7, #0x3c]
	asrs r0, r5, #0xc
	ldr r5, [r6, #0x18]
	ldr r3, [r7, #0x28]
	add r5, sl
	subs r4, r5, r3
	str r4, [r7, #0x40]
	ldr r2, [r6, #0x1c]
	ldr r1, [r7, #0x2c]
	adds r5, r0, r2
	subs r4, r5, r1
	str r4, [r7, #0x44]
	ldr r0, [r6, #0x10]
	adds r0, #2
	str r0, [r6, #0x10]
	ldr r1, [r7, #0x40]
	ldr r2, [r7, #0x28]
	movs r5, #0x96
	adds r4, r2, r1
	lsls r1, r5, #2
	cmp r4, r1
	bge _0802CF72
	adds r5, r1, #0
	subs r4, r5, r2
	str r4, [r7, #0x40]
_0802CF72:
	ldr r3, [r6, #8]
	cmp r3, #0
	beq _0802CF80
	subs r2, r3, #2
	str r2, [r6, #8]
	cmp r2, #0
	beq _0802CFB4
_0802CF80:
	ldr r3, [r6, #0x3c]
	cmp r3, #0
	ble _0802CFA8
	subs r3, #2
	str r3, [r6, #0x3c]
	cmp r3, #0
	ble _0802CF94
	movs r3, #0x84
	adds r1, r3, r7
	b _0802CB96
_0802CF94:
	adds r0, r7, #0
	movs r1, #0
	bl sub_0802C9C8
	movs r3, #0x84
	adds r2, r3, r7
	adds r5, r7, #0
	adds r4, r7, #0
	mov r8, r2
	b _0802CB9C
_0802CFA8:
	movs r5, #0x84
	adds r0, r5, r7
	adds r4, r7, #0
	adds r5, r7, #0
	mov r8, r0
	b _0802CB9C
_0802CFB4:
	adds r1, r7, #0
	adds r1, #0x90
	str r2, [r1]
	str r2, [r6, #8]
	b _0802CF80
_0802CFBE:
	ldr r0, _0802CFE0
	ldr r1, _0802CFE4
	str r0, [sp]
	ldr r2, _0802CFE8
	ldr r0, _0802CFEC
	ldr r3, _0802CFF0
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802CB72
	.byte 0x00, 0x00
_0802CFD8:
	.4byte sub_03000138
_0802CFDC:
	.4byte sub_03000134
_0802CFE0:
	.4byte gUnk_08053668
_0802CFE4:
	.4byte gUnk_08053674
_0802CFE8:
	.4byte gUnk_080536D8
_0802CFEC:
	.4byte gUnk_0805368C
_0802CFF0:
	.4byte 0x0000019F

	.global react_bossweapon
	.thumb_func
	.type react_bossweapon, %function
react_bossweapon: @ 0802CFF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	sub sp, #0x14
	adds r6, r1, #0
	cmp r4, #0
	beq _0802D0C0
_0802D004:
	cmp r6, #0
	beq _0802D0A8
_0802D008:
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r1, [r2]
	ldr r7, _0802D0D8
	lsls r0, r1, #2
	ldr r5, _0802D0DC
	ldr r1, _0802D0E0
	ldr r3, [r7, r0]
	ldr r7, [r5, r0]
	ldr r5, [r1, r0]
	ldrb r1, [r6, #2]
	mov r8, r3
	cmp r1, #0x32
	beq _0802D054
	adds r0, r4, #0
	movs r1, #0
	bl sub_0802C9C8
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	mov r3, r8
	str r5, [sp]
	str r7, [sp, #4]
	bl gamesfx_play_at
_0802D048:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802D054:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0802C9C8
	adds r0, r6, #0
	ldr r2, _0802D0E4
	adds r0, #0xa0
	ldr r1, [r0, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0802D088
_0802D06A:
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	mov r3, r8
	str r5, [sp]
	str r7, [sp, #4]
	bl gamesfx_play_at
	b _0802D048
_0802D088:
	ldr r2, _0802D0E8
	adds r2, #0x8c
	ldr r1, [r2]
	cmp r1, #7
	bne _0802D06A
	movs r1, #0xa
	movs r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r1, r5, #0
	mov r0, r8
	adds r2, r7, #0
	movs r3, #1
	bl gamesfx_play
	b _0802D048
_0802D0A8:
	ldr r0, _0802D0EC
	ldr r1, _0802D0F0
	str r0, [sp]
	ldr r2, _0802D0F4
	ldr r0, _0802D0F8
	ldr r3, _0802D0FC
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802D008
_0802D0C0:
	ldr r0, _0802D100
	ldr r1, _0802D0F0
	str r0, [sp]
	ldr r2, _0802D0F4
	ldr r0, _0802D0F8
	ldr r3, _0802D104
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802D004
_0802D0D8:
	.4byte gUnk_0884FF5C
_0802D0DC:
	.4byte gUnk_0884FFDC
_0802D0E0:
	.4byte gUnk_0884FFBC
_0802D0E4:
	.4byte gLocalPlayerIndex
_0802D0E8:
	.4byte gGameSetup
_0802D0EC:
	.4byte gUnk_080536E8
_0802D0F0:
	.4byte gUnk_08053674
_0802D0F4:
	.4byte gUnk_080536F4
_0802D0F8:
	.4byte gUnk_0805368C
_0802D0FC:
	.4byte 0x00000286
_0802D100:
	.4byte gUnk_08053668
_0802D104:
	.4byte 0x00000285

	.global sub_0802D108
	.thumb_func
	.type sub_0802D108, %function
sub_0802D108: @ 0802D108
	movs r0, #1
	rsbs r3, r0, #0
	ldr r2, _0802D11C
	ldr r0, _0802D120
	movs r1, #0
	str r1, [r2]
	str r3, [r0]
	ldr r0, _0802D124
	str r1, [r0]
	bx lr
_0802D11C:
	.4byte 0x0202EC4C
_0802D120:
	.4byte 0x0202EC50
_0802D124:
	.4byte 0x0202EC54

	.global sub_0802D128
	.thumb_func
	.type sub_0802D128, %function
sub_0802D128: @ 0802D128
	adds r0, #0xa0
	ldr r3, [r0, #0x50]
	movs r1, #0x80
	lsls r2, r1, #8
	subs r1, r2, r3
	ldr r2, [r0]
	lsls r3, r2, #2
	ldr r2, _0802D144
	ldr r0, [r2, r3]
	adds r2, r0, #0
	muls r2, r1, r2
	asrs r0, r2, #0xf
	bx lr
	.byte 0x00, 0x00
_0802D144:
	.4byte gUnk_0884FF7C

	.global init_bossbomb_fire
	.thumb_func
	.type init_bossbomb_fire, %function
init_bossbomb_fire: @ 0802D148
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802D18A
_0802D152:
	ldr r1, _0802D178
	adds r0, r4, #0
	strh r1, [r4]
	movs r2, #0x23
	movs r1, #0x88
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _0802D180
	adds r0, r1, r3
	ldr r1, _0802D17C
	add sp, #4
	strh r1, [r0, #0xa]
	b _0802D184
	.byte 0x00, 0x00
_0802D178:
	.4byte 0x00000001
_0802D17C:
	.4byte 0x00000040
_0802D180:
	.4byte 0x02018F34
_0802D184:
	pop {r4}
	pop {r0}
	bx r0
_0802D18A:
	ldr r0, _0802D1A4
	movs r3, #0xad
	str r0, [sp]
	ldr r1, _0802D1A8
	ldr r0, _0802D1AC
	ldr r2, _0802D1B0
	lsls r3, r3, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802D152
_0802D1A4:
	.4byte gUnk_08053668
_0802D1A8:
	.4byte gUnk_08053674
_0802D1AC:
	.4byte gUnk_0805368C
_0802D1B0:
	.4byte gUnk_08053708

	.global act_bossbomb_fire
	.thumb_func
	.type act_bossbomb_fire, %function
act_bossbomb_fire: @ 0802D1B4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802D208
_0802D1BE:
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	ldr r3, [r4, #0x24]
	ldr r2, [r4, #0x3c]
	adds r1, r3, r2
	ldr r3, [r4, #0x28]
	ldr r2, [r4, #0x40]
	str r1, [r4, #0x24]
	adds r1, r3, r2
	ldr r3, [r4, #0x2c]
	ldr r2, [r4, #0x44]
	str r1, [r4, #0x28]
	adds r1, r3, r2
	movs r2, #0x18
	muls r2, r0, r2
	str r1, [r4, #0x2c]
	ldr r0, _0802D220
	adds r2, #8
	ldrh r1, [r0, r2]
	ldr r0, _0802D224
	ands r0, r1
	lsls r1, r0, #5
	ldr r2, _0802D228
	adds r1, #0x18
	ldr r0, [r2, r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D200
	adds r0, r4, #0
	bl obj_free
_0802D200:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0802D208:
	ldr r0, _0802D22C
	ldr r1, _0802D230
	str r0, [sp]
	ldr r2, _0802D234
	ldr r0, _0802D238
	ldr r3, _0802D23C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802D1BE
_0802D220:
	.4byte 0x02018F34
_0802D224:
	.4byte 0x00007FFF
_0802D228:
	.4byte 0x0201AA4C
_0802D22C:
	.4byte gUnk_08053668
_0802D230:
	.4byte gUnk_08053674
_0802D234:
	.4byte gUnk_0805371C
_0802D238:
	.4byte gUnk_0805368C
_0802D23C:
	.4byte 0x000002C5

	.global sub_0802D240
	.thumb_func
	.type sub_0802D240, %function
sub_0802D240: @ 0802D240
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r0, #0xa0
	ldr r3, [r0]
	mov sl, r0
	mov r8, r3
	movs r0, #0xe8
	mov r7, r8
	muls r7, r0, r7
	ldr r4, _0802D32C
	ldr r1, [r4, r7]
	lsls r6, r1, #6
	lsrs r0, r6, #0x11
	ldr r5, _0802D330
	bl _call_via_r5
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	adds r1, r2, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r4, #0xc8
	adds r5, r7, r4
	adds r0, #8
	adds r3, r0, r7
	mov lr, r5
	asrs r6, r1, #0xc
	mov ip, r3
	movs r7, #0
	mov fp, lr
_0802D284:
	movs r1, #0xc
	adds r2, r7, #0
	muls r2, r1, r2
	add r2, ip
	movs r3, #2
	ldrsh r0, [r2, r3]
	movs r5, #6
	ldrsh r3, [r2, r5]
	mov sb, r3
	mov r3, sb
	muls r3, r6, r3
	movs r5, #0
	ldrsh r4, [r2, r5]
	movs r5, #4
	ldrsh r1, [r2, r5]
	asrs r5, r3, #0xc
	adds r4, r4, r5
	movs r5, #8
	ldrsh r3, [r2, r5]
	mov sb, r3
	mov r5, sb
	muls r5, r6, r5
	asrs r3, r5, #0xc
	adds r5, r0, r3
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	adds r3, r2, #0
	muls r3, r6, r3
	asrs r3, r3, #0xc
	adds r2, r1, r3
	asrs r0, r5, #0xa
	asrs r5, r2, #0xa
	lsls r2, r5, #0xa
	lsls r5, r0, #5
	asrs r3, r4, #0xa
	orrs r2, r5
	orrs r2, r3
	mov r5, fp
	movs r4, #2
	adds r7, #1
	strh r2, [r5]
	add fp, r4
	cmp r7, #0xf
	ble _0802D284
	mov r5, sl
	movs r2, #0x80
	ldr r0, [r5, #0x10]
	lsls r4, r2, #8
	cmp r0, r4
	bge _0802D300
	movs r2, #0xe8
	mov r5, r8
	muls r5, r2, r5
	lsls r3, r0, #0xb
	movs r4, #0xb0
	asrs r1, r3, #0xf
	lsls r0, r4, #4
	subs r4, r0, r1
	ldr r0, _0802D32C
	adds r5, #4
	lsls r1, r4, #0xa
	str r1, [r0, r5]
_0802D300:
	movs r5, #0xe8
	mov r1, r8
	muls r1, r5, r1
	ldr r0, _0802D32C
	adds r5, r1, #4
	ldr r4, [r0, r5]
	ldr r3, [r0, r1]
	lsls r2, r4, #1
	adds r3, r3, r2
	ldr r2, _0802D334
	ands r3, r2
	str r3, [r0, r1]
	str r4, [r0, r5]
	mov r0, lr
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802D32C:
	.4byte 0x0202EC58
_0802D330:
	.4byte sub_03000138
_0802D334:
	.4byte 0x03FFFFFF
