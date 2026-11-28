@ asm/object.s: ROM 0x0013D8-0x003098 (rom, VMA 0x080013D8)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global obj_add_process
	.thumb_func
	.type obj_add_process, %function
obj_add_process: @ 080013D8
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	adds r5, r1, #0
	cmp r4, #0
	beq _0800148E
_080013E4:
	ldrh r1, [r4]
	movs r0, #8
	bics r0, r1
	cmp r0, #0
	beq _08001476
_080013EE:
	ldrb r2, [r4, #2]
	lsls r1, r2, #4
	ldr r2, _0800141C
	adds r1, #4
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _0800144C
	ldrh r0, [r4]
	ldr r3, _08001418
	orrs r0, r3
	strh r0, [r4]
	strb r5, [r4, #3]
	cmp r5, #0
	beq _08001472
	ldr r0, _08001420
	ldr r3, [r0]
	cmp r3, #0
	beq _08001460
	movs r1, #0
	adds r2, r3, #0
	b _08001424
_08001418:
	.4byte 0x00000008
_0800141C:
	.4byte gUnk_08713FD0
_08001420:
	.4byte gObjProcessList
_08001424:
	ldrb r3, [r2, #3]
	cmp r3, r5
	blt _0800143C
	str r2, [r4, #4]
	ldr r3, [r2, #8]
	str r3, [r4, #8]
	ldr r3, [r2, #8]
	movs r1, #1
	cmp r3, #0
	beq _0800145C
	str r4, [r3, #4]
_0800143A:
	str r4, [r2, #8]
_0800143C:
	adds r3, r2, #0
	ldr r2, [r3, #4]
	cmp r2, #0
	beq _08001448
	cmp r1, #0
	beq _08001424
_08001448:
	cmp r1, #0
	beq _08001454
_0800144C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08001454:
	str r1, [r4, #4]
	str r3, [r4, #8]
	str r4, [r3, #4]
	b _0800144C
_0800145C:
	str r4, [r0]
	b _0800143A
_08001460:
	ldr r3, [r0]
	str r3, [r4, #4]
	cmp r3, #0
	beq _0800146A
	str r4, [r3, #8]
_0800146A:
	movs r1, #0
	str r1, [r4, #8]
	str r4, [r0]
	b _0800144C
_08001472:
	ldr r0, _080014A8
	b _08001460
_08001476:
	ldr r2, _080014AC
	ldr r0, _080014B0
	str r2, [sp]
	ldr r1, _080014B4
	ldr r2, _080014B8
	movs r3, #0x5d
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080013EE
_0800148E:
	ldr r0, _080014BC
	ldr r1, _080014B4
	str r0, [sp]
	ldr r2, _080014B8
	ldr r0, _080014B0
	movs r3, #0x5c
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080013E4
	.byte 0x00, 0x00
_080014A8:
	.4byte gObjProcessList
_080014AC:
	.4byte gUnk_0804F6C8
_080014B0:
	.4byte gUnk_0804F6E0
_080014B4:
	.4byte gUnk_0804F71C
_080014B8:
	.4byte gUnk_0804F72C
_080014BC:
	.4byte gUnk_0804F73C

	.global obj_remove_draw
	.thumb_func
	.type obj_remove_draw, %function
obj_remove_draw: @ 080014C0
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08001544
_080014CA:
	ldrh r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800152A
_080014D4:
	movs r3, #0x11
	rsbs r2, r3, #0
	ands r2, r1
	movs r1, #0x80
	lsls r0, r1, #5
	ands r0, r2
	strh r2, [r4]
	cmp r0, #0
	beq _0800150C
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _080014F0
	ldr r0, [r4, #0x10]
	str r0, [r2, #0x10]
_080014F0:
	ldr r2, [r4, #0x10]
	cmp r2, #0
	beq _08001508
_080014F6:
	ldr r1, [r4, #0xc]
	str r1, [r2, #0xc]
_080014FA:
	movs r2, #0
	str r2, [r4, #0x10]
	str r2, [r4, #0xc]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08001508:
	ldr r2, _0800155C
	b _0800151E
_0800150C:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _08001516
	ldr r0, [r4, #0x10]
	str r0, [r2, #0x10]
_08001516:
	ldr r2, [r4, #0x10]
	cmp r2, #0
	bne _080014F6
	ldr r2, _08001560
_0800151E:
	ldr r0, [r2]
	cmp r0, r4
	bne _080014FA
	ldr r1, [r4, #0xc]
	str r1, [r2]
	b _080014FA
_0800152A:
	ldr r1, _08001564
	ldr r0, _08001568
	str r1, [sp]
	ldr r2, _0800156C
	ldr r1, _08001570
	movs r3, #0xc5
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldrh r1, [r4]
	b _080014D4
_08001544:
	ldr r0, _08001574
	ldr r1, _08001570
	str r0, [sp]
	ldr r2, _0800156C
	ldr r0, _08001568
	movs r3, #0xc4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080014CA
_0800155C:
	.4byte gObjDrawList
_08001560:
	.4byte gObjDrawList2
_08001564:
	.4byte gUnk_0804F748
_08001568:
	.4byte gUnk_0804F6E0
_0800156C:
	.4byte gUnk_0804F760
_08001570:
	.4byte gUnk_0804F71C
_08001574:
	.4byte gUnk_0804F73C

	.global obj_remove_static_hit
	.thumb_func
	.type obj_remove_static_hit, %function
obj_remove_static_hit: @ 08001578
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080015F0
_08001582:
	movs r3, #0xa0
	ldrh r1, [r4]
	lsls r0, r3, #1
	adds r3, r0, #0
	ands r3, r1
	cmp r3, r0
	beq _080015AA
	ldr r1, _08001608
	movs r3, #0x96
	str r1, [sp]
	ldr r0, _0800160C
	ldr r1, _08001610
	ldr r2, _08001614
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldrh r1, [r4]
_080015AA:
	ldr r2, _08001618
	ands r2, r1
	strh r2, [r4]
	ldr r2, [r4, #0x14]
	cmp r2, #0
	beq _080015BA
	ldr r0, [r4, #0x18]
	str r0, [r2, #0x18]
_080015BA:
	ldr r2, [r4, #0x18]
	cmp r2, #0
	beq _080015CC
	ldr r1, [r4, #0x14]
	str r1, [r2, #0x14]
_080015C4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_080015CC:
	ldr r5, _0800161C
	ldr r2, [r5]
	cmp r2, r4
	beq _080015EA
	ldr r0, _08001620
	ldr r1, _08001610
	str r0, [sp]
	ldr r2, _08001614
	ldr r0, _0800160C
	ldr r3, _08001624
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_080015EA:
	ldr r1, [r4, #0x14]
	str r1, [r5]
	b _080015C4
_080015F0:
	ldr r0, _08001628
	ldr r1, _08001610
	str r0, [sp]
	ldr r2, _08001614
	ldr r0, _0800160C
	ldr r3, _0800162C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001582
_08001608:
	.4byte gUnk_0804F770
_0800160C:
	.4byte gUnk_0804F6E0
_08001610:
	.4byte gUnk_0804F71C
_08001614:
	.4byte gUnk_0804F7C0
_08001618:
	.4byte 0xFFFFFE3F
_0800161C:
	.4byte gObjStaticHitList
_08001620:
	.4byte gUnk_0804F7D8
_08001624:
	.4byte 0x0000013B
_08001628:
	.4byte gUnk_0804F73C
_0800162C:
	.4byte 0x0000012B

	.global obj_remove_vector_hit
	.thumb_func
	.type obj_remove_vector_hit, %function
obj_remove_vector_hit: @ 08001630
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080016A8
_0800163A:
	movs r3, #0x90
	ldrh r1, [r4]
	lsls r0, r3, #2
	adds r3, r0, #0
	ands r3, r1
	cmp r3, r0
	beq _08001660
	ldr r1, _080016C4
	ldr r0, _080016C8
	str r1, [sp]
	ldr r2, _080016CC
	ldr r1, _080016D0
	ldr r3, _080016D4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldrh r1, [r4]
_08001660:
	ldr r2, _080016D8
	ands r2, r1
	strh r2, [r4]
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _08001670
	ldr r0, [r4, #0x20]
	str r0, [r2, #0x20]
_08001670:
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _08001682
	ldr r1, [r4, #0x1c]
	str r1, [r2, #0x1c]
_0800167A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08001682:
	ldr r5, _080016DC
	ldr r2, [r5]
	cmp r2, r4
	beq _080016A2
	ldr r0, _080016E0
	movs r3, #0xab
	str r0, [sp]
	ldr r1, _080016D0
	ldr r0, _080016C8
	ldr r2, _080016CC
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_080016A2:
	ldr r1, [r4, #0x1c]
	str r1, [r5]
	b _0800167A
_080016A8:
	ldr r0, _080016E4
	movs r3, #0xa3
	str r0, [sp]
	ldr r1, _080016D0
	ldr r0, _080016C8
	ldr r2, _080016CC
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800163A
	.byte 0x00, 0x00
_080016C4:
	.4byte gUnk_0804F7F4
_080016C8:
	.4byte gUnk_0804F6E0
_080016CC:
	.4byte gUnk_0804F844
_080016D0:
	.4byte gUnk_0804F71C
_080016D4:
	.4byte 0x00000147
_080016D8:
	.4byte 0xFFFFFD3F
_080016DC:
	.4byte gObjVectorHitList
_080016E0:
	.4byte gUnk_0804F85C
_080016E4:
	.4byte gUnk_0804F73C

	.global obj_really_free
	.thumb_func
	.type obj_really_free, %function
obj_really_free: @ 080016E8
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #8
	cmp r4, #0
	bne _080016F4
	b _0800181E
_080016F4:
	ldr r5, _08001798
	ldr r2, _0800179C
	ldr r0, [r5]
	ldr r1, [r2]
	subs r0, #1
	str r0, [r5]
	cmp r1, r4
	bne _08001706
	b _08001806
_08001706:
	ldrb r2, [r4, #2]
	ldr r0, _080017A0
	lsls r5, r2, #4
	adds r5, #0xc
	ldr r3, [r0, r5]
	cmp r3, #0
	beq _0800171A
	adds r0, r4, #0
	bl _call_via_r3
_0800171A:
	ldrh r2, [r4]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	beq _08001742
	movs r0, #9
	rsbs r5, r0, #0
	ands r5, r2
	ldr r2, [r4, #4]
	strh r5, [r4]
	cmp r2, #0
	beq _08001736
	ldr r1, [r4, #8]
	str r1, [r2, #8]
_08001736:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _080017E2
	ldr r5, [r4, #4]
	str r5, [r2, #4]
_08001740:
	ldrh r2, [r4]
_08001742:
	movs r5, #0x10
	ands r5, r2
	cmp r5, #0
	beq _08001752
	adds r0, r4, #0
	bl obj_remove_draw
	ldrh r2, [r4]
_08001752:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0800176C
	movs r5, #0x80
	lsls r1, r5, #1
	ands r1, r2
	cmp r1, #0
	beq _080017D0
	adds r0, r4, #0
	bl obj_remove_static_hit
_0800176A:
	ldrh r2, [r4]
_0800176C:
	movs r5, #0x20
	ands r5, r2
	cmp r5, #0
	beq _0800177A
	adds r0, r4, #0
	bl obj_destroy_sprite
_0800177A:
	mov r0, sp
	ldr r2, _08001794
	adds r0, #6
	strh r2, [r0]
	adds r1, r4, #0
	ldr r2, _080017A4
	bl CpuSet
	ldr r5, _0800179C
	ldr r3, [r5]
	cmp r3, r4
	beq _080017B4
	b _080017A8
_08001794:
	.4byte 0x00000000
_08001798:
	.4byte 0x02018390
_0800179C:
	.4byte gObjFreeList
_080017A0:
	.4byte gUnk_08713FD0
_080017A4:
	.4byte 0x010000A0
_080017A8:
	str r3, [r4, #4]
	add sp, #8
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
_080017B4:
	ldr r0, _08001838
	movs r3, #0xd7
	str r0, [sp]
	ldr r1, _0800183C
	ldr r0, _08001840
	ldr r2, _08001844
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r3, [r5]
	b _080017A8
_080017D0:
	movs r1, #0x80
	lsls r0, r1, #2
	ands r0, r2
	cmp r0, #0
	beq _0800176C
	adds r0, r4, #0
	bl obj_remove_vector_hit
	b _0800176A
_080017E2:
	ldr r5, _08001848
	ldr r2, [r5]
	cmp r2, r4
	beq _08001800
	ldr r0, _0800184C
	ldr r1, _0800183C
	str r0, [sp]
	ldr r2, _08001850
	ldr r0, _08001840
	movs r3, #0xa4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08001800:
	ldr r1, [r4, #4]
	str r1, [r5]
	b _08001740
_08001806:
	ldr r1, _08001838
	ldr r0, _08001840
	str r1, [sp]
	ldr r2, _08001844
	ldr r1, _0800183C
	ldr r3, _08001854
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001706
_0800181E:
	ldr r0, _08001858
	movs r5, #0xc4
	str r0, [sp]
	ldr r1, _0800183C
	ldr r0, _08001840
	ldr r2, _08001844
	lsls r3, r5, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080016F4
_08001838:
	.4byte gUnk_0804F878
_0800183C:
	.4byte gUnk_0804F71C
_08001840:
	.4byte gUnk_0804F6E0
_08001844:
	.4byte gUnk_0804F890
_08001848:
	.4byte gObjProcessList
_0800184C:
	.4byte gUnk_0804F8A0
_08001850:
	.4byte gUnk_0804F8BC
_08001854:
	.4byte 0x0000018D
_08001858:
	.4byte gUnk_0804F73C

	.global obj_setup_sprite
	.thumb_func
	.type obj_setup_sprite, %function
obj_setup_sprite: @ 0800185C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	lsls r0, r2, #0x10
	sub sp, #4
	adds r5, r1, #0
	asrs r4, r0, #0x10
	cmp r6, #0
	bne _08001872
	b _080019FE
_08001872:
	ldrh r3, [r6]
	movs r1, #0x20
	bics r1, r3
	cmp r1, #0
	bne _0800187E
	b _080019E6
_0800187E:
	ldrh r1, [r6]
	ldr r3, _080018BC
	movs r0, #0x80
	lsls r4, r4, #0x10
	lsls r7, r0, #0xd
	orrs r1, r3
	ands r7, r4
	strh r1, [r6]
	mov r8, r4
	cmp r7, #0
	bne _08001896
	b _080019E2
_08001896:
	movs r0, #2
_08001898:
	bl spr_get_info
	adds r1, r6, #0
	adds r1, #0x5a
	strh r0, [r1]
	ldrh r7, [r1]
	movs r4, #0x18
	adds r2, r7, #0
	muls r2, r4, r2
	ldr r4, _080018C0
	lsls r5, r5, #4
	ldr r0, _080018C4
	adds r1, r2, #0
	ldr r3, [r4, r5]
	adds r1, #0x14
	str r3, [r0, r1]
	b _080018C8
	.byte 0x00, 0x00
_080018BC:
	.4byte 0x00000020
_080018C0:
	.4byte gUnk_08713650
_080018C4:
	.4byte gSprites
_080018C8:
	adds r1, r5, #0
	adds r1, #0xc
	ldr r3, [r4, r1]
	adds r1, r2, r0
	mov r2, r8
	strh r3, [r1, #6]
	lsrs r1, r2, #0x10
	movs r2, #2
	ands r2, r1
	cmp r2, #0
	beq _080018FA
	adds r0, r5, #0
	adds r0, #8
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _080018FA
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080018F2
	b _080019DE
_080018F2:
	adds r1, r6, #0
_080018F4:
	adds r0, r7, #0
	bl anim_get
_080018FA:
	mov r3, r8
	lsrs r0, r3, #0x10
	movs r2, #1
	ands r2, r0
	cmp r2, #0
	beq _08001918
	movs r1, #0x18
	adds r2, r7, #0
	muls r2, r1, r2
	ldr r3, _08001968
	adds r1, r5, #4
	ldr r1, [r3, r1]
	ldr r3, _0800196C
	adds r2, #0x10
	str r1, [r3, r2]
_08001918:
	movs r2, #0x10
	adds r1, r0, #0
	ands r1, r2
	mov ip, r2
	cmp r1, #0
	beq _08001956
	ldr r0, _08001970
	ldrb r4, [r0, r7]
	movs r5, #0x18
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r0, _0800196C
	ldr r5, _08001964
	adds r7, r1, r0
	ldr r2, _08001968
	movs r3, #0xac
	strh r5, [r7, #6]
	lsls r7, r3, #2
	adds r3, r2, r7
	ldr r3, [r3]
	adds r4, r1, #0
	adds r4, #0x14
	str r3, [r0, r4]
	movs r3, #0xad
	lsls r3, r3, #2
	adds r2, r2, r3
	ldr r3, [r2]
	subs r4, #4
	str r3, [r0, r4]
	adds r3, r1, r0
	strh r5, [r3, #0xa]
_08001956:
	ldrh r1, [r6]
	mov r3, ip
	bics r3, r1
	cmp r3, #0
	beq _080019C6
	b _08001974
	.byte 0x00, 0x00
_08001964:
	.4byte 0x00000080
_08001968:
	.4byte gUnk_08713650
_0800196C:
	.4byte gSprites
_08001970:
	.4byte gSpriteNext
_08001974:
	ldrh r1, [r6]
	ldr r3, _080019A0
	movs r0, #0x80
	orrs r1, r3
	lsls r3, r0, #5
	strh r1, [r6]
	ands r1, r3
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080019B4
	ldr r2, _080019A4
	ldr r3, [r2]
	str r3, [r6, #0xc]
	cmp r3, #0
	beq _08001996
	str r6, [r3, #0x10]
_08001996:
	movs r1, #0
	str r1, [r6, #0x10]
	str r6, [r2]
	b _080019A8
	.byte 0x00, 0x00
_080019A0:
	.4byte 0x00000010
_080019A4:
	.4byte gObjDrawList
_080019A8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080019B4:
	ldr r1, _08001A18
	ldr r2, [r1]
	str r2, [r6, #0xc]
	cmp r2, #0
	beq _080019C0
	str r6, [r2, #0x10]
_080019C0:
	str r3, [r6, #0x10]
	str r6, [r1]
	b _080019A8
_080019C6:
	ldr r2, _08001A1C
	ldr r0, _08001A20
	str r2, [sp]
	ldr r1, _08001A24
	ldr r2, _08001A28
	movs r3, #0xac
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001974
_080019DE:
	adds r1, r2, #0
	b _080018F4
_080019E2:
	movs r0, #1
	b _08001898
_080019E6:
	ldr r2, _08001A2C
	ldr r0, _08001A20
	str r2, [sp]
	ldr r1, _08001A24
	ldr r2, _08001A30
	ldr r3, _08001A34
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800187E
_080019FE:
	ldr r0, _08001A38
	movs r7, #0xdd
	str r0, [sp]
	ldr r1, _08001A24
	ldr r0, _08001A20
	ldr r2, _08001A30
	lsls r3, r7, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001872
_08001A18:
	.4byte gObjDrawList2
_08001A1C:
	.4byte gUnk_0804F8D0
_08001A20:
	.4byte gUnk_0804F6E0
_08001A24:
	.4byte gUnk_0804F71C
_08001A28:
	.4byte gUnk_0804F8E8
_08001A2C:
	.4byte gUnk_0804F8F8
_08001A30:
	.4byte gUnk_0804F914
_08001A34:
	.4byte 0x000001BB
_08001A38:
	.4byte gUnk_0804F73C

	.global obj_destroy_sprite
	.thumb_func
	.type obj_destroy_sprite, %function
obj_destroy_sprite: @ 08001A3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldrh r1, [r5]
	movs r0, #0x20
	bics r0, r1
	sub sp, #4
	cmp r0, #0
	beq _08001A64
	ldrb r1, [r5, #2]
	ldr r0, _08001A60
	bl AGBPrintf
_08001A5A:
	bl AGBPrintFlush
	b _08001A5A
_08001A60:
	.4byte gUnk_0804F928
_08001A64:
	cmp r5, #0
	beq _08001AFA
_08001A68:
	ldrh r2, [r5]
	movs r6, #0x20
	ands r6, r2
	cmp r6, #0
	beq _08001AE0
_08001A72:
	movs r4, #0x21
	rsbs r1, r4, #0
	ands r1, r2
	strh r1, [r5]
	adds r6, r5, #0
	adds r6, #0x5a
	ldrh r4, [r6]
	cmp r4, #0xff
	beq _08001ABC
	ldr r2, _08001AB4
	movs r3, #0x18
	ldr r7, _08001AB0
	mov sl, r2
	mov r8, r3
_08001A8E:
	mov r1, r8
	muls r1, r4, r1
	mov r2, sl
	adds r1, #8
	ldrh r0, [r2, r1]
	ands r0, r7
	cmp r0, #0
	beq _08001AA4
	adds r0, r4, #0
	bl spr_release_anim
_08001AA4:
	ldr r2, _08001AB8
	ldrb r4, [r2, r4]
	cmp r4, #0xff
	bne _08001A8E
	b _08001ABC
	.byte 0x00, 0x00
_08001AB0:
	.4byte 0x00008000
_08001AB4:
	.4byte gSprites
_08001AB8:
	.4byte gSpriteNext
_08001ABC:
	ldrh r0, [r6]
	bl spr_free_chain
	ldrh r3, [r5]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08001AD2
	adds r0, r5, #0
	bl obj_remove_draw
_08001AD2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08001AE0:
	ldr r2, _08001B14
	ldr r0, _08001B18
	str r2, [sp]
	ldr r1, _08001B1C
	ldr r2, _08001B20
	ldr r3, _08001B24
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldrh r2, [r5]
	b _08001A72
_08001AFA:
	ldr r0, _08001B28
	movs r4, #0xf3
	str r0, [sp]
	ldr r1, _08001B1C
	ldr r0, _08001B18
	ldr r2, _08001B20
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001A68
_08001B14:
	.4byte gUnk_0804F938
_08001B18:
	.4byte gUnk_0804F6E0
_08001B1C:
	.4byte gUnk_0804F71C
_08001B20:
	.4byte gUnk_0804F950
_08001B24:
	.4byte 0x000001E7
_08001B28:
	.4byte gUnk_0804F73C

	.global obj_spawn_level_object
	.thumb_func
	.type obj_spawn_level_object, %function
obj_spawn_level_object: @ 08001B2C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0xc]
	sub sp, #4
	cmp r2, #0
	beq _08001BD8
_08001B38:
	ldrb r4, [r2]
	cmp r4, #0
	ble _08001BF8
_08001B3E:
	cmp r4, #0x39
	ble _08001B5A
	ldr r0, _08001BBC
	movs r3, #0xb0
	str r0, [sp]
	ldr r1, _08001BC0
	ldr r0, _08001BC4
	ldr r2, _08001BC8
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08001B5A:
	ldr r1, _08001BCC
	ldr r0, [r1]
	cmp r0, #0
	beq _08001BEA
	ldr r3, _08001BD0
	ldr r2, [r3]
	adds r2, #1
	str r2, [r3]
	ldr r2, [r0, #4]
	str r2, [r1]
	strb r4, [r0, #2]
	adds r4, r0, #0
_08001B72:
	cmp r4, #0
	beq _08001BAA
	adds r1, r4, #0
	adds r1, #0x9c
	str r5, [r1]
	ldr r2, [r5]
	lsls r0, r2, #8
	str r0, [r4, #0x24]
	ldr r1, [r5, #4]
	lsls r2, r1, #8
	str r2, [r4, #0x28]
	ldr r0, [r5, #8]
	ldrb r2, [r4, #2]
	lsls r1, r0, #8
	str r1, [r4, #0x2c]
	ldr r0, _08001BD4
	lsls r1, r2, #4
	ldr r3, [r0, r1]
	cmp r3, #0
	beq _08001BAA
	adds r0, r4, #0
	bl _call_via_r3
	ldrh r0, [r4]
	ldr r3, _08001BB8
	ands r0, r3
	cmp r0, #0
	beq _08001BE0
_08001BAA:
	adds r5, #0x10
	ldr r1, [r5, #0xc]
	adds r2, r1, #0
	cmp r1, #0
	bne _08001B38
	b _08001BD8
	.byte 0x00, 0x00
_08001BB8:
	.4byte 0x00004000
_08001BBC:
	.4byte gUnk_0804F964
_08001BC0:
	.4byte gUnk_0804F71C
_08001BC4:
	.4byte gUnk_0804F6E0
_08001BC8:
	.4byte gUnk_0804F974
_08001BCC:
	.4byte gObjFreeList
_08001BD0:
	.4byte 0x02018390
_08001BD4:
	.4byte gUnk_08713FD0
_08001BD8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08001BE0:
	adds r0, r4, #0
	movs r1, #1
	bl obj_add_process
	b _08001BAA
_08001BEA:
	adds r2, r4, #0
	ldr r0, _08001C10
	ldr r1, _08001C14
	bl AGBPrintf
	movs r4, #0
	b _08001B72
_08001BF8:
	ldr r0, _08001C18
	ldr r1, _08001C1C
	str r0, [sp]
	ldr r2, _08001C14
	ldr r0, _08001C20
	ldr r3, _08001C24
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001B3E
_08001C10:
	.4byte gUnk_0804F97C
_08001C14:
	.4byte gUnk_0804F974
_08001C18:
	.4byte gUnk_0804F9A8
_08001C1C:
	.4byte gUnk_0804F71C
_08001C20:
	.4byte gUnk_0804F6E0
_08001C24:
	.4byte 0x0000015F

	.global obj_set_hitbox
	.thumb_func
	.type obj_set_hitbox, %function
obj_set_hitbox: @ 08001C28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, #0x18]
	adds r4, r0, #0
	lsls r0, r5, #0x10
	adds r7, r1, #0
	lsrs r5, r0, #0x10
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
	adds r1, r4, #0
	adds r1, #0x5c
	strh r0, [r4]
	adds r6, r2, #0
	strh r7, [r1]
	adds r1, #2
	strh r6, [r1]
	adds r1, #2
	strh r3, [r1]
	movs r0, #0x80
	ldr r1, [r4, #0x24]
	lsls r3, r0, #1
	adds r0, r7, r3
	subs r2, r1, r0
	adds r7, r1, r0
	ldr r1, [r4, #0x2c]
	mov ip, r2
	subs r2, r1, r0
	mov r8, r2
	movs r2, #0x80
	adds r3, r1, r0
	lsls r1, r2, #3
	ands r1, r5
	mov lr, r3
	cmp r1, #0
	beq _08001CF0
	ldr r6, [r4, #0x28]
	subs r2, r6, r0
	adds r1, r6, r0
_08001C78:
	str r2, [r4, #0x74]
	adds r5, r4, #0
	mov r2, r8
	str r2, [r4, #0x7c]
	mov r3, ip
	adds r5, #0x80
	mov r2, lr
	str r1, [r4, #0x78]
	str r3, [r4, #0x6c]
	str r7, [r4, #0x70]
	ldr r0, _08001D08
	str r2, [r5]
	ldr r2, [r0]
	ldr r0, _08001D0C
	asrs r1, r2, #5
	ldr r3, [r0]
	adds r2, r1, #1
	movs r6, #0
	movs r5, #1
	adds r1, r2, r3
	movs r0, #0x1f
_08001CA2:
	cmp ip, r1
	bgt _08001CAC
	cmp r7, r3
	blt _08001CAC
	orrs r6, r5
_08001CAC:
	subs r0, #1
	adds r1, r1, r2
	adds r3, r3, r2
	lsls r5, r5, #1
	cmp r0, #0
	bge _08001CA2
	str r6, [r4, #0x64]
	ldr r1, _08001D10
	ldr r2, [r1]
	ldr r1, _08001D14
	asrs r0, r2, #5
	ldr r3, [r1]
	adds r2, r0, #1
	movs r6, #0
	movs r5, #1
	adds r1, r2, r3
	movs r0, #0x1f
_08001CCE:
	cmp r8, r1
	bgt _08001CD8
	cmp lr, r3
	blt _08001CD8
	orrs r6, r5
_08001CD8:
	subs r0, #1
	adds r1, r1, r2
	adds r3, r3, r2
	lsls r5, r5, #1
	cmp r0, #0
	bge _08001CCE
	str r6, [r4, #0x68]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08001CF0:
	movs r1, #0x80
	lsls r2, r1, #4
	ands r2, r5
	cmp r2, #0
	beq _08001D00
	ldr r2, [r4, #0x28]
	adds r1, r2, r6
	b _08001C78
_08001D00:
	movs r2, #0
	movs r1, #0
	b _08001C78
	.byte 0x00, 0x00
_08001D08:
	.4byte 0x0200428C
_08001D0C:
	.4byte 0x02004284
_08001D10:
	.4byte 0x02004298
_08001D14:
	.4byte 0x02004290

	.global obj_project_to_screen
	.thumb_func
	.type obj_project_to_screen, %function
obj_project_to_screen: @ 08001D18
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _08001D2E
	b _08001F2C
_08001D2E:
	ldr r4, _08001F10
	ldr r3, [r4]
	mov r8, r3
	adds r3, #0x54
	movs r1, #0
	ldrsh r6, [r3, r1]
	ldr r2, _08001F14
	adds r0, r6, #0
	mov fp, r2
	bl _call_via_r11
	ldr r3, _08001F18
	adds r1, r0, #0
	mov sb, r3
	adds r0, r6, #0
	lsls r5, r1, #0x10
	bl _call_via_r9
	mov ip, r0
	asrs r4, r5, #0x10
	mov r5, ip
	lsls r5, r5, #0x10
	asrs r3, r5, #0x10
	str r3, [sp, #0xc]
	mov r3, r8
	adds r3, #0x56
	movs r1, #0
	ldrsh r7, [r3, r1]
	adds r0, r7, #0
	bl _call_via_r11
	adds r2, r0, #0
	lsls r0, r2, #0x10
	mov sl, r5
	asrs r5, r0, #0x10
	adds r0, r7, #0
	bl _call_via_r9
	adds r6, r5, #0
	muls r6, r4, r6
	ldr r1, [sp, #0xc]
	lsls r7, r0, #0x10
	asrs r0, r7, #0x14
	asrs r2, r7, #0x10
	asrs r7, r6, #0x10
	adds r6, r5, #0
	muls r6, r1, r6
	asrs r3, r6, #0x10
	movs r6, #0
	str r6, [sp, #0x2c]
	mov r6, sl
	asrs r6, r6, #0x14
	rsbs r1, r4, #0
	str r6, [sp, #0x3c]
	mov sl, r6
	asrs r6, r1, #4
	str r6, [sp, #4]
	str r6, [sp, #0x4c]
	adds r6, r2, #0
	muls r6, r4, r6
	str r3, [sp, #8]
	str r3, [sp, #0x48]
	rsbs r1, r5, #0
	ldr r3, [sp, #0xc]
	asrs r5, r1, #4
	asrs r1, r6, #0x10
	str r1, [sp, #0x40]
	mov sb, r1
	adds r1, r2, #0
	muls r1, r3, r1
	asrs r3, r1, #0x10
	str r0, [sp, #0x28]
	str r5, [sp, #0x30]
	str r7, [sp, #0x38]
	str r3, [sp, #0x50]
	mov r1, r8
	ldr r6, [r1, #0x24]
	ldr r4, [r1, #0x2c]
	adds r2, r0, #0
	muls r2, r6, r2
	muls r4, r5, r4
	adds r6, r2, r4
	asrs r2, r6, #8
	rsbs r4, r2, #0
	str r4, [sp, #0x34]
	mov fp, r3
	ldr r6, [r1, #0x24]
	ldr r3, [r1, #0x28]
	adds r2, r7, #0
	muls r2, r6, r2
	mov r6, sl
	muls r6, r3, r6
	adds r3, r6, #0
	adds r2, r2, r3
	ldr r3, [r1, #0x2c]
	mov r6, sb
	muls r6, r3, r6
	adds r3, r6, #0
	adds r6, r2, r3
	asrs r1, r6, #8
	rsbs r2, r1, #0
	str r2, [sp, #0x44]
	mov r6, r8
	ldr r3, [r6, #0x24]
	ldr r6, [sp, #8]
	adds r1, r6, #0
	muls r1, r3, r1
	mov r6, r8
	ldr r3, [r6, #0x28]
	ldr r6, [sp, #4]
	muls r3, r6, r3
	mov r6, r8
	adds r1, r1, r3
	ldr r3, [r6, #0x2c]
	mov r6, fp
	muls r6, r3, r6
	adds r3, r6, #0
	adds r6, r1, r3
	asrs r3, r6, #8
	rsbs r1, r3, #0
	str r1, [sp, #0x54]
	ldr r6, [sp, #0x10]
	ldr r3, [r6, #0x24]
	mov lr, r3
	ldr r3, [sp, #0x10]
	ldr r6, [r3, #0x28]
	ldr r3, [sp, #0x10]
	str r6, [sp, #0x20]
	mov r8, r6
	ldr r6, [r3, #0x2c]
	mov r3, lr
	muls r3, r0, r3
	adds r0, r3, #0
	adds r3, r5, #0
	muls r3, r6, r3
	adds r5, r0, r3
	asrs r3, r5, #4
	lsls r5, r4, #4
	adds r0, r3, r5
	mov r5, r8
	mov r4, lr
	muls r4, r7, r4
	mov r3, sl
	muls r3, r5, r3
	adds r4, r4, r3
	mov r3, sb
	muls r3, r6, r3
	adds r5, r4, r3
	asrs r3, r5, #4
	lsls r5, r2, #4
	str r6, [sp, #0x24]
	adds r4, r3, r5
	ldr r5, [sp, #8]
	mov r3, lr
	muls r3, r5, r3
	ldr r5, [sp, #4]
	mov r2, r8
	muls r2, r5, r2
	adds r3, r3, r2
	mov r2, fp
	muls r2, r6, r2
	adds r5, r3, r2
	asrs r6, r5, #8
	adds r5, r6, r1
	str r4, [sp, #0x18]
	str r5, [sp, #0x1c]
	str r0, [sp, #0x14]
	asrs r2, r5, #4
	ldr r6, _08001F1C
	lsls r1, r2, #2
	ldr r2, [r6, r1]
	mov r8, r2
	ldr r6, _08001F20
	mov r1, r8
	bl _call_via_r6
	movs r5, #0x78
	subs r2, r5, r0
	ldr r0, [sp, #0x10]
	lsls r1, r2, #8
	str r1, [r0, #0x24]
	adds r0, r4, #0
	mov r1, r8
	bl _call_via_r6
	movs r5, #0x50
	subs r4, r5, r0
	ldr r1, [sp, #0x10]
	lsls r2, r4, #8
	str r2, [r1, #0x28]
	adds r0, r1, #0
	adds r0, #0x5a
	ldrh r4, [r0]
	cmp r4, #0xff
	beq _08001EEC
	ldr r3, _08001F24
	ldr r7, _08001F28
	mov sb, r6
	mov sl, r3
_08001EBC:
	movs r5, #0x18
	adds r6, r4, #0
	muls r6, r5, r6
	adds r0, r6, #0
	adds r0, #8
	adds r5, r0, r7
	ldrh r3, [r5, #2]
	mov r1, r8
	lsls r0, r3, #0xc
	bl _call_via_r9
	movs r2, #0x80
	lsls r1, r2, #2
	cmp r0, r1
	ble _08001EDC
	adds r0, r1, #0
_08001EDC:
	mov r2, sl
	adds r1, r6, #0
	ldrb r4, [r2, r4]
	adds r1, #0xc
	strh r0, [r7, r1]
	strh r0, [r5, #2]
	cmp r4, #0xff
	bne _08001EBC
_08001EEC:
	ldr r5, [sp, #0x10]
	ldr r6, _08001F0C
	ldrh r0, [r5]
	orrs r0, r6
	adds r6, r5, #0
	strh r0, [r6]
	add sp, #0x58
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08001F0C:
	.4byte 0x00001000
_08001F10:
	.4byte 0x0200436C
_08001F14:
	.4byte sin_fx
_08001F18:
	.4byte cos_fx
_08001F1C:
	.4byte gUnk_0803F49C
_08001F20:
	.4byte _03000738
_08001F24:
	.4byte gSpriteNext
_08001F28:
	.4byte gSprites
_08001F2C:
	ldr r0, _08001F44
	ldr r1, _08001F48
	str r0, [sp]
	ldr r2, _08001F4C
	ldr r0, _08001F50
	ldr r3, _08001F54
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001D2E
_08001F44:
	.4byte gUnk_0804F73C
_08001F48:
	.4byte gUnk_0804F71C
_08001F4C:
	.4byte gUnk_0804F9B0
_08001F50:
	.4byte gUnk_0804F6E0
_08001F54:
	.4byte 0x000002AF

	.global obj_new
	.thumb_func
	.type obj_new, %function
obj_new: @ 08001F58
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	ble _08001FAA
_08001F62:
	cmp r4, #0x39
	ble _08001F7E
	ldr r0, _08001FC4
	movs r3, #0xb0
	str r0, [sp]
	ldr r1, _08001FC8
	ldr r0, _08001FCC
	ldr r2, _08001FD0
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08001F7E:
	ldr r1, _08001FD4
	ldr r0, [r1]
	cmp r0, #0
	beq _08001F9C
	ldr r3, _08001FD8
	ldr r2, [r3]
	adds r2, #1
	str r2, [r3]
	ldr r2, [r0, #4]
	str r2, [r1]
	strb r4, [r0, #2]
_08001F94:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
_08001F9C:
	ldr r0, _08001FDC
	ldr r1, _08001FD0
	adds r2, r4, #0
	bl AGBPrintf
	movs r0, #0
	b _08001F94
_08001FAA:
	ldr r0, _08001FE0
	ldr r1, _08001FC8
	str r0, [sp]
	ldr r2, _08001FD0
	ldr r0, _08001FCC
	ldr r3, _08001FE4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08001F62
	.byte 0x00, 0x00
_08001FC4:
	.4byte gUnk_0804F964
_08001FC8:
	.4byte gUnk_0804F71C
_08001FCC:
	.4byte gUnk_0804F6E0
_08001FD0:
	.4byte gUnk_0804F974
_08001FD4:
	.4byte gObjFreeList
_08001FD8:
	.4byte 0x02018390
_08001FDC:
	.4byte gUnk_0804F97C
_08001FE0:
	.4byte gUnk_0804F9A8
_08001FE4:
	.4byte 0x0000015F

	.global obj_free
	.thumb_func
	.type obj_free, %function
obj_free: @ 08001FE8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	ldrh r2, [r4]
	lsls r1, r0, #7
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08002000
_08001FFA:
	pop {r4}
	pop {r0}
	bx r0
_08002000:
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r4]
	ldr r0, _08002020
	ldr r1, [r0]
	ldr r3, _08002024
	lsls r2, r1, #2
	adds r1, #1
	str r4, [r3, r2]
	str r1, [r0]
	cmp r1, #0x7f
	ble _08001FFA
	ldr r0, _08002028
	bl AGBPrintf
	b _08001FFA
_08002020:
	.4byte gObjDeleteCount
_08002024:
	.4byte gObjDeleteList
_08002028:
	.4byte gUnk_0804F9C8

	.global obj_initialise
	.thumb_func
	.type obj_initialise, %function
obj_initialise: @ 0800202C
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	adds r5, r1, #0
	cmp r4, #0
	beq _08002068
_08002038:
	ldrb r2, [r4, #2]
	ldr r1, _08002080
	lsls r0, r2, #4
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _08002056
	adds r0, r4, #0
	bl _call_via_r3
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r0, r2, #7
	ands r0, r1
	cmp r0, #0
	beq _0800205E
_08002056:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_0800205E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl obj_add_process
	b _08002056
_08002068:
	ldr r0, _08002084
	ldr r1, _08002088
	str r0, [sp]
	ldr r2, _0800208C
	ldr r0, _08002090
	ldr r3, _08002094
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08002038
_08002080:
	.4byte gUnk_08713FD0
_08002084:
	.4byte gUnk_0804F73C
_08002088:
	.4byte gUnk_0804F71C
_0800208C:
	.4byte gUnk_0804F9F8
_08002090:
	.4byte gUnk_0804F6E0
_08002094:
	.4byte 0x000001FD

	.global obj_free_all
	.thumb_func
	.type obj_free_all, %function
obj_free_all: @ 08002098
	push {r4, lr}
	bl obj_flush_deletes
	ldr r0, _080020E8
	ldr r1, [r0]
	cmp r1, #0
	beq _080020B4
	adds r4, r0, #0
_080020A8:
	ldr r0, [r4]
	bl obj_really_free
	ldr r0, [r4]
	cmp r0, #0
	bne _080020A8
_080020B4:
	ldr r0, _080020EC
	ldr r1, [r0]
	cmp r1, #0
	beq _080020CA
	adds r4, r0, #0
_080020BE:
	ldr r0, [r4]
	bl obj_really_free
	ldr r2, [r4]
	cmp r2, #0
	bne _080020BE
_080020CA:
	ldr r0, _080020F0
	ldr r1, [r0]
	cmp r1, #0
	beq _080020E0
	adds r4, r0, #0
_080020D4:
	ldr r0, [r4]
	bl obj_really_free
	ldr r0, [r4]
	cmp r0, #0
	bne _080020D4
_080020E0:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080020E8:
	.4byte gObjProcessList
_080020EC:
	.4byte gObjDrawList2
_080020F0:
	.4byte gObjDrawList

	.global obj_flush_deletes
	.thumb_func
	.type obj_flush_deletes, %function
obj_flush_deletes: @ 080020F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r7, _08002134
	ldr r0, [r7]
	movs r5, #0
	cmp r5, r0
	bge _08002124
	ldr r6, _08002138
	mov sl, r5
	mov r8, r7
	movs r4, #0
_0800210E:
	ldr r0, [r4, r6]
	bl obj_really_free
	mov r2, sl
	str r2, [r4, r6]
	mov r2, r8
	ldr r0, [r2]
	adds r5, #1
	adds r4, #4
	cmp r5, r0
	blt _0800210E
_08002124:
	movs r1, #0
	str r1, [r7]
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08002134:
	.4byte gObjDeleteCount
_08002138:
	.4byte gObjDeleteList

	.global obj_remove_process
	.thumb_func
	.type obj_remove_process, %function
obj_remove_process: @ 0800213C
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080021B2
_08002146:
	ldrh r2, [r4]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08002198
_08002150:
	movs r1, #9
	rsbs r0, r1, #0
	ands r0, r2
	ldr r2, [r4, #4]
	strh r0, [r4]
	cmp r2, #0
	beq _08002162
	ldr r0, [r4, #8]
	str r0, [r2, #8]
_08002162:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _08002174
	ldr r1, [r4, #4]
	str r1, [r2, #4]
_0800216C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08002174:
	ldr r5, _080021CC
	ldr r2, [r5]
	cmp r2, r4
	beq _08002192
	ldr r0, _080021D0
	ldr r1, _080021D4
	str r0, [sp]
	ldr r2, _080021D8
	ldr r0, _080021DC
	movs r3, #0xa4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08002192:
	ldr r1, [r4, #4]
	str r1, [r5]
	b _0800216C
_08002198:
	ldr r1, _080021E0
	ldr r0, _080021DC
	str r1, [sp]
	ldr r2, _080021D8
	ldr r1, _080021D4
	movs r3, #0x9b
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldrh r2, [r4]
	b _08002150
_080021B2:
	ldr r0, _080021E4
	ldr r1, _080021D4
	str r0, [sp]
	ldr r2, _080021D8
	ldr r0, _080021DC
	movs r3, #0x9a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08002146
	.byte 0x00, 0x00
_080021CC:
	.4byte gObjProcessList
_080021D0:
	.4byte gUnk_0804F8A0
_080021D4:
	.4byte gUnk_0804F71C
_080021D8:
	.4byte gUnk_0804F8BC
_080021DC:
	.4byte gUnk_0804F6E0
_080021E0:
	.4byte gUnk_0804FA08
_080021E4:
	.4byte gUnk_0804F73C

	.global obj_add_draw
	.thumb_func
	.type obj_add_draw, %function
obj_add_draw: @ 080021E8
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08002262
_080021F2:
	ldrh r1, [r4]
	movs r0, #0x10
	bics r0, r1
	cmp r0, #0
	beq _0800224A
_080021FC:
	ldrh r1, [r4]
	ldr r3, _08002228
	movs r0, #0x80
	orrs r1, r3
	lsls r3, r0, #5
	strh r1, [r4]
	ands r1, r3
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08002238
	ldr r2, _0800222C
	ldr r3, [r2]
	str r3, [r4, #0xc]
	cmp r3, #0
	beq _0800221E
	str r4, [r3, #0x10]
_0800221E:
	movs r1, #0
	str r1, [r4, #0x10]
	str r4, [r2]
	b _08002230
	.byte 0x00, 0x00
_08002228:
	.4byte 0x00000010
_0800222C:
	.4byte gObjDrawList
_08002230:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08002238:
	ldr r1, _0800227C
	ldr r2, [r1]
	str r2, [r4, #0xc]
	cmp r2, #0
	beq _08002244
	str r4, [r2, #0x10]
_08002244:
	str r3, [r4, #0x10]
	str r4, [r1]
	b _08002230
_0800224A:
	ldr r2, _08002280
	ldr r0, _08002284
	str r2, [sp]
	ldr r1, _08002288
	ldr r2, _0800228C
	movs r3, #0xac
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080021FC
_08002262:
	ldr r0, _08002290
	ldr r1, _08002288
	str r0, [sp]
	ldr r2, _0800228C
	ldr r0, _08002284
	movs r3, #0xab
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080021F2
	.byte 0x00, 0x00
_0800227C:
	.4byte gObjDrawList2
_08002280:
	.4byte gUnk_0804F8D0
_08002284:
	.4byte gUnk_0804F6E0
_08002288:
	.4byte gUnk_0804F71C
_0800228C:
	.4byte gUnk_0804F8E8
_08002290:
	.4byte gUnk_0804F73C

	.global obj_add_static_hit
	.thumb_func
	.type obj_add_static_hit, %function
obj_add_static_hit: @ 08002294
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r0, [r1]
	sub sp, #4
	cmp r0, #0
	beq _080022F4
	cmp r4, #0
	beq _08002314
_080022A8:
	ldrh r3, [r4]
	movs r1, #0x40
	bics r1, r3
	cmp r1, #0
	beq _080022FC
_080022B2:
	ldrh r0, [r4]
	ldr r1, _080022E4
	orrs r0, r1
	strh r0, [r4]
	ldr r2, _080022EC
	ldr r3, [r2]
	str r3, [r4, #0x14]
	cmp r3, #0
	beq _080022C6
	str r4, [r3, #0x18]
_080022C6:
	movs r0, #0
	str r0, [r4, #0x18]
	str r4, [r2]
	ldrb r2, [r4, #2]
	lsls r1, r2, #4
	ldr r2, _080022F0
	adds r1, #8
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _080022F4
	ldrh r1, [r4]
	ldr r3, _080022E8
	orrs r1, r3
	strh r1, [r4]
	b _080022F4
_080022E4:
	.4byte 0x00000140
_080022E8:
	.4byte 0x00000080
_080022EC:
	.4byte gObjStaticHitList
_080022F0:
	.4byte gUnk_08713FD0
_080022F4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_080022FC:
	ldr r2, _0800232C
	ldr r0, _08002330
	str r2, [sp]
	ldr r1, _08002334
	ldr r2, _08002338
	movs r3, #0xec
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080022B2
_08002314:
	ldr r0, _0800233C
	ldr r1, _08002334
	str r0, [sp]
	ldr r2, _08002338
	ldr r0, _08002330
	movs r3, #0xeb
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080022A8
_0800232C:
	.4byte gUnk_0804FA20
_08002330:
	.4byte gUnk_0804F6E0
_08002334:
	.4byte gUnk_0804F71C
_08002338:
	.4byte gUnk_0804FA3C
_0800233C:
	.4byte gUnk_0804F73C

	.global obj_add_vector_hit
	.thumb_func
	.type obj_add_vector_hit, %function
obj_add_vector_hit: @ 08002340
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r0, [r1]
	sub sp, #4
	cmp r0, #0
	beq _08002394
	cmp r4, #0
	beq _080023B4
_08002354:
	ldrh r3, [r4]
	movs r1, #0x40
	bics r1, r3
	cmp r1, #0
	beq _0800239C
_0800235E:
	ldrb r2, [r4, #2]
	lsls r1, r2, #4
	ldr r2, _0800238C
	adds r1, #8
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _08002394
	ldrh r0, [r4]
	ldr r3, _08002388
	orrs r0, r3
	strh r0, [r4]
	ldr r2, _08002390
	ldr r3, [r2]
	str r3, [r4, #0x1c]
	cmp r3, #0
	beq _08002380
	str r4, [r3, #0x20]
_08002380:
	movs r1, #0
	str r1, [r4, #0x20]
	str r4, [r2]
	b _08002394
_08002388:
	.4byte 0x000002C0
_0800238C:
	.4byte gUnk_08713FD0
_08002390:
	.4byte gObjVectorHitList
_08002394:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0800239C:
	ldr r2, _080023D0
	ldr r0, _080023D4
	str r2, [sp]
	ldr r1, _080023D8
	ldr r2, _080023DC
	ldr r3, _080023E0
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0800235E
_080023B4:
	ldr r0, _080023E4
	movs r3, #0x88
	str r0, [sp]
	ldr r1, _080023D8
	ldr r0, _080023D4
	ldr r2, _080023DC
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08002354
	.byte 0x00, 0x00
_080023D0:
	.4byte gUnk_0804FA20
_080023D4:
	.4byte gUnk_0804F6E0
_080023D8:
	.4byte gUnk_0804F71C
_080023DC:
	.4byte gUnk_0804FA50
_080023E0:
	.4byte 0x00000111
_080023E4:
	.4byte gUnk_0804F73C

	.global dbg_putc
	.thumb_func
	.type dbg_putc, %function
dbg_putc: @ 080023E8
	push {r4, lr}
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	cmp r2, #9
	beq _08002472
	cmp r2, #9
	bgt _08002450
	cmp r2, #8
	beq _08002442
_080023FA:
	ldr r0, _08002430
	ldr r4, [r0]
	lsls r3, r4, #5
	ldr r4, _08002434
	ldr r0, [r4]
	adds r1, r3, r0
	lsls r3, r1, #1
	ldr r1, _08002438
	adds r3, r3, r1
	ldr r1, _0800242C
	adds r0, #1
	orrs r2, r1
	strh r2, [r3]
	str r0, [r4]
	adds r1, r4, #0
_08002418:
	ldr r2, [r1]
	cmp r2, #0x1e
	ble _0800243C
	movs r2, #0
	str r2, [r1]
	ldr r1, _08002430
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _0800243C
_0800242C:
	.4byte 0xFFFFD000
_08002430:
	.4byte gDbgCursorY
_08002434:
	.4byte gDbgCursorX
_08002438:
	.4byte 0x0600A000
_0800243C:
	pop {r4}
	pop {r0}
	bx r0
_08002442:
	ldr r1, _08002484
	ldr r3, [r1]
	cmp r3, #0
	ble _08002418
	subs r3, #1
	str r3, [r1]
	b _08002418
_08002450:
	cmp r2, #0xa
	beq _08002462
	cmp r2, #0xd
	bne _080023FA
	ldr r0, _08002484
	movs r1, #0
	str r1, [r0]
	adds r1, r0, #0
	b _08002418
_08002462:
	ldr r1, _08002484
	movs r0, #0
	str r0, [r1]
	ldr r0, _08002488
	ldr r2, [r0]
	adds r2, #1
	str r2, [r0]
	b _08002418
_08002472:
	ldr r0, _08002484
	ldr r3, [r0]
	ldr r2, _0800248C
	adds r3, #8
	ands r3, r2
	adds r1, r0, #0
	str r3, [r0]
	b _08002418
	.byte 0x00, 0x00
_08002484:
	.4byte gDbgCursorX
_08002488:
	.4byte gDbgCursorY
_0800248C:
	.4byte 0x0000FFF8

	.global dbg_draw_values
	.thumb_func
	.type dbg_draw_values, %function
dbg_draw_values: @ 08002490
	push {r4, lr}
	ldr r1, _080025B0
	movs r4, #0xa
	ldr r0, _080025B4
	str r4, [r1]
	movs r3, #0xb
	ldr r4, _080025B8
	str r3, [r0]
	adds r4, #0x86
	movs r1, #0
	ldrsh r2, [r4, r1]
	ldr r1, _080025BC
	lsls r0, r2, #2
	subs r0, #4
	ldr r4, [r1, r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _080024C2
_080024B4:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r2, [r4]
	cmp r2, #0
	bne _080024B4
_080024C2:
	ldr r0, _080025B0
	ldr r4, _080025B4
	movs r1, #0xa
	movs r3, #0xc
	str r1, [r0]
	str r3, [r4]
	ldr r1, _080025C0
	ldr r2, [r1]
	lsls r0, r2, #1
	ldr r2, _080025B8
	adds r0, #4
	ldrsh r4, [r2, r0]
	ldr r0, _080025C4
	lsls r1, r4, #2
	ldr r4, [r0, r1]
	ldrb r0, [r4]
	cmp r0, #0
	beq _080024F4
_080024E6:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r2, [r4]
	cmp r2, #0
	bne _080024E6
_080024F4:
	ldr r4, _080025B4
	ldr r1, _080025B0
	movs r0, #0xd
	movs r3, #0x12
	str r0, [r1]
	str r3, [r4]
	ldr r0, _080025C8
	ldr r4, [r0]
	cmp r4, #0
	blt _080025A6
_08002508:
	movs r1, #0xa
	adds r0, r4, #0
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	beq _08002598
	movs r0, #2
	bl dbg_putnum
_0800251C:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	lsls r4, r0, #0x18
	lsrs r0, r4, #0x18
	bl dbg_putc
	ldr r4, _080025CC
	ldrb r2, [r4]
	cmp r2, #0
	beq _08002544
_08002536:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r1, [r4]
	cmp r1, #0
	bne _08002536
_08002544:
	ldr r0, _080025B0
	movs r1, #0xd
	str r1, [r0]
	ldr r1, _080025B4
	movs r3, #0x13
	str r3, [r1]
	ldr r2, _080025B8
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08002580
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #1
	beq _08002568
_08002562:
	pop {r4}
	pop {r0}
	bx r0
_08002568:
	ldr r4, _080025D0
	ldrb r1, [r4]
	cmp r1, #0
	beq _08002562
_08002570:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r2, [r4]
	cmp r2, #0
	bne _08002570
	b _08002562
_08002580:
	ldr r4, _080025D4
	ldrb r2, [r4]
	cmp r2, #0
	beq _08002562
_08002588:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r0, [r4]
	cmp r0, #0
	bne _08002588
	b _08002562
_08002598:
	movs r0, #0x20
	bl dbg_putc
	movs r0, #0x20
	bl dbg_putc
	b _0800251C
_080025A6:
	movs r0, #0x2d
	bl dbg_putc
	rsbs r4, r4, #0
	b _08002508
_080025B0:
	.4byte gDbgCursorX
_080025B4:
	.4byte gDbgCursorY
_080025B8:
	.4byte gGameSetup
_080025BC:
	.4byte gDbgTrackNames
_080025C0:
	.4byte gLocalPlayerIndex
_080025C4:
	.4byte gDbgCharacterNames
_080025C8:
	.4byte gDbgVolume
_080025CC:
	.4byte gUnk_0804FD10
_080025D0:
	.4byte gUnk_0804FD18
_080025D4:
	.4byte gUnk_0804FD20

	.global dbg_setup_screen
	.thumb_func
	.type dbg_setup_screen, %function
dbg_setup_screen: @ 080025D8
	push {r4, lr}
	ldr r0, _08002614
	ldr r1, _0800261C
	movs r3, #0xc0
	sub sp, #4
	strh r0, [r1]
	lsls r4, r3, #0x13
	ldr r1, _08002620
	ldr r3, _08002624
	mov r2, sp
	adds r2, #2
	strh r0, [r2]
	str r2, [r1]
	str r4, [r1, #4]
	str r3, [r1, #8]
	ldr r3, [r1, #8]
	ldr r3, _08002618
	strh r3, [r2]
	ldr r3, _08002628
	str r2, [r1]
	str r3, [r1, #4]
	ldr r3, _0800262C
	str r3, [r1, #8]
	ldr r3, [r1, #8]
	ldr r3, _08002630
	str r3, [r1]
	movs r3, #0xa0
	lsls r3, r3, #0x13
	b _08002634
	.byte 0x00, 0x00
_08002614:
	.4byte 0x00000000
_08002618:
	.4byte 0x0000FFFF
_0800261C:
	.4byte 0x04000208
_08002620:
	.4byte 0x040000D4
_08002624:
	.4byte 0x81008000
_08002628:
	.4byte 0x06010000
_0800262C:
	.4byte 0x81000020
_08002630:
	.4byte gUnk_08053850
_08002634:
	str r3, [r1, #4]
	ldr r3, _080026B8
	str r3, [r1, #8]
	ldr r3, [r1, #8]
	strh r0, [r2]
	str r2, [r1]
	ldr r2, _080026BC
	str r2, [r1, #4]
	ldr r2, _080026C0
	str r2, [r1, #8]
	ldr r2, _080026C4
	ldr r3, [r1, #8]
	str r2, [r1]
	subs r2, #2
	str r4, [r1, #4]
	ldrh r4, [r2]
	lsls r2, r4, #5
	movs r4, #0x80
	lsls r4, r4, #0x18
	orrs r2, r4
	str r2, [r1, #8]
	ldr r3, [r1, #8]
	ldr r3, _080026C8
	str r3, [r1]
	subs r3, #2
	ldrh r3, [r3]
	ldr r2, _080026CC
	str r2, [r1, #4]
	lsls r2, r3, #4
	orrs r2, r4
	str r2, [r1, #8]
	ldr r2, _080026AC
	ldr r3, [r1, #8]
	movs r3, #0x80
	lsls r4, r3, #0x13
	strh r2, [r4]
	ldr r2, _080026B0
	adds r4, #8
	strh r2, [r4]
	ldr r2, _080026B4
	adds r4, #2
	strh r2, [r4]
	adds r4, #6
	strh r0, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #0x3a
	strh r0, [r4]
	ldr r2, _080026D0
	ldr r4, _080026D4
	ldr r0, _080026D8
	str r4, [r1]
	str r2, [r1, #4]
	str r0, [r1, #8]
	movs r2, #0xe0
	b _080026DC
_080026AC:
	.4byte 0x00001340
_080026B0:
	.4byte 0x0000140C
_080026B4:
	.4byte 0x00001580
_080026B8:
	.4byte 0x80000100
_080026BC:
	.4byte 0x05000200
_080026C0:
	.4byte 0x81000100
_080026C4:
	.4byte gUnk_0805F694
_080026C8:
	.4byte gUnk_0803062A
_080026CC:
	.4byte 0x0600C000
_080026D0:
	.4byte 0x0600A800
_080026D4:
	.4byte gUnk_081B8044
_080026D8:
	.4byte 0x80000400
_080026DC:
	ldr r3, [r1, #8]
	ldr r4, _08002700
	ldr r0, _08002704
	ldr r1, _08002708
	lsls r3, r2, #0x13
	movs r2, #0x7f
_080026E8:
	subs r2, #1
	strh r4, [r3]
	strh r0, [r3, #2]
	strh r1, [r3, #4]
	adds r3, #8
	cmp r2, #0
	bge _080026E8
	ldr r3, _0800270C
	ldr r0, _08002710
	add sp, #4
	strh r3, [r0]
	b _08002714
_08002700:
	.4byte 0x000000F8
_08002704:
	.4byte 0x000001F8
_08002708:
	.4byte 0x00000000
_0800270C:
	.4byte 0x00000001
_08002710:
	.4byte 0x04000208
_08002714:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global debug_menu_init
	.thumb_func
	.type debug_menu_init, %function
debug_menu_init: @ 0800271C
	push {r4, r5, r6, r7, lr}
	ldr r5, _08002760
	ldr r0, _08002758
	ldr r1, _08002764
	strh r0, [r5]
	ldr r0, _0800275C
	ldrh r2, [r1]
	orrs r2, r0
	strh r2, [r1]
	ldr r3, _08002768
	ldr r1, _0800276C
	str r3, [r1]
	strh r0, [r5]
	movs r0, #4
	bl music_play_if_changed
	ldr r2, _08002770
	ldr r1, _08002774
	movs r0, #0
	str r0, [r2]
	subs r0, #1
	str r0, [r1]
	bl dbg_setup_screen
	ldr r2, _08002778
	ldr r1, _0800277C
	movs r5, #7
	movs r0, #1
	b _08002780
	.byte 0x00, 0x00
_08002758:
	.4byte 0x00000000
_0800275C:
	.4byte 0x00000001
_08002760:
	.4byte 0x04000208
_08002764:
	.4byte 0x04000200
_08002768:
	.4byte vblank_handler
_0800276C:
	.4byte gIrqHandler
_08002770:
	.4byte gDbgVolume
_08002774:
	.4byte gDbgTestSound
_08002778:
	.4byte gDbgCursorX
_0800277C:
	.4byte gDbgCursorY
_08002780:
	str r5, [r2]
	ldr r3, _080027DC
	str r0, [r1]
	ldr r0, [r3]
	movs r5, #0
	cmp r5, r0
	bge _080027C0
	adds r7, r2, #0
	adds r6, r1, #0
_08002792:
	adds r4, r5, #0
	ldr r3, _080027E0
	adds r4, #0xb
	movs r2, #3
	lsls r0, r5, #2
	str r2, [r7]
	str r4, [r6]
	ldr r4, [r3, r0]
	ldrb r1, [r4]
	cmp r1, #0
	beq _080027B6
_080027A8:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r1, [r4]
	cmp r1, #0
	bne _080027A8
_080027B6:
	ldr r2, _080027DC
	ldr r0, [r2]
	adds r5, #1
	cmp r5, r0
	blt _08002792
_080027C0:
	ldr r0, _080027E4
	movs r1, #0
	str r1, [r0]
	bl dbg_draw_values
	ldr r3, _080027E8
	ldr r1, _080027EC
	str r3, [r1]
	bl music_stop
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080027DC:
	.4byte gDbgMenuItemCount
_080027E0:
	.4byte gDbgMenuItems
_080027E4:
	.4byte gDbgMenuRow
_080027E8:
	.4byte debug_menu_process
_080027EC:
	.4byte gStateFunc

	.global debug_menu_process
	.thumb_func
	.type debug_menu_process, %function
debug_menu_process: @ 080027F0
	push {r4, r5, lr}
	ldr r0, _08002838
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0xb
	lsls r3, r2, #3
	ldr r2, _08002830
	ands r3, r2
	movs r2, #0xe0
	lsls r2, r2, #0x13
	strh r3, [r2]
	ldr r2, _08002834
	ldr r3, _0800283C
	strh r2, [r3]
	ldr r3, _08002840
	ldrh r2, [r3]
	movs r3, #0x40
	ands r3, r2
	cmp r3, #0
	bne _0800281A
	b _08002ABA
_0800281A:
	cmp r1, #0
	ble _08002822
	subs r2, r1, #1
_08002820:
	str r2, [r0]
_08002822:
	ldr r1, _08002838
	ldr r0, [r1]
	cmp r0, #7
	bne _0800282C
	b _08002A2C
_0800282C:
	b _08002844
	.byte 0x00, 0x00
_08002830:
	.4byte 0x000000FF
_08002834:
	.4byte 0x00000008
_08002838:
	.4byte gDbgMenuRow
_0800283C:
	.4byte 0x07000002
_08002840:
	.4byte gKeysNew
_08002844:
	bl dbg_draw_values
	ldr r1, _08002920
	ldrh r3, [r1]
	movs r0, #0xb
	ands r0, r3
	cmp r0, #0
	beq _080028AC
	ldr r2, _08002924
	ldr r3, [r2]
	cmp r3, #8
	bhi _080028AC
	ldr r2, _08002928
	lsls r3, r3, #2
	ldr r0, [r3, r2]
	mov pc, r0
	.global _08002864
_08002864:
	.4byte _08002888
	.4byte _080028FA
	.4byte _08002972
	.4byte _08002986
	.4byte _08002978
	.4byte _080029A6
	.4byte _080029AC
	.4byte _080028AC
	.4byte _080029B8
	.global _08002888
_08002888:
	ldrh r2, [r1]
	movs r4, #1
	adds r1, r4, #0
	ands r1, r2
	cmp r1, #0
	beq _080028B6
	ldr r2, _0800292C
	adds r1, r2, #0
	adds r1, #0x86
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, _08002930
	ldr r3, [r3]
	ldrh r0, [r1]
	cmp r2, r3
	bge _080028B2
	adds r2, r0, #1
	strh r2, [r1]
	.global _080028AC
_080028AC:
	pop {r4, r5}
	pop {r0}
	bx r0
_080028B2:
	strh r4, [r1]
	b _080028AC
_080028B6:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080028DC
	ldr r4, _0800292C
	adds r2, r4, #0
	adds r2, #0x86
	movs r4, #0
	ldrsh r0, [r2, r4]
	ldrh r1, [r2]
	cmp r0, #1
	ble _080028D4
	subs r0, r1, #1
	strh r0, [r2]
	b _080028AC
_080028D4:
	ldr r0, _08002930
	ldr r1, [r0]
	strh r1, [r2]
	b _080028AC
_080028DC:
	movs r3, #0x80
	lsls r1, r2, #0x10
	lsls r2, r3, #0xc
	cmp r1, r2
	bne _080028AC
	ldr r2, _0800292C
	adds r3, r2, #0
	adds r3, #0x86
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0x13
	ble _08002986
	ldr r1, _0800291C
	strh r1, [r2]
	b _08002986
	.global _080028FA
_080028FA:
	ldrh r2, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800293E
	ldr r1, _08002934
	ldr r2, [r1]
	ldr r0, _0800292C
	lsls r4, r2, #1
	adds r2, r4, #4
	ldrsh r3, [r0, r2]
	ldrh r1, [r0, r2]
	cmp r3, #7
	bgt _08002938
	adds r3, r1, #1
	strh r3, [r0, r2]
	b _080028AC
_0800291C:
	.4byte 0x00000006
_08002920:
	.4byte gKeysNew
_08002924:
	.4byte gDbgMenuRow
_08002928:
	.4byte _08002864
_0800292C:
	.4byte gGameSetup
_08002930:
	.4byte gDbgTrackCount
_08002934:
	.4byte gLocalPlayerIndex
_08002938:
	ldr r1, _08002960
	strh r1, [r0, r2]
	b _080028AC
_0800293E:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080028AC
	ldr r1, _08002964
	ldr r2, [r1]
	ldr r0, _08002968
	lsls r4, r2, #1
	adds r2, r4, #4
	ldrsh r3, [r0, r2]
	ldrh r1, [r0, r2]
	cmp r3, #0
	ble _0800296C
	subs r3, r1, #1
	strh r3, [r0, r2]
	b _080028AC
	.byte 0x00, 0x00
_08002960:
	.4byte 0x00000000
_08002964:
	.4byte gLocalPlayerIndex
_08002968:
	.4byte gGameSetup
_0800296C:
	ldr r1, _08002994
	strh r1, [r0, r2]
	b _080028AC
	.global _08002972
_08002972:
	bl fe_cups_scoreboard_init
	b _080028AC
	.global _08002978
_08002978:
	ldr r2, _0800299C
	movs r0, #2
	ldrsh r3, [r2, r0]
	cmp r3, #0
	beq _080029A0
	cmp r3, #1
	beq _0800298C
	.global _08002986
_08002986:
	bl game_init
	b _080028AC
_0800298C:
	ldr r1, _08002998
	strh r1, [r2, #2]
	b _08002986
	.byte 0x00, 0x00
_08002994:
	.4byte 0x00000008
_08002998:
	.4byte 0x00000004
_0800299C:
	.4byte gGameSetup
_080029A0:
	ldr r0, _080029B4
	strh r0, [r2, #2]
	b _08002986
	.global _080029A6
_080029A6:
	bl fe_title_init
	b _080028AC
	.global _080029AC
_080029AC:
	bl fe_cups_win_init
	b _080028AC
	.byte 0x00, 0x00
_080029B4:
	.4byte 0x00000003
	.global _080029B8
_080029B8:
	ldrh r2, [r1]
	movs r0, #1
	adds r3, r0, #0
	ands r3, r2
	cmp r3, #0
	beq _080029CE
	ldr r2, _08002A28
	movs r4, #2
	ldrsh r3, [r2, r4]
	cmp r3, #0
	beq _08002A10
_080029CE:
	ldrh r3, [r1]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080029E2
	ldr r2, _08002A28
	movs r0, #2
	ldrsh r3, [r2, r0]
	cmp r3, #0
	beq _08002A1A
_080029E2:
	ldrh r3, [r1]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080029F6
	ldr r2, _08002A28
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #1
	beq _08002A14
_080029F6:
	ldrh r3, [r1]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	bne _08002A02
	b _080028AC
_08002A02:
	ldr r2, _08002A28
	movs r0, #2
	ldrsh r1, [r2, r0]
	cmp r1, #1
	beq _08002A0E
	b _080028AC
_08002A0E:
	ldr r0, _08002A20
_08002A10:
	strh r0, [r2, #2]
	b _080028AC
_08002A14:
	ldr r1, _08002A20
	strh r1, [r2, #2]
	b _080028AC
_08002A1A:
	ldr r1, _08002A24
	strh r1, [r2, #2]
	b _080028AC
_08002A20:
	.4byte 0x00000000
_08002A24:
	.4byte 0x00000001
_08002A28:
	.4byte gGameSetup
_08002A2C:
	ldr r1, _08002AD4
	ldrh r2, [r1]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _08002A3A
	b _08002844
_08002A3A:
	movs r4, #0x20
	ands r4, r2
	cmp r4, #0
	beq _08002AA6
	ldr r2, _08002AD8
	movs r1, #3
	ldr r3, [r2]
	rsbs r5, r1, #0
	cmp r3, r5
	blt _08002A52
	subs r3, #1
_08002A50:
	str r3, [r2]
_08002A52:
	bl dbg_draw_values
	ldr r2, _08002AD8
	ldr r3, [r2]
	cmp r3, #0
	blt _08002AA2
	movs r5, #4
_08002A60:
	ldr r2, [r2]
	movs r3, #4
	cmp r2, #0
	ble _08002A6A
	subs r3, r3, r2
_08002A6A:
	ldr r4, _08002ADC
	lsls r2, r3, #4
	ldr r0, [r4, r2]
	bl music_set_volume
	lsls r1, r5, #4
	ldr r0, [r4, r1]
	bl sfx_set_volume
	ldr r4, _08002AE0
	movs r2, #1
	ldr r0, [r4]
	rsbs r3, r2, #0
	cmp r0, r3
	beq _08002A92
	bl snd_is_playing
	cmp r0, #0
	beq _08002A92
	b _08002844
_08002A92:
	movs r3, #0x80
	movs r0, #0x4e
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	str r0, [r4]
	b _08002844
_08002AA2:
	adds r5, r3, #4
	b _08002A60
_08002AA6:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08002A52
	ldr r2, _08002AD8
	ldr r3, [r2]
	cmp r3, #3
	bgt _08002A52
	adds r3, #1
	b _08002A50
_08002ABA:
	movs r3, #0x80
	ands r3, r2
	cmp r3, #0
	bne _08002AC4
	b _08002822
_08002AC4:
	ldr r3, _08002AE4
	ldr r2, [r3]
	subs r2, #1
	cmp r1, r2
	blt _08002AD0
	b _08002822
_08002AD0:
	adds r2, r1, #1
	b _08002820
_08002AD4:
	.4byte gKeysNew
_08002AD8:
	.4byte gDbgVolume
_08002ADC:
	.4byte gDbgVolumeTable
_08002AE0:
	.4byte gDbgTestSound
_08002AE4:
	.4byte gDbgMenuItemCount

	.global dbg_putnum
	.thumb_func
	.type dbg_putnum, %function
dbg_putnum: @ 08002AE8
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0
	blt _08002B3E
_08002AF2:
	cmp r4, #1
	ble _08002B0A
	movs r1, #0xa
	adds r0, r5, #0
	bl __divsi3
	adds r1, r0, #0
	cmp r1, #0
	beq _08002B22
	subs r0, r4, #1
	bl dbg_putnum
_08002B0A:
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	lsls r3, r0, #0x18
	lsrs r0, r3, #0x18
	bl dbg_putc
	pop {r4, r5}
	pop {r0}
	bx r0
_08002B22:
	movs r1, #1
	subs r4, #2
	rsbs r0, r1, #0
	cmp r4, r0
	beq _08002B0A
_08002B2C:
	movs r0, #0x20
	bl dbg_putc
	movs r2, #1
	subs r4, #1
	rsbs r0, r2, #0
	cmp r4, r0
	bne _08002B2C
	b _08002B0A
_08002B3E:
	movs r0, #0x2d
	bl dbg_putc
	rsbs r5, r5, #0
	b _08002AF2

	.global sub_08002B48
	.thumb_func
	.type sub_08002B48, %function
sub_08002B48: @ 08002B48
	push {r4, r5, r6, r7, lr}
	bl dbg_setup_screen
	ldr r2, _08002BB0
	ldr r1, _08002BB4
	movs r5, #7
	movs r0, #1
	str r5, [r2]
	ldr r3, _08002BB8
	str r0, [r1]
	ldr r0, [r3]
	movs r5, #0
	cmp r5, r0
	bge _08002B96
	adds r7, r2, #0
	adds r6, r1, #0
_08002B68:
	adds r2, r5, #0
	ldr r3, _08002BBC
	movs r4, #3
	adds r2, #0xb
	lsls r0, r5, #2
	str r4, [r7]
	str r2, [r6]
	ldr r4, [r3, r0]
	ldrb r1, [r4]
	cmp r1, #0
	beq _08002B8C
_08002B7E:
	ldrb r0, [r4]
	adds r4, #1
	bl dbg_putc
	ldrb r1, [r4]
	cmp r1, #0
	bne _08002B7E
_08002B8C:
	ldr r2, _08002BB8
	ldr r0, [r2]
	adds r5, #1
	cmp r5, r0
	blt _08002B68
_08002B96:
	ldr r0, _08002BC0
	movs r1, #0
	str r1, [r0]
	bl dbg_draw_values
	ldr r3, _08002BC4
	ldr r1, _08002BC8
	str r3, [r1]
	bl music_stop
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08002BB0:
	.4byte gDbgCursorX
_08002BB4:
	.4byte gDbgCursorY
_08002BB8:
	.4byte gDbgMenuItemCount
_08002BBC:
	.4byte gDbgMenuItems
_08002BC0:
	.4byte gDbgMenuRow
_08002BC4:
	.4byte debug_menu_process
_08002BC8:
	.4byte gStateFunc

	.global particles_init
	.thumb_func
	.type particles_init, %function
particles_init: @ 08002BCC
	push {r4, r5, r6, lr}
	sub sp, #4
	mov r0, sp
	ldr r4, _08002C0C
	adds r0, #2
	strh r4, [r0]
	ldr r1, _08002C10
	ldr r2, _08002C14
	bl CpuSet
	ldr r1, _08002C18
	ldr r5, _08002C1C
	strh r4, [r1]
	movs r0, #0
	adds r6, r1, #0
_08002BEA:
	adds r2, r4, #0
	lsls r3, r2, #0x10
	adds r1, r2, #1
	lsrs r2, r3, #0xf
	lsls r3, r0, #3
	adds r0, #1
	adds r4, r1, #0
	strh r3, [r5, r2]
	cmp r0, #0x3f
	ble _08002BEA
	ldr r5, _08002C20
	movs r0, #0xa8
	lsls r3, r0, #2
	adds r4, r5, r3
	strh r1, [r6]
	ldr r0, [r4]
	b _08002C24
_08002C0C:
	.4byte 0x00000000
_08002C10:
	.4byte gParticles
_08002C14:
	.4byte 0x01000400
_08002C18:
	.4byte gParticleFreeCount
_08002C1C:
	.4byte gParticleFree
_08002C20:
	.4byte gUnk_08713650
_08002C24:
	ldrh r1, [r0]
	adds r4, r0, r1
	ldrh r2, [r4]
	lsls r5, r2, #4
	adds r0, r4, r5
	movs r1, #0
	ldr r5, _08002CB8
	bl _call_via_r5
	ldrh r1, [r4, #2]
	lsls r3, r1, #4
	adds r0, r4, r3
	movs r1, #4
	bl _call_via_r5
	ldrh r2, [r4, #4]
	lsls r1, r2, #4
	adds r0, r4, r1
	movs r1, #8
	bl _call_via_r5
	ldrh r3, [r4, #6]
	lsls r2, r3, #4
	adds r0, r4, r2
	movs r1, #0xc
	bl _call_via_r5
	ldrh r1, [r4, #8]
	lsls r3, r1, #4
	adds r0, r4, r3
	movs r1, #0x10
	bl _call_via_r5
	ldrh r2, [r4, #0xa]
	lsls r1, r2, #4
	adds r0, r4, r1
	movs r1, #0x14
	bl _call_via_r5
	ldrh r3, [r4, #0xc]
	lsls r2, r3, #4
	adds r0, r4, r2
	movs r1, #0x18
	bl _call_via_r5
	ldrh r1, [r4, #0xe]
	lsls r3, r1, #4
	adds r0, r4, r3
	movs r1, #0x1c
	bl _call_via_r5
	ldrh r2, [r4, #0x10]
	lsls r1, r2, #4
	adds r0, r4, r1
	movs r1, #0x20
	bl _call_via_r5
	ldrh r3, [r4, #0x12]
	lsls r2, r3, #4
	adds r0, r4, r2
	movs r1, #0x24
	bl _call_via_r5
	ldrh r1, [r4, #0x14]
	lsls r0, r1, #4
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x28
	bl _call_via_r5
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08002CB8:
	.4byte obj_tiles_upload

	.global particles_update
	.thumb_func
	.type particles_update, %function
particles_update: @ 08002CBC
	push {r4, r5, r6, r7, lr}
	ldr r2, _08002D68
	ldr r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08002D2E
	movs r5, #0
	ldr r1, _08002D6C
	ldr r7, _08002D70
	ldr r6, _08002D74
	mov ip, r5
_08002CD4:
	ldr r3, [r1, #0x18]
	cmp r3, #0
	beq _08002D26
	subs r3, #2
	str r3, [r1, #0x18]
	cmp r3, #0
	ble _08002D54
	ldr r4, [r1, #0xc]
	ldr r0, [r1]
	lsls r3, r4, #1
	adds r4, r0, r3
	str r4, [r1]
	ldr r4, [r1, #0x10]
	ldr r3, [r1, #4]
	lsls r2, r4, #1
	adds r0, r3, r2
	ldr r3, [r1, #0x14]
	lsls r2, r3, #1
	ldr r3, [r1, #8]
	adds r3, r3, r2
	str r3, [r1, #8]
	movs r2, #0x80
	ldr r3, [r1, #0x1c]
	lsls r2, r2, #3
	ands r3, r2
	str r0, [r1, #4]
	cmp r3, #0
	beq _08002D20
	adds r2, r0, #0
	subs r2, #0x20
	str r2, [r1, #4]
	adds r0, r4, #0
	ldr r2, _08002D78
	subs r0, #0x1e
	str r0, [r1, #0x10]
	cmp r0, r2
	bge _08002D20
	str r2, [r1, #0x10]
_08002D20:
	ldr r0, [r1, #4]
	cmp r0, #0
	blt _08002D34
_08002D26:
	adds r5, #1
	adds r1, #0x20
	cmp r5, #0x3f
	ble _08002CD4
_08002D2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08002D34:
	ldr r2, [r1, #0x1c]
	movs r3, #0x80
	lsls r0, r3, #4
	ands r2, r0
	cmp r2, #0
	beq _08002D4C
	ldr r0, [r1, #0x10]
	mov r3, ip
	rsbs r2, r0, #0
	str r3, [r1, #4]
	str r2, [r1, #0x10]
	b _08002D26
_08002D4C:
	ldrh r0, [r6]
	str r2, [r1, #0x18]
	lsls r2, r0, #0x10
	b _08002D5C
_08002D54:
	ldrh r0, [r6]
	mov r3, ip
	lsls r2, r0, #0x10
	str r3, [r1, #0x18]
_08002D5C:
	adds r3, r0, #1
	lsrs r0, r2, #0xf
	lsls r2, r5, #3
	strh r3, [r6]
	strh r2, [r7, r0]
	b _08002D26
_08002D68:
	.4byte gFrameCount
_08002D6C:
	.4byte gParticles
_08002D70:
	.4byte gParticleFree
_08002D74:
	.4byte gParticleFreeCount
_08002D78:
	.4byte 0xFFFFFB00

	.global sub_08002D7C
	.thumb_func
	.type sub_08002D7C, %function
sub_08002D7C: @ 08002D7C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r2, [r0, #0x28]
	ldr r1, [r0, #0x24]
	ldr r3, [r0, #0x2c]
	adds r0, #0x5c
	mov sb, r2
	ldrh r2, [r0]
	mov fp, r1
	adds r1, r2, #0
	muls r1, r2, r1
	sub sp, #0xc
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, _08002E74
	movs r0, #0x3f
	str r1, [sp]
	str r0, [sp, #8]
	mov sl, r3
	mov ip, r2
_08002DAC:
	mov r0, ip
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _08002E52
	ldr r1, [r0, #0x1c]
	movs r2, #0x80
	lsls r3, r2, #2
	ands r1, r3
	cmp r1, #0
	beq _08002E52
	ldr r2, [r0]
	mov r1, fp
	subs r7, r1, r2
	ldr r1, [r0, #4]
	mov r0, sb
	subs r4, r0, r1
	mov r3, ip
	asrs r6, r4, #8
	ldr r4, [r3, #8]
	mov r0, sl
	subs r3, r0, r4
	asrs r5, r7, #8
	adds r0, r5, #0
	muls r0, r5, r0
	asrs r7, r3, #8
	adds r3, r6, #0
	muls r3, r6, r3
	adds r6, r7, #0
	muls r6, r7, r6
	adds r5, r0, r3
	mov r3, ip
	ldr r3, [r3, #0xc]
	mov r8, r3
	add r2, r8
	mov r3, fp
	adds r0, r5, r6
	subs r6, r3, r2
	mov r2, ip
	ldr r2, [r2, #0x10]
	mov lr, r2
	add r1, lr
	mov r3, sb
	subs r2, r3, r1
	mov r1, ip
	asrs r5, r6, #8
	asrs r6, r2, #8
	ldr r2, [r1, #0x14]
	mov r3, sl
	adds r7, r4, r2
	subs r4, r3, r7
	asrs r7, r4, #8
	adds r3, r6, #0
	muls r3, r6, r3
	adds r1, r5, #0
	muls r1, r5, r1
	adds r6, r7, #0
	muls r6, r7, r6
	adds r5, r1, r3
	mov r3, r8
	adds r1, r5, r6
	asrs r5, r3, #8
	mov r3, lr
	asrs r6, r3, #8
	asrs r7, r2, #8
	adds r3, r6, #0
	muls r3, r6, r3
	adds r2, r5, #0
	muls r2, r5, r2
	adds r2, r2, r3
	adds r3, r7, #0
	muls r3, r7, r3
	adds r2, r2, r3
	adds r3, r0, r1
	subs r1, r3, r2
	ldr r2, [sp]
	cmp r1, r2
	bge _08002E52
	movs r1, #0
	mov r2, ip
	str r1, [r2, #0x18]
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
_08002E52:
	ldr r3, [sp, #8]
	movs r2, #0x20
	subs r3, #1
	add ip, r2
	str r3, [sp, #8]
	cmp r3, #0
	bge _08002DAC
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08002E74:
	.4byte gParticles

	.global particle_new
	.thumb_func
	.type particle_new, %function
particle_new: @ 08002E78
	push {lr}
	ldr r1, _08002EA0
	ldrh r2, [r1]
	adds r0, r2, #0
	cmp r0, #0
	beq _08002E9C
	ldr r0, _08002EA4
	adds r3, r2, r0
	strh r3, [r1]
	lsls r0, r3, #0x10
	ldr r2, _08002EA8
	lsrs r1, r0, #0xf
	ldrh r0, [r2, r1]
	ldr r2, _08002EAC
	lsls r1, r0, #2
	adds r0, r1, r2
_08002E98:
	pop {r1}
	bx r1
_08002E9C:
	movs r0, #0
	b _08002E98
_08002EA0:
	.4byte gParticleFreeCount
_08002EA4:
	.4byte 0x0000FFFF
_08002EA8:
	.4byte gParticleFree
_08002EAC:
	.4byte gParticles

	.global spr_init
	.thumb_func
	.type spr_init, %function
spr_init: @ 08002EB0
	push {lr}
	ldr r1, _08002EF4
	movs r0, #0x80
	movs r3, #0
	str r3, [r1]
	lsls r1, r0, #1
	ldr r0, _08002EF8
	str r1, [r0]
	ldr r1, _08002EFC
	movs r2, #0
_08002EC4:
	adds r0, r2, #1
	strb r0, [r1, r2]
	adds r2, r0, #0
	cmp r2, #0xff
	ble _08002EC4
	ldr r2, _08002F00
	movs r1, #0x84
	lsls r0, r1, #1
	adds r1, r2, r0
	movs r3, #0
	str r3, [r1]
	str r3, [r2]
	ldr r3, _08002F04
	movs r1, #0x2c
	subs r0, #4
	str r1, [r3]
	adds r3, r2, r0
	movs r0, #0x83
	lsls r0, r0, #2
	adds r2, r2, r0
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
_08002EF4:
	.4byte gSpriteFreeHead
_08002EF8:
	.4byte gSpriteFreeCount
_08002EFC:
	.4byte gSpriteNext
_08002F00:
	.4byte 0x0201A834
_08002F04:
	.4byte 0x02018EB0

	.global spr_get_info
	.thumb_func
	.type spr_get_info, %function
spr_get_info: @ 08002F08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r1, _08002F78
	ldr r3, [r1]
	adds r2, r0, #0
	sub sp, #4
	cmp r3, r2
	blt _08002F9A
	subs r0, r3, r2
	str r0, [r1]
	ldr r3, _08002F7C
	ldr r1, [r3]
	mov sl, r1
	cmp r2, #0
	ble _08002F66
	movs r1, #2
	.2byte 0x4469 @ add r1, sp, r1
	ldr r6, _08002F80
	mov r8, r1
	adds r5, r3, #0
	movs r7, #0x18
	adds r4, r2, #0
_08002F38:
	ldr r1, [r5]
	ldr r0, _08002F70
	mov r2, r8
	strh r0, [r2]
	adds r0, r1, #0
	muls r0, r7, r0
	ldr r2, _08002F84
	adds r1, r0, r6
	mov r0, r8
	bl CpuSet
	ldr r1, [r5]
	adds r2, r1, #0
	muls r2, r7, r2
	adds r0, r2, r6
	ldr r2, _08002F74
	strh r2, [r0, #0xa]
	ldr r2, _08002F88
	ldrb r0, [r2, r1]
	subs r4, #1
	str r0, [r5]
	cmp r4, #0
	bne _08002F38
_08002F66:
	ldr r0, _08002F88
	movs r3, #0xff
	strb r3, [r0, r1]
	mov r0, sl
	b _08002F8C
_08002F70:
	.4byte 0x00000000
_08002F74:
	.4byte 0x00000100
_08002F78:
	.4byte gSpriteFreeCount
_08002F7C:
	.4byte gSpriteFreeHead
_08002F80:
	.4byte gSprites
_08002F84:
	.4byte 0x0100000C
_08002F88:
	.4byte gSpriteNext
_08002F8C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08002F9A:
	ldr r0, _08002FA8
	ldr r1, _08002FAC
	bl AGBPrintf
	movs r0, #0xff
	b _08002F8C
	.byte 0x00, 0x00
_08002FA8:
	.4byte gUnk_0804FD28
_08002FAC:
	.4byte gUnk_0804FD54

	.global spr_free_chain
	.thumb_func
	.type spr_free_chain, %function
spr_free_chain: @ 08002FB0
	push {r4, r5, r6, lr}
	ldr r6, _08002FD4
	ldr r5, _08002FD8
	ldr r4, _08002FDC
	ldr r1, [r6]
_08002FBA:
	ldrb r2, [r5, r0]
	ldr r3, [r4]
	adds r1, #1
	strb r3, [r5, r0]
	str r0, [r4]
	adds r0, r2, #0
	cmp r2, #0xff
	bne _08002FBA
	str r1, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08002FD4:
	.4byte gSpriteFreeCount
_08002FD8:
	.4byte gSpriteNext
_08002FDC:
	.4byte gSpriteFreeHead

	.global spr_set_shadow_size
	.thumb_func
	.type spr_set_shadow_size, %function
spr_set_shadow_size: @ 08002FE0
	push {r4, r5, lr}
	movs r2, #0x18
	muls r2, r0, r2
	ldr r4, _08003018
	adds r1, r2, r4
	ldrh r2, [r1, #0xa]
	lsls r5, r2, #1
	adds r1, r5, r2
	asrs r5, r1, #2
_08002FF2:
	movs r2, #0x18
	adds r1, r0, #0
	muls r1, r2, r1
	adds r3, r1, r4
	ldrh r2, [r3, #6]
	movs r3, #0x80
	ands r3, r2
	cmp r3, #0
	beq _08003008
	adds r2, r1, r4
	strh r5, [r2, #0xa]
_08003008:
	ldr r1, _0800301C
	ldrb r0, [r1, r0]
	cmp r0, #0xff
	bne _08002FF2
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08003018:
	.4byte gSprites
_0800301C:
	.4byte gSpriteNext

	.global spr_hide_shadow
	.thumb_func
	.type spr_hide_shadow, %function
spr_hide_shadow: @ 08003020
	push {r4, r5, r6, r7, lr}
	cmp r0, #0xff
	beq _0800304E
	movs r3, #0x18
	ldr r4, _08003054
	ldr r5, _08003058
	mov ip, r3
	movs r7, #0x80
	movs r6, #0
_08003032:
	mov r1, ip
	muls r1, r0, r1
	adds r3, r1, r4
	ldrh r2, [r3, #6]
	adds r3, r7, #0
	ands r3, r2
	cmp r3, #0
	beq _08003048
	adds r2, r1, #0
	adds r2, #0x14
	str r6, [r4, r2]
_08003048:
	ldrb r0, [r5, r0]
	cmp r0, #0xff
	bne _08003032
_0800304E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08003054:
	.4byte gSprites
_08003058:
	.4byte gSpriteNext

	.global sub_0800305C
	.thumb_func
	.type sub_0800305C, %function
sub_0800305C: @ 0800305C
	push {lr}
	ldr r2, _08003088
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #2
	ands r0, r1
	cmp r0, #0
	beq _08003082
	ldr r2, _0800308C
_0800306E:
	movs r1, #0
	str r1, [r2]
	movs r0, #0x82
	ldr r3, _08003090
	lsls r1, r0, #1
	adds r0, r2, r1
	ldr r1, [r3]
	str r1, [r0]
	pop {r0}
	bx r0
_08003082:
	ldr r2, _08003094
	b _0800306E
	.byte 0x00, 0x00
_08003088:
	.4byte gModeFlags
_0800308C:
	.4byte 0x0201A93C
_08003090:
	.4byte 0x02018EB0
_08003094:
	.4byte 0x0201A834
