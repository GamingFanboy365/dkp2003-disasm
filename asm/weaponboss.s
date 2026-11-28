@ asm/weaponboss.s: ROM 0x02C45C-0x02CA98 (rom, VMA 0x0802C45C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global weaponbossInit
	.thumb_func
	.type weaponbossInit, %function
weaponbossInit: @ 0802C45C
	push {lr}
	ldr r3, _0802C4E8
	ldr r1, _0802C4EC
	movs r0, #0
	str r0, [r1]
	movs r0, #0x28
	ldrsh r2, [r3, r0]
	movs r3, #0x18
	muls r3, r2, r3
	ldr r0, _0802C4F0
	adds r3, #0x14
	ldr r2, [r0, r3]
	sub sp, #4
	cmp r2, #1
	bhi _0802C4B6
	ldr r2, _0802C4F4
	ldr r0, _0802C4F8
_0802C47E:
	str r2, [r1]
_0802C480:
	bl AGBPrintf
_0802C484:
	ldr r0, _0802C4EC
	ldr r1, [r0]
	cmp r1, #0
	beq _0802C49E
_0802C48C:
	bl sub_0802B544
	bl sub_08029E10
	bl sub_0802D108
	add sp, #4
	pop {r0}
	bx r0
_0802C49E:
	ldr r2, _0802C4FC
	ldr r0, _0802C500
	str r2, [sp]
	ldr r1, _0802C504
	ldr r2, _0802C508
	movs r3, #0xa4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C48C
_0802C4B6:
	subs r0, r2, #2
	cmp r0, #1
	bhi _0802C4C2
	ldr r2, _0802C50C
	ldr r0, _0802C510
	b _0802C47E
_0802C4C2:
	cmp r2, #6
	beq _0802C4DE
	cmp r2, #4
	beq _0802C4DE
	cmp r2, #7
	beq _0802C4D2
	cmp r2, #5
	bne _0802C484
_0802C4D2:
	ldr r2, _0802C514
	ldr r0, _0802C518
	str r2, [r1]
	bl AGBPrintf
	b _0802C484
_0802C4DE:
	ldr r0, _0802C51C
	str r0, [r1]
	ldr r0, _0802C520
	b _0802C480
	.byte 0x00, 0x00
_0802C4E8:
	.4byte gGameSetup
_0802C4EC:
	.4byte 0x0202EC48
_0802C4F0:
	.4byte gUnk_08051654
_0802C4F4:
	.4byte gUnk_0884FA7C
_0802C4F8:
	.4byte gUnk_080534A0
_0802C4FC:
	.4byte gUnk_080534D4
_0802C500:
	.4byte gUnk_080534EC
_0802C504:
	.4byte gUnk_08053528
_0802C508:
	.4byte gUnk_0805353C
_0802C50C:
	.4byte gUnk_0884FB9C
_0802C510:
	.4byte gUnk_0805354C
_0802C514:
	.4byte gUnk_0884FDDC
_0802C518:
	.4byte gUnk_08053580
_0802C51C:
	.4byte gUnk_0884FCBC
_0802C520:
	.4byte gUnk_080535B0

	.global weaponbossAllocate
	.thumb_func
	.type weaponbossAllocate, %function
weaponbossAllocate: @ 0802C524
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r3, _0802C5F4
	movs r2, #0
	ldrsh r1, [r3, r2]
	sub sp, #4
	movs r4, #0
	cmp r1, #1
	beq _0802C5DA
	movs r2, #0x85
	lsls r1, r2, #1
	adds r3, r1, r0
	mov r8, r3
	ldrh r3, [r3]
	adds r5, r0, #0
	adds r5, #0xa0
	cmp r3, #0
	beq _0802C560
	cmp r3, #0xb
	beq _0802C560
_0802C550:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802C560:
	ldr r1, [r5]
	movs r3, #8
	ands r1, r3
	cmp r1, #0
	bne _0802C550
	bl sub_0800A804
	adds r4, r0, #0
	bl multi_lfsr_next
	adds r7, r0, #0
	ldr r0, _0802C5F8
	mov lr, r0
	ldr r0, _0802C5FC
	ldr r3, [r0]
	lsls r0, r4, #2
	adds r4, r0, r3
	movs r0, #0x90
	lsls r3, r0, #1
	movs r6, #0
	movs r1, #0
	movs r2, #0
	mov sl, r4
	mov ip, r3
_0802C590:
	ldr r3, [r4]
	mov r0, lr
	muls r0, r3, r0
	adds r3, r0, #0
	asrs r0, r3, #8
	adds r1, r1, r0
	cmp r7, r1
	bge _0802C5A8
	mov r4, sl
	adds r6, r2, #0
	add r4, ip
	movs r2, #9
_0802C5A8:
	adds r2, #1
	adds r4, #0x20
	cmp r2, #8
	ble _0802C590
	ldr r4, [r5]
	movs r1, #1
	orrs r4, r1
	mov r2, r8
	str r4, [r5]
	strh r6, [r2]
	movs r4, #1
	cmp r6, #0
	bne _0802C550
	ldr r2, _0802C600
	ldr r0, _0802C604
	str r2, [sp]
	ldr r1, _0802C608
	ldr r2, _0802C60C
	movs r3, #0xe3
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C550
_0802C5DA:
	ldr r0, _0802C610
	ldr r1, _0802C608
	str r0, [sp]
	ldr r2, _0802C60C
	ldr r0, _0802C604
	movs r3, #0xc7
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C550
	.byte 0x00, 0x00
_0802C5F4:
	.4byte gGameSetup
_0802C5F8:
	.4byte 0x00028F5C
_0802C5FC:
	.4byte 0x0202EC48
_0802C600:
	.4byte gUnk_080535E0
_0802C604:
	.4byte gUnk_080534EC
_0802C608:
	.4byte gUnk_08053528
_0802C60C:
	.4byte gUnk_080535EC
_0802C610:
	.4byte gUnk_08053600

	.global weaponbossManager
	.thumb_func
	.type weaponbossManager, %function
weaponbossManager: @ 0802C614
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	bne _0802C620
	b _0802C7F2
_0802C620:
	ldrb r3, [r4, #2]
	cmp r3, #0x32
	beq _0802C642
	cmp r3, #0x35
	beq _0802C642
	ldr r0, _0802C6A0
	movs r5, #0x86
	str r0, [sp]
	ldr r1, _0802C6A4
	ldr r0, _0802C6A8
	ldr r2, _0802C6AC
	lsls r3, r5, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0802C642:
	movs r3, #0x85
	lsls r2, r3, #1
	adds r5, r4, r2
	ldrh r1, [r5]
	adds r6, r4, #0
	movs r7, #0
	adds r6, #0xa0
	cmp r1, #0
	bne _0802C656
	b _0802C7B0
_0802C656:
	ldr r0, [r6]
	ldr r1, _0802C6B0
	ands r0, r1
	cmp r0, #2
	beq _0802C6B4
_0802C660:
	adds r0, r4, #0
	adds r0, #0xfc
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldrh r2, [r0]
	cmp r3, #0
	beq _0802C678
	subs r1, r2, #2
	lsls r2, r1, #0x10
	strh r1, [r0]
	cmp r2, #0
	ble _0802C68C
_0802C678:
	ldr r0, [r6]
	movs r1, #3
	rsbs r3, r1, #0
	ands r0, r3
	str r0, [r6]
	add sp, #4
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802C68C:
	ldr r2, _0802C69C
	strh r2, [r0]
	movs r1, #5
	ldr r0, [r6]
	rsbs r3, r1, #0
	ands r0, r3
	str r0, [r6]
	b _0802C678
_0802C69C:
	.4byte 0x00000000
_0802C6A0:
	.4byte gUnk_08053604
_0802C6A4:
	.4byte gUnk_08053528
_0802C6A8:
	.4byte gUnk_080534EC
_0802C6AC:
	.4byte gUnk_08053648
_0802C6B0:
	.4byte 0x0000219E
_0802C6B4:
	ldrh r3, [r5]
	subs r3, #1
	cmp r3, #0xa
	bhi _0802C6FC
	ldr r2, _0802C728
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.global _0802C6C4
_0802C6C4:
	.4byte _0802C6F0
	.4byte _0802C712
	.4byte _0802C72C
	.4byte _0802C738
	.4byte _0802C746
	.4byte _0802C754
	.4byte _0802C76C
	.4byte _0802C6FC
	.4byte _0802C782
	.4byte _0802C78E
	.4byte _0802C7A8
	.global _0802C6F0
_0802C6F0:
	adds r0, r4, #0
	bl sub_0802AE80
_0802C6F6:
	ldr r2, _0802C71C
_0802C6F8:
	movs r7, #1
	strh r2, [r5]
	.global _0802C6FC
_0802C6FC:
	cmp r7, #0
	beq _0802C678
	ldr r0, [r6]
	movs r3, #5
	orrs r0, r3
	str r0, [r6]
	ldr r1, _0802C720
	adds r0, r4, #0
	adds r0, #0xfc
	strh r1, [r0]
	b _0802C678
	.global _0802C712
_0802C712:
	adds r0, r4, #0
	bl sub_0802AE80
	ldr r0, _0802C724
	b _0802C74E
_0802C71C:
	.4byte 0x00000000
_0802C720:
	.4byte 0x0000000F
_0802C724:
	.4byte 0x00000009
_0802C728:
	.4byte _0802C6C4
	.global _0802C72C
_0802C72C:
	adds r0, r4, #0
	bl sub_08028F20
	cmp r0, #0
	beq _0802C6FC
	b _0802C772
	.global _0802C738
_0802C738:
	adds r0, r4, #0
	bl sub_08028F20
	cmp r0, #0
	beq _0802C6FC
	ldr r2, _0802C764
	b _0802C6F8
	.global _0802C746
_0802C746:
	adds r0, r4, #0
	bl sub_0802B5B0
	ldr r0, _0802C768
_0802C74E:
	movs r7, #1
	strh r0, [r5]
	b _0802C6FC
	.global _0802C754
_0802C754:
	ldrb r7, [r4, #2]
	cmp r7, #0x32
	bne _0802C772
	adds r0, r4, #0
	bl sub_08025C88
	b _0802C772
	.byte 0x00, 0x00
_0802C764:
	.4byte 0x0000000A
_0802C768:
	.4byte 0x00000000
	.global _0802C76C
_0802C76C:
	ldrb r0, [r4, #2]
	cmp r0, #0x32
	beq _0802C77A
_0802C772:
	ldr r1, _0802C7A0
	movs r7, #1
	strh r1, [r5]
	b _0802C6FC
_0802C77A:
	adds r0, r4, #0
	bl sub_0802BCC0
	b _0802C772
	.global _0802C782
_0802C782:
	adds r0, r4, #0
	bl sub_0802AE80
	movs r7, #1
	strh r7, [r5]
	b _0802C6FC
	.global _0802C78E
_0802C78E:
	adds r0, r4, #0
	bl sub_08028F20
	cmp r0, #0
	beq _0802C6FC
	ldr r2, _0802C7A4
	strh r2, [r5]
	movs r7, #1
	b _0802C6FC
_0802C7A0:
	.4byte 0x00000000
_0802C7A4:
	.4byte 0x00000003
	.global _0802C7A8
_0802C7A8:
	adds r0, r4, #0
	bl sub_0802C828
	b _0802C6F6
_0802C7B0:
	ldr r1, [r6]
	ldr r0, _0802C810
	ands r1, r0
	cmp r1, #2
	beq _0802C7BC
	b _0802C660
_0802C7BC:
	movs r5, #0x81
	lsls r3, r5, #1
	adds r5, r4, r3
	movs r1, #0
	ldrsh r2, [r5, r1]
	cmp r2, #0
	bgt _0802C7CC
	b _0802C660
_0802C7CC:
	adds r0, r4, #0
	bl sub_08028250
	cmp r0, #0
	bne _0802C7D8
	b _0802C678
_0802C7D8:
	ldr r1, [r6]
	movs r3, #4
	orrs r1, r3
	str r1, [r6]
	ldrh r2, [r5]
	adds r1, r4, #0
	ldr r0, _0802C80C
	subs r2, #1
	adds r1, #0xfc
	movs r7, #1
	strh r2, [r5]
	strh r0, [r1]
	b _0802C678
_0802C7F2:
	ldr r0, _0802C814
	ldr r1, _0802C818
	str r0, [sp]
	ldr r2, _0802C81C
	ldr r0, _0802C820
	ldr r3, _0802C824
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C620
	.byte 0x00, 0x00
_0802C80C:
	.4byte 0x0000000A
_0802C810:
	.4byte 0x0000219E
_0802C814:
	.4byte gUnk_0805365C
_0802C818:
	.4byte gUnk_08053528
_0802C81C:
	.4byte gUnk_08053648
_0802C820:
	.4byte gUnk_080534EC
_0802C824:
	.4byte 0x0000010B

	.global sub_0802C828
	.thumb_func
	.type sub_0802C828, %function
sub_0802C828: @ 0802C828
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r2, _0802C93C
	ldr r1, [r2]
	mov fp, r0
	cmp r1, #0x13
	bgt _0802C92A
	movs r0, #0x38
	bl sub_08001F58
	adds r7, r0, #0
	cmp r7, #0
	beq _0802C92A
	mov r3, fp
	adds r3, #0x56
	movs r1, #0
	ldrsh r6, [r3, r1]
	ldr r2, _0802C940
	adds r0, r6, #0
	mov sl, r2
	bl _call_via_r10
	ldr r3, _0802C944
	adds r1, r0, #0
	lsls r0, r1, #0x10
	mov sb, r3
	asrs r4, r0, #0x10
	adds r0, r6, #0
	bl _call_via_r9
	movs r6, #0xfa
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	lsls r1, r6, #2
	adds r5, r3, #0
	muls r5, r1, r5
	adds r0, r4, #0
	muls r0, r1, r0
	mov r4, fp
	asrs r6, r5, #0xc
	ldr r5, [r4, #0x24]
	ldr r3, [r4, #0x2c]
	asrs r1, r0, #0xc
	subs r0, r5, r6
	ldr r6, [r4, #0x28]
	subs r5, r3, r1
	str r0, [r7, #0x24]
	str r6, [r7, #0x28]
	str r5, [r7, #0x2c]
	mov r5, fp
	adds r5, #0xa0
	ldr r4, [r5, #4]
	ldr r0, _0802C948
	lsls r6, r4, #1
	adds r6, #4
	mov r8, r0
	ldrsh r0, [r0, r6]
	bl sub_080040EC
	adds r4, r0, #0
	ldr r1, [r4, #0x70]
	adds r6, r7, #0
	adds r6, #0xa0
	str r1, [r6]
	adds r0, r7, #0
	movs r1, #0
	bl obj_initialise
	adds r0, r7, #0
	adds r0, #0x90
	mov r2, fp
	str r2, [r0]
	ldr r2, [r5, #4]
	str r2, [r6, #0xc]
	ldr r3, [r4, #0x70]
	mov r0, r8
	lsls r4, r3, #1
	adds r1, r4, r3
	movs r4, #0x14
	ldrsh r2, [r0, r4]
	adds r0, r1, r2
	ldr r1, _0802C94C
	lsls r4, r0, #2
	ldr r0, [r1, r4]
	adds r5, #0x58
	lsls r4, r0, #1
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl _call_via_r9
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	adds r2, r4, #0
	muls r2, r1, r2
	asrs r0, r2, #0xc
	str r0, [r6, #0x54]
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl _call_via_r10
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	adds r2, r4, #0
	muls r2, r1, r2
	asrs r0, r2, #0xc
	str r0, [r6, #0x58]
	movs r3, #0
	ldrsh r0, [r5, r3]
	bl _call_via_r10
	lsls r3, r0, #0x10
	asrs r4, r3, #0x10
	str r4, [r6, #0x5c]
	movs r4, #0
	ldrsh r0, [r5, r4]
	bl _call_via_r9
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	rsbs r3, r2, #0
	str r3, [r6, #0x60]
	ldr r1, _0802C93C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0802C92A:
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0802C93C:
	.4byte 0x0202EC54
_0802C940:
	.4byte sub_03000134
_0802C944:
	.4byte sub_03000138
_0802C948:
	.4byte gGameSetup
_0802C94C:
	.4byte gUnk_0885003C

	.global sub_0802C950
	.thumb_func
	.type sub_0802C950, %function
sub_0802C950: @ 0802C950
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0xa0
	ldr r4, [r1]
	cmp r4, #2
	beq _0802C9B2
	cmp r4, #4
	beq _0802C9B2
	cmp r4, #1
	beq _0802C9B2
	cmp r4, #6
	beq _0802C986
	ldr r2, _0802C9BC
	ldr r0, [r2]
	ldr r2, _0802C9C0
	lsls r1, r0, #2
	ldr r3, _0802C9C4
	ldr r0, [r2, r1]
	lsls r1, r4, #2
	ldr r2, [r3, r1]
	adds r1, r5, #0
	bl sub_08020130
_0802C980:
	pop {r4, r5}
	pop {r1}
	bx r1
_0802C986:
	ldr r3, [r1, #0x64]
	cmp r3, #0x3f
	bgt _0802C998
	adds r3, #2
	str r3, [r1, #0x64]
	cmp r3, #0x40
	ble _0802C998
	movs r2, #0x40
	str r2, [r1, #0x64]
_0802C998:
	ldr r2, [r1, #0x64]
	adds r0, r2, #0
	muls r0, r2, r0
	ldr r2, [r1]
	adds r3, r0, #0
	asrs r0, r3, #6
	lsls r1, r2, #2
	lsls r2, r0, #0x11
	ldr r0, _0802C9C4
	asrs r3, r2, #6
	ldr r2, [r0, r1]
	adds r0, r2, r3
	b _0802C980
_0802C9B2:
	ldr r0, [r1]
	ldr r2, _0802C9C4
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	b _0802C980
_0802C9BC:
	.4byte gLocalPlayerIndex
_0802C9C0:
	.4byte gRacerObjects
_0802C9C4:
	.4byte gUnk_0884FF9C

	.global sub_0802C9C8
	.thumb_func
	.type sub_0802C9C8, %function
sub_0802C9C8: @ 0802C9C8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	movs r3, #0xa0
	adds r0, r3, r7
	ldr r5, [r0]
	movs r2, #2
	str r2, [r0, #4]
	lsls r4, r5, #2
	adds r5, r7, #0
	adds r5, #0x5a
	adds r6, r1, #0
	ldr r1, _0802CA8C
	mov sb, r0
	ldrh r0, [r5]
	ldr r2, [r1, r4]
	movs r4, #0x18
	muls r0, r4, r0
	mov sl, r2
	ldr r2, _0802CA90
	mov fp, r2
	add r0, fp
	ldrh r3, [r0, #0xa]
	adds r0, r7, #0
	mov r8, r3
	bl obj_destroy_sprite
	mov r1, sl
	movs r2, #0x23
	adds r0, r7, #0
	bl obj_setup_sprite
	ldrh r1, [r5]
	muls r1, r4, r1
	mov r2, r8
	add r1, fp
	strh r2, [r1, #0xa]
	cmp r6, #0
	beq _0802CA2A
	ldr r2, [r6, #0x3c]
	str r2, [r7, #0x3c]
	ldr r1, [r6, #0x40]
	str r1, [r7, #0x40]
	ldr r0, [r6, #0x44]
	str r0, [r7, #0x44]
_0802CA2A:
	mov r2, sb
	ldr r0, [r2]
	cmp r0, #2
	beq _0802CA64
_0802CA32:
	adds r0, r7, #0
	bl obj_remove_vector_hit
	ldr r1, _0802CA94
	mov r0, sb
	ldr r2, [r1]
	ldr r3, [r0, #0x40]
	cmp r2, r3
	beq _0802CA54
_0802CA44:
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802CA54:
	movs r2, #1
	rsbs r0, r2, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xec
	bl gamesfx_stop
	b _0802CA44
_0802CA64:
	movs r0, #0x31
	bl sub_08001F58
	ldr r2, [r7, #0x24]
	str r2, [r0, #0x24]
	ldr r1, [r7, #0x28]
	subs r1, #0x64
	str r1, [r0, #0x28]
	ldr r2, [r7, #0x2c]
	str r2, [r0, #0x2c]
	ldr r1, [r7, #0x3c]
	str r1, [r0, #0x3c]
	ldr r2, [r7, #0x40]
	str r2, [r0, #0x40]
	ldr r1, [r7, #0x44]
	str r1, [r0, #0x44]
	movs r1, #0
	bl obj_initialise
	b _0802CA32
_0802CA8C:
	.4byte gUnk_0884FF1C
_0802CA90:
	.4byte 0x02018F34
_0802CA94:
	.4byte 0x0202EC50
