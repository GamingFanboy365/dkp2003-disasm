@ asm/act_blue_zinger.s: ROM 0x02AA40-0x02AD54 (rom, VMA 0x0802AA40)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global react_blue_zinger
	.thumb_func
	.type react_blue_zinger, %function
react_blue_zinger: @ 0802AA40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	sub sp, #8
	adds r7, r1, #0
	cmp r5, #0
	bne _0802AA52
	b _0802ABAC
_0802AA52:
	cmp r7, #0
	bne _0802AA58
	b _0802AB94
_0802AA58:
	ldrb r3, [r7, #2]
	cmp r3, #1
	beq _0802AAC8
	cmp r3, #2
	beq _0802AA76
	adds r0, r5, #0
	movs r1, #0
	bl destroy_blue_zinger
_0802AA6A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802AA76:
	adds r6, r7, #0
	adds r6, #0xa0
	ldr r1, [r6]
	movs r3, #0xd8
	lsls r0, r3, #4
	ands r1, r0
	cmp r1, #0
	bne _0802AB1A
	adds r4, r5, #0
	adds r4, #0xa0
	movs r0, #3
	str r0, [r4]
	ldr r1, [r6, #4]
	movs r2, #0x3c
	str r1, [r4, #0xc]
	str r2, [r4, #4]
	adds r0, r5, #0
	bl obj_remove_vector_hit
	ldr r1, [r6]
	movs r3, #0x80
	lsls r0, r3, #4
	orrs r1, r0
	adds r0, r5, #0
	str r1, [r6]
	adds r0, #0xc4
	bl gamesfx_stop
	ldr r1, _0802ABC8
	ldr r0, [r4, #0x3c]
	ldr r3, [r1]
	cmp r3, r0
	bne _0802AA6A
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r5, #0
	str r2, [r1]
	adds r0, #0xd4
	bl gamesfx_stop
	b _0802AA6A
_0802AAC8:
	adds r4, r7, #0
	adds r4, #0xa0
	ldr r2, [r4]
	movs r0, #0x80
	lsls r1, r0, #7
	ands r1, r2
	cmp r1, #0
	beq _0802AB0E
	adds r0, r5, #0
	adds r1, r7, #0
	adds r5, #0xa0
	bl destroy_blue_zinger
	ldr r1, [r5, #8]
	adds r0, r7, #0
	movs r2, #0
	movs r3, #0
	bl player_weapon_hit
	cmp r0, #0
	beq _0802AA6A
	ldr r0, [r5, #8]
	ldr r4, _0802ABCC
	lsls r2, r0, #2
	ldr r0, [r4, r2]
	adds r1, r7, #0
	bl voice_hit_victim
	ldr r1, [r5, #8]
	lsls r2, r1, #2
	ldr r0, [r4, r2]
	adds r1, r7, #0
	bl voice_hit_attacker
	b _0802AA6A
_0802AB0E:
	movs r1, #0xd8
	lsls r3, r1, #4
	ands r3, r2
	mov r8, r3
	cmp r3, #0
	beq _0802AB24
_0802AB1A:
	adds r0, r5, #0
	adds r1, r7, #0
	bl destroy_blue_zinger
	b _0802AA6A
_0802AB24:
	adds r6, r5, #0
	adds r6, #0xa0
	movs r0, #3
	str r0, [r6]
	ldr r1, [r4, #4]
	movs r2, #0x3c
	str r2, [r6, #4]
	str r1, [r6, #0xc]
	adds r0, r5, #0
	bl obj_remove_vector_hit
	movs r3, #0x80
	ldr r1, [r4]
	lsls r0, r3, #4
	orrs r1, r0
	adds r0, r5, #0
	str r1, [r4]
	adds r0, #0xc4
	bl gamesfx_stop
	adds r0, r5, #0
	adds r0, #0xc8
	bl gamesfx_stop
	ldr r1, _0802ABC8
	ldr r0, [r6, #0x3c]
	ldr r3, [r1]
	cmp r3, r0
	beq _0802AB84
_0802AB5E:
	ldr r3, _0802ABD0
	ldr r0, [r4, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _0802AB6A
	b _0802AA6A
_0802AB6A:
	mov r3, r8
	movs r2, #0xa
	str r3, [sp, #4]
	movs r3, #0x80
	str r2, [sp]
	movs r0, #0xda
	lsls r2, r3, #9
	movs r1, #0xb4
	movs r3, #1
	bl gamesfx_play
	str r0, [r6, #0x2c]
	b _0802AA6A
_0802AB84:
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r5, #0
	str r2, [r1]
	adds r0, #0xd4
	bl gamesfx_stop
	b _0802AB5E
_0802AB94:
	ldr r0, _0802ABD4
	ldr r1, _0802ABD8
	str r0, [sp]
	ldr r2, _0802ABDC
	ldr r0, _0802ABE0
	ldr r3, _0802ABE4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802AA58
_0802ABAC:
	ldr r0, _0802ABE8
	movs r3, #0xe2
	str r0, [sp]
	ldr r1, _0802ABD8
	ldr r0, _0802ABE0
	ldr r2, _0802ABDC
	lsls r3, r3, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802AA52
	.byte 0x00, 0x00
_0802ABC8:
	.4byte gBlueZingerBuzzOwner
_0802ABCC:
	.4byte gRacerObjects
_0802ABD0:
	.4byte gLocalPlayerIndex
_0802ABD4:
	.4byte gUnk_08052EA8
_0802ABD8:
	.4byte gUnk_08052EB4
_0802ABDC:
	.4byte gUnk_08052ECC
_0802ABE0:
	.4byte gUnk_08052EE0
_0802ABE4:
	.4byte 0x00000389
_0802ABE8:
	.4byte gUnk_08052F1C

	.global blue_zinger_buzz_reset
	.thumb_func
	.type blue_zinger_buzz_reset, %function
blue_zinger_buzz_reset: @ 0802ABEC
	ldr r0, _0802ABFC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0802AC00
	subs r1, #1
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_0802ABFC:
	.4byte 0x0202EC08
_0802AC00:
	.4byte gBlueZingerBuzzOwner

	.global blue_zinger_sfx_pitch_cb
	.thumb_func
	.type blue_zinger_sfx_pitch_cb, %function
blue_zinger_sfx_pitch_cb: @ 0802AC04
	push {lr}
	ldr r2, _0802AC20
	adds r1, r0, #0
	ldr r0, [r2]
	ldr r2, _0802AC24
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	movs r3, #0x80
	lsls r2, r3, #9
	bl sfx_doppler
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_0802AC20:
	.4byte gLocalPlayerIndex
_0802AC24:
	.4byte gRacerObjects

	.global blue_zinger_sfx_vol_cb
	.thumb_func
	.type blue_zinger_sfx_vol_cb, %function
blue_zinger_sfx_vol_cb: @ 0802AC28
	adds r0, #0xa0
	ldr r2, [r0, #0x38]
	movs r0, #0x80
	lsls r1, r0, #9
	subs r0, r1, r2
	lsls r2, r0, #7
	subs r1, r2, r0
	asrs r0, r1, #0x10
	bx lr
	.byte 0x00, 0x00

	.global blue_zinger_sfx_cb2
	.thumb_func
	.type blue_zinger_sfx_cb2, %function
blue_zinger_sfx_cb2: @ 0802AC3C
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	ldr r1, _0802AC64
	muls r1, r3, r1
	asrs r0, r1, #8
	cmp r0, #0xb4
	ble _0802AC5C
	movs r0, #0xb4
_0802AC4E:
	cmp r0, #0
	beq _0802AC56
_0802AC52:
	pop {r1}
	bx r1
_0802AC56:
	movs r1, #1
	rsbs r0, r1, #0
	b _0802AC52
_0802AC5C:
	cmp r0, #0
	bge _0802AC4E
	movs r0, #0
	b _0802AC4E
_0802AC64:
	.4byte 0x00000133

	.global blue_zinger_sfx_vol2_cb
	.thumb_func
	.type blue_zinger_sfx_vol2_cb, %function
blue_zinger_sfx_vol2_cb: @ 0802AC68
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #0x1c]
	movs r0, #0x80
	lsls r1, r0, #4
	subs r2, r1, r3
	lsls r0, r2, #7
	subs r1, r0, r2
	asrs r0, r1, #0xb
	cmp r0, #0
	blt _0802AC88
	cmp r0, #0x7f
	ble _0802AC84
	movs r0, #0x7f
_0802AC84:
	pop {r1}
	bx r1
_0802AC88:
	movs r0, #0
	b _0802AC84

	.global blue_zinger_sfx_pitch2_cb
	.thumb_func
	.type blue_zinger_sfx_pitch2_cb, %function
blue_zinger_sfx_pitch2_cb: @ 0802AC8C
	push {lr}
	adds r0, #0xa0
	ldr r2, [r0, #0x1c]
	movs r0, #0x80
	lsls r1, r0, #4
	subs r0, r1, r2
	lsls r1, r0, #0xf
	asrs r0, r1, #0xb
	cmp r0, #0
	blt _0802ACB4
	movs r2, #0x80
	lsls r3, r2, #8
	cmp r0, r3
	ble _0802ACAA
	adds r0, r3, #0
_0802ACAA:
	movs r2, #0x80
	lsls r1, r2, #8
	adds r0, r0, r1
	pop {r1}
	bx r1
_0802ACB4:
	movs r0, #0
	b _0802ACAA

	.global init_blue_zinger
	.thumb_func
	.type init_blue_zinger, %function
init_blue_zinger: @ 0802ACB8
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802AD28
_0802ACC2:
	ldr r0, _0802AD00
	movs r1, #0x38
	strh r0, [r4]
	movs r2, #0x13
	adds r0, r4, #0
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r2, _0802AD04
	adds r3, r3, r2
	strh r1, [r3, #0xa]
	bl spr_set_shadow_size
	movs r1, #1
	adds r0, r4, #0
	rsbs r2, r1, #0
	adds r0, #0xa0
	str r2, [r0, #0x28]
	str r2, [r0, #0x24]
	str r2, [r0, #0x2c]
	adds r0, r4, #0
	bl blue_zinger_set_velocity
	movs r1, #0x80
	b _0802AD08
	.byte 0x00, 0x00
_0802AD00:
	.4byte 0x00000001
_0802AD04:
	.4byte gSprites
_0802AD08:
	lsls r0, r1, #3
	movs r2, #0xa0
	str r0, [sp]
	lsls r1, r2, #3
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r4, #0
	bl obj_add_vector_hit
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0802AD28:
	ldr r0, _0802AD40
	ldr r1, _0802AD44
	str r0, [sp]
	ldr r2, _0802AD48
	ldr r0, _0802AD4C
	ldr r3, _0802AD50
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802ACC2
_0802AD40:
	.4byte gUnk_08052F1C
_0802AD44:
	.4byte gUnk_08052EB4
_0802AD48:
	.4byte gUnk_08052F28
_0802AD4C:
	.4byte gUnk_08052EE0
_0802AD50:
	.4byte 0x00000183
