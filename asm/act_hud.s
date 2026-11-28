@ asm/act_hud.s: ROM 0x00F80C-0x0104F8 (rom, VMA 0x0800F80C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_hud_map
	.thumb_func
	.type init_hud_map, %function
init_hud_map: @ 0800F80C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #8
	mov r8, r0
	cmp r0, #0
	bne _0800F822
	b _0800F9D6
_0800F822:
	ldr r5, _0800F8A4
	adds r7, r5, #0
	adds r7, #0x86
	movs r1, #0
	ldrsh r2, [r7, r1]
	movs r4, #0x94
	muls r2, r4, r2
	ldr r0, _0800F8A8
	adds r3, r2, #0
	adds r3, #0x7c
	ldrsh r4, [r0, r3]
	adds r3, #4
	ldr r1, [r0, r3]
	ldr r3, _0800F8AC
	str r1, [r3]
	adds r3, r2, #0
	adds r3, #0x84
	ldr r1, [r0, r3]
	ldr r3, _0800F8B0
	adds r2, #0x88
	str r1, [r3]
	lsls r4, r4, #0x10
	ldr r3, [r0, r2]
	ldr r1, _0800F8B4
	adds r0, r4, #0
	str r3, [r1]
	lsrs r1, r0, #0x10
	str r4, [sp, #4]
	mov sl, r1
	cmp r1, #0
	bne _0800F862
	b _0800F9CE
_0800F862:
	ldr r0, _0800F89C
	mov r2, r8
	strh r0, [r2]
	movs r1, #0xb8
	adds r2, #0xa0
	movs r4, #0
	movs r7, #0xfa
	strb r4, [r2]
	lsls r6, r1, #7
	lsls r2, r7, #8
	mov r7, r8
	str r2, [r7, #0x24]
	str r6, [r7, #0x28]
	adds r5, #0x88
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r0, #1
	bl spr_get_info
	mov r3, r8
	adds r3, #0x5a
	strh r0, [r3]
	ldrh r6, [r3]
	movs r0, #0x18
	adds r2, r6, #0
	muls r2, r0, r2
	ldr r7, _0800F8B8
	ldr r1, _0800F8A0
	b _0800F8BC
_0800F89C:
	.4byte 0x00001001
_0800F8A0:
	.4byte 0x00000000
_0800F8A4:
	.4byte gGameSetup
_0800F8A8:
	.4byte gUnk_087146C0
_0800F8AC:
	.4byte 0x02023F7C
_0800F8B0:
	.4byte 0x02023F80
_0800F8B4:
	.4byte 0x02023F84
_0800F8B8:
	.4byte gSprites
_0800F8BC:
	adds r3, r2, #0
	adds r0, r2, #4
	adds r4, r2, r7
	adds r3, #8
	strh r1, [r7, r0]
	strh r1, [r4, #2]
	strh r1, [r4]
	adds r4, r3, r7
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r4, #2]
	adds r3, r0, r7
	strh r1, [r3, #2]
	ldr r0, _0800F920
	movs r3, #0xf4
	lsls r3, r3, #2
	ldr r3, [r3, r0]
	adds r1, r2, #0
	adds r1, #0x14
	str r3, [r7, r1]
	mov r1, sl
	mov ip, r3
	lsls r3, r1, #4
	adds r3, #4
	ldr r1, [r0, r3]
	adds r2, #0x10
	str r1, [r7, r2]
	ldr r2, _0800F918
	strh r2, [r4]
	movs r2, #0
	ldrsh r3, [r5, r2]
	cmp r3, #1
	ble _0800F960
	movs r2, #0x18
	mov lr, ip
	mov sb, r2
	mov ip, r1
	movs r2, #0x80
	ldr r1, _0800F924
	lsls r5, r2, #1
	adds r4, r7, #0
	ldr r7, _0800F91C
	mov sl, r5
	mov fp, r1
	subs r5, r3, #1
	b _0800F928
_0800F918:
	.4byte 0x00000004
_0800F91C:
	.4byte 0x00000000
_0800F920:
	.4byte gUnk_08713650
_0800F924:
	.4byte gSpriteNext
_0800F928:
	mov r2, fp
	ldrb r6, [r2, r6]
	mov r2, sb
	muls r2, r6, r2
	adds r3, r2, #0
	adds r1, r2, #4
	adds r0, r2, r4
	adds r3, #8
	strh r7, [r4, r1]
	strh r7, [r0, #2]
	strh r7, [r0]
	adds r0, r3, r4
	mov r3, sl
	strh r3, [r0, #2]
	adds r3, r1, r4
	strh r7, [r3, #2]
	adds r3, r2, #0
	adds r3, #0x14
	mov r1, lr
	str r1, [r4, r3]
	ldr r1, _0800F988
	adds r2, #0x10
	mov r3, ip
	subs r5, #1
	str r3, [r4, r2]
	strh r1, [r0]
	cmp r5, #0
	bne _0800F928
_0800F960:
	ldr r4, _0800F994
	ldrb r7, [r4, r6]
	movs r5, #0x18
	adds r1, r7, #0
	muls r1, r5, r1
	ldr r4, _0800F998
	ldr r5, _0800F98C
	adds r3, r1, #0
	adds r0, r1, r4
	adds r7, r1, #4
	adds r3, #8
	ldr r2, _0800F990
	strh r5, [r4, r7]
	adds r6, r7, r4
	strh r5, [r0, #2]
	strh r5, [r0]
	adds r0, r3, r4
	strh r2, [r0, #2]
	b _0800F99C
	.byte 0x00, 0x00
_0800F988:
	.4byte 0x00000001
_0800F98C:
	.4byte 0x00000000
_0800F990:
	.4byte 0x00000100
_0800F994:
	.4byte gSpriteNext
_0800F998:
	.4byte gSprites
_0800F99C:
	strh r5, [r6, #2]
	ldr r2, [sp, #4]
	ldr r7, _0800F9F0
	lsrs r3, r2, #0xc
	ldr r2, [r7, r3]
	adds r6, r1, #0
	adds r6, #0x14
	str r2, [r4, r6]
	adds r3, #4
	ldr r2, [r7, r3]
	adds r1, #0x10
	str r2, [r4, r1]
	strh r5, [r0]
	mov r0, r8
	bl obj_add_draw
_0800F9BC:
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800F9CE:
	mov r0, r8
	bl obj_free
	b _0800F9BC
_0800F9D6:
	ldr r0, _0800F9F4
	ldr r1, _0800F9F8
	str r0, [sp]
	ldr r2, _0800F9FC
	ldr r0, _0800FA00
	movs r3, #0x2a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800F822
	.byte 0x00, 0x00
_0800F9F0:
	.4byte gUnk_08713650
_0800F9F4:
	.4byte gUnk_080504BC
_0800F9F8:
	.4byte gUnk_080504C8
_0800F9FC:
	.4byte gUnk_080504D8
_0800FA00:
	.4byte gUnk_080504E8

	.global act_hud_map
	.thumb_func
	.type act_hud_map, %function
act_hud_map: @ 0800FA04
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	cmp r0, #0
	bne _0800FA1A
	b _0800FBB8
_0800FA1A:
	movs r0, #0
	mov ip, r0
	ldr r0, _0800FB48
	adds r0, #0x88
	mov r3, r8
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r3, #0x5a
	ldrh r7, [r3]
	cmp ip, r2
	bge _0800FABA
	ldr r5, _0800FB4C
	ldr r4, _0800FB50
	ldr r3, [r5]
	ldr r1, [r4]
	mov lr, r3
	str r2, [sp, #0xc]
	ldr r3, _0800FB54
	ldr r2, _0800FB58
	mov sl, r3
	movs r0, #0x18
	str r1, [sp, #8]
	str r2, [sp, #4]
	mov fp, sl
	mov sb, r0
_0800FA4C:
	ldr r4, [sp, #4]
	ldm r4!, {r1}
	adds r5, r4, #0
	str r5, [sp, #4]
	ldr r2, [r1, #0x24]
	asrs r0, r2, #8
	mov r4, lr
	muls r4, r0, r4
	adds r5, r4, #0
	ldr r4, [sp, #8]
	asrs r2, r5, #0x10
	movs r0, #4
	adds r5, r2, r4
	rsbs r3, r0, #0
	cmp r5, r3
	bge _0800FA6E
	adds r5, r3, #0
_0800FA6E:
	cmp r5, #0x44
	ble _0800FA74
	movs r5, #0x44
_0800FA74:
	ldr r2, [r1, #0x2c]
	asrs r0, r2, #8
	mov r4, lr
	muls r4, r0, r4
	adds r2, r4, #0
	ldr r4, _0800FB5C
	asrs r3, r2, #0x10
	ldr r2, [r4]
	adds r4, r3, r2
	movs r3, #4
	rsbs r2, r3, #0
	cmp r4, r2
	bge _0800FA90
	adds r4, r2, #0
_0800FA90:
	cmp r4, #0x44
	ble _0800FA96
	movs r4, #0x44
_0800FA96:
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _0800FB68
_0800FA9C:
	mov r0, sb
	muls r0, r7, r0
	subs r3, r5, #4
	mov r1, sl
	strh r3, [r1, r0]
	subs r3, r4, #4
	add r0, sl
	strh r3, [r0, #2]
	movs r1, #1
	ldr r0, _0800FB60
	ldr r3, [sp, #0xc]
	add ip, r1
	ldrb r7, [r0, r7]
	cmp ip, r3
	blt _0800FA4C
_0800FABA:
	mov r2, r8
	adds r2, #0xa0
	ldrb r3, [r2]
	cmp r3, #1
	beq _0800FB24
	cmp r3, #1
	bgt _0800FAEE
	cmp r3, #0
	beq _0800FADE
_0800FACC:
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0800FADE:
	ldr r0, _0800FB48
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #5
	bne _0800FACC
	movs r1, #1
	strb r1, [r2]
	b _0800FACC
_0800FAEE:
	cmp r3, #2
	beq _0800FB14
	cmp r3, #3
	bne _0800FACC
	mov r1, r8
	movs r2, #0xfa
	ldr r3, [r1, #0x24]
	lsls r0, r2, #8
	cmp r3, r0
	bge _0800FB0C
	movs r2, #0xe0
	lsls r0, r2, #3
	adds r2, r3, r0
	str r2, [r1, #0x24]
	b _0800FACC
_0800FB0C:
	mov r0, r8
	bl obj_free
	b _0800FACC
_0800FB14:
	ldr r1, _0800FB48
	adds r1, #0x8c
	ldr r0, [r1]
	cmp r0, #8
	bne _0800FACC
	movs r0, #3
	strb r0, [r2]
	b _0800FACC
_0800FB24:
	mov r1, r8
	ldr r3, [r1, #0x24]
	movs r0, #0xac
	lsls r1, r0, #8
	cmp r3, r1
	ble _0800FB40
	ldr r0, _0800FB64
	adds r3, r3, r0
	mov r0, r8
	str r3, [r0, #0x24]
	cmp r3, r1
	bge _0800FACC
	str r1, [r0, #0x24]
	b _0800FACC
_0800FB40:
	movs r1, #2
	strb r1, [r2]
	b _0800FACC
	.byte 0x00, 0x00
_0800FB48:
	.4byte gGameSetup
_0800FB4C:
	.4byte 0x02023F84
_0800FB50:
	.4byte 0x02023F7C
_0800FB54:
	.4byte gSprites
_0800FB58:
	.4byte gRacerObjects
_0800FB5C:
	.4byte 0x02023F80
_0800FB60:
	.4byte gSpriteNext
_0800FB64:
	.4byte 0xFFFFF900
_0800FB68:
	mov r6, sb
	muls r6, r7, r6
	mov r2, fp
	adds r3, r6, #4
	adds r0, r3, r2
	ldr r2, _0800FBA0
	adds r3, r1, #0
	adds r3, #0x56
	strh r2, [r0, #2]
	ldrh r2, [r3]
	ldr r3, _0800FBA4
	subs r1, r3, r2
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x1c
	cmp r1, #8
	ble _0800FB8E
	movs r2, #0x10
	strh r2, [r0, #2]
	subs r1, r2, r1
_0800FB8E:
	cmp r1, #4
	ble _0800FBAC
	ldrh r3, [r0, #2]
	ldr r2, _0800FBA8
	orrs r3, r2
	strh r3, [r0, #2]
	movs r0, #8
	subs r1, r0, r1
	b _0800FBAC
_0800FBA0:
	.4byte 0x00000000
_0800FBA4:
	.4byte 0xFFFF8800
_0800FBA8:
	.4byte 0x00000020
_0800FBAC:
	adds r2, r6, #0
	adds r2, #8
	adds r3, r1, #4
	mov r0, fp
	strh r3, [r0, r2]
	b _0800FA9C
_0800FBB8:
	ldr r0, _0800FBD0
	ldr r1, _0800FBD4
	str r0, [sp]
	ldr r2, _0800FBD8
	ldr r0, _0800FBDC
	movs r3, #0x68
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800FA1A
_0800FBD0:
	.4byte gUnk_080504BC
_0800FBD4:
	.4byte gUnk_080504C8
_0800FBD8:
	.4byte gUnk_08050524
_0800FBDC:
	.4byte gUnk_080504E8

	.global act_hud_wrongway
	.thumb_func
	.type act_hud_wrongway, %function
act_hud_wrongway: @ 0800FBE0
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #8
	cmp r4, #0
	beq _0800FC88
_0800FBEA:
	ldr r0, _0800FC6C
	ldr r2, [r0]
	ldr r1, _0800FC70
	lsls r0, r2, #2
	ldr r3, [r1, r0]
	adds r1, r4, #0
	adds r1, #0xa0
	ldrh r2, [r1, #2]
	cmp r2, #0
	beq _0800FC78
	cmp r2, #1
	beq _0800FC24
	cmp r2, #2
	beq _0800FC0E
_0800FC06:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
_0800FC0E:
	ldr r2, _0800FC74
	adds r0, r3, r2
	ldrb r3, [r0]
	cmp r3, #0
	bne _0800FC06
	strh r3, [r1, #2]
	strh r3, [r1]
	adds r0, r4, #0
	bl obj_remove_draw
	b _0800FC06
_0800FC24:
	ldr r2, _0800FC74
	adds r0, r3, r2
	ldrb r3, [r0]
	cmp r3, #0
	beq _0800FC62
	ldrh r2, [r1]
	adds r2, #2
	strh r2, [r1]
	lsls r3, r2, #0x10
	movs r2, #0xb2
	lsls r0, r2, #0xf
	cmp r3, r0
	bls _0800FC06
	ldr r0, _0800FC68
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl obj_add_draw
	movs r2, #1
	rsbs r0, r2, #0
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xde
	bl gamesfx_play
	b _0800FC06
_0800FC62:
	strh r3, [r1, #2]
	strh r3, [r1]
	b _0800FC06
_0800FC68:
	.4byte 0x00000002
_0800FC6C:
	.4byte gLocalPlayerIndex
_0800FC70:
	.4byte gRacerObjects
_0800FC74:
	.4byte 0x0000011D
_0800FC78:
	ldr r2, _0800FCA4
	adds r0, r3, r2
	ldrb r2, [r0]
	cmp r2, #0
	beq _0800FC06
	ldr r2, _0800FCA0
	strh r2, [r1, #2]
	b _0800FC06
_0800FC88:
	ldr r0, _0800FCA8
	ldr r1, _0800FCAC
	str r0, [sp]
	ldr r2, _0800FCB0
	ldr r0, _0800FCB4
	movs r3, #0xcf
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800FBEA
_0800FCA0:
	.4byte 0x00000001
_0800FCA4:
	.4byte 0x0000011D
_0800FCA8:
	.4byte gUnk_080504BC
_0800FCAC:
	.4byte gUnk_080504C8
_0800FCB0:
	.4byte gUnk_08050530
_0800FCB4:
	.4byte gUnk_080504E8

	.global act_hud_lapcounter
	.thumb_func
	.type act_hud_lapcounter, %function
act_hud_lapcounter: @ 0800FCB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	sub sp, #8
	cmp r5, #0
	bne _0800FCC4
	b _0800FE70
_0800FCC4:
	ldr r2, _0800FE8C
	ldr r1, [r2]
	ldr r6, _0800FE90
	adds r1, #0x90
	ldrb r4, [r6, r1]
	subs r4, #1
	cmp r4, #0
	bge _0800FCD6
	b _0800FE6C
_0800FCD6:
	cmp r4, #2
	ble _0800FCDC
	movs r4, #2
_0800FCDC:
	adds r0, r5, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r1, #0x18
	muls r2, r1, r2
	ldr r3, _0800FE94
	movs r6, #0x8a
	lsls r6, r6, #3
	adds r3, r3, r6
	ldr r0, _0800FE98
	adds r1, r2, #0
	ldr r3, [r3]
	adds r1, #0x14
	adds r2, #8
	str r3, [r0, r1]
	strh r4, [r0, r2]
	adds r4, r5, #0
	adds r4, #0xa0
	ldr r3, [r4]
	cmp r3, #5
	bhi _0800FD32
	ldr r2, _0800FE9C
	lsls r0, r3, #2
	ldr r1, [r0, r2]
	mov pc, r1
	.byte 0x00, 0x00
	.global _0800FD10
_0800FD10:
	.4byte _0800FD28
	.4byte _0800FD40
	.4byte _0800FD62
	.4byte _0800FDB2
	.4byte _0800FE1A
	.4byte _0800FE54
	.global _0800FD28
_0800FD28:
	ldr r1, _0800FE90
	adds r1, #0x8c
	ldr r2, [r1]
	cmp r2, #6
	beq _0800FD3A
_0800FD32:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0800FD3A:
	movs r0, #1
	str r0, [r4]
	b _0800FD32
	.global _0800FD40
_0800FD40:
	movs r2, #0x80
	ldr r3, [r5, #0x24]
	lsls r1, r2, #3
	cmp r3, r1
	bge _0800FD5C
	movs r0, #0xe0
	lsls r2, r0, #3
	adds r0, r3, r2
	adds r2, r1, #0
	str r0, [r5, #0x24]
	cmp r0, r2
	ble _0800FD32
	str r2, [r5, #0x24]
	b _0800FD32
_0800FD5C:
	movs r1, #2
	str r1, [r4]
	b _0800FD32
	.global _0800FD62
_0800FD62:
	ldr r1, _0800FE8C
	ldr r2, [r1]
	ldr r0, _0800FEA0
	lsls r6, r2, #2
	ldr r1, [r0, r6]
	movs r3, #0x8f
	lsls r6, r3, #1
	adds r0, r1, r6
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _0800FD32
	ldr r0, _0800FEA4
	adds r3, r1, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	bne _0800FD32
	movs r2, #1
	rsbs r0, r2, #0
	movs r1, #0
	movs r3, #0x80
	lsls r2, r3, #9
	str r0, [sp]
	str r1, [sp, #4]
	movs r3, #1
	movs r1, #0x7f
	movs r0, #0x98
	bl gamesfx_play
	movs r0, #0x1c
	bl obj_new
	movs r1, #0
	bl obj_initialise
	movs r2, #3
	str r2, [r4]
	b _0800FD32
	.global _0800FDB2
_0800FDB2:
	ldr r2, _0800FE8C
	ldr r1, [r2]
	ldr r0, _0800FEA0
	lsls r6, r1, #2
	ldr r1, [r0, r6]
	movs r3, #0x8f
	lsls r6, r3, #1
	adds r0, r1, r6
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _0800FD32
	ldr r0, _0800FEA4
	adds r3, r1, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #3
	bne _0800FD32
	movs r2, #1
	rsbs r0, r2, #0
	movs r1, #0
	movs r6, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r6, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x99
	bl gamesfx_play
	ldr r2, _0800FE90
	adds r2, #0x86
	movs r6, #0
	ldrsh r0, [r2, r6]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _0800FEA8
	adds r1, #0x78
	ldr r0, [r3, r1]
	movs r1, #0
	bl sub_0801E220
	movs r0, #0x1d
	bl obj_new
	movs r1, #0
	bl obj_initialise
	movs r1, #4
	str r1, [r4]
	b _0800FD32
	.global _0800FE1A
_0800FE1A:
	ldr r0, _0800FE90
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #8
	beq _0800FE26
	b _0800FD32
_0800FE26:
	movs r2, #1
	rsbs r0, r2, #0
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x9a
	bl gamesfx_play
	movs r0, #0x20
	bl obj_new
	movs r1, #0
	bl obj_initialise
	movs r2, #5
	str r2, [r4]
	bl music_stop
	b _0800FD32
	.global _0800FE54
_0800FE54:
	ldr r3, [r5, #0x24]
	ldr r0, _0800FEAC
	cmp r3, r0
	ble _0800FE64
	ldr r0, _0800FEB0
	adds r1, r3, r0
	str r1, [r5, #0x24]
	b _0800FD32
_0800FE64:
	adds r0, r5, #0
	bl obj_free
	b _0800FD32
_0800FE6C:
	movs r4, #0
	b _0800FCDC
_0800FE70:
	ldr r0, _0800FEB4
	movs r4, #0x8b
	str r0, [sp]
	ldr r1, _0800FEB8
	ldr r0, _0800FEBC
	ldr r2, _0800FEC0
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800FCC4
	.byte 0x00, 0x00
_0800FE8C:
	.4byte gLocalPlayerIndex
_0800FE90:
	.4byte gGameSetup
_0800FE94:
	.4byte gUnk_08713650
_0800FE98:
	.4byte gSprites
_0800FE9C:
	.4byte _0800FD10
_0800FEA0:
	.4byte gRacerObjects
_0800FEA4:
	.4byte 0x0000011F
_0800FEA8:
	.4byte gUnk_087146C0
_0800FEAC:
	.4byte 0xFFFFC000
_0800FEB0:
	.4byte 0xFFFFF900
_0800FEB4:
	.4byte gUnk_080504BC
_0800FEB8:
	.4byte gUnk_080504C8
_0800FEBC:
	.4byte gUnk_080504E8
_0800FEC0:
	.4byte gUnk_08050544

	.global act_hud_position
	.thumb_func
	.type act_hud_position, %function
act_hud_position: @ 0800FEC4
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0800FF88
_0800FECE:
	ldr r2, _0800FFA0
	ldr r0, [r2]
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r1, _0800FFA4
	ldrb r3, [r2]
	adds r0, #0x98
	ldrb r5, [r1, r0]
	cmp r3, #1
	beq _0800FF6A
	cmp r3, #1
	bgt _0800FF22
	cmp r3, #0
	beq _0800FEF2
_0800FEEA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_0800FEF2:
	adds r0, r1, #0
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #6
	bne _0800FEEA
	adds r1, r4, #0
	movs r0, #1
	adds r1, #0x5a
	strb r0, [r2]
	ldrh r2, [r1]
	movs r4, #0x18
	muls r2, r4, r2
	ldr r3, _0800FFA8
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r3, r3, r4
	ldr r0, _0800FFAC
	adds r1, r2, #0
	ldr r3, [r3]
	adds r1, #0x14
	adds r2, #8
	str r3, [r0, r1]
	strh r5, [r0, r2]
	b _0800FEEA
_0800FF22:
	cmp r3, #2
	beq _0800FF48
	cmp r3, #3
	bne _0800FEEA
	movs r1, #0xf0
	ldr r3, [r4, #0x24]
	lsls r0, r1, #7
	cmp r3, r0
	ble _0800FF42
	ldr r1, _0800FFB0
	adds r0, r3, r1
	ldr r1, [r4, #0x28]
	adds r1, #0x90
	str r0, [r4, #0x24]
	str r1, [r4, #0x28]
	b _0800FEEA
_0800FF42:
	movs r0, #0xff
	strb r0, [r2]
	b _0800FEEA
_0800FF48:
	adds r3, r1, #0
	adds r3, #0x8c
	ldr r0, [r3]
	cmp r0, #8
	beq _0800FF64
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r0, #0x18
	muls r0, r1, r0
	ldr r3, _0800FFAC
	adds r0, #8
	strh r5, [r3, r0]
	b _0800FEEA
_0800FF64:
	movs r1, #3
	strb r1, [r2]
	b _0800FEEA
_0800FF6A:
	movs r0, #0xdc
	ldr r3, [r4, #0x24]
	lsls r1, r0, #8
	cmp r3, r1
	ble _0800FF82
	ldr r2, _0800FFB0
	adds r0, r3, r2
	str r0, [r4, #0x24]
	cmp r0, r1
	bge _0800FEEA
	str r1, [r4, #0x24]
	b _0800FEEA
_0800FF82:
	movs r1, #2
	strb r1, [r2]
	b _0800FEEA
_0800FF88:
	ldr r0, _0800FFB4
	ldr r1, _0800FFB8
	str r0, [sp]
	ldr r2, _0800FFBC
	ldr r0, _0800FFC0
	ldr r3, _0800FFC4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800FECE
_0800FFA0:
	.4byte gLocalPlayerIndex
_0800FFA4:
	.4byte gGameSetup
_0800FFA8:
	.4byte gUnk_08713650
_0800FFAC:
	.4byte gSprites
_0800FFB0:
	.4byte 0xFFFFF900
_0800FFB4:
	.4byte gUnk_080504BC
_0800FFB8:
	.4byte gUnk_080504C8
_0800FFBC:
	.4byte gUnk_08050558
_0800FFC0:
	.4byte gUnk_080504E8
_0800FFC4:
	.4byte 0x000001A1

	.global init_hud_position
	.thumb_func
	.type init_hud_position, %function
init_hud_position: @ 0800FFC8
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801000A
_0800FFD2:
	ldr r0, _08010000
	movs r2, #1
	strh r0, [r4]
	rsbs r3, r2, #0
	adds r0, r4, #0
	adds r2, r3, #0
	adds r0, #0xa0
	movs r1, #0
	strb r1, [r0]
	strb r2, [r0, #1]
	movs r1, #0xa0
	movs r0, #0x90
	lsls r2, r0, #9
	lsls r0, r1, #5
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x3e
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _08010004
_08010000:
	.4byte 0x00001001
_08010004:
	pop {r4}
	pop {r0}
	bx r0
_0801000A:
	ldr r0, _08010024
	movs r3, #0xc9
	str r0, [sp]
	ldr r1, _08010028
	ldr r0, _0801002C
	ldr r2, _08010030
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800FFD2
_08010024:
	.4byte gUnk_080504BC
_08010028:
	.4byte gUnk_080504C8
_0801002C:
	.4byte gUnk_080504E8
_08010030:
	.4byte gUnk_0805056C

	.global init_hud_lapcounter
	.thumb_func
	.type init_hud_lapcounter, %function
init_hud_lapcounter: @ 08010034
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08010072
_0801003E:
	ldr r2, _08010064
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0
	strh r2, [r4]
	str r1, [r0]
	ldr r2, _08010068
	movs r1, #0x80
	lsls r0, r1, #3
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x45
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _0801006C
	.byte 0x00, 0x00
_08010064:
	.4byte 0x00001001
_08010068:
	.4byte 0xFFFFC000
_0801006C:
	pop {r4}
	pop {r0}
	bx r0
_08010072:
	ldr r0, _0801008C
	ldr r1, _08010090
	str r0, [sp]
	ldr r2, _08010094
	ldr r0, _08010098
	ldr r3, _0801009C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801003E
	.byte 0x00, 0x00
_0801008C:
	.4byte gUnk_080504BC
_08010090:
	.4byte gUnk_080504C8
_08010094:
	.4byte gUnk_08050580
_08010098:
	.4byte gUnk_080504E8
_0801009C:
	.4byte 0x00000107

	.global init_hud_wrongway
	.thumb_func
	.type init_hud_wrongway, %function
init_hud_wrongway: @ 080100A0
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080100E6
_080100AA:
	ldr r0, _080100D8
	movs r2, #0xf0
	strh r0, [r4]
	lsls r1, r2, #7
	movs r0, #0xa0
	str r1, [r4, #0x24]
	lsls r2, r0, #7
	ldr r1, _080100DC
	adds r0, r4, #0
	adds r0, #0xa0
	str r2, [r4, #0x28]
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r2, #3
	adds r0, r4, #0
	movs r1, #0x46
	bl obj_setup_sprite
	adds r0, r4, #0
	bl obj_remove_draw
	add sp, #4
	b _080100E0
_080100D8:
	.4byte 0x00001001
_080100DC:
	.4byte 0x00000000
_080100E0:
	pop {r4}
	pop {r0}
	bx r0
_080100E6:
	ldr r0, _08010100
	ldr r1, _08010104
	str r0, [sp]
	ldr r2, _08010108
	ldr r0, _0801010C
	movs r3, #0xbe
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080100AA
	.byte 0x00, 0x00
_08010100:
	.4byte gUnk_080504BC
_08010104:
	.4byte gUnk_080504C8
_08010108:
	.4byte gUnk_08050594
_0801010C:
	.4byte gUnk_080504E8

	.global init_hud_lap2
	.thumb_func
	.type init_hud_lap2, %function
init_hud_lap2: @ 08010110
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801014A
_0801011A:
	ldr r0, _08010140
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0x5a
	strh r0, [r4]
	str r2, [r1]
	movs r0, #0xf0
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x43
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _08010144
_08010140:
	.4byte 0x00001001
_08010144:
	pop {r4}
	pop {r0}
	bx r0
_0801014A:
	ldr r0, _08010164
	ldr r1, _08010168
	str r0, [sp]
	ldr r2, _0801016C
	ldr r0, _08010170
	ldr r3, _08010174
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801011A
	.byte 0x00, 0x00
_08010164:
	.4byte gUnk_080504BC
_08010168:
	.4byte gUnk_080504C8
_0801016C:
	.4byte gUnk_080505A8
_08010170:
	.4byte gUnk_080504E8
_08010174:
	.4byte 0x00000215

	.global act_hud_lap2
	.thumb_func
	.type act_hud_lap2, %function
act_hud_lap2: @ 08010178
	push {lr}
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r3, [r2]
	cmp r3, #0
	ble _0801018C
	subs r3, #2
	str r3, [r2]
_08010188:
	pop {r0}
	bx r0
_0801018C:
	bl obj_free
	b _08010188
	.byte 0x00, 0x00

	.global init_hud_lapfinal
	.thumb_func
	.type init_hud_lapfinal, %function
init_hud_lapfinal: @ 08010194
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080101CE
_0801019E:
	ldr r0, _080101C4
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0x5a
	strh r0, [r4]
	str r2, [r1]
	movs r0, #0xf0
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x44
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _080101C8
_080101C4:
	.4byte 0x00001001
_080101C8:
	pop {r4}
	pop {r0}
	bx r0
_080101CE:
	ldr r0, _080101E8
	ldr r1, _080101EC
	str r0, [sp]
	ldr r2, _080101F0
	ldr r0, _080101F4
	ldr r3, _080101F8
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801019E
	.byte 0x00, 0x00
_080101E8:
	.4byte gUnk_080504BC
_080101EC:
	.4byte gUnk_080504C8
_080101F0:
	.4byte gUnk_080505B8
_080101F4:
	.4byte gUnk_080504E8
_080101F8:
	.4byte 0x0000022A

	.global act_hud_lapfinal
	.thumb_func
	.type act_hud_lapfinal, %function
act_hud_lapfinal: @ 080101FC
	push {lr}
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r3, [r2]
	cmp r3, #0
	ble _08010210
	subs r3, #2
	str r3, [r2]
_0801020C:
	pop {r0}
	bx r0
_08010210:
	bl obj_free
	b _0801020C
	.byte 0x00, 0x00

	.global init_hud_getready
	.thumb_func
	.type init_hud_getready, %function
init_hud_getready: @ 08010218
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08010252
_08010222:
	ldr r0, _08010248
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0x28
	strh r0, [r4]
	str r2, [r1]
	movs r0, #0xf0
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x40
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _0801024C
_08010248:
	.4byte 0x00001001
_0801024C:
	pop {r4}
	pop {r0}
	bx r0
_08010252:
	ldr r0, _0801026C
	ldr r1, _08010270
	str r0, [sp]
	ldr r2, _08010274
	ldr r0, _08010278
	ldr r3, _0801027C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010222
	.byte 0x00, 0x00
_0801026C:
	.4byte gUnk_080504BC
_08010270:
	.4byte gUnk_080504C8
_08010274:
	.4byte gUnk_080505CC
_08010278:
	.4byte gUnk_080504E8
_0801027C:
	.4byte 0x000001EB

	.global act_hud_getready
	.thumb_func
	.type act_hud_getready, %function
act_hud_getready: @ 08010280
	push {lr}
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r3, [r2]
	cmp r3, #0
	ble _08010294
	subs r3, #2
	str r3, [r2]
_08010290:
	pop {r0}
	bx r0
_08010294:
	bl obj_free
	b _08010290
	.byte 0x00, 0x00

	.global init_hud_go
	.thumb_func
	.type init_hud_go, %function
init_hud_go: @ 0801029C
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080102D6
_080102A6:
	ldr r0, _080102CC
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0x28
	strh r0, [r4]
	str r2, [r1]
	movs r0, #0xf0
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x3f
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _080102D0
_080102CC:
	.4byte 0x00001001
_080102D0:
	pop {r4}
	pop {r0}
	bx r0
_080102D6:
	ldr r0, _080102F0
	movs r3, #0x80
	str r0, [sp]
	ldr r1, _080102F4
	ldr r0, _080102F8
	ldr r2, _080102FC
	lsls r3, r3, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080102A6
_080102F0:
	.4byte gUnk_080504BC
_080102F4:
	.4byte gUnk_080504C8
_080102F8:
	.4byte gUnk_080504E8
_080102FC:
	.4byte gUnk_080505E0

	.global act_hud_go
	.thumb_func
	.type act_hud_go, %function
act_hud_go: @ 08010300
	push {lr}
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r3, [r2]
	cmp r3, #0
	ble _08010314
	subs r3, #2
	str r3, [r2]
_08010310:
	pop {r0}
	bx r0
_08010314:
	bl obj_free
	b _08010310
	.byte 0x00, 0x00

	.global init_hud_finish
	.thumb_func
	.type init_hud_finish, %function
init_hud_finish: @ 0801031C
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08010356
_08010326:
	ldr r0, _0801034C
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0x5a
	strh r0, [r4]
	str r2, [r1]
	movs r0, #0xf0
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x41
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _08010350
_0801034C:
	.4byte 0x00001001
_08010350:
	pop {r4}
	pop {r0}
	bx r0
_08010356:
	ldr r0, _08010370
	ldr r1, _08010374
	str r0, [sp]
	ldr r2, _08010378
	ldr r0, _0801037C
	ldr r3, _08010380
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010326
	.byte 0x00, 0x00
_08010370:
	.4byte gUnk_080504BC
_08010374:
	.4byte gUnk_080504C8
_08010378:
	.4byte gUnk_080505EC
_0801037C:
	.4byte gUnk_080504E8
_08010380:
	.4byte 0x0000023F

	.global act_hud_finish
	.thumb_func
	.type act_hud_finish, %function
act_hud_finish: @ 08010384
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080103AC
_0801038E:
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r3, [r2]
	cmp r3, #0
	ble _080103A4
	subs r3, #2
	str r3, [r2]
_0801039C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_080103A4:
	adds r0, r4, #0
	bl obj_free
	b _0801039C
_080103AC:
	ldr r0, _080103C8
	movs r3, #0x93
	str r0, [sp]
	ldr r1, _080103CC
	ldr r0, _080103D0
	ldr r2, _080103D4
	lsls r3, r3, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801038E
	.byte 0x00, 0x00
_080103C8:
	.4byte gUnk_080504BC
_080103CC:
	.4byte gUnk_080504C8
_080103D0:
	.4byte gUnk_080504E8
_080103D4:
	.4byte gUnk_080505FC

	.global init_hud_crosshair
	.thumb_func
	.type init_hud_crosshair, %function
init_hud_crosshair: @ 080103D8
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801040A
_080103E2:
	ldr r1, _08010400
	movs r0, #0xf0
	strh r1, [r4]
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r1, #0x75
	adds r0, r4, #0
	movs r2, #3
	bl obj_setup_sprite
	add sp, #4
	b _08010404
_08010400:
	.4byte 0x00001001
_08010404:
	pop {r4}
	pop {r0}
	bx r0
_0801040A:
	ldr r0, _08010424
	ldr r1, _08010428
	str r0, [sp]
	ldr r2, _0801042C
	ldr r0, _08010430
	movs r3, #0xf7
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080103E2
	.byte 0x00, 0x00
_08010424:
	.4byte gUnk_080504BC
_08010428:
	.4byte gUnk_080504C8
_0801042C:
	.4byte gUnk_0805060C
_08010430:
	.4byte gUnk_080504E8

	.global act_hud_crosshair
	.thumb_func
	.type act_hud_crosshair, %function
act_hud_crosshair: @ 08010434
	bx lr
	.byte 0x00, 0x00

	.global init_hud_battle_position
	.thumb_func
	.type init_hud_battle_position, %function
init_hud_battle_position: @ 08010438
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08010492
_08010442:
	ldr r1, _0801047C
	movs r2, #0xf0
	strh r1, [r4]
	movs r1, #0xa0
	lsls r0, r2, #7
	lsls r2, r1, #7
	str r0, [r4, #0x24]
	str r2, [r4, #0x28]
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #3
	bl obj_setup_sprite
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r1, #0x18
	adds r0, r2, #0
	muls r0, r1, r0
	ldr r2, _08010480
	ldr r3, [r2]
	ldr r1, _08010484
	adds r3, #0xa0
	ldrb r2, [r1, r3]
	ldr r1, _08010488
	adds r0, #8
	strh r2, [r1, r0]
	add sp, #4
	b _0801048C
_0801047C:
	.4byte 0x00001001
_08010480:
	.4byte gLocalPlayerIndex
_08010484:
	.4byte gGameSetup
_08010488:
	.4byte gSprites
_0801048C:
	pop {r4}
	pop {r0}
	bx r0
_08010492:
	ldr r0, _080104AC
	movs r3, #0x96
	str r0, [sp]
	ldr r1, _080104B0
	ldr r0, _080104B4
	ldr r2, _080104B8
	lsls r3, r3, #2
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010442
_080104AC:
	.4byte gUnk_080504BC
_080104B0:
	.4byte gUnk_080504C8
_080104B4:
	.4byte gUnk_080504E8
_080104B8:
	.4byte gUnk_08050620

	.global act_hud_battle_position
	.thumb_func
	.type act_hud_battle_position, %function
act_hud_battle_position: @ 080104BC
	push {lr}
	sub sp, #4
	cmp r0, #0
	beq _080104CA
_080104C4:
	add sp, #4
	pop {r0}
	bx r0
_080104CA:
	ldr r0, _080104E4
	ldr r1, _080104E8
	str r0, [sp]
	ldr r2, _080104EC
	ldr r0, _080104F0
	ldr r3, _080104F4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080104C4
	.byte 0x00, 0x00
_080104E4:
	.4byte gUnk_080504BC
_080104E8:
	.4byte gUnk_080504C8
_080104EC:
	.4byte gUnk_0805063C
_080104F0:
	.4byte gUnk_080504E8
_080104F4:
	.4byte 0x00000266
