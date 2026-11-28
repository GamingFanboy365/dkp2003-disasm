@ asm/act_banana.s: ROM 0x0112B4-0x011AAC (rom, VMA 0x080112B4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_banana
	.thumb_func
	.type init_banana, %function
init_banana: @ 080112B4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801130C
_080112BE:
	ldr r0, _080112F8
	movs r1, #0x31
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
	ldr r2, _080112FC
	adds r3, r3, r2
	strh r1, [r3, #0xa]
	bl sub_08002FE0
	movs r1, #0x80
	lsls r0, r1, #3
	str r0, [sp]
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r4, #0
	b _08011300
_080112F8:
	.4byte 0x00000005
_080112FC:
	.4byte 0x02018F34
_08011300:
	bl obj_add_static_hit
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0801130C:
	ldr r0, _08011324
	ldr r1, _08011328
	str r0, [sp]
	ldr r2, _0801132C
	ldr r0, _08011330
	movs r3, #0x18
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080112BE
_08011324:
	.4byte gUnk_08050968
_08011328:
	.4byte gUnk_08050974
_0801132C:
	.4byte gUnk_08050988
_08011330:
	.4byte gUnk_08050994

	.global react_banana
	.thumb_func
	.type react_banana, %function
react_banana: @ 08011334
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	adds r4, r1, #0
	cmp r5, #0
	beq _08011378
_08011340:
	cmp r4, #0
	beq _08011360
_08011344:
	ldrb r2, [r4, #2]
	adds r2, #0xff
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r1, r2, #0x11
	cmp r0, r1
	bhi _08011358
	adds r0, r5, #0
	bl obj_free
_08011358:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08011360:
	ldr r0, _08011390
	ldr r1, _08011394
	str r0, [sp]
	ldr r2, _08011398
	ldr r0, _0801139C
	movs r3, #0x2b
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08011344
_08011378:
	ldr r0, _080113A0
	ldr r1, _08011394
	str r0, [sp]
	ldr r2, _08011398
	ldr r0, _0801139C
	movs r3, #0x2a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08011340
_08011390:
	.4byte gUnk_080509D0
_08011394:
	.4byte gUnk_08050974
_08011398:
	.4byte gUnk_080509DC
_0801139C:
	.4byte gUnk_08050994
_080113A0:
	.4byte gUnk_08050968

	.global sub_080113A4
	.thumb_func
	.type sub_080113A4, %function
sub_080113A4: @ 080113A4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r5, r1, #0
	movs r7, #0x8d
	movs r1, #0xa0
	sub sp, #4
	str r0, [sp]
	lsls r3, r7, #1
	adds r0, r1, r5
	mov sl, r0
	adds r1, r3, r5
	ldr r0, _08011598
	ldrh r2, [r1]
	ldr r4, [r0]
	lsls r6, r2, #4
	adds r0, r4, r6
	mov r8, r2
	movs r2, #4
	ldrsh r3, [r0, r2]
	lsls r2, r3, #4
	mov lr, r0
	adds r0, r4, r2
	movs r2, #0xa
	ldrsh r4, [r0, r2]
	ldr r7, [r5, #0x30]
	mov ip, r3
	mov sb, r1
	movs r3, #8
	ldrsh r1, [r0, r3]
	ldr r3, [r5, #0x38]
	adds r2, r1, #0
	muls r2, r7, r2
	muls r3, r4, r3
	asrs r7, r2, #8
	asrs r3, r3, #8
	ldr r6, [r0, #0xc]
	adds r2, r7, r3
	ldr r3, [r5, #0x24]
	adds r7, r2, r6
	adds r2, r1, #0
	muls r2, r3, r2
	ldr r1, [r5, #0x2c]
	muls r1, r4, r1
	asrs r2, r2, #8
	asrs r3, r1, #8
	adds r1, r2, r3
	adds r2, r1, r6
	mov r3, sl
	movs r6, #0x8f
	str r2, [r3, #0x74]
	lsls r3, r6, #1
	adds r6, r5, r3
	ldrb r3, [r6]
	movs r1, #0x10
	rsbs r1, r1, #0
	mov fp, r1
	ands r1, r3
	strb r1, [r6]
	cmp r2, r7
	blt _080114EE
	cmp r7, #0
	blt _08011442
_08011428:
	ldr r3, _0801159C
	movs r1, #0
	adds r0, r5, r3
	strb r1, [r0]
_08011430:
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08011442:
	cmp r2, #0
	blt _08011428
	mov r2, ip
	cmp r2, #0
	beq _0801148C
_0801144C:
	mov r6, ip
	mov r1, sb
	movs r2, #0x8c
	strh r6, [r1]
	lsls r1, r2, #1
	adds r6, r5, r1
	ldrh r4, [r6]
	movs r1, #4
	ldrsh r2, [r0, r1]
	ldr r1, _08011598
	adds r4, #1
	strh r4, [r6]
	ldr r4, [r1]
	lsls r6, r2, #4
	adds r0, r4, r6
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r5, #0x24]
	movs r3, #0xa
	ldrsh r4, [r0, r3]
	ldr r6, [r0, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r1, r0, #8
	ldr r0, [r5, #0x2c]
	muls r0, r4, r0
	asrs r3, r0, #8
	adds r0, r1, r3
	adds r3, r0, r6
	mov r0, sl
	str r3, [r0, #0x74]
	b _08011428
_0801148C:
	movs r4, #0x8e
	lsls r2, r4, #1
	adds r4, r5, r2
	ldrb r2, [r4]
	adds r3, r2, #0
	cmp r3, #0
	beq _080114A6
	ldr r3, _080115A0
	adds r6, r5, r3
	strb r2, [r6]
	mov r6, ip
	strb r6, [r4]
	b _0801144C
_080114A6:
	cmp r1, #0
	beq _080114CC
	ldr r3, _080115A0
	adds r4, r5, r3
_080114AE:
	ldrb r1, [r6]
	mov r3, fp
	ands r3, r1
	movs r1, #1
	orrs r3, r1
	strb r3, [r6]
	ldrb r3, [r4]
	adds r3, #1
	strb r3, [r4]
	mov r2, sl
	ldr r6, [r2, #4]
	ldr r4, _080115A4
	adds r6, #0x90
	strb r3, [r4, r6]
	b _0801144C
_080114CC:
	mov r3, sl
	ldr r4, [r3, #4]
	movs r3, #0xa
	muls r3, r4, r3
	ldr r2, _080115A0
	adds r4, r5, r2
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r1, r3, r2
	ldr r2, [sp]
	adds r2, #0xa0
	lsls r3, r1, #2
	ldr r1, [r2, #8]
	ldr r2, _080115A4
	adds r3, #0xb0
	str r1, [r2, r3]
	b _080114AE
_080114EE:
	mov r0, lr
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r5, #0x30]
	movs r3, #0xa
	ldrsh r4, [r0, r3]
	ldr r6, [r0, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r7, r0, #8
	ldr r0, [r5, #0x38]
	muls r0, r4, r0
	asrs r3, r0, #8
	adds r0, r7, r3
	adds r7, r0, r6
	ldr r0, [r5, #0x24]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, [r5, #0x2c]
	muls r1, r4, r1
	asrs r0, r2, #8
	asrs r3, r1, #8
	adds r1, r0, r3
	adds r0, r1, r6
	cmp r0, #0
	blt _0801152C
_08011522:
	ldr r3, _0801159C
	movs r2, #1
	adds r0, r5, r3
	strb r2, [r0]
	b _08011430
_0801152C:
	cmp r7, #0
	blt _08011522
	mov r0, r8
	cmp r0, #0
	beq _08011576
_08011536:
	mov r3, lr
	ldrh r6, [r3, #6]
	mov r0, sb
	movs r1, #0x8c
	strh r6, [r0]
	lsls r4, r1, #1
	adds r0, r5, r4
	ldrh r2, [r0]
	ldr r1, _08011598
	subs r2, #1
	ldr r4, [r1]
	lsls r3, r6, #0x10
	strh r2, [r0]
	asrs r6, r3, #0xc
	adds r0, r4, r6
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r5, #0x24]
	movs r3, #0xa
	ldrsh r4, [r0, r3]
	ldr r6, [r0, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r1, r0, #8
	ldr r0, [r5, #0x2c]
	muls r0, r4, r0
	asrs r3, r0, #8
	adds r0, r1, r3
	adds r1, r0, r6
	mov r0, sl
	str r1, [r0, #0x74]
	b _08011522
_08011576:
	ldr r0, _080115A0
	movs r6, #0x8e
	adds r1, r5, r0
	ldrb r3, [r1]
	lsls r2, r6, #1
	adds r4, r5, r2
	strb r3, [r4]
	ldrb r6, [r1]
	subs r6, #1
	lsls r4, r6, #0x18
	strb r6, [r1]
	cmp r4, #0
	bge _08011536
	mov r4, r8
	strb r4, [r1]
	b _08011536
	.byte 0x00, 0x00
_08011598:
	.4byte 0x02023F88
_0801159C:
	.4byte 0x0000011D
_080115A0:
	.4byte 0x0000011F
_080115A4:
	.4byte gGameSetup

	.global sub_080115A8
	.thumb_func
	.type sub_080115A8, %function
sub_080115A8: @ 080115A8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x10]
	ldr r1, _0801173C
	ldr r0, [r1]
	cmp r0, #0
	bne _080115C2
	b _08011750
_080115C2:
	ldr r2, _08011740
	movs r0, #0
	adds r2, #0x88
	mov fp, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp fp, r0
	bge _080115EC
	ldr r5, _08011744
	adds r6, r2, #0
_080115D6:
	ldm r5!, {r7}
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	bl sub_080113A4
	movs r3, #1
	movs r4, #0
	ldrsh r2, [r6, r4]
	add fp, r3
	cmp fp, r2
	blt _080115D6
_080115EC:
	ldr r1, _08011740
	adds r1, #0x88
	movs r5, #0
	movs r0, #0
	ldrsh r4, [r1, r0]
	mov fp, r5
	cmp fp, r4
	bge _080116C2
	mov r2, sp
	adds r2, #0x30
	add r1, sp, #0x14
	str r2, [sp, #0xc]
	str r5, [sp, #8]
	mov sb, r1
_08011608:
	ldr r1, [sp, #8]
	ldr r7, _08011744
	ldr r4, [r7, r1]
	ldr r7, _08011748
	adds r0, r4, r7
	subs r7, #5
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r3, r4, r7
	ldrh r7, [r3]
	add r2, sp, #0x34
	lsls r0, r5, #8
	ldr r5, [sp, #8]
	adds r1, r2, #0
	orrs r0, r7
	str r0, [r5, r1]
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r4, [r2, #4]
	ldr r7, [sp, #8]
	add r5, sp, #0x54
	str r4, [r5, r7]
	ldr r4, [r2, #0x74]
	mov r3, fp
	mov r2, sb
	str r4, [r2, r7]
	mov r8, fp
	cmp r3, #0
	ble _080116A8
	ldr r3, [sp, #0xc]
	ldr r2, [r3]
	cmp r0, r2
	blt _080116A8
	adds r7, r5, #0
	mov r0, fp
	adds r5, r1, #0
	mov sl, r5
	lsls r5, r0, #2
	mov ip, sb
	subs r6, r5, #4
_08011658:
	ldr r0, [r1, r5]
	ldr r2, [r1, r6]
	str r2, [r1, r5]
	str r0, [r1, r6]
	ldr r1, [r5, r7]
	ldr r4, [r6, r7]
	str r4, [r5, r7]
	str r1, [r6, r7]
	mov r1, ip
	ldr r2, [r6, r1]
	ldr r0, [r5, r1]
	str r2, [r5, r1]
	mov r2, r8
	lsls r4, r2, #2
	str r0, [r6, r1]
	mov lr, r8
	subs r0, r4, #4
	adds r1, r4, #0
	cmp r2, #0
	ble _0801168C
	mov r3, sl
	ldr r4, [r1, r3]
	ldr r2, [r0, r3]
	cmp r4, r2
	bne _0801168C
	b _080118E8
_0801168C:
	movs r0, #1
	rsbs r1, r0, #0
	add r8, r1
	mov r0, r8
	subs r5, #4
	subs r6, #4
	cmp r0, #0
	ble _080116A8
	add r0, sp, #0x34
	adds r1, r0, #0
	ldr r3, [r1, r5]
	ldr r4, [r1, r6]
	cmp r3, r4
	bge _08011658
_080116A8:
	ldr r1, [sp, #0xc]
	ldr r5, [sp, #8]
	adds r1, #4
	adds r5, #4
	str r5, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _0801174C
	movs r5, #1
	movs r0, #0
	ldrsh r7, [r2, r0]
	add fp, r5
	cmp fp, r7
	blt _08011608
_080116C2:
	ldr r0, _08011740
	adds r7, r0, #0
	adds r7, #0x8c
	ldr r4, [r7]
	cmp r4, #7
	bne _080116D0
	b _08011850
_080116D0:
	ldr r7, _08011740
	movs r2, #0
	mov fp, r2
	adds r2, r7, #0
	adds r2, #0x88
	movs r4, #0
	ldrsh r1, [r2, r4]
	cmp fp, r1
	bge _08011750
_080116E2:
	mov r5, fp
	lsls r6, r5, #2
	add r3, sp, #0x54
	ldr r4, [r3, r6]
	ldr r1, _08011744
	lsls r5, r4, #2
	ldr r4, [r1, r5]
	adds r5, r4, #0
	adds r5, #0xa0
	ldr r2, [r5, #4]
	movs r6, #0x8f
	lsls r3, r6, #1
	mov r0, fp
	adds r2, #0x98
	adds r6, r4, r3
	strb r0, [r7, r2]
	ldrb r0, [r6]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0801171A
	ldrh r0, [r6]
	ldr r3, _08011738
	ands r3, r0
	movs r0, #0x80
	lsls r2, r0, #3
	cmp r3, r2
	beq _0801179C
_0801171A:
	ldr r3, _08011740
	movs r0, #0
	ldrsh r7, [r3, r0]
	cmp r7, #0
	beq _08011762
_08011724:
	movs r7, #1
	add fp, r7
	ldr r7, _08011740
	adds r2, r7, #0
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp fp, r0
	blt _080116E2
	b _08011750
_08011738:
	.4byte 0x0000FFF0
_0801173C:
	.4byte 0x02023F8C
_08011740:
	.4byte gGameSetup
_08011744:
	.4byte gRacerObjects
_08011748:
	.4byte 0x0000011F
_0801174C:
	.4byte 0x0202D7D4
_08011750:
	add sp, #0x74
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08011762:
	ldr r2, _08011938
	ldr r1, [r5, #4]
	ldr r0, [r2]
	cmp r1, r0
	bne _08011724
	ldrb r3, [r6]
	movs r7, #0xf0
	ands r7, r3
	cmp r7, #0
	beq _08011782
_08011776:
	movs r3, #0x90
	lsls r5, r3, #1
	adds r1, r4, r5
	movs r2, #0
	str r2, [r1]
	b _08011724
_08011782:
	adds r0, r1, #0
	ldr r7, _0801193C
	adds r0, #0x98
	ldrb r1, [r7, r0]
	cmp r1, #7
	bne _08011776
	movs r7, #0x90
	lsls r0, r7, #1
	adds r1, r4, r0
	ldr r2, [r1]
	adds r2, #2
	str r2, [r1]
	b _08011724
_0801179C:
	ldr r0, [r5, #4]
	mov r3, fp
	adds r0, #0xa0
	strb r3, [r7, r0]
	adds r0, r1, #0
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r6]
	ldr r2, _08011938
	ldr r0, [r5, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _08011826
	ldr r0, _08011940
_080117B8:
	ldr r7, [r5, #4]
	ldr r1, [r0]
	cmp r7, r1
	bge _080117C6
	movs r0, #0x3c
	bl sub_08020204
_080117C6:
	ldr r1, _0801193C
	movs r0, #0
	ldrsh r2, [r1, r0]
	cmp r2, #2
	beq _08011814
	mov r2, fp
	cmp r2, #0
	beq _0801180E
	mov r3, fp
	subs r3, #1
	cmp r3, #2
	bhi _08011802
	adds r0, r4, #0
	movs r1, #3
_080117E2:
	movs r2, #0
	bl gamesfx_play_voice
_080117E8:
	ldrb r3, [r4, #2]
	cmp r3, #1
	beq _080117FA
	cmp r3, #2
	bne _0801171A
	adds r0, r4, #0
	bl sub_0800E820
	b _0801171A
_080117FA:
	adds r0, r4, #0
	bl sub_0800A798
	b _0801171A
_08011802:
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl gamesfx_play_voice
	b _080117E8
_0801180E:
	adds r0, r4, #0
	movs r1, #2
	b _080117E2
_08011814:
	mov r1, fp
	cmp r1, #0
	beq _08011820
	adds r0, r4, #0
	movs r1, #4
	b _080117E2
_08011820:
	adds r0, r4, #0
	movs r1, #2
	b _080117E2
_08011826:
	movs r0, #4
	bl camera_op_set
	adds r0, r7, #0
	adds r0, #0x8c
	movs r7, #8
	str r7, [r0]
	ldr r1, [sp, #0x10]
	movs r2, #0x3c
	adds r1, #0xa0
	str r2, [r1, #4]
	ldr r0, _08011940
	ldr r7, [r0]
	cmp r7, #1
	bne _080117B8
	ldr r7, _08011944
	ldr r3, [r7]
	movs r2, #0x40
	orrs r3, r2
	str r3, [r7]
	b _080117B8
_08011850:
	movs r2, #0
	mov fp, r2
	adds r2, r0, #0
	adds r2, #0x88
	movs r4, #0
	ldrsh r1, [r2, r4]
	cmp fp, r1
	blt _08011862
	b _080116D0
_08011862:
	adds r5, r0, #0
	mov r8, r5
	mov r6, r8
	ldr r7, _08011948
	mov sl, r2
	adds r6, #0xa8
	movs r5, #0
_08011870:
	add r3, sp, #0x54
	ldr r4, [r5, r3]
	lsls r2, r4, #2
	ldr r4, [r7, r2]
	ldr r2, _08011938
	adds r3, r4, #0
	adds r3, #0xa0
	ldr r1, [r3, #4]
	ldr r3, [r2]
	cmp r1, r3
	beq _080118A2
_08011886:
	add r4, sp, #0x54
	ldr r0, [r5, r4]
	strb r0, [r6]
	mov r1, sl
	movs r3, #1
	movs r4, #0
	ldrsh r2, [r1, r4]
	add fp, r3
	adds r6, #1
	adds r5, #4
	mov r0, r8
	cmp fp, r2
	blt _08011870
	b _080116D0
_080118A2:
	movs r3, #0x8f
	lsls r2, r3, #1
	adds r3, r4, r2
	ldrb r2, [r3]
	movs r4, #0xf0
	ands r4, r2
	cmp r4, #0
	bne _08011886
	adds r2, r1, #0
	adds r2, #0x98
	ldrb r3, [r0, r2]
	cmp fp, r3
	bge _080118D0
	lsls r2, r3, #2
	add r1, sp, #0x54
	ldr r0, [r1, r2]
	lsls r1, r0, #2
	ldr r0, [r7, r1]
	movs r2, #1
	movs r1, #1
	bl gamesfx_play_voice
	b _08011886
_080118D0:
	cmp fp, r3
	ble _08011886
	lsls r1, r3, #2
	add r4, sp, #0x54
	ldr r2, [r4, r1]
	lsls r4, r2, #2
	ldr r0, [r7, r4]
	movs r1, #0
	movs r2, #1
	bl gamesfx_play_voice
	b _08011886
_080118E8:
	mov r3, ip
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	cmp r2, r3
	bgt _080118F4
	b _0801168C
_080118F4:
	add r3, sp, #0x34
	str r4, [r1, r3]
	str r4, [r0, r3]
	ldr r4, [r1, r7]
	ldr r2, [r0, r7]
	str r2, [r1, r7]
	str r4, [r0, r7]
	mov r3, sb
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	mov r4, sb
	str r3, [r1, r4]
	str r2, [r0, r4]
	movs r4, #1
	rsbs r3, r4, #0
	add lr, r3
	mov r3, lr
	subs r0, #4
	subs r1, #4
	cmp r3, #0
	bgt _08011920
	b _0801168C
_08011920:
	mov r2, sl
	ldr r4, [r1, r2]
	ldr r3, [r0, r2]
	cmp r4, r3
	beq _0801192C
	b _0801168C
_0801192C:
	mov r3, ip
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	cmp r2, r3
	bgt _080118F4
	b _0801168C
_08011938:
	.4byte gLocalPlayerIndex
_0801193C:
	.4byte gGameSetup
_08011940:
	.4byte 0x0202DE5C
_08011944:
	.4byte gModeFlags
_08011948:
	.4byte gRacerObjects

	.global sub_0801194C
	.thumb_func
	.type sub_0801194C, %function
sub_0801194C: @ 0801194C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r0, #0
	mov fp, r0
	ldr r0, _08011A94
	adds r3, r0, #0
	adds r3, #0x88
	movs r1, #0
	ldrsh r2, [r3, r1]
	cmp fp, r2
	bge _0801199E
_0801196E:
	mov r2, fp
	ldr r4, _08011A98
	lsls r3, r2, #2
	ldr r1, [r4, r3]
	movs r3, #0xa0
	adds r2, r3, r1
	movs r3, #0x8f
	mov sl, r2
	lsls r2, r3, #1
	adds r3, r2, r1
	ldrb r2, [r3]
	mov r8, r3
	movs r3, #0xf0
	ands r3, r2
	cmp r3, #0
	beq _080119B0
_0801198E:
	movs r3, #1
	add fp, r3
	adds r3, r0, #0
	adds r3, #0x88
	movs r2, #0
	ldrsh r1, [r3, r2]
	cmp fp, r1
	blt _0801196E
_0801199E:
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080119B0:
	ldr r7, _08011A9C
	movs r5, #0x8d
	adds r4, r7, r1
	lsls r3, r5, #1
	ldr r7, _08011AA0
	adds r6, r1, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrh r5, [r6]
	movs r2, #3
	ldr r6, [r7]
	mov sb, r4
	subs r4, r2, r0
	adds r2, r6, #0
	muls r2, r4, r2
	subs r1, r6, r5
	ldr r6, _08011AA4
	subs r7, r1, #1
	mov r0, sl
	ldr r1, [r6]
	adds r4, r7, r2
	ldr r7, [r0, #0x74]
	lsls r0, r5, #4
	adds r3, r1, r0
	movs r0, #4
	ldrsh r5, [r3, r0]
	lsls r6, r5, #4
	adds r2, r1, r6
	movs r0, #4
	ldrsh r5, [r2, r0]
	lsls r0, r5, #4
	adds r5, r1, r0
	cmp r4, #0
	ble _08011A30
	mov ip, r1
	adds r6, r4, #0
_080119F8:
	movs r1, #0
	ldrsh r4, [r2, r1]
	lsls r3, r4, #8
	movs r4, #2
	ldrsh r0, [r2, r4]
	lsls r1, r0, #8
	movs r0, #8
	ldrsh r2, [r5, r0]
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	muls r2, r3, r2
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r4, [r5, #0xc]
	asrs r1, r3, #8
	asrs r2, r2, #8
	adds r0, r2, r1
	adds r2, r5, #0
	adds r3, r0, r4
	movs r0, #4
	ldrsh r1, [r2, r0]
	subs r6, #1
	lsls r4, r1, #4
	mov r1, ip
	adds r7, r7, r3
	adds r5, r1, r4
	cmp r6, #0
	bne _080119F8
_08011A30:
	ldr r6, [sp]
	rsbs r4, r7, #0
	movs r2, #0xf0
	adds r6, #0xa0
	lsls r5, r2, #2
	adds r0, r4, #0
	cmp r4, #0
	blt _08011A90
_08011A40:
	adds r1, r5, #0
	ldr r3, _08011AA8
	bl _call_via_r3
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08011A8C
_08011A50:
	ldr r2, [r6, #8]
	mov r3, r8
	ldrb r4, [r3]
	adds r1, r2, r0
	movs r0, #0xf
	ands r0, r4
	movs r4, #0x10
	orrs r0, r4
	mov r4, r8
	strb r0, [r4]
	mov r0, sl
	ldr r3, [r0, #4]
	ldr r4, _08011A94
	adds r2, r3, #0
	adds r3, #0x98
	ldrb r3, [r4, r3]
	adds r2, #0xa0
	strb r3, [r4, r2]
	ldr r2, [r0, #4]
	movs r3, #0xa
	muls r3, r2, r3
	mov r0, sb
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r3, r3, r2
	lsls r0, r3, #2
	adds r0, #0xb0
	str r1, [r4, r0]
	adds r0, r4, #0
	b _0801198E
_08011A8C:
	rsbs r0, r0, #0
	b _08011A50
_08011A90:
	adds r0, r7, #0
	b _08011A40
_08011A94:
	.4byte gGameSetup
_08011A98:
	.4byte gRacerObjects
_08011A9C:
	.4byte 0x0000011F
_08011AA0:
	.4byte 0x02023F8C
_08011AA4:
	.4byte 0x02023F88
_08011AA8:
	.4byte udiv
