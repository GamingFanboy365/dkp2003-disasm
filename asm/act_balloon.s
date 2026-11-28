@ asm/act_balloon.s: ROM 0x0202C8-0x020AB4 (rom, VMA 0x080202C8)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_balloon
	.thumb_func
	.type init_balloon, %function
init_balloon: @ 080202C8
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08020392
_080202D2:
	ldr r2, _080202FC
	movs r1, #0
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _08020300
	cmp r3, #2
	beq _08020300
	cmp r3, #1
	beq _08020300
	cmp r3, #4
	beq _08020300
	cmp r3, #5
	beq _08020300
_080202EC:
	adds r0, r4, #0
	bl obj_free
_080202F2:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080202FC:
	.4byte gGameSetup
_08020300:
	movs r3, #2
	ldrsh r2, [r2, r3]
	cmp r2, #0
	beq _08020382
_08020308:
	cmp r2, #1
	bne _080202EC
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r2, [r1]
	ldr r0, [r2, #0xc]
	ldr r2, [r0, #0x20]
	cmp r2, #1
	bne _080202EC
_0802031A:
	ldr r0, _08020350
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0xa0
	movs r2, #0
	str r2, [r0]
	movs r2, #0x80
	str r2, [r0, #4]
	movs r2, #0x30
	str r2, [r0, #8]
	movs r2, #0xa
	str r2, [r0, #0xc]
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	ldrh r2, [r3, #0x18]
	str r2, [r0, #0x4c]
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #1]
	str r2, [r0, #0x50]
	ldr r2, [r1]
	ldr r3, [r2, #0xc]
	ldr r3, [r3, #8]
	cmp r3, #0
	beq _0802035E
	b _08020354
	.byte 0x00, 0x00
_08020350:
	.4byte 0x00000001
_08020354:
	ldr r3, [r0, #0x54]
	movs r2, #1
	orrs r3, r2
	str r3, [r0, #0x54]
	ldr r2, [r1]
_0802035E:
	ldr r3, [r2, #0xc]
	ldr r3, [r3, #0xc]
	cmp r3, #0
	beq _08020370
	ldr r3, [r0, #0x54]
	movs r2, #2
	orrs r3, r2
	str r3, [r0, #0x54]
	ldr r2, [r1]
_08020370:
	ldr r3, [r2, #0xc]
	ldr r1, [r3, #0x10]
	cmp r1, #0
	beq _080202F2
	ldr r1, [r0, #0x54]
	movs r3, #4
	orrs r1, r3
	str r1, [r0, #0x54]
	b _080202F2
_08020382:
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r0, [r1]
	ldr r3, [r0, #0xc]
	ldr r0, [r3, #0x1c]
	cmp r0, #1
	bne _08020308
	b _0802031A
_08020392:
	ldr r0, _080203AC
	ldr r1, _080203B0
	str r0, [sp]
	ldr r2, _080203B4
	ldr r0, _080203B8
	movs r3, #0x1f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080202D2
	.byte 0x00, 0x00
_080203AC:
	.4byte gUnk_080525AC
_080203B0:
	.4byte gUnk_080525B8
_080203B4:
	.4byte gUnk_080525CC
_080203B8:
	.4byte gUnk_080525DC

	.global act_balloon
	.thumb_func
	.type act_balloon, %function
act_balloon: @ 080203BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	sub sp, #4
	cmp r6, #0
	bne _080203D0
	b _080208B4
_080203D0:
	adds r7, r6, #0
	adds r7, #0xa0
	ldr r3, [r7]
	cmp r3, #1
	bne _080203DC
	b _0802073C
_080203DC:
	cmp r3, #1
	ble _080203E2
	b _0802066C
_080203E2:
	cmp r3, #0
	beq _08020498
_080203E6:
	ldr r1, [r6, #0x24]
	adds r0, r6, #0
	adds r0, #0x84
	str r1, [r0]
	ldr r2, [r6, #0x28]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r6, #0x24]
	ldr r3, [r6, #0x3c]
	ldr r1, [r6, #0x28]
	str r2, [r6, #0x30]
	adds r2, r2, r3
	ldr r3, [r6, #0x40]
	str r2, [r6, #0x24]
	adds r2, r1, r3
	ldr r0, [r6, #0x2c]
	str r2, [r6, #0x28]
	ldr r2, [r6, #0x44]
	str r1, [r6, #0x34]
	adds r1, r0, r2
	str r0, [r6, #0x38]
	str r1, [r6, #0x2c]
	adds r0, r6, #0
	ldr r2, _08020710
	bl _call_via_r2
	ldr r3, [r7]
	cmp r3, #1
	bgt _08020458
	cmp r3, #0
	blt _08020458
	movs r4, #0x80
	movs r1, #0
	ldr r5, _08020714
	lsls r6, r4, #7
	mov ip, r1
	adds r4, r7, #0
	movs r0, #7
_08020438:
	ldm r5!, {r2}
	ldrb r1, [r2, #2]
	cmp r1, #1
	beq _08020470
_08020440:
	subs r0, #1
	cmp r0, #0
	bge _08020438
	mov r5, ip
	cmp r5, #0
	beq _08020468
	movs r1, #0x80
	movs r0, #1
	lsls r2, r1, #7
	str r0, [r7, #0x10]
	subs r0, r2, r6
	str r0, [r7, #0x14]
_08020458:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08020468:
	mov r1, ip
	str r1, [r7, #0x10]
	str r1, [r7, #0x14]
	b _08020458
_08020470:
	ldr r1, [r2, #0x24]
	ldr r3, [r4, #0x1c]
	subs r1, r1, r3
	ldr r3, [r2, #0x2c]
	ldr r2, [r4, #0x24]
	subs r3, r3, r2
	asrs r1, r1, #8
	asrs r3, r3, #8
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r3, #0
	muls r1, r3, r1
	adds r3, r1, #0
	adds r2, r2, r3
	cmp r2, r6
	bge _08020440
	movs r3, #1
	mov ip, r3
	adds r6, r2, #0
	b _08020440
_08020498:
	movs r1, #0
	mov r8, r1
	ldr r1, _08020718
	ldrh r2, [r1]
	adds r0, r2, #0
	movs r4, #0
	cmp r0, #2
	bls _080204AA
	b _08020602
_080204AA:
	ldr r1, _0802071C
	ldr r0, [r1]
	ldr r5, _08020714
	lsls r2, r0, #2
	ldr r1, [r5, r2]
	ldr r5, _08020720
	adds r0, r1, r5
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #0
	ble _080204DE
	movs r1, #1
	mov ip, r1
	subs r3, #1
	mov r2, ip
	ldr r0, [r7, #0x54]
	lsls r2, r3
	ands r0, r2
	mov r8, r2
	cmp r0, #0
	beq _080204DE
	ldr r1, [r7, #0x58]
	ands r1, r2
	cmp r1, #0
	bne _080204DE
	b _080205FE
_080204DE:
	cmp r4, #0
	bne _080204E4
	b _080203E6
_080204E4:
	ldr r1, [r7, #0x10]
	cmp r1, #0
	beq _080204EC
	b _080203E6
_080204EC:
	adds r5, r6, #0
	adds r5, #0x9c
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r4, r2, #8
	str r4, [r6, #0x24]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r4, r2, #8
	str r4, [r6, #0x28]
	ldr r0, [r5]
	ldr r2, [r0, #8]
	lsls r4, r2, #8
	str r4, [r6, #0x2c]
	ldr r3, [r7, #0x50]
	str r1, [r7, #0x18]
	cmp r3, #0
	beq _080205DC
	cmp r3, #1
	beq _080205B8
	ldr r5, [r6, #0x24]
	str r5, [r7, #0x1c]
	ldr r0, [r6, #0x28]
	str r0, [r7, #0x20]
	ldr r2, [r6, #0x2c]
	movs r3, #1
	str r2, [r7, #0x24]
	str r1, [r7, #0x28]
	str r1, [r7, #0x2c]
	str r1, [r7, #0x30]
	str r1, [r7, #0x34]
	str r1, [r7, #0x38]
	str r1, [r7, #0x3c]
	rsbs r1, r3, #0
_08020530:
	ldr r5, [r6, #0x28]
	str r5, [r7, #0x40]
	ldr r3, _08020724
	ldr r2, [r6, #0x28]
	movs r4, #0
	adds r0, r2, r3
	str r0, [r6, #0x28]
	str r4, [r6, #0x3c]
	str r4, [r6, #0x40]
	str r4, [r6, #0x44]
	adds r0, r6, #0
	movs r2, #0x13
	bl obj_setup_sprite
	adds r1, r6, #0
	adds r1, #0x5a
	ldrh r4, [r1]
	movs r2, #0x18
	muls r2, r4, r2
	ldr r1, _08020728
	adds r0, r2, r1
	movs r2, #0x18
	ldr r5, [r7, #4]
	mov sl, r2
	ldr r2, _0802072C
	movs r3, #0x80
	strh r5, [r0, #0xa]
	mov lr, r3
	adds r5, r7, #0
	mov ip, r2
_0802056C:
	mov r0, sl
	muls r0, r4, r0
	adds r3, r0, r1
	ldrh r2, [r3, #6]
	mov r3, lr
	ands r3, r2
	cmp r3, #0
	beq _08020582
	ldr r2, [r5, #8]
	adds r3, r0, r1
	strh r2, [r3, #0xa]
_08020582:
	mov r3, ip
	ldrb r4, [r3, r4]
	cmp r4, #0xff
	bne _0802056C
	ldr r3, [r7, #0xc]
	movs r2, #0x80
	lsls r0, r2, #3
	lsls r1, r3, #8
	str r0, [sp]
	movs r2, #0
	adds r0, r6, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r6, #0
	bl obj_add_vector_hit
	movs r5, #0x80
	ldr r1, [r7, #0x58]
	lsls r2, r5, #1
	mov r5, r8
	movs r0, #1
	orrs r1, r5
	str r2, [r7, #0x44]
	str r0, [r7]
	str r1, [r7, #0x58]
	b _080203E6
_080205B8:
	ldr r4, [r6, #0x24]
	str r4, [r7, #0x1c]
	ldr r5, [r6, #0x28]
	str r5, [r7, #0x20]
	movs r4, #0x80
	ldr r0, [r6, #0x2c]
	lsls r5, r4, #2
	movs r2, #0x10
	str r1, [r7, #0x2c]
	str r5, [r7, #0x34]
	str r1, [r7, #0x38]
	subs r5, #0x80
	movs r1, #0x78
	str r0, [r7, #0x24]
	str r2, [r7, #0x28]
	str r2, [r7, #0x30]
	str r5, [r7, #0x3c]
	b _08020530
_080205DC:
	ldr r0, [r6, #0x24]
	str r0, [r7, #0x1c]
	ldr r2, [r6, #0x28]
	str r2, [r7, #0x20]
	movs r5, #8
	ldr r4, [r6, #0x2c]
	str r1, [r7, #0x2c]
	str r1, [r7, #0x38]
	movs r1, #0xc0
	str r5, [r7, #0x28]
	str r5, [r7, #0x30]
	str r1, [r7, #0x3c]
	adds r5, #0xf8
	movs r1, #0x76
	str r4, [r7, #0x24]
	str r5, [r7, #0x34]
	b _08020530
_080205FE:
	movs r4, #1
	b _080204DE
_08020602:
	subs r5, r2, #4
	movs r0, #0x80
	lsls r2, r5, #0x10
	lsls r5, r0, #9
	cmp r2, r5
	bls _08020610
	b _080204DE
_08020610:
	ldr r2, _08020730
	ldr r1, [r2]
	movs r0, #0
	mov sl, r2
	cmp r0, r1
	blt _0802061E
	b _080204DE
_0802061E:
	ldr r1, _08020714
	movs r3, #1
	mov lr, r1
	mov ip, r3
	mov sb, r7
	adds r5, r2, #0
_0802062A:
	lsls r3, r0, #2
	mov r1, lr
	ldr r2, [r1, r3]
	ldr r1, _08020720
	adds r3, r2, r1
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0
	ble _0802065A
	mov r8, ip
	subs r3, #1
	mov r2, r8
	mov r1, sb
	lsls r2, r3
	ldr r3, [r1, #0x54]
	ands r3, r2
	mov r8, r2
	cmp r3, #0
	beq _0802065A
	ldr r1, [r7, #0x58]
	ands r1, r2
	cmp r1, #0
	beq _08020666
_0802065A:
	mov r2, sl
	ldr r1, [r2]
	adds r0, #1
	cmp r0, r1
	blt _0802062A
	b _080204DE
_08020666:
	ldr r0, [r5]
	movs r4, #1
	b _0802065A
_0802066C:
	cmp r3, #2
	beq _080206C8
	cmp r3, #3
	beq _08020676
	b _080203E6
_08020676:
	adds r2, r6, #0
	adds r2, #0x5a
	ldrh r4, [r2]
	movs r1, #0x18
	adds r2, r4, #0
	muls r2, r1, r2
	ldr r0, _08020728
	adds r2, #8
	ldrh r3, [r0, r2]
	adds r2, r2, r0
	ldrh r0, [r2, #2]
	ldr r1, _08020734
	adds r0, #0xc
	ands r1, r3
	strh r0, [r2, #2]
	lsls r3, r1, #5
	ldr r2, _08020738
	adds r3, #0x18
	ldr r0, [r2, r3]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080206A6
	b _080203E6
_080206A6:
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	beq _080206C0
	adds r0, r6, #0
	bl obj_destroy_sprite
	movs r1, #0
	str r1, [r7]
	b _080203E6
_080206C0:
	adds r0, r6, #0
	bl obj_free
	b _080203E6
_080206C8:
	ldr r4, [r7, #0x48]
	cmp r4, #0
	beq _08020704
	subs r5, r4, #2
	str r5, [r7, #0x48]
	cmp r5, #0
	blt _080206FE
_080206D6:
	ldr r1, [r7, #0x48]
	adds r5, r1, #0
	muls r5, r1, r5
	adds r0, r5, #0
	asrs r2, r0, #8
	ldr r0, _08020724
	muls r2, r0, r2
	ldr r3, [r7, #0x10]
	asrs r1, r2, #8
	movs r2, #0
	cmp r3, #0
	beq _080206F4
	ldr r3, [r7, #0x14]
	muls r3, r0, r3
	asrs r2, r3, #0xe
_080206F4:
	ldr r0, [r7, #0x40]
	adds r3, r0, r1
	adds r0, r3, r2
	str r0, [r7, #0x20]
	b _080203E6
_080206FE:
	movs r1, #0
	str r1, [r7, #0x48]
	b _080206D6
_08020704:
	adds r0, r6, #0
	bl obj_destroy_sprite
	str r4, [r7]
	b _080203E6
	.byte 0x00, 0x00
_08020710:
	.4byte sub_03003750
_08020714:
	.4byte gRacerObjects
_08020718:
	.4byte gGameSetup
_0802071C:
	.4byte gLocalPlayerIndex
_08020720:
	.4byte 0x0000011F
_08020724:
	.4byte 0x00002710
_08020728:
	.4byte 0x02018F34
_0802072C:
	.4byte 0x0201A734
_08020730:
	.4byte 0x0202DE5C
_08020734:
	.4byte 0x00007FFF
_08020738:
	.4byte 0x0201AA4C
_0802073C:
	ldr r3, [r7, #0x44]
	movs r1, #0
	cmp r3, #0
	beq _0802075E
	subs r3, #2
	str r3, [r7, #0x44]
	cmp r3, #0
	bge _0802074E
	b _080208B0
_0802074E:
	ldr r2, [r7, #0x44]
	adds r0, r2, #0
	muls r0, r2, r0
	ldr r1, _080208CC
	adds r5, r0, #0
	asrs r4, r5, #8
	muls r4, r1, r4
	asrs r1, r4, #8
_0802075E:
	ldr r4, [r7, #0x10]
	movs r2, #0
	cmp r4, #0
	beq _0802076E
	ldr r5, [r7, #0x14]
	ldr r3, _080208CC
	muls r5, r3, r5
	asrs r2, r5, #0xe
_0802076E:
	ldr r0, [r7, #0x40]
	adds r4, r0, r1
	adds r5, r4, r2
	ldr r2, [r7, #0x18]
	ldr r0, [r7, #0x34]
	mov r8, r2
	mov r1, r8
	muls r1, r0, r1
	lsls r4, r1, #0x10
	str r5, [r7, #0x20]
	asrs r0, r4, #0x10
	ldr r4, _080208D0
	bl _call_via_r4
	ldr r2, [r7, #0x28]
	lsls r3, r0, #0x10
	ldr r0, [r7, #0x38]
	asrs r5, r3, #0x10
	adds r1, r2, #0
	muls r1, r5, r1
	mov r2, r8
	muls r2, r0, r2
	asrs r5, r1, #4
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	bl _call_via_r4
	ldr r2, [r7, #0x2c]
	lsls r3, r0, #0x10
	ldr r0, [r7, #0x3c]
	asrs r4, r3, #0x10
	adds r1, r2, #0
	muls r1, r4, r1
	mov r2, r8
	muls r2, r0, r2
	asrs r4, r1, #4
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	ldr r2, _080208D4
	bl _call_via_r2
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	ldr r3, [r7, #0x30]
	adds r2, r3, #0
	muls r2, r1, r2
	ldr r0, [r7, #0x1c]
	ldr r3, [r6, #0x24]
	adds r5, r5, r0
	subs r0, r5, r3
	str r0, [r6, #0x3c]
	ldr r5, [r7, #0x20]
	adds r0, r4, r5
	ldr r5, [r6, #0x28]
	subs r4, r0, r5
	str r4, [r6, #0x40]
	ldr r5, [r7, #0x24]
	asrs r1, r2, #4
	adds r0, r1, r5
	ldr r5, [r6, #0x2c]
	subs r1, r0, r5
	str r1, [r6, #0x44]
	ldr r2, [r7, #0x18]
	adds r2, #2
	str r2, [r7, #0x18]
	ldr r5, [r6, #0x40]
	ldr r2, [r6, #0x28]
	movs r0, #0xc8
	adds r1, r2, r5
	lsls r5, r0, #2
	cmp r1, r5
	bge _08020804
	adds r0, r5, #0
	subs r1, r0, r2
	str r1, [r6, #0x40]
_08020804:
	ldr r0, _080208D8
	ldrh r2, [r0]
	movs r1, #0
	mov lr, r1
	adds r1, r2, #0
	cmp r1, #2
	bhi _08020856
	ldr r0, _080208DC
	ldr r1, [r0]
	ldr r5, _080208E0
	lsls r2, r1, #2
	ldr r0, [r5, r2]
	ldr r5, _080208E4
	adds r1, r0, r5
	movs r3, #0
	ldrsb r3, [r1, r3]
	cmp r3, #0
	ble _08020836
	subs r3, #1
	movs r1, #1
	ldr r2, [r7, #0x54]
	lsls r1, r3
	ands r1, r2
	cmp r1, #0
	beq _08020850
_08020836:
	mov r3, lr
	cmp r3, #0
	bne _0802083E
	b _080203E6
_0802083E:
	movs r2, #0x80
	lsls r0, r2, #1
	movs r1, #2
	str r0, [r7, #0x48]
	str r1, [r7]
	adds r0, r6, #0
	bl obj_remove_vector_hit
	b _080203E6
_08020850:
	movs r1, #1
	mov lr, r1
	b _08020836
_08020856:
	subs r0, r2, #4
	movs r2, #0x80
	lsls r1, r0, #0x10
	lsls r0, r2, #9
	cmp r1, r0
	bhi _08020836
	ldr r3, _080208E8
	mov r8, r3
	ldr r3, [r3]
	movs r4, #0
	cmp r3, #0
	ble _0802089E
	movs r5, #1
	ldr r1, _080208E0
	mov ip, r5
	mov sl, r7
	adds r0, r3, #0
_08020878:
	ldm r1!, {r2}
	ldr r5, _080208E4
	adds r3, r2, r5
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0
	ble _08020898
	subs r3, #1
	mov r2, ip
	mov r5, sl
	lsls r2, r3
	ldr r3, [r5, #0x54]
	ands r2, r3
	cmp r2, #0
	beq _080208AC
_08020898:
	subs r0, #1
	cmp r0, #0
	bne _08020878
_0802089E:
	mov r1, r8
	ldr r2, [r1]
	cmp r4, r2
	bne _08020836
	movs r2, #1
	mov lr, r2
	b _08020836
_080208AC:
	adds r4, #1
	b _08020898
_080208B0:
	str r1, [r7, #0x44]
	b _0802074E
_080208B4:
	ldr r0, _080208EC
	ldr r1, _080208F0
	str r0, [sp]
	ldr r2, _080208F4
	ldr r0, _080208F8
	movs r3, #0x4a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080203D0
_080208CC:
	.4byte 0x00002710
_080208D0:
	.4byte sin_fx
_080208D4:
	.4byte cos_fx
_080208D8:
	.4byte gGameSetup
_080208DC:
	.4byte gLocalPlayerIndex
_080208E0:
	.4byte gRacerObjects
_080208E4:
	.4byte 0x0000011F
_080208E8:
	.4byte 0x0202DE5C
_080208EC:
	.4byte gUnk_080525AC
_080208F0:
	.4byte gUnk_080525B8
_080208F4:
	.4byte gUnk_08052618
_080208F8:
	.4byte gUnk_080525DC

	.global react_balloon
	.thumb_func
	.type react_balloon, %function
react_balloon: @ 080208FC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	sub sp, #0x14
	adds r7, r1, #0
	cmp r5, #0
	bne _0802090A
	b _08020A4E
_0802090A:
	cmp r7, #0
	bne _08020910
	b _08020A36
_08020910:
	ldrb r1, [r7, #2]
	cmp r1, #0x2b
	beq _0802091E
_08020916:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802091E:
	adds r4, r5, #0
	adds r0, r5, #0
	adds r4, #0xa0
	bl obj_destroy_sprite
	ldr r3, [r4, #0x50]
	cmp r3, #0
	bne _08020930
	b _08020A32
_08020930:
	cmp r3, #1
	beq _08020A2E
	movs r2, #1
	rsbs r1, r2, #0
_08020938:
	adds r0, r5, #0
	movs r2, #0x23
	bl obj_setup_sprite
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _08020A68
	ldr r6, [r4, #4]
	adds r0, r1, r3
	strh r6, [r0, #0xa]
	movs r6, #3
	str r6, [r4]
	adds r0, r5, #0
	bl obj_remove_vector_hit
	ldr r6, [r4, #0x50]
	cmp r6, #0
	beq _080209CC
	cmp r6, #1
	bne _08020916
	adds r2, r7, #0
	adds r2, #0xa0
	ldr r1, [r2, #8]
	ldr r2, _08020A6C
	lsls r0, r1, #2
	ldr r1, [r2, r0]
	ldr r0, [r4, #0x4c]
	adds r4, r1, #0
	adds r4, #0xa0
	ldr r1, [r4, #4]
	bl sub_0802108C
	ldr r2, _08020A70
	ldr r1, [r4, #4]
	ldr r0, [r2]
	cmp r1, r0
	beq _080209AC
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	movs r3, #0xf3
	str r6, [sp, #8]
	bl gamesfx_play_at
	b _08020916
_080209AC:
	movs r1, #0x80
	lsls r0, r1, #9
	movs r2, #1
	rsbs r1, r2, #0
	str r0, [sp]
	movs r0, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #0xf3
	movs r3, #0x7f
	ldr r0, _08020A74
	str r6, [sp, #4]
	bl gamesfx_play_endcb
	b _08020916
_080209CC:
	adds r2, r7, #0
	adds r2, #0xa0
	ldr r1, [r2, #8]
	ldr r2, _08020A6C
	lsls r0, r1, #2
	ldr r1, [r2, r0]
	ldr r0, [r4, #0x4c]
	adds r4, r1, #0
	adds r4, #0xa0
	ldr r1, [r4, #4]
	bl sub_08020DC8
	ldr r2, _08020A70
	ldr r0, [r4, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _08020A10
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	subs r3, #2
	str r3, [sp, #0xc]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	movs r3, #0xf3
	str r6, [sp, #0x10]
	bl gamesfx_play_at
	b _08020916
_08020A10:
	movs r2, #0x80
	movs r0, #1
	lsls r1, r2, #9
	str r0, [sp, #4]
	subs r0, #2
	str r1, [sp]
	str r0, [sp, #8]
	adds r1, r5, #0
	movs r2, #0xf3
	movs r3, #0x7f
	ldr r0, _08020A74
	str r6, [sp, #0xc]
	bl gamesfx_play_endcb
	b _08020916
_08020A2E:
	movs r1, #0x79
	b _08020938
_08020A32:
	movs r1, #0x77
	b _08020938
_08020A36:
	ldr r0, _08020A78
	ldr r1, _08020A7C
	str r0, [sp]
	ldr r2, _08020A80
	ldr r0, _08020A84
	ldr r3, _08020A88
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08020910
_08020A4E:
	ldr r0, _08020A8C
	movs r3, #0xfe
	str r0, [sp]
	ldr r1, _08020A7C
	ldr r0, _08020A84
	ldr r2, _08020A80
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802090A
_08020A68:
	.4byte 0x02018F34
_08020A6C:
	.4byte gRacerObjects
_08020A70:
	.4byte gLocalPlayerIndex
_08020A74:
	.4byte sub_08020A90
_08020A78:
	.4byte gUnk_08052624
_08020A7C:
	.4byte gUnk_080525B8
_08020A80:
	.4byte gUnk_08052630
_08020A84:
	.4byte gUnk_080525DC
_08020A88:
	.4byte 0x000001FD
_08020A8C:
	.4byte gUnk_080525AC

	.global sub_08020A90
	.thumb_func
	.type sub_08020A90, %function
sub_08020A90: @ 08020A90
	push {lr}
	movs r2, #1
	sub sp, #8
	rsbs r1, r2, #0
	movs r0, #0
	movs r3, #0x80
	str r1, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xf5
	bl gamesfx_play
	add sp, #8
	pop {r0}
	bx r0
	.byte 0xC0, 0x46
