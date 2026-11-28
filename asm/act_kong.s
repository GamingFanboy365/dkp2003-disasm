@ asm/act_kong.s: ROM 0x013300-0x013A64 (rom, VMA 0x08013300)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_kong
	.thumb_func
	.type init_kong, %function
init_kong: @ 08013300
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	bne _0801330C
	b _080133CC
_0801330C:
	ldr r2, _08013324
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08013328
_08013316:
	adds r0, r4, #0
	bl obj_free
_0801331C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08013324:
	.4byte gGameSetup
_08013328:
	movs r3, #2
	ldrsh r1, [r2, r3]
	cmp r1, #0
	beq _080133BC
_08013330:
	cmp r1, #1
	bne _08013316
	adds r2, r4, #0
	adds r2, #0x9c
	ldr r1, [r2]
	ldr r0, [r1, #0xc]
	ldr r1, [r0, #8]
	cmp r1, #1
	bne _08013316
_08013342:
	ldr r1, _08013370
	strh r1, [r4]
	ldr r0, [r2]
	ldr r2, [r0, #0xc]
	ldrb r3, [r2, #1]
	cmp r3, #1
	beq _080133B8
	cmp r3, #1
	bgt _080133B0
	cmp r3, #0
	beq _080133A6
_08013358:
	movs r1, #0x11
_0801335A:
	adds r0, r4, #0
	movs r2, #0x13
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _08013374
	b _08013378
_08013370:
	.4byte 0x00000001
_08013374:
	.4byte 0x02018F34
_08013378:
	adds r1, r3, r2
	ldr r2, _080133AC
	strh r2, [r1, #0xa]
	bl sub_08002FE0
	adds r1, r4, #0
	adds r1, #0xa0
	movs r2, #0
	movs r0, #0x80
	str r2, [r1]
	movs r3, #0xa0
	lsls r2, r0, #3
	str r2, [sp]
	adds r0, r4, #0
	lsls r1, r3, #3
	movs r2, #0
	movs r3, #0
	bl sub_08001C28
	adds r0, r4, #0
	bl obj_add_static_hit
	b _0801331C
_080133A6:
	movs r1, #0xe
	b _0801335A
	.byte 0x00, 0x00
_080133AC:
	.4byte 0x00000020
_080133B0:
	cmp r3, #2
	bne _08013358
	movs r1, #0x10
	b _0801335A
_080133B8:
	movs r1, #0xf
	b _0801335A
_080133BC:
	adds r2, r4, #0
	adds r2, #0x9c
	ldr r0, [r2]
	ldr r3, [r0, #0xc]
	ldr r0, [r3, #4]
	cmp r0, #1
	bne _08013330
	b _08013342
_080133CC:
	ldr r0, _080133E4
	ldr r1, _080133E8
	str r0, [sp]
	ldr r2, _080133EC
	ldr r0, _080133F0
	movs r3, #0x1b
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801330C
_080133E4:
	.4byte gUnk_08050EC0
_080133E8:
	.4byte gUnk_08050ECC
_080133EC:
	.4byte gUnk_08050EDC
_080133F0:
	.4byte gUnk_08050EE8

	.global act_kong
	.thumb_func
	.type act_kong, %function
act_kong: @ 080133F4
	push {lr}
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r3, [r1]
	cmp r3, #1
	beq _08013424
	cmp r3, #1
	ble _08013408
	cmp r3, #2
	beq _0801340C
_08013408:
	pop {r0}
	bx r0
_0801340C:
	ldr r3, [r1, #0x10]
	movs r1, #0x86
	lsls r2, r1, #1
	adds r1, r3, r2
	ldrh r2, [r1]
	movs r1, #0x20
	bics r1, r2
	cmp r1, #0
	beq _08013408
	bl obj_free
	b _08013408
_08013424:
	ldr r3, [r1, #4]
	cmp r3, #0
	ble _08013470
	subs r3, #2
	str r3, [r1, #4]
	ldr r3, [r1, #8]
	lsls r2, r3, #1
	ldr r3, [r1, #0xc]
	adds r3, r3, r2
	str r3, [r1, #0xc]
	ldr r3, [r0, #0x3c]
	lsls r2, r3, #1
	ldr r3, [r0, #0x24]
	adds r3, r3, r2
	str r3, [r0, #0x24]
	ldr r3, [r0, #0x40]
	lsls r2, r3, #1
	ldr r3, [r0, #0x28]
	adds r3, r3, r2
	str r3, [r0, #0x28]
	ldr r3, [r0, #0x44]
	lsls r2, r3, #1
	ldr r3, [r0, #0x2c]
	adds r3, r3, r2
	str r3, [r0, #0x2c]
	adds r3, r0, #0
	adds r3, #0x5a
	ldrh r2, [r3]
	movs r3, #0x18
	muls r3, r2, r3
	ldr r0, _080134A4
	ldrh r1, [r1, #0xe]
	adds r2, r3, #0
	adds r2, #0xc
	strh r1, [r0, r2]
	adds r2, r3, r0
	strh r1, [r2, #0xa]
	b _08013408
_08013470:
	movs r2, #2
	str r2, [r1]
	movs r3, #0x86
	ldr r2, [r1, #0x10]
	lsls r1, r3, #1
	adds r2, r2, r1
	ldrh r3, [r2]
	ldr r1, _080134A0
	orrs r3, r1
	adds r1, r0, #0
	adds r1, #0x9c
	strh r3, [r2]
	ldr r2, [r1]
	ldr r1, [r2, #0xc]
	ldrb r2, [r1, #1]
	movs r1, #0x90
	lsls r3, r2, #0xd
	lsls r2, r1, #7
	adds r1, r3, r2
	movs r2, #0x80
	str r1, [r0, #0x24]
	lsls r1, r2, #5
	str r1, [r0, #0x28]
	b _08013408
_080134A0:
	.4byte 0x00000020
_080134A4:
	.4byte 0x02018F34

	.global react_kong
	.thumb_func
	.type react_kong, %function
react_kong: @ 080134A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	sub sp, #8
	adds r7, r1, #0
	cmp r4, #0
	bne _080134B6
	b _08013600
_080134B6:
	cmp r7, #0
	bne _080134BC
	b _080135E8
_080134BC:
	ldrb r5, [r7, #2]
	cmp r5, #1
	beq _080134CA
_080134C2:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080134CA:
	adds r0, r4, #0
	bl obj_remove_static_hit
	adds r0, r4, #0
	bl obj_remove_draw
	adds r0, r4, #0
	bl obj_project_to_screen
	adds r0, r4, #0
	bl obj_add_draw
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r6, #0x18
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r3, _08013574
	adds r2, #8
	adds r6, r2, r3
	ldrh r3, [r6, #2]
	adds r1, r4, #0
	adds r1, #0xa0
	lsls r3, r3, #0x10
	str r3, [r1, #0xc]
	movs r3, #0x20
	str r3, [r1, #4]
	ldrh r2, [r6, #2]
	movs r6, #0x80
	subs r3, r6, r2
	lsls r6, r3, #0xb
	str r6, [r1, #8]
	adds r6, r4, #0
	adds r6, #0x9c
	ldr r2, [r6]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #1]
	lsls r3, r2, #0xd
	movs r2, #0x90
	lsls r2, r2, #7
	adds r3, r3, r2
	ldr r2, [r4, #0x24]
	subs r3, r3, r2
	cmp r3, #0
	blt _080135E4
_08013526:
	asrs r2, r3, #5
	str r2, [r4, #0x3c]
	movs r3, #0x80
	ldr r2, [r4, #0x28]
	lsls r3, r3, #5
	subs r3, r3, r2
	cmp r3, #0
	blt _080135E0
_08013536:
	asrs r2, r3, #5
	str r2, [r4, #0x40]
	str r5, [r1]
	str r7, [r1, #0x10]
	movs r1, #0x86
	lsls r2, r1, #1
	adds r1, r7, r2
	ldr r2, [r6]
	ldr r3, [r2, #0xc]
	ldrb r2, [r3, #1]
	lsls r5, r2
	ldrh r2, [r1]
	orrs r5, r2
	ldr r2, _08013570
	orrs r5, r2
	strh r5, [r1]
	bl sub_08003020
	ldr r1, [r6]
	ldr r0, [r1, #0xc]
	ldrb r2, [r0, #1]
	cmp r2, #1
	beq _080135C8
	cmp r2, #1
	bgt _0801358E
	cmp r2, #0
	bne _080134C2
	b _08013578
	.byte 0x00, 0x00
_08013570:
	.4byte 0x00000010
_08013574:
	.4byte 0x02018F34
_08013578:
	movs r0, #0xa
	movs r3, #0x80
	str r0, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0x92
	movs r3, #1
	bl gamesfx_play
	b _080134C2
_0801358E:
	cmp r2, #2
	beq _080135B0
	cmp r2, #3
	beq _08013598
	b _080134C2
_08013598:
	movs r0, #0xa
	movs r2, #0
	movs r3, #0x80
	str r0, [sp]
	str r2, [sp, #4]
	movs r0, #0x95
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	bl gamesfx_play
	b _080134C2
_080135B0:
	movs r1, #0xa
	movs r0, #0
	movs r3, #0x80
	str r1, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x94
	bl gamesfx_play
	b _080134C2
_080135C8:
	movs r2, #0xa
	movs r1, #0
	movs r3, #0x80
	str r2, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x93
	bl gamesfx_play
	b _080134C2
_080135E0:
	adds r3, #0x1f
	b _08013536
_080135E4:
	adds r3, #0x1f
	b _08013526
_080135E8:
	ldr r0, _08013618
	ldr r1, _0801361C
	str r0, [sp]
	ldr r2, _08013620
	ldr r0, _08013624
	movs r3, #0x6f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080134BC
_08013600:
	ldr r0, _08013628
	ldr r1, _0801361C
	str r0, [sp]
	ldr r2, _08013620
	ldr r0, _08013624
	movs r3, #0x6e
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080134B6
_08013618:
	.4byte gUnk_08050F24
_0801361C:
	.4byte gUnk_08050ECC
_08013620:
	.4byte gUnk_08050F30
_08013624:
	.4byte gUnk_08050EE8
_08013628:
	.4byte gUnk_08050EC0

	.global init_hud_kong
	.thumb_func
	.type init_hud_kong, %function
init_hud_kong: @ 0801362C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080136DC
_0801363E:
	ldr r1, _08013674
	movs r7, #0xf0
	ldr r0, _08013680
	adds r5, r4, #0
	movs r2, #0
	adds r5, #0xa0
	lsls r6, r7, #7
	strh r1, [r4]
	str r2, [r5]
	str r2, [r5, #4]
	str r6, [r4, #0x24]
	str r0, [r4, #0x28]
	movs r0, #4
	bl spr_get_info
	adds r1, r4, #0
	adds r1, #0x5a
	ldr r3, _08013678
	strh r0, [r1]
	movs r2, #0x18
	ldr r5, _0801367C
	mov sb, r3
	ldr r3, _08013684
	ldrh r0, [r1]
	mov sl, r2
	movs r7, #0
	b _08013688
_08013674:
	.4byte 0x00001001
_08013678:
	.4byte 0x00000080
_0801367C:
	.4byte 0x00000000
_08013680:
	.4byte 0xFFFFF000
_08013684:
	.4byte 0x0201A734
_08013688:
	movs r2, #0x30
	ldr r1, _080136F4
	mov r8, r5
	mov ip, r7
	mov lr, r3
	rsbs r6, r2, #0
	movs r5, #3
_08013696:
	mov r2, sl
	muls r2, r0, r2
	mov r7, r8
	adds r3, r2, r1
	strh r7, [r3, #2]
	strh r6, [r3]
	adds r3, r2, #0
	mov r7, ip
	adds r3, #0x14
	str r7, [r1, r3]
	subs r3, #4
	str r7, [r1, r3]
	adds r2, r2, r1
	mov r7, sb
	subs r3, #4
	strh r7, [r2, #0xa]
	mov r2, sb
	strh r2, [r1, r3]
	subs r5, #1
	mov r3, lr
	ldrb r0, [r3, r0]
	adds r6, #0x20
	cmp r5, #0
	bge _08013696
	adds r0, r4, #0
	bl obj_add_draw
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080136DC:
	ldr r0, _080136F8
	ldr r1, _080136FC
	str r0, [sp]
	ldr r2, _08013700
	ldr r0, _08013704
	movs r3, #0xaa
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801363E
_080136F4:
	.4byte 0x02018F34
_080136F8:
	.4byte gUnk_08050EC0
_080136FC:
	.4byte gUnk_08050ECC
_08013700:
	.4byte gUnk_08050F3C
_08013704:
	.4byte gUnk_08050EE8

	.global act_hud_kong
	.thumb_func
	.type act_hud_kong, %function
act_hud_kong: @ 08013708
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #8
	mov r8, r0
	cmp r0, #0
	bne _0801371E
	b _080139B8
_0801371E:
	ldr r2, _08013884
	ldr r1, [r2]
	ldr r6, _08013888
	lsls r0, r1, #2
	ldr r1, [r6, r0]
	mov r6, r8
	adds r6, #0xa0
	ldr r3, [r6]
	cmp r3, #5
	bhi _0801377C
	ldr r2, _0801388C
	lsls r3, r3, #2
	ldr r0, [r3, r2]
	mov pc, r0
	.byte 0x00, 0x00
	.global _0801373C
_0801373C:
	.4byte _08013754
	.4byte _080137A8
	.4byte _080137D2
	.4byte _080138C6
	.4byte _080138E6
	.4byte _08013976
	.global _08013754
_08013754:
	movs r2, #0x86
	lsls r3, r2, #1
	adds r1, r1, r3
	ldrh r2, [r1]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0801377C
	movs r3, #0x11
	rsbs r0, r3, #0
	ands r0, r2
	strh r0, [r1]
	movs r0, #1
	str r0, [r6]
	movs r1, #0xf0
	ldr r0, _08013890
	lsls r2, r1, #7
	mov r1, r8
	str r2, [r1, #0x24]
	str r0, [r1, #0x28]
_0801377C:
	mov r0, r8
	ldr r3, [r0, #0x24]
	ldr r2, [r0, #0x3c]
	adds r1, r3, r2
	ldr r3, [r0, #0x28]
	ldr r2, [r0, #0x40]
	str r1, [r0, #0x24]
	adds r1, r3, r2
	ldr r3, [r0, #0x2c]
	ldr r2, [r0, #0x44]
	str r1, [r0, #0x28]
	adds r1, r3, r2
	str r1, [r0, #0x2c]
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.global _080137A8
_080137A8:
	mov r2, r8
	movs r1, #0x80
	ldr r3, [r2, #0x28]
	lsls r0, r1, #5
	cmp r3, r0
	bge _080137C8
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r3, r3, r1
	str r3, [r2, #0x28]
	adds r2, r0, #0
	cmp r3, r2
	ble _0801377C
	mov r3, r8
	str r2, [r3, #0x28]
	b _0801377C
_080137C8:
	movs r0, #0x3c
	movs r2, #2
	str r0, [r6, #4]
_080137CE:
	str r2, [r6]
	b _0801377C
	.global _080137D2
_080137D2:
	movs r2, #0x86
	lsls r3, r2, #1
	adds r0, r3, r1
	ldrh r2, [r0]
	movs r1, #0x10
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _080137F4
	movs r1, #0x11
	rsbs r0, r1, #0
	ands r0, r2
	mov r1, ip
	strh r0, [r1]
	movs r0, #0x3c
	str r0, [r6, #4]
	ldrh r2, [r1]
_080137F4:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08013868
	movs r5, #0x21
	mov r3, r8
	rsbs r4, r5, #0
	adds r3, #0x5a
	ldr r0, _08013894
	ldr r1, _08013898
	ands r4, r2
	ldrh r5, [r3]
	mov r2, ip
	movs r3, #0x18
	ldr r7, _0801389C
	strh r4, [r2]
	mov lr, r3
	movs r4, #0
	mov sl, r0
	mov sb, r1
_0801381C:
	mov r2, ip
	ldrh r1, [r2]
	movs r2, #1
	asrs r1, r4
	ands r1, r2
	cmp r1, #0
	beq _080138B6
	cmp r4, #1
	beq _080138B2
	cmp r4, #1
	bgt _080138AA
	cmp r4, #0
	beq _080138A6
_08013836:
	movs r2, #0x11
_08013838:
	mov r1, lr
	muls r1, r5, r1
	lsls r2, r2, #4
	mov r3, sl
	ldr r3, [r3, r2]
	adds r0, r1, #0
	adds r0, #0x14
	str r3, [r7, r0]
	adds r2, #4
	mov r0, sl
	mov fp, r3
	ldr r3, [r0, r2]
	adds r1, #0x10
	str r3, [r7, r1]
_08013854:
	mov r2, lr
	muls r2, r5, r2
	ldr r0, _08013880
	adds r1, r2, r7
	strh r0, [r1, #0xa]
	adds r4, #1
	mov r1, sb
	ldrb r5, [r1, r5]
	cmp r4, #3
	ble _0801381C
_08013868:
	ldr r3, [r6, #4]
	cmp r3, #0
	ble _08013874
	subs r3, #2
	str r3, [r6, #4]
	b _0801377C
_08013874:
	mov r2, ip
	ldrh r1, [r2]
	cmp r1, #0xf
	beq _080138A0
	movs r2, #3
	b _080137CE
_08013880:
	.4byte 0x00000080
_08013884:
	.4byte gLocalPlayerIndex
_08013888:
	.4byte gRacerObjects
_0801388C:
	.4byte _0801373C
_08013890:
	.4byte 0xFFFFF000
_08013894:
	.4byte gUnk_08713650
_08013898:
	.4byte 0x0201A734
_0801389C:
	.4byte 0x02018F34
_080138A0:
	movs r0, #4
	str r0, [r6]
	b _0801377C
_080138A6:
	movs r2, #0xe
	b _08013838
_080138AA:
	cmp r4, #2
	bne _08013836
	movs r2, #0x10
	b _08013838
_080138B2:
	movs r2, #0xf
	b _08013838
_080138B6:
	mov r0, lr
	muls r0, r5, r0
	adds r2, r0, #0
	adds r2, #0x14
	adds r0, #0x10
	str r1, [r7, r2]
	str r1, [r7, r0]
	b _08013854
	.global _080138C6
_080138C6:
	mov r0, r8
	ldr r3, [r0, #0x28]
	ldr r2, _080139D0
	cmp r3, r2
	ble _080138E0
	ldr r1, _080139D4
	adds r3, r3, r1
	str r3, [r0, #0x28]
	cmp r3, r2
	blt _080138DC
	b _0801377C
_080138DC:
	str r2, [r0, #0x28]
	b _0801377C
_080138E0:
	movs r1, #0
	str r1, [r6]
	b _0801377C
	.global _080138E6
_080138E6:
	movs r3, #0x86
	lsls r0, r3, #1
	adds r3, r1, r0
	ldrh r0, [r3]
	movs r2, #0xf
	ands r2, r0
	cmp r2, #0
	bne _080138F8
	b _080137CE
_080138F8:
	cmp r2, #3
	beq _0801395E
	cmp r2, #3
	bgt _08013926
	cmp r2, #1
	beq _0801390E
_08013904:
	movs r2, #0x19
	movs r0, #5
	str r2, [r6, #4]
	str r0, [r6]
	b _0801377C
_0801390E:
	movs r1, #0xa
	movs r2, #0
	movs r3, #0x80
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0x92
	movs r3, #1
	bl gamesfx_play
	b _08013904
_08013926:
	cmp r2, #7
	beq _08013946
	cmp r2, #0xf
	bne _08013904
	movs r1, #0xa
	movs r2, #0
	movs r3, #0x80
	str r1, [sp]
	str r2, [sp, #4]
	movs r0, #0x95
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	bl gamesfx_play
	b _08013904
_08013946:
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x94
	bl gamesfx_play
	b _08013904
_0801395E:
	movs r2, #0xa
	movs r0, #0
	movs r3, #0x80
	str r2, [sp]
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0x93
	bl gamesfx_play
	b _08013904
	.global _08013976
_08013976:
	movs r2, #0x86
	lsls r0, r2, #1
	adds r2, r1, r0
	ldrh r1, [r2]
	ldr r3, [r6, #4]
	movs r0, #0xf
	ands r0, r1
	cmp r3, #0
	ble _080139B0
	subs r3, #1
	str r3, [r6, #4]
	mov r3, r8
	adds r3, #0x5a
	adds r1, r0, #0
	ldrh r2, [r3]
	cmp r0, #1
	ble _080139A2
	ldr r3, _080139D8
_0801399A:
	asrs r1, r1, #1
	ldrb r2, [r3, r2]
	cmp r1, #1
	bgt _0801399A
_080139A2:
	movs r1, #0x18
	muls r2, r1, r2
	ldr r0, _080139DC
	ldrh r1, [r0, r2]
	adds r1, #8
	strh r1, [r0, r2]
	b _0801377C
_080139B0:
	asrs r1, r0, #1
	strh r1, [r2]
	movs r2, #4
	b _080137CE
_080139B8:
	ldr r0, _080139E0
	ldr r1, _080139E4
	str r0, [sp]
	ldr r2, _080139E8
	ldr r0, _080139EC
	movs r3, #0xc6
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801371E
_080139D0:
	.4byte 0xFFFFC000
_080139D4:
	.4byte 0xFFFFF900
_080139D8:
	.4byte 0x0201A734
_080139DC:
	.4byte 0x02018F34
_080139E0:
	.4byte gUnk_08050EC0
_080139E4:
	.4byte gUnk_08050ECC
_080139E8:
	.4byte gUnk_08050F4C
_080139EC:
	.4byte gUnk_08050EE8

	.global sub_080139F0
	.thumb_func
	.type sub_080139F0, %function
sub_080139F0: @ 080139F0
	push {lr}
	ldr r2, _08013A40
	adds r2, #0x86
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0x94
	muls r1, r0, r1
	ldr r3, _08013A44
	adds r1, #0x40
	ldr r0, [r3, r1]
	cmp r0, #0
	beq _08013A38
	ldr r3, [r0, #4]
	ldr r2, _08013A48
	lsls r1, r3, #8
	str r1, [r2]
	ldr r2, [r0, #8]
	lsls r3, r2, #8
	ldr r2, _08013A4C
	str r3, [r2]
	subs r2, r3, r1
	ldr r1, _08013A50
	str r2, [r1]
	ldr r3, [r0, #0xc]
	ldr r2, _08013A54
	lsls r1, r3, #8
	str r1, [r2]
	ldr r2, [r0, #0x10]
	ldr r0, _08013A58
	lsls r3, r2, #8
	str r3, [r0]
	subs r0, r3, r1
	ldr r1, _08013A5C
	str r0, [r1]
_08013A34:
	pop {r0}
	bx r0
_08013A38:
	ldr r0, _08013A60
	bl AGBPrintf
	b _08013A34
_08013A40:
	.4byte gGameSetup
_08013A44:
	.4byte gUnk_087146C0
_08013A48:
	.4byte 0x02004284
_08013A4C:
	.4byte 0x02004288
_08013A50:
	.4byte 0x0200428C
_08013A54:
	.4byte 0x02004290
_08013A58:
	.4byte 0x02004294
_08013A5C:
	.4byte 0x02004298
_08013A60:
	.4byte gUnk_08050F5C
