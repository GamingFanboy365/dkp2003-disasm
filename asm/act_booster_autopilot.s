@ asm/act_booster_autopilot.s: ROM 0x020DDC-0x0210A0 (rom, VMA 0x08020DDC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_booster_autopilot
	.thumb_func
	.type init_booster_autopilot, %function
init_booster_autopilot: @ 08020DDC
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08020E68
_08020DE6:
	ldr r1, _08020E4C
	movs r3, #1
	rsbs r0, r3, #0
	str r0, [r1]
	ldr r1, _08020E50
	str r0, [r1]
	ldr r0, _08020E54
	movs r1, #2
	ldrsh r2, [r0, r1]
	cmp r2, #0
	beq _08020E58
_08020DFC:
	cmp r2, #1
	beq _08020E0E
_08020E00:
	adds r0, r4, #0
	bl obj_free
_08020E06:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08020E0E:
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r2, [r1]
	ldr r0, [r2, #0xc]
	ldr r2, [r0, #0xc]
	cmp r2, #1
	bne _08020E00
_08020E1C:
	ldr r0, _08020E44
	strh r0, [r4]
	ldr r2, [r1]
	ldr r0, [r2, #0xc]
	ldr r3, _08020E48
	ldrb r2, [r0, #1]
	subs r0, r3, r2
	lsls r2, r0, #8
	adds r0, r4, #0
	adds r0, #0x56
	strh r2, [r0]
	adds r0, #0x4a
	movs r2, #0
	str r2, [r0, #4]
	ldr r3, [r1]
	ldr r2, [r3, #0xc]
	ldrb r1, [r2, #6]
	str r1, [r0]
	b _08020E06
	.byte 0x00, 0x00
_08020E44:
	.4byte 0x00000001
_08020E48:
	.4byte 0x00000080
_08020E4C:
	.4byte 0x0202E438
_08020E50:
	.4byte 0x0202E43C
_08020E54:
	.4byte gGameSetup
_08020E58:
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r0, [r1]
	ldr r3, [r0, #0xc]
	ldr r0, [r3, #8]
	cmp r0, #1
	bne _08020DFC
	b _08020E1C
_08020E68:
	ldr r0, _08020E80
	ldr r1, _08020E84
	str r0, [sp]
	ldr r2, _08020E88
	ldr r0, _08020E8C
	movs r3, #0x1f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020DE6
_08020E80:
	.4byte gUnk_080526E8
_08020E84:
	.4byte gUnk_080526F4
_08020E88:
	.4byte gUnk_08052710
_08020E8C:
	.4byte gUnk_08052728

	.global act_booster_autopilot
	.thumb_func
	.type act_booster_autopilot, %function
act_booster_autopilot: @ 08020E90
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	sub sp, #8
	cmp r6, #0
	bne _08020E9C
	b _08020F96
_08020E9C:
	adds r5, r6, #0
	adds r5, #0xa0
	ldr r7, [r5, #4]
	cmp r7, #0
	beq _08020F2C
	ldr r1, _08020F1C
	ldr r0, [r5]
	ldr r3, [r1]
	cmp r3, r0
	beq _08020EC8
	adds r0, r6, #0
	bl obj_destroy_sprite
	adds r0, r6, #0
	bl obj_remove_static_hit
	movs r0, #0
	str r0, [r5, #4]
_08020EC0:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08020EC8:
	ldr r3, [r5, #8]
	cmp r3, #0
	beq _08020EC0
	subs r3, #2
	str r3, [r5, #8]
	cmp r3, #0
	bgt _08020EC0
	movs r3, #1
	rsbs r0, r3, #0
	movs r4, #0
	str r4, [r5, #8]
	str r0, [r1]
	ldr r1, _08020F20
	ldr r2, [r1]
	lsls r3, r2, #2
	ldr r2, _08020F24
	ldr r1, [r2, r3]
	ldr r3, _08020F28
	adds r1, #0xa0
	ldr r2, [r1, #4]
	ldr r1, [r3]
	cmp r2, r1
	beq _08020F06
_08020EF6:
	adds r0, r6, #0
	bl obj_destroy_sprite
	adds r0, r6, #0
	bl obj_remove_static_hit
	str r4, [r5, #4]
	b _08020EC0
_08020F06:
	movs r3, #0x80
	str r0, [sp]
	lsls r2, r3, #9
	movs r0, #0xf6
	movs r1, #0x7f
	movs r3, #1
	str r4, [sp, #4]
	bl gamesfx_play
	b _08020EF6
	.byte 0x00, 0x00
_08020F1C:
	.4byte 0x0202E438
_08020F20:
	.4byte 0x0202E43C
_08020F24:
	.4byte gRacerObjects
_08020F28:
	.4byte gLocalPlayerIndex
_08020F2C:
	ldr r2, _08020F8C
	ldr r0, [r5]
	ldr r1, [r2]
	cmp r1, r0
	bne _08020EC0
	adds r0, r6, #0
	movs r1, #0x35
	movs r2, #0x13
	bl obj_setup_sprite
	adds r2, r6, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _08020F90
	adds r4, r1, r3
	ldr r1, _08020F88
	strh r1, [r4, #0xa]
	bl sub_08002FE0
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
	bl sub_08001C28
	adds r0, r6, #0
	bl obj_add_static_hit
	movs r0, #1
	str r0, [r5, #4]
	str r7, [r5, #0xc]
	ldr r2, [r4]
	ldr r1, [r2, #0xc]
	ldrh r0, [r1, #4]
	str r0, [r5, #8]
	b _08020F94
_08020F88:
	.4byte 0x0000003C
_08020F8C:
	.4byte 0x0202E438
_08020F90:
	.4byte 0x02018F34
_08020F94:
	b _08020EC0
_08020F96:
	ldr r0, _08020FB0
	ldr r1, _08020FB4
	str r0, [sp]
	ldr r2, _08020FB8
	ldr r0, _08020FBC
	movs r3, #0x51
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020E9C
	.byte 0x00, 0x00
_08020FB0:
	.4byte gUnk_080526E8
_08020FB4:
	.4byte gUnk_080526F4
_08020FB8:
	.4byte gUnk_08052764
_08020FBC:
	.4byte gUnk_08052728

	.global react_booster_autopilot
	.thumb_func
	.type react_booster_autopilot, %function
react_booster_autopilot: @ 08020FC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	sub sp, #8
	adds r4, r1, #0
	cmp r5, #0
	beq _08021054
_08020FCC:
	cmp r4, #0
	beq _0802103C
_08020FD0:
	ldrb r1, [r4, #2]
	cmp r1, #1
	beq _08020FDE
_08020FD6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08020FDE:
	adds r6, r5, #0
	adds r6, #0xa0
	ldr r2, [r6, #0xc]
	cmp r2, #0
	bne _08020FD6
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r2, [r0]
	movs r3, #0xc8
	lsls r1, r3, #1
	ands r2, r1
	cmp r2, #0
	bne _08020FD6
	ldr r3, _0802106C
	ldr r1, [r3]
	ldr r3, [r0, #4]
	cmp r1, r3
	beq _0802100A
	ldr r3, _08021070
	ldr r0, [r3]
	cmp r1, r0
	beq _08021024
_0802100A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl player_touch_booster_autopilot
	ldr r1, _08021074
	movs r3, #1
	rsbs r0, r3, #0
	movs r2, #1
	str r2, [r6, #0xc]
	str r0, [r1]
	ldr r1, _0802106C
	str r0, [r1]
	b _08020FD6
_08021024:
	movs r0, #1
	rsbs r1, r0, #0
	movs r3, #0x80
	str r1, [sp]
	str r2, [sp, #4]
	movs r0, #0xf6
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	bl gamesfx_play
	b _0802100A
_0802103C:
	ldr r0, _08021078
	ldr r1, _0802107C
	str r0, [sp]
	ldr r2, _08021080
	ldr r0, _08021084
	movs r3, #0xc4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020FD0
_08021054:
	ldr r0, _08021088
	ldr r1, _0802107C
	str r0, [sp]
	ldr r2, _08021080
	ldr r0, _08021084
	movs r3, #0xc3
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020FCC
_0802106C:
	.4byte 0x0202E43C
_08021070:
	.4byte gLocalPlayerIndex
_08021074:
	.4byte 0x0202E438
_08021078:
	.4byte gUnk_0805277C
_0802107C:
	.4byte gUnk_080526F4
_08021080:
	.4byte gUnk_08052788
_08021084:
	.4byte gUnk_08052728
_08021088:
	.4byte gUnk_080526E8

	.global sub_0802108C
	.thumb_func
	.type sub_0802108C, %function
sub_0802108C: @ 0802108C
	ldr r2, _08021098
	str r0, [r2]
	ldr r0, _0802109C
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_08021098:
	.4byte 0x0202E438
_0802109C:
	.4byte 0x0202E43C
