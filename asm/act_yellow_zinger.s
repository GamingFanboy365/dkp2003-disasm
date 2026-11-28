@ asm/act_yellow_zinger.s: ROM 0x02AD54-0x02B658 (rom, VMA 0x0802AD54)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global destroy_yellow_zinger
	.thumb_func
	.type destroy_yellow_zinger, %function
destroy_yellow_zinger: @ 0802AD54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r3, #0xa0
	adds r0, r3, r6
	movs r2, #2
	str r2, [r0]
	adds r5, r6, #0
	adds r5, #0x5a
	mov sb, r0
	ldrh r0, [r5]
	movs r4, #0x18
	muls r0, r4, r0
	adds r7, r1, #0
	ldr r1, _0802AE60
	mov sl, r1
	add r0, sl
	ldrh r3, [r0, #0xa]
	adds r0, r6, #0
	mov r8, r3
	sub sp, #4
	bl obj_destroy_sprite
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x23
	bl obj_setup_sprite
	ldrh r0, [r5]
	muls r0, r4, r0
	mov r1, r8
	add r0, sl
	strh r1, [r0, #0xa]
	cmp r7, #0
	beq _0802AE56
	ldr r2, [r7, #0x3c]
	str r2, [r6, #0x3c]
	ldr r0, [r7, #0x40]
	str r0, [r6, #0x40]
	ldr r1, [r7, #0x44]
	str r1, [r6, #0x44]
_0802ADAC:
	adds r0, r6, #0
	bl obj_remove_vector_hit
	ldr r1, _0802AE64
	mov r0, sb
	ldr r3, [r1]
	ldr r7, [r0, #0x40]
	cmp r3, r7
	beq _0802AE46
_0802ADBE:
	ldr r1, _0802AE68
	ldr r3, [r1]
	adds r7, r1, #0
	cmp r3, #0
	ble _0802ADF2
	movs r4, #0
	movs r2, #0
	cmp r4, r3
	bge _0802ADE8
	ldr r0, _0802AE6C
	adds r5, r1, #0
	mov ip, r2
_0802ADD6:
	lsls r3, r2, #2
	ldr r3, [r0, r3]
	cmp r3, r6
	beq _0802AE1A
_0802ADDE:
	ldr r3, [r1]
	adds r2, #1
	adds r7, r1, #0
	cmp r2, r3
	blt _0802ADD6
_0802ADE8:
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	cmp r4, #0
	beq _0802AE02
_0802ADF2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802AE02:
	ldr r1, _0802AE70
	ldr r0, _0802AE74
	str r1, [sp]
	ldr r2, _0802AE78
	ldr r1, _0802AE7C
	movs r3, #0xad
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802ADF2
_0802AE1A:
	ldr r4, [r5]
	subs r4, #1
	adds r1, r2, #0
	cmp r2, r4
	bge _0802AE36
_0802AE24:
	lsls r4, r1, #2
	adds r3, r4, #4
	ldr r2, [r0, r3]
	str r2, [r0, r4]
	ldr r2, [r7]
	adds r1, #1
	subs r2, #1
	cmp r1, r2
	blt _0802AE24
_0802AE36:
	ldr r2, [r5]
	lsls r7, r2, #2
	mov r1, ip
	subs r7, #4
	str r1, [r0, r7]
	ldr r1, _0802AE68
	movs r4, #1
	b _0802ADDE
_0802AE46:
	movs r2, #1
	rsbs r0, r2, #0
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0xd8
	bl gamesfx_stop
	b _0802ADBE
_0802AE56:
	str r7, [r6, #0x3c]
	str r7, [r6, #0x40]
	str r7, [r6, #0x44]
	b _0802ADAC
	.byte 0x00, 0x00
_0802AE60:
	.4byte gSprites
_0802AE64:
	.4byte 0x0202EC40
_0802AE68:
	.4byte 0x0202EC38
_0802AE6C:
	.4byte 0x0202EC10
_0802AE70:
	.4byte gUnk_08052F3C
_0802AE74:
	.4byte gUnk_08052F44
_0802AE78:
	.4byte gUnk_08052F80
_0802AE7C:
	.4byte gUnk_08052F98

	.global sub_0802AE80
	.thumb_func
	.type sub_0802AE80, %function
sub_0802AE80: @ 0802AE80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x56
	movs r1, #0
	ldrsh r5, [r2, r1]
	ldr r4, _0802AF30
	adds r0, r5, #0
	bl _call_via_r4
	adds r7, r0, #0
	lsls r0, r7, #0x10
	ldr r2, _0802AF34
	asrs r7, r0, #0x10
	adds r0, r5, #0
	bl _call_via_r2
	movs r1, #0xfa
	lsls r3, r0, #0x10
	asrs r5, r3, #0x10
	lsls r2, r1, #2
	adds r1, r5, #0
	muls r1, r2, r1
	movs r0, #0x15
	asrs r5, r1, #0xc
	muls r7, r2, r7
	bl obj_new
	ldr r1, [r6, #0x24]
	asrs r4, r7, #0xc
	subs r2, r1, r5
	adds r7, r0, #0
	str r2, [r7, #0x24]
	ldr r1, [r6, #0x28]
	str r1, [r7, #0x28]
	ldr r5, [r6, #0x2c]
	subs r2, r5, r4
	adds r4, r6, #0
	str r2, [r7, #0x2c]
	movs r1, #0
	adds r4, #0xa0
	bl obj_initialise
	ldr r0, [r4, #4]
	movs r1, #0xa0
	adds r2, r1, r7
	str r0, [r2, #8]
	adds r0, r7, #0
	adds r0, #0x90
	str r6, [r0]
	ldr r5, _0802AF38
	ldr r1, [r5]
	mov r8, r2
	cmp r1, #9
	ble _0802AEFE
	ldr r1, _0802AF3C
	ldr r0, [r1]
	movs r1, #0
	bl destroy_yellow_zinger
	ldr r1, [r5]
_0802AEFE:
	ldr r2, _0802AF3C
	lsls r0, r1, #2
	str r7, [r2, r0]
	adds r2, r1, #1
	str r2, [r5]
	ldr r3, _0802AF40
	ldr r1, [r4]
	ands r1, r3
	str r1, [r4]
	ldr r2, _0802AF44
	ldr r0, [r2]
	mov r1, r8
	str r0, [r1, #0x40]
	adds r0, #1
	str r0, [r2]
	cmp r0, #0
	blt _0802AF2A
_0802AF20:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802AF2A:
	movs r1, #0
	str r1, [r2]
	b _0802AF20
_0802AF30:
	.4byte cos_fx
_0802AF34:
	.4byte sin_fx
_0802AF38:
	.4byte 0x0202EC38
_0802AF3C:
	.4byte 0x0202EC10
_0802AF40:
	.4byte 0xFFFFF3FF
_0802AF44:
	.4byte 0x0202EC3C

	.global init_yellow_zinger
	.thumb_func
	.type init_yellow_zinger, %function
init_yellow_zinger: @ 0802AF48
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802AFDA
_0802AF52:
	ldr r0, _0802AF8C
	movs r1, #0x36
	strh r0, [r4]
	movs r2, #0x13
	adds r0, r4, #0
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _0802AF94
	adds r5, r1, r3
	ldr r1, _0802AF90
	adds r4, #0xa0
	strh r1, [r5, #0xa]
	movs r5, #0
	bl spr_set_shadow_size
	str r5, [r4]
	str r5, [r4, #4]
	str r5, [r4, #0xc]
	str r5, [r4, #0x34]
	bl multi_lfsr_next
	lsrs r1, r0, #0xc
	str r1, [r4, #0x1c]
	b _0802AF98
_0802AF8C:
	.4byte 0x00000001
_0802AF90:
	.4byte 0x00000008
_0802AF94:
	.4byte gSprites
_0802AF98:
	bl multi_lfsr_next
	lsrs r3, r0, #0xc
	str r3, [r4, #0x20]
	bl multi_lfsr_next
	lsrs r2, r0, #0xc
	str r2, [r4, #0x24]
	bl multi_lfsr_next
	lsrs r1, r0, #7
	str r1, [r4, #0x28]
	bl multi_lfsr_next
	lsrs r3, r0, #7
	str r3, [r4, #0x2c]
	bl multi_lfsr_next
	lsrs r2, r0, #7
	str r2, [r4, #0x30]
	ldr r1, _0802AFF4
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #3
	beq _0802AFD4
	str r5, [r4, #0x4c]
_0802AFCC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_0802AFD4:
	movs r1, #0x3c
	str r1, [r4, #0x4c]
	b _0802AFCC
_0802AFDA:
	ldr r0, _0802AFF8
	ldr r1, _0802AFFC
	str r0, [sp]
	ldr r2, _0802B000
	ldr r0, _0802B004
	movs r3, #0xf3
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802AF52
	.byte 0x00, 0x00
_0802AFF4:
	.4byte gGameSetup
_0802AFF8:
	.4byte gUnk_08052FB0
_0802AFFC:
	.4byte gUnk_08052F98
_0802B000:
	.4byte gUnk_08052FBC
_0802B004:
	.4byte gUnk_08052F44

	.global act_yellow_zinger
	.thumb_func
	.type act_yellow_zinger, %function
act_yellow_zinger: @ 0802B008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0x14
	cmp r7, #0
	bne _0802B01C
	b _0802B418
_0802B01C:
	adds r1, r7, #0
	adds r6, r7, #0
	adds r1, #0x5a
	adds r6, #0xa0
	ldrh r3, [r1]
	ldr r4, [r6]
	mov sb, r3
	cmp r4, #1
	bne _0802B030
	b _0802B2C6
_0802B030:
	cmp r4, #1
	ble _0802B036
	b _0802B272
_0802B036:
	cmp r4, #0
	bne _0802B03C
	b _0802B18C
_0802B03C:
	movs r3, #0x84
	movs r2, #0x88
	adds r0, r3, r7
	adds r1, r2, r7
	adds r5, r7, #0
	mov sl, r0
	mov r8, r1
_0802B04A:
	adds r5, #0x8c
_0802B04C:
	ldr r2, [r7, #0x24]
	mov r1, sl
	str r2, [r1]
	ldr r1, [r7, #0x28]
	mov r2, r8
	str r1, [r2]
	ldr r0, [r7, #0x2c]
	str r0, [r5]
	ldr r2, [r7, #0x24]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x28]
	str r2, [r7, #0x30]
	adds r2, r2, r3
	ldr r3, [r7, #0x40]
	str r2, [r7, #0x24]
	adds r2, r1, r3
	ldr r0, [r7, #0x2c]
	str r2, [r7, #0x28]
	ldr r2, [r7, #0x44]
	str r1, [r7, #0x34]
	adds r1, r0, r2
	str r1, [r7, #0x2c]
	str r0, [r7, #0x38]
	ldr r2, _0802B3D4
	adds r0, r7, #0
	bl _call_via_r2
	mov r0, sb
	bl spr_set_shadow_size
	ldr r1, [r6]
	cmp r1, #1
	beq _0802B09E
_0802B08E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802B09E:
	ldr r1, _0802B3D8
	adds r1, #0x8c
	ldr r0, [r1]
	cmp r0, #7
	beq _0802B0C2
	ldr r1, _0802B3DC
	ldr r0, [r6, #0x40]
	ldr r3, [r1]
	cmp r3, r0
	bne _0802B08E
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r7, #0
	str r2, [r1]
	adds r0, #0xd8
	bl gamesfx_stop
	b _0802B08E
_0802B0C2:
	ldr r2, [r7, #0x24]
	ldr r4, _0802B3E0
	movs r3, #0xa0
	adds r0, r2, r4
	lsls r4, r3, #7
	ldr r3, _0802B3E4
	adds r1, r2, r4
	ldr r2, [r3]
	ldr r3, _0802B3E8
	ldr r3, [r3]
	bl sub_0802C42C
	str r0, [r6, #0x44]
	ldr r3, [r7, #0x2c]
	ldr r1, _0802B3E0
	adds r0, r3, r1
	adds r1, r3, r4
	ldr r3, _0802B3EC
	ldr r2, [r3]
	ldr r3, _0802B3F0
	ldr r3, [r3]
	bl sub_0802C42C
	ldr r1, _0802B3F4
	str r0, [r6, #0x48]
	ldr r2, [r1]
	lsls r3, r2, #2
	ldr r2, _0802B3F8
	ldr r1, [r2, r3]
	ldr r3, [r6, #0x44]
	ldr r2, [r1, #0x64]
	ands r3, r2
	cmp r3, #0
	beq _0802B170
	ldr r2, [r1, #0x68]
	ands r2, r0
	cmp r2, #0
	beq _0802B170
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
	movs r2, #0x80
	asrs r0, r1, #0xc
	lsls r1, r2, #9
	str r0, [r6, #0x3c]
	cmp r0, r1
	bhi _0802B170
	ldr r2, _0802B3DC
	movs r0, #1
	ldr r3, [r2]
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0802B08E
	ldr r0, [r6, #0x40]
	str r0, [r2]
	movs r0, #0x7f
	str r0, [sp]
	str r1, [sp, #4]
	movs r2, #2
	movs r0, #0xa
	movs r1, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, _0802B3FC
	ldr r1, _0802B400
	adds r2, r7, #0
	movs r3, #0x9c
	bl gamesfx_play_cb
	str r0, [r6, #0x38]
	b _0802B08E
_0802B170:
	ldr r1, _0802B3DC
	ldr r0, [r6, #0x40]
	ldr r3, [r1]
	cmp r3, r0
	beq _0802B17C
	b _0802B08E
_0802B17C:
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r7, #0
	str r2, [r1]
	adds r0, #0xd8
	bl gamesfx_stop
	b _0802B08E
_0802B18C:
	movs r0, #0x18
	mov r5, sb
	muls r5, r0, r5
	ldr r2, _0802B404
	adds r5, #8
	adds r1, r5, r2
	ldrh r0, [r1, #2]
	movs r5, #0x9c
	adds r0, #4
	strh r0, [r1, #2]
	lsls r2, r0, #0x10
	lsls r1, r5, #0xe
	cmp r2, r1
	bhi _0802B1CC
	ldr r0, [r6, #8]
	ldr r5, _0802B3F8
	lsls r2, r0, #2
	ldr r0, [r5, r2]
	ldr r1, [r0, #0x3c]
	str r1, [r7, #0x3c]
	ldr r5, [r0, #0x40]
	str r5, [r7, #0x40]
	ldr r1, [r0, #0x44]
	movs r5, #0x84
	movs r3, #0x88
	str r1, [r7, #0x44]
	adds r2, r3, r7
	adds r1, r5, r7
	adds r5, r7, #0
	mov sl, r1
	mov r8, r2
	b _0802B04A
_0802B1CC:
	movs r5, #1
	movs r2, #0x14
	movs r0, #0x84
	str r5, [r6]
	str r2, [r6, #4]
	adds r3, r0, r7
	ldr r1, [r7, #0x24]
	mov sl, r3
	mov r0, sl
	str r1, [r7, #0x30]
	str r4, [r7, #0x3c]
	str r4, [r7, #0x40]
	str r4, [r7, #0x44]
	str r1, [r0]
	ldr r5, [r7, #0x28]
	movs r3, #0x88
	adds r1, r3, r7
	str r5, [r7, #0x34]
	str r5, [r1]
	ldr r2, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x8c
	str r2, [r7, #0x38]
	str r2, [r5]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x10]
	mov r8, r1
	ldr r1, [r7, #0x28]
	str r1, [r6, #0x14]
	ldr r2, [r7, #0x2c]
	movs r0, #0x80
	lsls r1, r0, #3
	movs r3, #0xa0
	str r2, [r6, #0x18]
	adds r0, r7, #0
	str r1, [sp]
	movs r2, #0
	lsls r1, r3, #3
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r7, #0
	bl obj_add_vector_hit
	ldr r2, _0802B3F4
	ldr r0, [r6, #8]
	ldr r1, [r2]
	cmp r0, r1
	beq _0802B252
_0802B22E:
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
	b _0802B04C
_0802B252:
	ldr r0, _0802B3D8
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #7
	bne _0802B22E
	movs r2, #0xa
	movs r3, #0x80
	str r2, [sp]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0x9b
	movs r3, #1
	str r4, [sp, #4]
	bl gamesfx_play
	b _0802B04C
_0802B272:
	cmp r4, #2
	beq _0802B286
	movs r5, #0x88
	movs r0, #0x84
	adds r3, r5, r7
	adds r2, r0, r7
	adds r5, r7, #0
	mov sl, r2
	mov r8, r3
	b _0802B04A
_0802B286:
	movs r0, #0x18
	mov r1, sb
	muls r1, r0, r1
	ldr r2, _0802B404
	adds r1, #8
	adds r0, r1, r2
	ldrh r1, [r0, #2]
	adds r1, #8
	strh r1, [r0, #2]
	ldrh r3, [r0]
	ldr r1, _0802B408
	ands r1, r3
	lsls r0, r1, #5
	ldr r2, _0802B40C
	adds r0, #0x18
	ldr r1, [r2, r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0802B2B6
	adds r0, r7, #0
	bl obj_free
	b _0802B08E
_0802B2B6:
	movs r0, #0x84
	movs r5, #0x88
	adds r3, r0, r7
	adds r0, r5, r7
	adds r5, r7, #0
	mov sl, r3
	mov r8, r0
	b _0802B04A
_0802B2C6:
	ldr r3, [r6, #0x34]
	cmp r3, #0xff
	bgt _0802B2D0
	adds r3, #8
	str r3, [r6, #0x34]
_0802B2D0:
	ldr r2, [r6, #0xc]
	ldr r0, [r6, #0x28]
	mov sl, r2
	mov r2, sl
	muls r2, r0, r2
	lsls r4, r2, #0x10
	asrs r0, r4, #0x10
	ldr r4, _0802B410
	bl _call_via_r4
	ldr r1, [r6, #0x1c]
	lsls r3, r0, #0x10
	ldr r0, [r6, #0x2c]
	asrs r5, r3, #0x10
	adds r2, r1, #0
	muls r2, r5, r2
	mov r1, sl
	muls r1, r0, r1
	asrs r5, r2, #4
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	bl _call_via_r4
	ldr r1, [r6, #0x20]
	lsls r3, r0, #0x10
	ldr r0, [r6, #0x30]
	asrs r4, r3, #0x10
	adds r2, r1, #0
	muls r2, r4, r2
	mov r1, sl
	muls r1, r0, r1
	asrs r4, r2, #4
	lsls r2, r1, #0x10
	asrs r0, r2, #0x10
	ldr r1, _0802B414
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	ldr r3, [r6, #0x24]
	adds r1, r3, #0
	muls r1, r2, r1
	ldr r3, [r6, #0x10]
	asrs r0, r1, #4
	adds r1, r5, r3
	ldr r3, [r7, #0x24]
	subs r5, r1, r3
	str r5, [r7, #0x3c]
	ldr r3, [r6, #0x14]
	adds r1, r4, r3
	ldr r3, [r7, #0x28]
	subs r4, r1, r3
	str r4, [r7, #0x40]
	ldr r3, [r6, #0x18]
	adds r1, r0, r3
	ldr r3, [r7, #0x2c]
	subs r0, r1, r3
	str r0, [r7, #0x44]
	ldr r1, [r6, #0x34]
	muls r1, r5, r1
	asrs r5, r1, #8
	str r5, [r7, #0x3c]
	ldr r1, [r6, #0x34]
	muls r1, r4, r1
	asrs r5, r1, #8
	str r5, [r7, #0x40]
	ldr r1, [r6, #0x34]
	muls r1, r0, r1
	asrs r5, r1, #8
	str r5, [r7, #0x44]
	ldr r2, [r6, #0xc]
	adds r2, #2
	str r2, [r6, #0xc]
	ldr r0, [r7, #0x40]
	ldr r2, [r7, #0x28]
	movs r1, #0x96
	adds r5, r2, r0
	lsls r0, r1, #2
	cmp r5, r0
	bge _0802B376
	adds r1, r0, #0
	subs r5, r1, r2
	str r5, [r7, #0x40]
_0802B376:
	ldr r3, [r6, #4]
	cmp r3, #0
	beq _0802B384
	subs r2, r3, #2
	str r2, [r6, #4]
	cmp r2, #0
	beq _0802B3CA
_0802B384:
	ldr r3, [r6, #0x4c]
	cmp r3, #0
	beq _0802B3BA
	subs r3, #2
	str r3, [r6, #0x4c]
	cmp r3, #0
	ble _0802B3A2
	movs r2, #0x84
	movs r3, #0x88
	adds r1, r2, r7
	adds r5, r7, #0
	adds r2, r3, r7
	mov sl, r1
	mov r8, r2
	b _0802B04A
_0802B3A2:
	movs r1, #0
	adds r0, r7, #0
	bl destroy_yellow_zinger
	movs r2, #0x84
	movs r3, #0x88
	adds r1, r2, r7
	adds r5, r7, #0
	adds r2, r3, r7
	mov sl, r1
	mov r8, r2
	b _0802B04A
_0802B3BA:
	movs r5, #0x88
	movs r1, #0x84
	adds r0, r5, r7
	adds r3, r1, r7
	adds r5, r7, #0
	mov sl, r3
	mov r8, r0
	b _0802B04A
_0802B3CA:
	adds r0, r7, #0
	adds r0, #0x90
	str r2, [r0]
	str r2, [r6, #4]
	b _0802B384
_0802B3D4:
	.4byte sub_03003750
_0802B3D8:
	.4byte gGameSetup
_0802B3DC:
	.4byte 0x0202EC40
_0802B3E0:
	.4byte 0xFFFFB000
_0802B3E4:
	.4byte 0x02004284
_0802B3E8:
	.4byte 0x0200428C
_0802B3EC:
	.4byte 0x02004290
_0802B3F0:
	.4byte 0x02004298
_0802B3F4:
	.4byte gLocalPlayerIndex
_0802B3F8:
	.4byte gRacerObjects
_0802B3FC:
	.4byte sub_0802B59C
_0802B400:
	.4byte yellow_zinger_sfx_pitch_cb
_0802B404:
	.4byte gSprites
_0802B408:
	.4byte 0x00007FFF
_0802B40C:
	.4byte gAnims
_0802B410:
	.4byte sin_fx
_0802B414:
	.4byte cos_fx
_0802B418:
	ldr r0, _0802B434
	movs r4, #0x91
	str r0, [sp]
	ldr r1, _0802B438
	ldr r0, _0802B43C
	ldr r2, _0802B440
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802B01C
	.byte 0x00, 0x00
_0802B434:
	.4byte gUnk_08052FB0
_0802B438:
	.4byte gUnk_08052F98
_0802B43C:
	.4byte gUnk_08052F44
_0802B440:
	.4byte gUnk_08052FD0

	.global react_yellow_zinger
	.thumb_func
	.type react_yellow_zinger, %function
react_yellow_zinger: @ 0802B444
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #0x14
	adds r5, r1, #0
	cmp r4, #0
	beq _0802B508
_0802B450:
	cmp r5, #0
	beq _0802B4F0
_0802B454:
	ldrb r2, [r5, #2]
	adds r2, #0xff
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r1, r2, #0x11
	cmp r0, r1
	bhi _0802B4C4
	adds r0, r4, #0
	adds r1, r5, #0
	bl destroy_yellow_zinger
	adds r1, r5, #0
	ldr r2, _0802B520
	adds r1, #0xa0
	ldr r0, [r1, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _0802B4A2
_0802B478:
	movs r3, #0x7f
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
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	movs r3, #0xe8
	bl gamesfx_play_at
_0802B49A:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
_0802B4A2:
	ldr r2, _0802B524
	adds r2, #0x8c
	ldr r0, [r2]
	cmp r0, #7
	bne _0802B478
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xe8
	bl gamesfx_play
	b _0802B49A
_0802B4C4:
	adds r0, r4, #0
	movs r1, #0
	bl destroy_yellow_zinger
	movs r3, #0x7f
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
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	movs r3, #0xe8
	bl gamesfx_play_at
	b _0802B49A
_0802B4F0:
	ldr r0, _0802B528
	ldr r1, _0802B52C
	str r0, [sp]
	ldr r2, _0802B530
	ldr r0, _0802B534
	ldr r3, _0802B538
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802B454
_0802B508:
	ldr r0, _0802B53C
	ldr r1, _0802B52C
	str r0, [sp]
	ldr r2, _0802B530
	ldr r0, _0802B534
	ldr r3, _0802B540
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802B450
_0802B520:
	.4byte gLocalPlayerIndex
_0802B524:
	.4byte gGameSetup
_0802B528:
	.4byte gUnk_08052FE4
_0802B52C:
	.4byte gUnk_08052F98
_0802B530:
	.4byte gUnk_08052FF0
_0802B534:
	.4byte gUnk_08052F44
_0802B538:
	.4byte 0x00000206
_0802B53C:
	.4byte gUnk_08052FB0
_0802B540:
	.4byte 0x00000205

	.global sub_0802B544
	.thumb_func
	.type sub_0802B544, %function
sub_0802B544: @ 0802B544
	push {lr}
	ldr r2, _0802B568
	movs r1, #0
	movs r3, #9
_0802B54C:
	subs r3, #1
	stm r2!, {r1}
	cmp r3, #0
	bge _0802B54C
	ldr r0, _0802B56C
	ldr r2, _0802B570
	movs r1, #0
	str r1, [r2]
	str r1, [r0]
	ldr r0, _0802B574
	subs r1, #1
	str r1, [r0]
	pop {r0}
	bx r0
_0802B568:
	.4byte 0x0202EC10
_0802B56C:
	.4byte 0x0202EC38
_0802B570:
	.4byte 0x0202EC3C
_0802B574:
	.4byte 0x0202EC40

	.global yellow_zinger_sfx_pitch_cb
	.thumb_func
	.type yellow_zinger_sfx_pitch_cb, %function
yellow_zinger_sfx_pitch_cb: @ 0802B578
	push {lr}
	ldr r2, _0802B594
	adds r1, r0, #0
	ldr r0, [r2]
	ldr r2, _0802B598
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	movs r3, #0x80
	lsls r2, r3, #9
	bl sub_08020130
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_0802B594:
	.4byte gLocalPlayerIndex
_0802B598:
	.4byte gRacerObjects

	.global sub_0802B59C
	.thumb_func
	.type sub_0802B59C, %function
sub_0802B59C: @ 0802B59C
	adds r0, #0xa0
	ldr r2, [r0, #0x3c]
	movs r0, #0x80
	lsls r1, r0, #9
	subs r0, r1, r2
	lsls r2, r0, #7
	subs r1, r2, r0
	asrs r0, r1, #0x10
	bx lr
	.byte 0xC0, 0x46

	.global sub_0802B5B0
	.thumb_func
	.type sub_0802B5B0, %function
sub_0802B5B0: @ 0802B5B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x56
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldr r4, _0802B648
	adds r0, r5, #0
	sub sp, #8
	bl _call_via_r4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	ldr r2, _0802B64C
	asrs r4, r0, #0x10
	adds r0, r5, #0
	bl _call_via_r2
	movs r1, #0xfa
	lsls r3, r0, #0x10
	asrs r5, r3, #0x10
	lsls r2, r1, #3
	adds r1, r5, #0
	muls r1, r2, r1
	movs r0, #0x22
	asrs r5, r1, #0xc
	muls r4, r2, r4
	bl obj_new
	ldr r1, [r6, #0x24]
	adds r2, r1, r5
	str r2, [r0, #0x24]
	ldr r1, [r6, #0x28]
	str r1, [r0, #0x28]
	ldr r2, [r6, #0x2c]
	asrs r4, r4, #0xc
	adds r1, r2, r4
	str r1, [r0, #0x2c]
	adds r4, r6, #0
	adds r4, #0xa0
	ldr r2, [r4, #4]
	adds r1, r0, #0
	adds r1, #0xa0
	str r2, [r1, #8]
	adds r1, r0, #0
	adds r1, #0x90
	str r6, [r1]
	movs r1, #0
	bl obj_initialise
	ldr r2, _0802B650
	ldr r1, [r4, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _0802B624
_0802B61C:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0802B624:
	ldr r1, _0802B654
	adds r1, #0x8c
	ldr r2, [r1]
	cmp r2, #7
	bne _0802B61C
	movs r2, #0xa
	movs r0, #0
	movs r3, #0x80
	str r2, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r0, #0xca
	movs r1, #0x7f
	movs r3, #1
	bl gamesfx_play
	b _0802B61C
	.byte 0x00, 0x00
_0802B648:
	.4byte cos_fx
_0802B64C:
	.4byte sin_fx
_0802B650:
	.4byte gLocalPlayerIndex
_0802B654:
	.4byte gGameSetup
