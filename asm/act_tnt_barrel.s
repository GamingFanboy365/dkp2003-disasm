@ asm/act_tnt_barrel.s: ROM 0x02B658-0x02B9F4 (rom, VMA 0x0802B658)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_tnt_barrel
	.thumb_func
	.type init_tnt_barrel, %function
init_tnt_barrel: @ 0802B658
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _0802B6F6
_0802B662:
	ldr r0, _0802B698
	movs r1, #0x55
	strh r0, [r5]
	movs r2, #0x13
	adds r0, r5, #0
	bl obj_setup_sprite
	adds r1, r5, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r4, #0x18
	muls r4, r0, r4
	ldr r1, _0802B6A0
	ldr r7, _0802B69C
	adds r6, r4, r1
	movs r2, #0x99
	ldr r4, [r5, #0x28]
	strh r7, [r6, #0xa]
	lsls r7, r2, #5
	subs r6, r7, r4
	movs r4, #0x1e
	muls r6, r4, r6
	asrs r4, r6, #0xc
	cmp r4, #0
	blt _0802B6F2
	b _0802B6A4
	.byte 0x00, 0x00
_0802B698:
	.4byte 0x00000001
_0802B69C:
	.4byte 0x00000028
_0802B6A0:
	.4byte 0x02018F34
_0802B6A4:
	movs r3, #0x18
	mov lr, r3
	ldr r7, _0802B710
	movs r3, #0x80
	adds r6, r1, #0
	mov ip, r3
_0802B6B0:
	mov r1, lr
	muls r1, r0, r1
	adds r3, r1, r6
	ldrh r2, [r3, #6]
	mov r3, ip
	ands r3, r2
	cmp r3, #0
	beq _0802B6C4
	adds r2, r1, r6
	strh r4, [r2, #0xa]
_0802B6C4:
	ldrb r0, [r7, r0]
	cmp r0, #0xff
	bne _0802B6B0
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r2, [r0, #8]
	ldr r1, _0802B714
	lsls r3, r2, #2
	ldr r2, [r1, r3]
	ldr r3, [r2, #0x3c]
	lsls r1, r3, #1
	str r1, [r5, #0x3c]
	ldr r1, [r2, #0x40]
	str r1, [r5, #0x40]
	ldr r1, [r2, #0x44]
	lsls r2, r1, #1
	movs r1, #1
	str r2, [r5, #0x44]
	add sp, #4
	str r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802B6F2:
	movs r4, #0
	b _0802B6A4
_0802B6F6:
	ldr r0, _0802B718
	ldr r1, _0802B71C
	str r0, [sp]
	ldr r2, _0802B720
	ldr r0, _0802B724
	movs r3, #0x62
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802B662
	.byte 0x00, 0x00
_0802B710:
	.4byte 0x0201A734
_0802B714:
	.4byte gRacerObjects
_0802B718:
	.4byte gUnk_08053004
_0802B71C:
	.4byte gUnk_08053010
_0802B720:
	.4byte gUnk_08053028
_0802B724:
	.4byte gUnk_08053038

	.global act_tnt_barrel
	.thumb_func
	.type act_tnt_barrel, %function
act_tnt_barrel: @ 0802B728
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	movs r4, #0xa0
	movs r0, #0x5a
	adds r1, r0, r7
	adds r3, r4, r7
	ldrh r2, [r1]
	mov sl, r1
	ldr r1, [r3, #8]
	ldr r0, _0802B9D0
	mov sb, r2
	lsls r2, r1, #2
	ldr r1, [r0, r2]
	sub sp, #0x1c
	mov r8, r3
	str r1, [sp, #0x18]
	mov r1, r8
	ldr r3, [r1]
	cmp r3, #1
	bne _0802B75C
	b _0802B924
_0802B75C:
	cmp r3, #1
	ble _0802B764
	cmp r3, #2
	beq _0802B7D6
_0802B764:
	ldr r6, [r7, #0x24]
	ldr r0, [r7, #0x3c]
	ldr r5, [r7, #0x2c]
	ldr r2, [r7, #0x28]
	ldr r1, [r7, #0x40]
	ldr r3, [r7, #0x44]
	adds r4, r6, r0
	movs r6, #0x99
	str r4, [r7, #0x24]
	adds r0, r5, r3
	adds r4, r2, r1
	lsls r5, r6, #5
	str r4, [r7, #0x28]
	str r0, [r7, #0x2c]
	movs r1, #0x1e
	subs r7, r5, r4
	muls r7, r1, r7
	asrs r6, r7, #0xc
	cmp r6, #0
	blt _0802B7D2
_0802B78C:
	ldr r3, _0802B9D4
	ldr r0, _0802B9D8
	movs r4, #0
	mov ip, r3
	movs r7, #0x18
	movs r5, #0x80
_0802B798:
	mov r2, sb
	mov r1, ip
	ldrb r1, [r1, r2]
	mov sb, r1
	cmp r1, #0xff
	beq _0802B7CE
	mov r1, sb
	muls r1, r7, r1
	adds r3, r1, r0
	ldrh r2, [r3, #6]
	adds r3, r5, #0
	ands r3, r2
	cmp r3, #0
	beq _0802B7B8
	adds r2, r1, r0
	strh r6, [r2, #0xa]
_0802B7B8:
	cmp r4, #0
	beq _0802B798
	add sp, #0x1c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802B7CE:
	movs r4, #1
	b _0802B7B8
_0802B7D2:
	movs r6, #0
	b _0802B78C
_0802B7D6:
	movs r1, #0x18
	mov r6, sb
	muls r6, r1, r6
	movs r5, #0
	ldr r2, _0802B9D8
	str r5, [r7, #0x3c]
	str r5, [r7, #0x40]
	str r5, [r7, #0x44]
	adds r6, #8
	adds r5, r6, r2
	ldrh r3, [r5]
	ldr r1, _0802B9DC
	ldrh r4, [r5, #2]
	ands r1, r3
	lsls r6, r1, #5
	adds r4, #8
	strh r4, [r5, #2]
	str r6, [sp, #0x14]
	ldr r5, _0802B9E0
	adds r6, #8
	ldr r2, [r5, r6]
	ldr r1, _0802B9E4
	lsls r4, r2, #2
	ldr r2, [r1, r4]
	mov sl, r2
	ldr r2, _0802B9E8
	movs r1, #0
	ldrsh r6, [r2, r1]
	mov fp, r2
	cmp r6, #3
	beq _0802B8F6
	mov r3, fp
	adds r3, #0x88
	movs r1, #0
	ldrsh r4, [r3, r1]
	movs r6, #0
	cmp r6, r4
	bge _0802B85A
_0802B822:
	adds r4, r6, #0
	adds r4, #0xa8
	mov r2, fp
	ldrb r1, [r2, r4]
	ldr r2, _0802B9D0
	lsls r5, r1, #2
	ldr r4, [r2, r5]
	adds r2, r4, #0
	adds r2, #0xa0
	mov r1, r8
	ldr r0, [r2, #4]
	ldr r5, [r1, #8]
	cmp r0, r5
	beq _0802B84A
	ldr r0, [r2]
	movs r1, #0x8c
	lsls r3, r1, #5
	ands r0, r3
	cmp r0, #0
	beq _0802B880
_0802B84A:
	mov r3, fp
	adds r3, #0x88
	movs r1, #0
	ldrsh r4, [r3, r1]
	adds r6, #1
	cmp r6, r4
	blt _0802B822
	ldr r5, _0802B9E0
_0802B85A:
	ldr r2, [sp, #0x14]
	adds r2, #0x18
	ldr r6, [r5, r2]
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	bne _0802B86A
	b _0802B764
_0802B86A:
	mov r2, r8
	ldr r1, [r2, #0x10]
	cmp r1, #0
	beq _0802B878
	ldr r0, [sp, #0x18]
	bl sub_0802026C
_0802B878:
	adds r0, r7, #0
	bl obj_free
	b _0802B764
_0802B880:
	ldr r0, [r4, #0x24]
	ldr r1, [r7, #0x24]
	subs r2, r0, r1
	asrs r0, r2, #8
	ldr r3, [r4, #0x2c]
	ldr r2, [r7, #0x2c]
	subs r3, r3, r2
	asrs r3, r3, #8
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r3, #0
	muls r0, r3, r0
	adds r3, r0, #0
	adds r0, r2, r3
	cmp r0, sl
	bge _0802B84A
	ldrb r3, [r4, #2]
	movs r0, #0
	cmp r3, #1
	beq _0802B8E4
	cmp r3, #2
	beq _0802B8D8
_0802B8AC:
	cmp r0, #0
	beq _0802B8D2
	adds r1, r4, #0
	ldr r0, [sp, #0x18]
	bl sub_08020210
	mov r1, r8
	ldr r2, _0802B9E8
	str r4, [r1, #0x10]
	movs r1, #0
	ldrsh r5, [r2, r1]
	mov fp, r2
	cmp r5, #6
	bne _0802B84A
	adds r0, r4, #0
	ldr r1, _0802B9EC
	bl sub_08014264
	b _0802B84A
_0802B8D2:
	ldr r2, _0802B9E8
	mov fp, r2
	b _0802B84A
_0802B8D8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800E35C
	b _0802B8AC
_0802B8E4:
	ldr r2, _0802B9F0
	mov r3, sl
	subs r2, r2, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl player_weapon_hit
	b _0802B8AC
_0802B8F6:
	ldr r4, [r0, #4]
	ldrb r0, [r4, #2]
	cmp r0, #0x35
	bne _0802B85A
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r6, [r2, #8]
	cmp r6, #3
	bne _0802B85A
	mov r2, r8
	ldr r1, [r2]
	movs r0, #0x8c
	lsls r3, r0, #5
	ands r1, r3
	cmp r1, #0
	bne _0802B85A
	mov r3, r8
	ldr r1, [r3, #8]
	adds r0, r4, #0
	ldr r2, _0802B9EC
	bl sub_08027FBC
	b _0802B85A
_0802B924:
	mov r2, r8
	ldr r4, [r2, #0xc]
	mov r1, r8
	lsls r6, r4, #1
	subs r4, #0x3c
	str r4, [r1, #0xc]
	ldr r1, [r7, #0x28]
	subs r6, #0x3c
	movs r3, #0xc8
	adds r5, r1, r6
	lsls r2, r3, #2
	str r6, [r7, #0x40]
	cmp r5, r2
	blt _0802B942
	b _0802B764
_0802B942:
	adds r5, r2, #0
	movs r3, #2
	subs r4, r5, r1
	mov r1, r8
	str r4, [r7, #0x40]
	str r3, [r1]
	mov r2, sl
	ldrh r6, [r2]
	movs r4, #0x18
	muls r6, r4, r6
	ldr r5, _0802B9D8
	adds r0, r7, #0
	adds r1, r6, r5
	ldrh r6, [r1, #0xa]
	mov fp, r3
	bl obj_destroy_sprite
	adds r0, r7, #0
	movs r1, #0x56
	movs r2, #0x23
	bl obj_setup_sprite
	mov r1, sl
	ldrh r0, [r1]
	muls r0, r4, r0
	mov r3, fp
	adds r2, r0, r5
	movs r4, #0x80
	movs r5, #0x7f
	strh r6, [r2, #0xa]
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	ldr r0, [r7, #0x24]
	lsls r6, r4, #9
	str r5, [sp]
	str r3, [sp, #8]
	movs r5, #0xa
	movs r3, #0xd0
	movs r4, #0
	str r6, [sp, #4]
	str r5, [sp, #0xc]
	str r4, [sp, #0x10]
	bl gamesfx_play_at
	movs r0, #0x3c
	bl sub_08020204
	ldr r1, [sp, #0x18]
	ldrb r3, [r1, #2]
	cmp r3, #1
	beq _0802B9BC
	cmp r3, #2
	beq _0802B9AE
	b _0802B764
_0802B9AE:
	ldr r0, [sp, #0x18]
	movs r1, #0x3c
	movs r2, #0x3c
	movs r3, #0
	bl sub_0800E740
	b _0802B764
_0802B9BC:
	movs r3, #0x3c
	adds r0, r1, #0
	movs r2, #0
	movs r1, #0
	str r3, [sp]
	str r4, [sp, #4]
	bl sub_0800A8D4
	b _0802B764
	.byte 0x00, 0x00
_0802B9D0:
	.4byte gRacerObjects
_0802B9D4:
	.4byte 0x0201A734
_0802B9D8:
	.4byte 0x02018F34
_0802B9DC:
	.4byte 0x00007FFF
_0802B9E0:
	.4byte 0x0201AA4C
_0802B9E4:
	.4byte gUnk_0884F034
_0802B9E8:
	.4byte gGameSetup
_0802B9EC:
	.4byte 0x00002666
_0802B9F0:
	.4byte 0x00000A28
