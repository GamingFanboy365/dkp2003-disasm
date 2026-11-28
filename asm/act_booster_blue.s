@ asm/act_booster_blue.s: ROM 0x020AB4-0x020DDC (rom, VMA 0x08020AB4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_booster_blue
	.thumb_func
	.type init_booster_blue, %function
init_booster_blue: @ 08020AB4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08020B66
_08020ABE:
	ldr r1, _08020AE8
	movs r3, #1
	rsbs r0, r3, #0
	str r0, [r1]
	ldr r1, _08020AEC
	str r0, [r1]
	ldr r0, _08020AF0
	movs r1, #2
	ldrsh r2, [r0, r1]
	cmp r2, #0
	beq _08020B56
_08020AD4:
	cmp r2, #1
	beq _08020AF4
_08020AD8:
	adds r0, r4, #0
	bl obj_free
_08020ADE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08020AE8:
	.4byte 0x0202E430
_08020AEC:
	.4byte 0x0202E434
_08020AF0:
	.4byte gGameSetup
_08020AF4:
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r2, [r1]
	ldr r0, [r2, #0xc]
	ldr r2, [r0, #0x10]
	cmp r2, #1
	bne _08020AD8
_08020B02:
	ldr r0, _08020B3C
	strh r0, [r4]
	ldr r2, [r1]
	ldr r0, [r2, #0xc]
	ldr r3, _08020B40
	ldrb r2, [r0, #1]
	subs r0, r3, r2
	lsls r2, r0, #8
	adds r0, r4, #0
	adds r0, #0x56
	strh r2, [r0]
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #8]
	adds r0, #0x4a
	str r2, [r0]
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	movs r2, #9
	ldrsb r2, [r3, r2]
	str r2, [r0, #4]
	movs r2, #0
	str r2, [r0, #8]
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	ldrh r2, [r3, #6]
	str r2, [r0, #0xc]
	b _08020B44
	.byte 0x00, 0x00
_08020B3C:
	.4byte 0x00000001
_08020B40:
	.4byte 0x00000080
_08020B44:
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #0x14]
	str r2, [r0, #0x14]
	ldr r3, [r1]
	ldr r2, [r3, #0xc]
	ldr r1, [r2, #0x18]
	str r1, [r0, #0x18]
	b _08020ADE
_08020B56:
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r0, [r1]
	ldr r3, [r0, #0xc]
	ldr r0, [r3, #0xc]
	cmp r0, #1
	bne _08020AD4
	b _08020B02
_08020B66:
	ldr r0, _08020B80
	ldr r1, _08020B84
	str r0, [sp]
	ldr r2, _08020B88
	ldr r0, _08020B8C
	movs r3, #0x1f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020ABE
	.byte 0x00, 0x00
_08020B80:
	.4byte gUnk_08052640
_08020B84:
	.4byte gUnk_0805264C
_08020B88:
	.4byte gUnk_08052664
_08020B8C:
	.4byte gUnk_08052678

	.global act_booster_blue
	.thumb_func
	.type act_booster_blue, %function
act_booster_blue: @ 08020B90
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	sub sp, #8
	cmp r6, #0
	bne _08020B9C
	b _08020C96
_08020B9C:
	adds r5, r6, #0
	adds r5, #0xa0
	ldr r7, [r5, #8]
	cmp r7, #0
	beq _08020C2C
	ldr r1, _08020C1C
	ldr r0, [r5]
	ldr r3, [r1]
	cmp r3, r0
	beq _08020BC8
	adds r0, r6, #0
	bl obj_destroy_sprite
	adds r0, r6, #0
	bl obj_remove_static_hit
	movs r0, #0
	str r0, [r5, #8]
_08020BC0:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08020BC8:
	ldr r3, [r5, #0x10]
	cmp r3, #0
	beq _08020BC0
	subs r3, #2
	str r3, [r5, #0x10]
	cmp r3, #0
	bgt _08020BC0
	movs r3, #1
	rsbs r0, r3, #0
	movs r4, #0
	str r4, [r5, #0x10]
	str r0, [r1]
	ldr r1, _08020C20
	ldr r2, [r1]
	lsls r3, r2, #2
	ldr r2, _08020C24
	ldr r1, [r2, r3]
	ldr r3, _08020C28
	adds r1, #0xa0
	ldr r2, [r1, #4]
	ldr r1, [r3]
	cmp r2, r1
	beq _08020C06
_08020BF6:
	adds r0, r6, #0
	bl obj_destroy_sprite
	adds r0, r6, #0
	bl obj_remove_static_hit
	str r4, [r5, #8]
	b _08020BC0
_08020C06:
	movs r3, #0x80
	str r0, [sp]
	lsls r2, r3, #9
	movs r0, #0xf6
	movs r1, #0x7f
	movs r3, #1
	str r4, [sp, #4]
	bl gamesfx_play
	b _08020BF6
	.byte 0x00, 0x00
_08020C1C:
	.4byte 0x0202E430
_08020C20:
	.4byte 0x0202E434
_08020C24:
	.4byte gRacerObjects
_08020C28:
	.4byte gLocalPlayerIndex
_08020C2C:
	ldr r2, _08020C8C
	ldr r0, [r5]
	ldr r1, [r2]
	cmp r1, r0
	bne _08020BC0
	adds r0, r6, #0
	movs r1, #0x34
	movs r2, #0x13
	bl obj_setup_sprite
	adds r2, r6, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _08020C90
	adds r4, r1, r3
	ldr r1, _08020C88
	strh r1, [r4, #0xa]
	bl spr_set_shadow_size
	adds r4, r6, #0
	adds r4, #0x9c
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ldrb r2, [r1, #2]
	movs r0, #0x80
	lsls r1, r2, #8
	lsls r2, r0, #3
	str r2, [sp]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r6, #0
	bl obj_add_static_hit
	movs r0, #1
	str r0, [r5, #8]
	str r7, [r5, #0x1c]
	ldr r2, [r4]
	ldr r1, [r2, #0xc]
	ldrh r0, [r1, #4]
	str r0, [r5, #0x10]
	b _08020C94
_08020C88:
	.4byte 0x0000003C
_08020C8C:
	.4byte 0x0202E430
_08020C90:
	.4byte gSprites
_08020C94:
	b _08020BC0
_08020C96:
	ldr r0, _08020CB0
	ldr r1, _08020CB4
	str r0, [sp]
	ldr r2, _08020CB8
	ldr r0, _08020CBC
	movs r3, #0x64
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020B9C
	.byte 0x00, 0x00
_08020CB0:
	.4byte gUnk_08052640
_08020CB4:
	.4byte gUnk_0805264C
_08020CB8:
	.4byte gUnk_080526B4
_08020CBC:
	.4byte gUnk_08052678

	.global react_booster_blue
	.thumb_func
	.type react_booster_blue, %function
react_booster_blue: @ 08020CC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	cmp r0, #0
	beq _08020D96
_08020CD0:
	cmp r4, #0
	beq _08020D7E
_08020CD4:
	ldrb r7, [r4, #2]
	cmp r7, #1
	beq _08020CE6
_08020CDA:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08020CE6:
	mov r5, r8
	adds r5, #0xa0
	ldr r1, [r5, #0x1c]
	cmp r1, #0
	bne _08020CDA
	ldr r2, [r5, #0x18]
	cmp r2, #0
	beq _08020D50
	ldr r0, _08020D48
	adds r6, r4, #0
	adds r6, #0xa0
	ldr r2, [r0]
	ldr r0, [r6, #4]
	cmp r2, r0
	beq _08020D0C
	ldr r3, _08020D4C
	ldr r0, [r3]
	cmp r2, r0
	beq _08020D2C
_08020D0C:
	movs r0, #0x88
	ldr r2, _08020D44
	lsls r1, r0, #1
	adds r0, r4, r1
	strh r2, [r0]
	mov r1, r8
	adds r0, r4, #0
	bl player_touch_booster_blue
	movs r1, #1
	str r1, [r5, #0x1c]
	ldr r0, [r5, #4]
	ldr r1, [r6, #4]
	bl booster_blue_set
	b _08020CDA
_08020D2C:
	movs r0, #1
	rsbs r2, r0, #0
	movs r3, #0x80
	str r2, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r0, #0xf6
	movs r1, #0x7f
	movs r3, #1
	bl gamesfx_play
	b _08020D0C
_08020D44:
	.4byte 0x00000000
_08020D48:
	.4byte 0x0202E434
_08020D4C:
	.4byte gLocalPlayerIndex
_08020D50:
	adds r6, r4, #0
	ldr r2, _08020DB0
	adds r6, #0xa0
	ldr r0, [r2]
	ldr r1, [r6, #4]
	cmp r0, r1
	bne _08020CDA
	movs r1, #0x88
	lsls r2, r1, #1
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	mov r1, r8
	bl player_touch_booster_blue
	str r7, [r5, #0x1c]
	ldr r0, [r5, #4]
	ldr r1, [r6, #4]
	bl booster_blue_set
	b _08020CDA
_08020D7E:
	ldr r0, _08020DB4
	ldr r1, _08020DB8
	str r0, [sp]
	ldr r2, _08020DBC
	ldr r0, _08020DC0
	movs r3, #0xd7
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020CD4
_08020D96:
	ldr r0, _08020DC4
	ldr r1, _08020DB8
	str r0, [sp]
	ldr r2, _08020DBC
	ldr r0, _08020DC0
	movs r3, #0xd6
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020CD0
	.byte 0x00, 0x00
_08020DB0:
	.4byte 0x0202E434
_08020DB4:
	.4byte gUnk_080526C8
_08020DB8:
	.4byte gUnk_0805264C
_08020DBC:
	.4byte gUnk_080526D4
_08020DC0:
	.4byte gUnk_08052678
_08020DC4:
	.4byte gUnk_08052640

	.global booster_blue_set
	.thumb_func
	.type booster_blue_set, %function
booster_blue_set: @ 08020DC8
	ldr r2, _08020DD4
	str r0, [r2]
	ldr r0, _08020DD8
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_08020DD4:
	.4byte 0x0202E430
_08020DD8:
	.4byte 0x0202E434
