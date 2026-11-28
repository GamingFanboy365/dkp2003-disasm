@ asm/act_powerup.s: ROM 0x0104F8-0x0108C8 (rom, VMA 0x080104F8)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_powerup
	.thumb_func
	.type init_powerup, %function
init_powerup: @ 080104F8
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080105B8
_08010502:
	ldr r2, _08010530
	movs r1, #0
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _08010534
	cmp r3, #2
	beq _08010534
	cmp r3, #3
	beq _08010534
	cmp r3, #4
	beq _08010534
	cmp r3, #5
	beq _08010534
	cmp r3, #6
	beq _08010534
_08010520:
	adds r0, r4, #0
	bl obj_free
_08010526:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08010530:
	.4byte gGameSetup
_08010534:
	movs r3, #2
	ldrsh r2, [r2, r3]
	cmp r2, #0
	beq _080105A8
_0801053C:
	cmp r2, #1
	bne _08010520
	adds r5, r4, #0
	adds r5, #0x9c
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	ldr r2, [r1, #8]
	cmp r2, #1
	bne _08010520
_0801054E:
	ldr r0, _08010588
	movs r1, #0x2f
	strh r0, [r4]
	movs r2, #0x13
	adds r0, r4, #0
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _08010590
	adds r1, r3, r2
	ldr r2, _0801058C
	strh r2, [r1, #0xa]
	bl spr_set_shadow_size
	ldr r0, [r5]
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0
	strb r2, [r1]
	ldr r1, [r0, #0xc]
	ldrb r2, [r1, #1]
	movs r0, #0x80
	lsls r1, r2, #8
	lsls r2, r0, #3
	b _08010594
_08010588:
	.4byte 0x00000001
_0801058C:
	.4byte 0x00000032
_08010590:
	.4byte gSprites
_08010594:
	str r2, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r4, #0
	bl obj_add_static_hit
	b _08010526
_080105A8:
	adds r5, r4, #0
	adds r5, #0x9c
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	ldr r0, [r1, #4]
	cmp r0, #1
	bne _0801053C
	b _0801054E
_080105B8:
	ldr r0, _080105D0
	ldr r1, _080105D4
	str r0, [sp]
	ldr r2, _080105D8
	ldr r0, _080105DC
	movs r3, #0x24
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010502
_080105D0:
	.4byte gUnk_08050654
_080105D4:
	.4byte gUnk_08050660
_080105D8:
	.4byte gUnk_08050674
_080105DC:
	.4byte gUnk_08050684

	.global act_powerup
	.thumb_func
	.type act_powerup, %function
act_powerup: @ 080105E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	bne _080105EC
	b _08010750
_080105EC:
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r3, [r5]
	cmp r3, #1
	bne _080105F8
	b _080106BC
_080105F8:
	cmp r3, #1
	bgt _08010610
	cmp r3, #0
	beq _08010608
_08010600:
	ldrb r1, [r5]
	ldr r0, _08010664
	bl AGBPrintf
_08010608:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08010610:
	cmp r3, #2
	beq _0801066C
	cmp r3, #3
	bne _08010600
	movs r1, #2
	ldrsh r2, [r5, r1]
	ldrh r3, [r5, #2]
	cmp r2, #0
	beq _08010650
	subs r3, #2
	lsls r2, r3, #0x10
	strh r3, [r5, #2]
	cmp r2, #0
	ble _0801064A
_0801062C:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r2, #0x18
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r3, _0801065C
	ldrh r2, [r5, #2]
	subs r3, r3, r2
	ldr r2, _08010668
	adds r1, r1, r2
	strh r3, [r1, #0xa]
	bl spr_set_shadow_size
	b _08010608
_0801064A:
	ldr r0, _08010660
	strh r0, [r5, #2]
	b _0801062C
_08010650:
	strb r2, [r5]
	adds r0, r4, #0
	bl obj_add_static_hit
	b _0801062C
	.byte 0x00, 0x00
_0801065C:
	.4byte 0x00000032
_08010660:
	.4byte 0x00000000
_08010664:
	.4byte gUnk_080506C0
_08010668:
	.4byte gSprites
_0801066C:
	movs r1, #2
	ldrsh r6, [r5, r1]
	ldrh r3, [r5, #2]
	cmp r6, #0
	beq _08010686
	subs r3, #2
	lsls r2, r3, #0x10
	strh r3, [r5, #2]
	cmp r2, #0
	bgt _08010608
	ldr r1, _080106B0
	strh r1, [r5, #2]
	b _08010608
_08010686:
	ldr r1, _080106B4
	movs r0, #3
	strh r1, [r5, #2]
	strb r0, [r5]
	movs r1, #0x2f
	adds r0, r4, #0
	movs r2, #0x33
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _080106B8
	adds r1, r3, r2
	strh r6, [r1, #0xa]
	bl spr_set_shadow_size
	b _08010608
	.byte 0x00, 0x00
_080106B0:
	.4byte 0x00000000
_080106B4:
	.4byte 0x0000000F
_080106B8:
	.4byte gSprites
_080106BC:
	ldr r0, [r4, #0x24]
	ldr r3, [r4, #0x3c]
	adds r1, r0, r3
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x40]
	adds r2, r0, r1
	ldr r3, [r4, #0x2c]
	str r2, [r4, #0x28]
	ldr r2, [r4, #0x44]
	adds r0, r3, r2
	ldr r2, _08010768
	str r0, [r4, #0x2c]
	cmp r1, r2
	ble _080106E6
	adds r0, r1, #0
	subs r0, #8
	str r0, [r4, #0x40]
	cmp r0, r2
	bge _080106E6
	str r2, [r4, #0x40]
_080106E6:
	ldr r3, [r4, #0x28]
	cmp r3, #0
	blt _0801074A
_080106EC:
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r1, #0x18
	muls r2, r1, r2
	ldr r0, _0801076C
	adds r2, #8
	ldrh r3, [r0, r2]
	adds r2, r2, r0
	ldrh r0, [r2, #2]
	ldr r1, _08010770
	adds r0, #0xc
	ands r1, r3
	strh r0, [r2, #2]
	lsls r3, r1, #5
	ldr r2, _08010774
	adds r3, #0x18
	ldr r0, [r2, r3]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801071A
	b _08010608
_0801071A:
	adds r0, r4, #0
	bl obj_destroy_sprite
	movs r0, #2
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r1, [r0]
	ldr r2, [r1]
	lsls r1, r2, #8
	str r1, [r4, #0x24]
	ldr r2, [r0]
	ldr r1, [r2, #4]
	lsls r2, r1, #8
	str r2, [r4, #0x28]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	movs r2, #0
	lsls r1, r0, #8
	str r1, [r4, #0x2c]
	str r2, [r4, #0x44]
	str r2, [r4, #0x40]
	str r2, [r4, #0x3c]
	b _08010608
_0801074A:
	rsbs r2, r3, #0
	str r2, [r4, #0x40]
	b _080106EC
_08010750:
	ldr r0, _08010778
	ldr r1, _0801077C
	str r0, [sp]
	ldr r2, _08010780
	ldr r0, _08010784
	movs r3, #0x3d
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080105EC
_08010768:
	.4byte 0xFFFFFD00
_0801076C:
	.4byte gSprites
_08010770:
	.4byte 0x00007FFF
_08010774:
	.4byte gAnims
_08010778:
	.4byte gUnk_08050654
_0801077C:
	.4byte gUnk_08050660
_08010780:
	.4byte gUnk_080506E0
_08010784:
	.4byte gUnk_08050684

	.global react_powerup
	.thumb_func
	.type react_powerup, %function
react_powerup: @ 08010788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	sub sp, #0x14
	mov sl, r1
	cmp r7, #0
	bne _0801079C
	b _08010896
_0801079C:
	mov r1, sl
	cmp r1, #0
	bne _080107A4
	b _0801087E
_080107A4:
	mov r3, sl
	ldrb r2, [r3, #2]
	adds r1, r2, #0
	adds r1, #0xff
	lsls r3, r1, #0x18
	movs r1, #0x80
	lsls r0, r1, #0x11
	cmp r3, r0
	bls _080107CE
	adds r3, r2, #0
	cmp r3, #0x32
	beq _080107CE
	cmp r3, #0x35
	beq _080107CE
_080107C0:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080107CE:
	mov r3, sl
	ldr r2, _0801083C
	adds r3, #0xa0
	ldr r5, [r3, #4]
	ldr r4, [r2]
	cmp r5, r4
	beq _0801085C
_080107DC:
	movs r6, #0x80
	lsls r5, r6, #9
	movs r4, #0x7f
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	movs r6, #0xa
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #2
	movs r5, #0
	movs r3, #0x90
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	str r5, [sp, #0x10]
	bl gamesfx_play_at
_080107FE:
	ldr r6, _08010838
	adds r5, r7, #0
	adds r5, #0xa0
	movs r4, #1
	strb r4, [r5]
	strh r6, [r5, #2]
	adds r5, r7, #0
	adds r5, #0x5a
	ldrh r0, [r5]
	movs r4, #0x18
	muls r0, r4, r0
	ldr r6, _08010840
	adds r1, r0, r6
	ldrh r3, [r1, #0xa]
	adds r0, r7, #0
	mov r8, r3
	bl obj_destroy_sprite
	adds r0, r7, #0
	movs r1, #0x30
	movs r2, #0x23
	bl obj_setup_sprite
	ldrh r2, [r5]
	muls r2, r4, r2
	mov r0, r8
	adds r1, r2, r6
	b _08010844
	.byte 0x00, 0x00
_08010838:
	.4byte 0x0000003C
_0801083C:
	.4byte gLocalPlayerIndex
_08010840:
	.4byte gSprites
_08010844:
	strh r0, [r1, #0xa]
	adds r0, r7, #0
	bl obj_remove_static_hit
	mov r1, sl
	ldr r2, [r1, #0x3c]
	str r2, [r7, #0x3c]
	ldr r0, [r1, #0x40]
	str r0, [r7, #0x40]
	ldr r2, [r1, #0x44]
	str r2, [r7, #0x44]
	b _080107C0
_0801085C:
	ldr r0, _080108B0
	adds r0, #0x8c
	ldr r6, [r0]
	cmp r6, #7
	bne _080107DC
	movs r1, #0
	movs r3, #0x80
	movs r4, #0xa
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x90
	str r4, [sp]
	bl gamesfx_play
	b _080107FE
_0801087E:
	ldr r0, _080108B4
	ldr r1, _080108B8
	str r0, [sp]
	ldr r2, _080108BC
	ldr r0, _080108C0
	movs r3, #0x92
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080107A4
_08010896:
	ldr r0, _080108C4
	ldr r1, _080108B8
	str r0, [sp]
	ldr r2, _080108BC
	ldr r0, _080108C0
	movs r3, #0x91
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801079C
	.byte 0x00, 0x00
_080108B0:
	.4byte gGameSetup
_080108B4:
	.4byte gUnk_080506EC
_080108B8:
	.4byte gUnk_08050660
_080108BC:
	.4byte gUnk_080506F8
_080108C0:
	.4byte gUnk_08050684
_080108C4:
	.4byte gUnk_08050654
