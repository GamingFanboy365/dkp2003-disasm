@ asm/act_weaponicon.s: ROM 0x028A28-0x0291EC (rom, VMA 0x08028A28)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_weapon_icon
	.thumb_func
	.type init_weapon_icon, %function
init_weapon_icon: @ 08028A28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _08028ADE
_08028A32:
	adds r6, r5, #0
	adds r6, #0xa0
	ldr r4, [r6, #0x10]
	bl lfsr_next
	ldr r2, _08028A70
	lsrs r0, r0, #0xd
	adds r0, #1
	str r0, [r6, #0x14]
	ldr r3, _08028A74
	strh r2, [r5]
	adds r4, #0xa0
	ldr r2, [r4, #4]
	ldr r1, [r3]
	cmp r2, r1
	beq _08028AA8
_08028A52:
	movs r1, #0x20
	movs r0, #0x80
	lsls r2, r0, #0xc
	str r1, [r6, #4]
	movs r1, #0
	str r1, [r6, #0xc]
	str r2, [r6, #8]
	movs r3, #0x80
	ldr r2, [r5, #0x24]
	lsls r0, r3, #3
	subs r3, r0, r2
	cmp r3, #0
	blt _08028AA4
	b _08028A78
	.byte 0x00, 0x00
_08028A70:
	.4byte 0x00000001
_08028A74:
	.4byte gLocalPlayerIndex
_08028A78:
	asrs r2, r3, #5
	str r2, [r5, #0x3c]
	movs r3, #0xf8
	ldr r2, [r5, #0x28]
	lsls r0, r3, #7
	subs r3, r0, r2
	cmp r3, #0
	blt _08028AA0
_08028A88:
	asrs r2, r3, #5
	str r2, [r5, #0x40]
	str r1, [r6]
	ldr r0, [r4]
	movs r1, #8
	orrs r0, r1
	str r0, [r4]
	add sp, #4
	str r1, [r6, #0x18]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08028AA0:
	adds r3, #0x1f
	b _08028A88
_08028AA4:
	adds r3, #0x1f
	b _08028A78
_08028AA8:
	ldr r2, _08028AFC
	adds r1, r0, #0
	lsls r0, r1, #1
	ldrh r1, [r2, r0]
	adds r0, r5, #0
	movs r2, #3
	bl obj_setup_sprite
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _08028B00
	adds r0, r1, r3
	ldr r1, _08028AF8
	strh r1, [r0, #0xa]
	adds r0, r5, #0
	bl obj_remove_draw
	adds r0, r5, #0
	bl obj_project_to_screen
	adds r0, r5, #0
	bl obj_add_draw
	b _08028A52
_08028ADE:
	ldr r0, _08028B04
	ldr r1, _08028B08
	str r0, [sp]
	ldr r2, _08028B0C
	ldr r0, _08028B10
	movs r3, #0x2e
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08028A32
	.byte 0x00, 0x00
_08028AF8:
	.4byte 0x00000002
_08028AFC:
	.4byte gUnk_08052D64
_08028B00:
	.4byte 0x02018F34
_08028B04:
	.4byte gUnk_08052D7C
_08028B08:
	.4byte gUnk_08052D88
_08028B0C:
	.4byte gUnk_08052DA0
_08028B10:
	.4byte gUnk_08052DB4

	.global act_weapon_icon
	.thumb_func
	.type act_weapon_icon, %function
act_weapon_icon: @ 08028B14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r7, r5, #0
	adds r7, #0xa0
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #0x18]
	sub sp, #8
	mov sl, r1
	cmp r3, #0
	ble _08028B38
	subs r3, #2
	str r3, [r7, #0x18]
	cmp r3, #0
	bge _08028B38
	b _08028DE2
_08028B38:
	ldr r3, [r7]
	cmp r3, #1
	bne _08028B40
	b _08028D34
_08028B40:
	cmp r3, #1
	ble _08028B46
	b _08028C6A
_08028B46:
	cmp r3, #0
	beq _08028B58
_08028B4A:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08028B58:
	ldr r0, [r7, #4]
	subs r0, #2
	str r0, [r7, #4]
	cmp r0, #0
	ble _08028C2C
	ldr r1, [r7, #8]
	ldr r0, [r7, #0xc]
	lsls r3, r1, #1
	adds r1, r0, r3
	str r1, [r7, #0xc]
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x24]
	lsls r3, r0, #1
	adds r0, r1, r3
	ldr r1, [r5, #0x40]
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x28]
	lsls r3, r1, #1
	adds r1, r0, r3
	ldr r0, [r5, #0x44]
	str r1, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	lsls r3, r0, #1
	adds r0, r1, r3
	str r0, [r5, #0x2c]
	ldr r1, [r7, #0x18]
	cmp r1, #0
	beq _08028BBC
	movs r1, #0xa0
	add r1, sl
	mov r8, r1
_08028B96:
	ldr r3, _08028C90
	mov r2, r8
	ldr r1, [r2, #4]
	ldr r0, [r3]
	cmp r1, r0
	bne _08028B4A
	adds r0, r5, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r3, #0x18
	muls r3, r2, r3
	ldr r0, _08028C94
	ldrh r1, [r7, #0xe]
	adds r2, r3, #0
	adds r2, #0xc
	strh r1, [r0, r2]
	adds r2, r3, r0
	strh r1, [r2, #0xa]
	b _08028B4A
_08028BBC:
	ldr r4, [r7, #0x14]
_08028BBE:
	bl lfsr_next
	lsrs r2, r0, #0xd
	adds r6, r2, #1
	str r6, [r7, #0x14]
	cmp r6, r4
	beq _08028BBE
	movs r2, #0xa0
	ldr r3, _08028C90
	add r2, sl
	ldr r1, [r2, #4]
	ldr r0, [r3]
	mov r8, r2
	cmp r1, r0
	beq _08028BE2
_08028BDC:
	movs r1, #8
	str r1, [r7, #0x18]
	b _08028B96
_08028BE2:
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r4, #0x18
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, _08028C94
	ldr r1, _08028C98
	mov lr, r3
	lsls r3, r6, #1
	ldrh r3, [r1, r3]
	ldr r4, _08028C9C
	lsls r6, r3, #4
	ldr r3, [r4, r6]
	adds r0, r2, #0
	adds r0, #0x14
	mov r6, lr
	str r3, [r6, r0]
	ldr r0, [r7, #0x14]
	lsls r3, r0, #1
	ldrh r0, [r1, r3]
	lsls r1, r0, #4
	adds r1, #4
	ldr r0, [r4, r1]
	adds r2, #0x10
	str r0, [r6, r2]
	movs r3, #0x80
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #0xd1
	lsls r2, r3, #9
	movs r1, #0x40
	movs r3, #2
	bl gamesfx_play
	b _08028BDC
_08028C2C:
	movs r0, #1
	str r0, [r7]
	movs r1, #0x80
	movs r0, #0xf8
	lsls r2, r1, #3
	lsls r1, r0, #7
	str r2, [r5, #0x24]
	str r1, [r5, #0x28]
	mov r3, sl
	ldr r2, _08028C90
	adds r3, #0xa0
	ldr r0, [r3, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _08028C50
_08028C4A:
	movs r0, #4
	str r0, [r7, #4]
	b _08028B4A
_08028C50:
	adds r1, r5, #0
	adds r1, #0x5a
	ldrh r2, [r1]
	movs r3, #0x18
	muls r3, r2, r3
	ldr r0, _08028C94
	ldr r1, _08028C8C
	adds r2, r3, #0
	adds r2, #0xc
	strh r1, [r0, r2]
	adds r2, r3, r0
	strh r1, [r2, #0xa]
	b _08028C4A
_08028C6A:
	cmp r3, #2
	beq _08028CA8
	cmp r3, #3
	beq _08028C74
	b _08028B4A
_08028C74:
	ldr r1, [r7, #0x18]
	cmp r1, #0
	beq _08028CA0
	ldr r0, [r5, #0x40]
	ldr r2, [r5, #0x28]
	lsls r1, r0, #1
	adds r3, r2, r1
	adds r0, #0x40
	str r3, [r5, #0x28]
	str r0, [r5, #0x40]
	b _08028B4A
	.byte 0x00, 0x00
_08028C8C:
	.4byte 0x00000100
_08028C90:
	.4byte gLocalPlayerIndex
_08028C94:
	.4byte 0x02018F34
_08028C98:
	.4byte gUnk_08052D64
_08028C9C:
	.4byte gUnk_08713650
_08028CA0:
	adds r0, r5, #0
	bl obj_free
	b _08028B4A
_08028CA8:
	ldr r0, _08028DE8
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #8
	beq _08028D2C
	movs r3, #0x85
	lsls r0, r3, #1
	add r0, sl
	mov r1, sl
	ldrh r2, [r0]
	adds r1, #0xa0
	mov r8, r1
	cmp r2, #0
	beq _08028D0E
	ldr r2, [r1]
	movs r3, #1
	ands r3, r2
	cmp r3, #0
	bne _08028CD0
	b _08028B4A
_08028CD0:
	movs r3, #2
	rsbs r3, r3, #0
	ands r2, r3
	str r2, [r1]
	ldr r3, _08028DEC
	ldr r2, [r1, #4]
	ldr r1, [r3]
	cmp r2, r1
	beq _08028CE4
	b _08028B4A
_08028CE4:
	adds r4, r5, #0
	adds r4, #0x5a
	ldrh r1, [r4]
	movs r4, #0x18
	muls r1, r4, r1
	ldrh r2, [r0]
	ldr r6, _08028DF0
	lsls r0, r2, #1
	ldrh r2, [r6, r0]
	ldr r4, _08028DF4
	lsls r2, r2, #4
	ldr r3, [r4, r2]
	ldr r6, _08028DF8
	adds r0, r1, #0
	adds r0, #0x14
	str r3, [r6, r0]
	adds r2, #4
	ldr r0, [r4, r2]
	adds r1, #0x10
	str r0, [r6, r1]
	b _08028B4A
_08028D0E:
	movs r6, #0
	movs r1, #0x28
	movs r2, #3
	str r1, [r7, #0x18]
	str r2, [r7]
	str r6, [r5, #0x44]
	str r6, [r5, #0x40]
	str r6, [r5, #0x3c]
	mov r6, r8
	ldr r1, [r6]
	movs r3, #2
	rsbs r0, r3, #0
	ands r1, r0
	str r1, [r6]
	b _08028B4A
_08028D2C:
	movs r3, #0xa0
	add r3, sl
	mov r8, r3
	b _08028D0E
_08028D34:
	ldr r2, [r7, #0x18]
	cmp r2, #0
	beq _08028D3C
	b _08028B4A
_08028D3C:
	ldr r3, [r7, #4]
	cmp r3, #0
	ble _08028D46
	subs r3, #1
	str r3, [r7, #4]
_08028D46:
	cmp r3, #0
	beq _08028DBE
	ldr r4, [r7, #0x14]
_08028D4C:
	bl lfsr_next
	movs r1, #7
	bl __umodsi3
	adds r0, #1
	str r0, [r7, #0x14]
	cmp r0, r4
	beq _08028D4C
	movs r1, #0xa0
	add r1, sl
	mov r8, r1
_08028D64:
	ldr r3, _08028DEC
	mov r2, r8
	ldr r0, [r2, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _08028D76
_08028D70:
	movs r2, #8
	str r2, [r7, #0x18]
	b _08028B4A
_08028D76:
	adds r6, r5, #0
	adds r6, #0x5a
	ldrh r0, [r6]
	movs r4, #0x18
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, [r7, #0x14]
	ldr r1, _08028DF0
	lsls r3, r3, #1
	ldrh r3, [r1, r3]
	ldr r4, _08028DF4
	lsls r3, r3, #4
	ldr r3, [r4, r3]
	ldr r6, _08028DF8
	adds r0, r2, #0
	adds r0, #0x14
	str r3, [r6, r0]
	ldr r3, [r7, #0x14]
	lsls r0, r3, #1
	ldrh r3, [r1, r0]
	lsls r0, r3, #4
	adds r0, #4
	ldr r1, [r4, r0]
	adds r2, #0x10
	str r1, [r6, r2]
	movs r3, #0x80
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #0xd1
	lsls r2, r3, #9
	movs r1, #0x40
	movs r3, #2
	bl gamesfx_play
	b _08028D70
_08028DBE:
	movs r0, #0x85
	lsls r2, r0, #1
	add r2, sl
	ldrh r6, [r2]
	movs r3, #0xa0
	add r3, sl
	str r6, [r7, #0x14]
	mov r8, r3
	mov r6, r8
	ldr r0, [r6]
	movs r1, #2
	rsbs r3, r1, #0
	ands r0, r3
	subs r3, #7
	ands r0, r3
	str r0, [r6]
	str r1, [r7]
	b _08028D64
_08028DE2:
	movs r0, #0
	str r0, [r7, #0x18]
	b _08028B38
_08028DE8:
	.4byte gGameSetup
_08028DEC:
	.4byte gLocalPlayerIndex
_08028DF0:
	.4byte gUnk_08052D64
_08028DF4:
	.4byte gUnk_08713650
_08028DF8:
	.4byte 0x02018F34

	.global destroy_red_zinger
	.thumb_func
	.type destroy_red_zinger, %function
destroy_red_zinger: @ 08028DFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _08028F10
	adds r5, r7, #0
	adds r5, #0x5a
	mov sl, r2
	ldrh r2, [r5]
	movs r4, #0x18
	muls r2, r4, r2
	add r2, sl
	ldrh r3, [r2, #0xa]
	sub sp, #0x14
	mov r8, r3
	adds r6, r1, #0
	bl obj_destroy_sprite
	movs r2, #0x23
	adds r0, r7, #0
	movs r1, #0x48
	bl obj_setup_sprite
	ldrh r0, [r5]
	muls r0, r4, r0
	mov r1, r8
	add r0, sl
	strh r1, [r0, #0xa]
	adds r0, r7, #0
	adds r0, #0xc0
	bl gamesfx_stop
	adds r0, r7, #0
	adds r0, #0xc4
	bl gamesfx_stop
	adds r0, r7, #0
	adds r0, #0xc8
	bl gamesfx_stop
	adds r4, r7, #0
	ldr r1, _08028F14
	adds r4, #0xa0
	ldr r3, [r1]
	ldr r0, [r4, #0x34]
	cmp r3, r0
	beq _08028EFE
_08028E5C:
	cmp r6, #0
	beq _08028EDC
	ldr r1, [r6, #0x3c]
	str r1, [r7, #0x3c]
	ldr r2, [r6, #0x40]
	str r2, [r7, #0x40]
	ldr r0, [r6, #0x44]
	adds r1, r6, #0
	str r0, [r7, #0x44]
	ldr r2, _08028F18
	adds r1, #0xa0
	ldr r0, [r1, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _08028EBA
_08028E7A:
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
	movs r3, #0xd2
	bl gamesfx_play_at
_08028E9C:
	ldr r2, [r4]
	cmp r2, #2
	beq _08028EA8
	adds r0, r7, #0
	bl obj_remove_vector_hit
_08028EA8:
	movs r1, #3
	str r1, [r4]
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08028EBA:
	ldr r2, _08028F1C
	adds r2, #0x8c
	ldr r0, [r2]
	cmp r0, #7
	bne _08028E7A
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xd2
	bl gamesfx_play
	b _08028E9C
_08028EDC:
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
	movs r3, #0xd2
	str r6, [sp, #0x10]
	bl gamesfx_play_at
	b _08028E9C
_08028EFE:
	movs r2, #1
	rsbs r0, r2, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xcc
	bl gamesfx_stop
	b _08028E5C
	.byte 0x00, 0x00
_08028F10:
	.4byte 0x02018F34
_08028F14:
	.4byte gRedZingerBuzzOwner
_08028F18:
	.4byte gLocalPlayerIndex
_08028F1C:
	.4byte gGameSetup

	.global sub_08028F20
	.thumb_func
	.type sub_08028F20, %function
sub_08028F20: @ 08028F20
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0xa0
	ldr r0, [r2, #4]
	sub sp, #0x24
	movs r1, #1
	ldrb r3, [r5, #2]
	str r0, [sp, #0x1c]
	rsbs r0, r1, #0
	movs r1, #0
	str r0, [sp, #0x20]
	mov fp, r1
	cmp r3, #1
	bne _08028F4A
	b _080290EE
_08028F4A:
	cmp r3, #2
	bne _08028F50
	b _08029074
_08028F50:
	cmp r3, #0x32
	bne _08028F56
	b _0802905A
_08028F56:
	mov r3, fp
	cmp r3, #0
	beq _08028FF2
	movs r0, #0x16
	bl obj_new
	ldr r1, [r5, #0x3c]
	ldr r4, [r5, #0x24]
	lsls r3, r1, #1
	adds r6, r0, #0
	adds r1, r4, r3
	str r1, [r6, #0x24]
	ldr r2, [r5, #0x28]
	str r2, [r6, #0x28]
	ldr r4, [r5, #0x44]
	ldr r1, [r5, #0x2c]
	lsls r3, r4, #1
	adds r4, r1, r3
	str r4, [r6, #0x2c]
	adds r2, r5, #0
	adds r2, #0x56
	ldrh r1, [r2]
	adds r4, r6, #0
	adds r4, #0x56
	strh r1, [r4]
	adds r1, r5, #0
	adds r1, #0x54
	ldrh r4, [r1]
	adds r3, r6, #0
	adds r3, #0x54
	strh r4, [r3]
	ldr r2, [sp, #0x1c]
	adds r4, r6, #0
	adds r4, #0xa0
	adds r3, #0x3c
	str r2, [r4, #8]
	str r5, [r3]
	ldr r3, [sp, #0x20]
	str r3, [r4, #0xc]
	ldr r1, [r5, #0x50]
	str r1, [r4, #0x10]
	movs r1, #0
	bl obj_initialise
	movs r3, #1
	ldr r0, [sp, #0x20]
	rsbs r2, r3, #0
	cmp r0, r2
	beq _08029050
	movs r0, #1
	movs r1, #0x96
	str r0, [r4]
	str r1, [r4, #4]
_08028FC0:
	ldr r1, _080291C4
	movs r2, #0xa
	str r2, [r4, #0x18]
	str r1, [r4, #0x14]
	ldr r2, _080291C8
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #2
	beq _08029046
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #3
	beq _0802903C
_08028FDA:
	ldr r2, _080291CC
	ldr r1, [sp, #0x1c]
	ldr r0, [r2]
	cmp r1, r0
	beq _0802900C
_08028FE4:
	ldr r2, _080291D0
	ldr r0, [r2]
	str r0, [r4, #0x34]
	adds r0, #1
	str r0, [r2]
	cmp r0, #0
	blt _08029006
_08028FF2:
	mov r0, fp
	add sp, #0x24
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08029006:
	movs r1, #0
	str r1, [r2]
	b _08028FF2
_0802900C:
	ldr r1, _080291C8
	adds r1, #0x8c
	ldr r0, [r1]
	cmp r0, #7
	bne _08028FE4
	movs r0, #0x80
	lsls r2, r0, #9
	movs r1, #0xb4
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #1
	movs r0, #0xa
	movs r2, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, _080291D4
	movs r1, #0
	adds r2, r6, #0
	movs r3, #0xdb
	bl gamesfx_play_cb
	str r0, [r4, #0x20]
	b _08028FE4
_0802903C:
	ldr r2, _080291D8
	movs r1, #4
	str r2, [r4, #0x14]
	str r1, [r4, #0x18]
	b _08028FDA
_08029046:
	ldr r2, _080291DC
	movs r0, #0xe
	str r2, [r4, #0x14]
	str r0, [r4, #0x18]
	b _08028FDA
_08029050:
	movs r2, #0
	movs r0, #0x96
	str r2, [r4]
	str r0, [r4, #4]
	b _08028FC0
_0802905A:
	ldr r3, [r2, #8]
	cmp r3, #1
	beq _0802906C
	cmp r3, #3
	beq _08029066
	b _08028F56
_08029066:
	movs r2, #1
	mov fp, r2
	b _08028F56
_0802906C:
	movs r1, #1
	mov fp, r1
	str r1, [sp, #0x20]
	b _08028F56
_08029074:
	ldr r1, [sp, #0x1c]
	ldr r2, _080291C8
	adds r1, #0x98
	ldrb r0, [r2, r1]
	cmp r0, #0
	ble _080290DC
	movs r4, #0xb5
	adds r0, r2, #0
	lsls r3, r4, #4
	adds r0, #0x88
	mov sb, r3
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #0
	cmp fp, r3
	bge _080290DC
	ldr r2, [r5, #0x24]
	mov r8, r2
	ldr r2, _080291E0
	adds r6, r5, #0
	ldr r7, [r5, #0x2c]
	str r2, [sp, #0x18]
	adds r6, #0x56
	mov sl, r3
_080290A4:
	ldr r1, [sp, #0x18]
	ldm r1!, {r2}
	adds r0, r1, #0
	str r0, [sp, #0x18]
	ldr r3, [r2, #0x24]
	mov r1, r8
	subs r0, r3, r1
	ldr r3, [r2, #0x2c]
	subs r1, r3, r7
	ldr r3, _080291E4
	bl _call_via_r3
	ldrh r2, [r6]
	subs r1, r0, r2
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	ldr r1, _080291E8
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r0, sb
	ble _080290D6
	str r4, [sp, #0x20]
	mov sb, r0
_080290D6:
	adds r4, #1
	cmp r4, sl
	blt _080290A4
_080290DC:
	movs r1, #1
	ldr r0, [sp, #0x20]
	rsbs r3, r1, #0
	cmp r0, r3
	bne _080290E8
	b _08028F56
_080290E8:
	movs r3, #1
	mov fp, r3
	b _08028F56
_080290EE:
	ldr r2, _080291C8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #6
	beq _08029164
	ldr r0, [sp, #0x1c]
	adds r0, #0x98
	ldrb r1, [r2, r0]
	cmp r1, #0
	ble _0802915E
	movs r4, #0xb5
	adds r0, r2, #0
	lsls r3, r4, #4
	adds r0, #0x88
	mov sb, r3
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #0
	cmp r4, r3
	bge _0802915E
	ldr r2, [r5, #0x24]
	mov r8, r2
	ldr r2, _080291E0
	adds r6, r5, #0
	ldr r7, [r5, #0x2c]
	str r2, [sp, #0x14]
	adds r6, #0x56
	mov sl, r3
_08029126:
	ldr r1, [sp, #0x14]
	ldm r1!, {r2}
	adds r0, r1, #0
	str r0, [sp, #0x14]
	ldr r3, [r2, #0x24]
	mov r1, r8
	subs r0, r3, r1
	ldr r3, [r2, #0x2c]
	subs r1, r3, r7
	ldr r3, _080291E4
	bl _call_via_r3
	ldrh r2, [r6]
	subs r1, r0, r2
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	ldr r1, _080291E8
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r0, sb
	ble _08029158
	str r4, [sp, #0x20]
	mov sb, r0
_08029158:
	adds r4, #1
	cmp r4, sl
	blt _08029126
_0802915E:
	movs r1, #1
	mov fp, r1
	b _08028F56
_08029164:
	movs r4, #0xb5
	adds r0, r2, #0
	lsls r3, r4, #4
	adds r0, #0x88
	mov sb, r3
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #0
	cmp fp, r3
	bge _0802915E
	ldr r2, [r5, #0x24]
	mov fp, r3
	ldr r3, _080291E0
	adds r6, r5, #0
	ldr r7, [r5, #0x2c]
	mov r8, r2
	adds r6, #0x56
	mov sl, r3
_08029188:
	mov r1, sl
	ldr r2, [r1]
	ldr r3, [r2, #0x24]
	mov r1, r8
	subs r0, r3, r1
	ldr r3, [r2, #0x2c]
	subs r1, r3, r7
	ldr r3, _080291E4
	bl _call_via_r3
	ldrh r1, [r6]
	subs r2, r0, r1
	lsls r3, r2, #0x10
	asrs r0, r3, #0x10
	ldr r1, _080291E8
	bl _call_via_r1
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r0, sb
	ble _080291B6
	str r4, [sp, #0x20]
	mov sb, r0
_080291B6:
	movs r0, #4
	adds r4, #1
	add sl, r0
	cmp r4, fp
	blt _08029188
	b _0802915E
	.byte 0x00, 0x00
_080291C4:
	.4byte 0x000005DC
_080291C8:
	.4byte gGameSetup
_080291CC:
	.4byte gLocalPlayerIndex
_080291D0:
	.4byte 0x0202EC00
_080291D4:
	.4byte sub_08029E60
_080291D8:
	.4byte 0x0000062C
_080291DC:
	.4byte 0x00000825
_080291E0:
	.4byte gRacerObjects
_080291E4:
	.4byte atan2_fx
_080291E8:
	.4byte cos_fx
