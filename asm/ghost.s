@ asm/ghost.s: ROM 0x00423C-0x004818 (rom, VMA 0x0800423C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global ghost_get_joy
	.thumb_func
	.type ghost_get_joy, %function
ghost_get_joy: @ 0800423C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r1, _080042C8
	adds r6, r0, #0
	ldr r0, [r1]
	sub sp, #4
	cmp r0, #0
	beq _080042A8
	ldr r2, _080042CC
	ldr r0, [r2]
	cmp r0, #0
	beq _080042A8
_08004254:
	ldr r3, _080042D0
	ldr r1, [r2]
	ldr r5, [r3]
	mov ip, r3
	cmp r5, r1
	beq _080042A0
	ldr r0, _080042D4
	ldr r1, _080042D8
	ldr r2, [r0]
	ldr r0, [r1]
	ldr r1, _080042DC
	eors r2, r0
	adds r0, r2, #0
	muls r0, r1, r0
	ldr r4, _080042E0
	adds r1, r5, r0
	ldrb r3, [r4, r1]
	subs r1, #1
	movs r0, #3
	ldrb r1, [r4, r1]
	adds r2, r3, #0
	ands r2, r0
	lsls r3, r3, #2
	orrs r2, r3
	adds r3, r1, #0
	ands r3, r0
	lsls r0, r1, #2
	orrs r3, r0
	strh r2, [r6]
	bics r2, r3
	strh r2, [r7]
	adds r1, r5, #1
	mov r2, ip
	str r1, [r2]
_08004298:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080042A0:
	ldr r0, _080042C4
	strh r0, [r7]
	strh r0, [r6]
	b _08004298
_080042A8:
	ldr r2, _080042E4
	ldr r0, _080042E8
	str r2, [sp]
	ldr r1, _080042EC
	ldr r2, _080042F0
	movs r3, #0x4e
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r2, _080042CC
	b _08004254
	.byte 0x00, 0x00
_080042C4:
	.4byte 0x00000000
_080042C8:
	.4byte 0x0201C570
_080042CC:
	.4byte 0x0201C580
_080042D0:
	.4byte 0x0201C578
_080042D4:
	.4byte 0x0201C584
_080042D8:
	.4byte 0x020219EC
_080042DC:
	.4byte 0x00002A30
_080042E0:
	.4byte 0x0201C58C
_080042E4:
	.4byte gUnk_0804FDF8
_080042E8:
	.4byte gUnk_0804FE18
_080042EC:
	.4byte gUnk_0804FE54
_080042F0:
	.4byte gUnk_0804FE60

	.global sub_080042F4
	.thumb_func
	.type sub_080042F4, %function
sub_080042F4: @ 080042F4
	push {r4, lr}
	ldr r0, _08004338
	movs r1, #0x80
	ldr r4, [r0]
	lsls r0, r1, #3
	ands r4, r0
	cmp r4, #0
	beq _0800430A
_08004304:
	pop {r4}
	pop {r0}
	bx r0
_0800430A:
	ldr r2, _0800433C
	ldr r0, _08004340
	movs r1, #1
	str r1, [r2]
	str r1, [r0]
	ldr r2, _08004344
	ldr r0, _08004348
	ldr r2, [r2]
	ldr r3, [r0]
	eors r3, r2
	eors r3, r1
	str r3, [r0]
	ldr r0, _0800434C
	ldr r3, _08004350
	ldr r2, [r0]
	str r2, [r3]
	ldr r2, _08004354
	str r1, [r2]
	ldr r2, _08004358
	str r1, [r0]
	str r4, [r2]
	b _08004304
	.byte 0x00, 0x00
_08004338:
	.4byte gModeFlags
_0800433C:
	.4byte 0x0201C574
_08004340:
	.4byte 0x0201C588
_08004344:
	.4byte 0x020219EC
_08004348:
	.4byte 0x0201C584
_0800434C:
	.4byte 0x0201C57C
_08004350:
	.4byte 0x0201C580
_08004354:
	.4byte 0x0201C578
_08004358:
	.4byte 0x03005660

	.global sub_0800435C
	.thumb_func
	.type sub_0800435C, %function
sub_0800435C: @ 0800435C
	ldr r0, _08004378
	movs r1, #0
	str r1, [r0]
	ldr r2, _0800437C
	ldr r0, _08004380
	str r1, [r2]
	str r1, [r0]
	ldr r2, _08004384
	ldr r0, _08004388
	str r1, [r2]
	str r1, [r0]
	ldr r0, _0800438C
	str r1, [r0]
	bx lr
_08004378:
	.4byte 0x020219EC
_0800437C:
	.4byte 0x0201C588
_08004380:
	.4byte 0x0201C57C
_08004384:
	.4byte 0x0201C584
_08004388:
	.4byte 0x0201C570
_0800438C:
	.4byte 0x0201C574
	.byte 0x01, 0x49, 0x08, 0x68, 0x70, 0x47, 0x00, 0x00, 0x88, 0xC5, 0x01, 0x02

	.global ghost_set_joy
	.thumb_func
	.type ghost_set_joy, %function
ghost_set_joy: @ 0800439C
	push {r4, r5, r6, lr}
	ldr r1, _080043E4
	lsls r2, r0, #0x10
	ldr r0, [r1]
	sub sp, #4
	asrs r5, r2, #0x10
	cmp r0, #0
	beq _08004400
_080043AC:
	ldr r6, _080043E8
	ldr r1, _080043EC
	ldr r4, [r6]
	cmp r4, r1
	beq _080043F8
	ldr r2, _080043F0
	ldr r0, [r2]
	movs r2, #1
	eors r0, r2
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r1, r5, #0x10
	adds r0, r4, r2
	ldr r2, _080043E0
	lsrs r3, r1, #0x10
	movs r1, #3
	ands r1, r3
	ands r3, r2
	lsrs r2, r3, #2
	orrs r1, r2
	ldr r2, _080043F4
	strb r1, [r2, r0]
	adds r1, r4, #1
	str r1, [r6]
	b _080043F8
	.byte 0x00, 0x00
_080043E0:
	.4byte 0xFFFFFFF3
_080043E4:
	.4byte 0x0201C574
_080043E8:
	.4byte 0x0201C57C
_080043EC:
	.4byte 0x00002A30
_080043F0:
	.4byte 0x0201C584
_080043F4:
	.4byte 0x0201C58C
_080043F8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08004400:
	ldr r0, _08004418
	ldr r1, _0800441C
	str r0, [sp]
	ldr r2, _08004420
	ldr r0, _08004424
	movs r3, #0x60
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080043AC
_08004418:
	.4byte gUnk_0804FE70
_0800441C:
	.4byte gUnk_0804FE54
_08004420:
	.4byte gUnk_0804FE7C
_08004424:
	.4byte gUnk_0804FE18

	.global sub_08004428
	.thumb_func
	.type sub_08004428, %function
sub_08004428: @ 08004428
	push {lr}
	ldr r1, _08004448
	ldr r0, [r1]
	cmp r0, #0
	beq _08004440
	ldr r2, _0800444C
	ldr r1, _08004450
	ldr r0, [r2]
	ldr r2, [r1]
	eors r0, r2
_0800443C:
	pop {r1}
	bx r1
_08004440:
	movs r3, #1
	rsbs r0, r3, #0
	b _0800443C
	.byte 0x00, 0x00
_08004448:
	.4byte 0x0201C570
_0800444C:
	.4byte 0x0201C584
_08004450:
	.4byte 0x020219EC

	.global sub_08004454
	.thumb_func
	.type sub_08004454, %function
sub_08004454: @ 08004454
	push {lr}
	ldr r1, _08004470
	ldr r0, [r1]
	cmp r0, #0
	beq _0800446A
	ldr r1, _08004474
	movs r0, #1
	str r0, [r1]
	ldr r0, _08004478
	movs r3, #0
	str r3, [r0]
_0800446A:
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08004470:
	.4byte 0x0201C588
_08004474:
	.4byte 0x0201C570
_08004478:
	.4byte 0x020219EC

	.global sub_0800447C
	.thumb_func
	.type sub_0800447C, %function
sub_0800447C: @ 0800447C
	push {lr}
	ldr r1, _08004498
	ldr r0, [r1]
	cmp r0, #0
	beq _08004492
	ldr r1, _0800449C
	ldr r0, [r1]
	movs r2, #1
	eors r0, r2
_0800448E:
	pop {r1}
	bx r1
_08004492:
	movs r3, #1
	rsbs r0, r3, #0
	b _0800448E
_08004498:
	.4byte 0x0201C574
_0800449C:
	.4byte 0x0201C584

	.global sub_080044A0
	.thumb_func
	.type sub_080044A0, %function
sub_080044A0: @ 080044A0
	ldr r1, _080044A8
	ldr r0, [r1]
	bx lr
	.byte 0x00, 0x00
_080044A8:
	.4byte 0x020219EC

	.global sub_080044AC
	.thumb_func
	.type sub_080044AC, %function
sub_080044AC: @ 080044AC
	push {lr}
	ldr r1, _080044C4
	ldr r0, [r1]
	cmp r0, #0
	beq _080044C0
	ldr r3, _080044C8
	ldr r0, _080044CC
	movs r1, #1
	str r1, [r3]
	str r1, [r0]
_080044C0:
	pop {r0}
	bx r0
_080044C4:
	.4byte 0x0201C588
_080044C8:
	.4byte 0x020219EC
_080044CC:
	.4byte 0x0201C570

	.global sub_080044D0
	.thumb_func
	.type sub_080044D0, %function
sub_080044D0: @ 080044D0
	push {r4, r5, r6, r7, lr}
	ldr r5, _0800454C
	ldr r3, [r5]
	mov ip, r1
	cmp r3, #0x20
	beq _08004548
	movs r4, #0x1c
	muls r3, r4, r3
	ldr r6, _08004550
	adds r3, r3, r6
	ldm r0!, {r1, r2, r7}
	stm r3!, {r1, r2, r7}
	ldr r2, [r5]
	muls r2, r4, r2
	adds r2, #0xc
	adds r3, r2, r6
	mov r1, ip
	ldm r1!, {r0, r2, r7}
	stm r3!, {r0, r2, r7}
	ldr r1, _08004554
	ldrh r0, [r1, #2]
	movs r7, #0x80
	subs r0, #3
	lsls r2, r0, #0x10
	lsls r1, r7, #9
	cmp r2, r1
	bhi _0800453C
	ldr r7, [r5]
	muls r7, r4, r7
	movs r3, #0x80
	adds r7, #0x18
	str r3, [r6, r7]
_08004510:
	ldr r5, _0800454C
	ldr r4, [r5]
	movs r6, #0x1c
	adds r2, r4, #0
	muls r2, r6, r2
	ldr r0, _08004550
	adds r1, r2, #0
	adds r1, #0xc
	ldrsh r7, [r0, r1]
	str r7, [r0, r1]
	adds r1, #4
	ldrsh r3, [r0, r1]
	str r3, [r0, r1]
	adds r2, #0x14
	ldrsh r3, [r0, r2]
	adds r4, #1
	str r3, [r0, r2]
	str r4, [r5]
	movs r0, #1
_08004536:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0800453C:
	ldr r0, [r5]
	muls r0, r4, r0
	movs r4, #0x10
	adds r0, #0x18
	str r4, [r6, r0]
	b _08004510
_08004548:
	movs r0, #0
	b _08004536
_0800454C:
	.4byte 0x02021D70
_08004550:
	.4byte 0x020219F0
_08004554:
	.4byte gGameSetup

	.global sub_08004558
	.thumb_func
	.type sub_08004558, %function
sub_08004558: @ 08004558
	push {r4, r5, r6, lr}
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r1, _080045C8
	movs r5, #0
	str r2, [r1]
	adds r0, #2
	cmp r5, r2
	bhs _080045B6
	ldr r4, _080045CC
	mov ip, r2
_0800456E:
	movs r6, #0x1c
	adds r1, r5, #0
	muls r1, r6, r1
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r2, r3, #8
	str r2, [r4, r1]
	movs r6, #2
	ldrsh r3, [r0, r6]
	adds r2, r1, #4
	lsls r6, r3, #8
	str r6, [r4, r2]
	movs r6, #4
	ldrsh r3, [r0, r6]
	adds r2, #4
	lsls r6, r3, #8
	str r6, [r4, r2]
	movs r6, #6
	ldrsh r3, [r0, r6]
	adds r2, #4
	str r3, [r4, r2]
	movs r6, #8
	ldrsh r3, [r0, r6]
	adds r2, #4
	str r3, [r4, r2]
	adds r2, #4
	movs r3, #0
	str r3, [r4, r2]
	movs r2, #0xa
	ldrsh r3, [r0, r2]
	adds r1, #0x18
	adds r5, #1
	str r3, [r4, r1]
	adds r0, #0xc
	cmp r5, ip
	blo _0800456E
_080045B6:
	ldr r0, _080045D0
	movs r1, #1
	str r1, [r0]
	bl sub_08004B7C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080045C8:
	.4byte 0x02021D70
_080045CC:
	.4byte 0x020219F0
_080045D0:
	.4byte 0x02021D78

	.global cam_path_print
	.thumb_func
	.type cam_path_print, %function
cam_path_print: @ 080045D4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08004650
	bl AGBPrintf
	ldr r1, _08004654
	ldr r0, [r1]
	movs r6, #0
	cmp r6, r0
	bhs _0800464A
	movs r0, #0xb4
	ldr r5, _08004658
	lsls r7, r0, #1
_080045EC:
	adds r1, r6, #0
	ldr r0, _0800465C
	bl AGBPrintf
	movs r1, #0x1c
	adds r4, r6, #0
	muls r4, r1, r4
	ldr r3, [r5, r4]
	ldr r0, _08004660
	asrs r1, r3, #8
	bl AGBPrintf
	adds r0, r4, #0
	adds r0, #8
	ldr r2, [r5, r0]
	ldr r0, _08004664
	asrs r1, r2, #8
	bl AGBPrintf
	adds r1, r4, #4
	ldr r0, [r5, r1]
	asrs r1, r0, #8
	ldr r0, _08004668
	bl AGBPrintf
	adds r2, r4, #0
	adds r2, #0xc
	ldrh r1, [r5, r2]
	adds r0, r1, #0
	muls r0, r7, r0
	adds r4, #0x10
	asrs r1, r0, #0x10
	ldr r0, _0800466C
	bl AGBPrintf
	ldrh r2, [r5, r4]
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r1, r0, #0x10
	ldr r0, _08004670
	bl AGBPrintf
	ldr r1, _08004654
	ldr r2, [r1]
	adds r6, #1
	cmp r6, r2
	blo _080045EC
_0800464A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08004650:
	.4byte gUnk_0804FE8C
_08004654:
	.4byte 0x02021D70
_08004658:
	.4byte 0x020219F0
_0800465C:
	.4byte gUnk_0804FE9C
_08004660:
	.4byte gUnk_0804FEA4
_08004664:
	.4byte gUnk_0804FEAC
_08004668:
	.4byte gUnk_0804FEB4
_0800466C:
	.4byte gUnk_0804FEBC
_08004670:
	.4byte gUnk_0804FECC

	.global sub_08004674
	.thumb_func
	.type sub_08004674, %function
sub_08004674: @ 08004674
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov sb, r1
	ldr r3, _080047F4
	ldr r1, _080047F8
	mov fp, r0
	ldr r2, [r1]
	ldr r0, [r3]
	sub sp, #0xc
	cmp r2, r0
	bne _08004694
	b _080047D0
_08004694:
	ldr r7, _080047FC
	ldr r6, _08004800
	ldr r1, [r7]
	ldr r5, [r6]
	adds r4, r5, #0
	muls r4, r1, r4
	movs r2, #0
	str r4, [sp, #8]
	mov sl, r2
_080046A6:
	ldr r3, _08004804
	mov r4, sl
	lsls r7, r4, #2
	mov r8, r3
	adds r4, r7, #0
	adds r4, #0x48
	mov r1, r8
	ldr r6, [r1, r4]
	ldr r5, [sp, #8]
	asrs r1, r6, #0x1f
	str r6, [sp]
	str r1, [sp, #4]
	movs r6, #0
	adds r3, r6, #0
	adds r2, r5, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r3, r7, #0
	adds r3, #0x30
	mov r4, r8
	ldr r2, [r4, r3]
	adds r0, r1, #0
	asrs r4, r2, #0x1f
	adds r3, r2, #0
	asrs r1, r1, #0x1f
	adds r0, r0, r3
	adcs r1, r4
	adds r3, r6, #0
	adds r2, r5, #0
	bl __muldi3
	adds r3, r7, #0
	adds r3, #0x18
	mov r4, r8
	ldr r2, [r4, r3]
	adds r0, r1, #0
	asrs r4, r2, #0x1f
	adds r3, r2, #0
	asrs r1, r1, #0x1f
	adds r0, r0, r3
	adcs r1, r4
	adds r3, r6, #0
	adds r2, r5, #0
	bl __muldi3
	adds r3, r1, #0
	asrs r4, r1, #0x1f
	str r3, [sp]
	str r4, [sp, #4]
	mov r1, r8
	ldr r0, [r1, r7]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	asrs r4, r0, #0x1f
	adds r1, r1, r3
	adcs r2, r4
	str r1, [sp]
	str r2, [sp, #4]
	lsls r5, r2, #0x1f
	ldr r2, [sp]
	ldr r0, [sp, #4]
	lsrs r4, r2, #1
	adds r3, r5, #0
	orrs r3, r4
	mov r2, sl
	asrs r4, r0, #1
	str r3, [sp]
	str r4, [sp, #4]
	cmp r2, #5
	bhi _0800475E
	ldr r2, _08004808
	ldr r5, [r7, r2]
	mov pc, r5
	.byte 0x00, 0x00
	.global _08004740
_08004740:
	.4byte _08004758
	.4byte _080047A8
	.4byte _080047B0
	.4byte _080047B8
	.4byte _080047C0
	.4byte _080047C8
	.global _08004758
_08004758:
	ldr r0, [sp]
	mov r4, fp
	str r0, [r4]
_0800475E:
	movs r2, #1
	add sl, r2
	mov r4, sl
	cmp r4, #5
	ble _080046A6
	ldr r5, _080047FC
	ldr r1, [r5]
	adds r1, #2
	str r1, [r5]
	ldr r5, _080047F8
	ldr r0, [r5]
	movs r3, #0x1c
	muls r3, r0, r3
	ldr r2, _0800480C
	adds r3, #0x18
	ldr r3, [r2, r3]
	cmp r1, r3
	beq _08004796
_08004782:
	movs r0, #1
_08004784:
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08004796:
	adds r3, r0, #1
	str r3, [r5]
	ldr r0, _080047F4
	ldr r1, [r0]
	cmp r3, r1
	bhs _08004782
	bl campan_start_seg
	b _08004782
	.global _080047A8
_080047A8:
	ldr r3, [sp]
	mov r2, fp
	str r3, [r2, #4]
	b _0800475E
	.global _080047B0
_080047B0:
	ldr r1, [sp]
	mov r4, fp
	str r1, [r4, #8]
	b _0800475E
	.global _080047B8
_080047B8:
	ldr r4, [sp]
	mov r2, sb
	str r4, [r2]
	b _0800475E
	.global _080047C0
_080047C0:
	ldr r5, [sp]
	mov r4, sb
	str r5, [r4, #4]
	b _0800475E
	.global _080047C8
_080047C8:
	ldr r0, [sp]
	mov r2, sb
	str r0, [r2, #8]
	b _0800475E
_080047D0:
	ldr r3, _08004810
	ldr r0, [r3]
	cmp r0, #0
	beq _080047EE
	cmp r2, #3
	bhi _080047E4
	ldr r0, _08004814
	bl AGBPrintf
	b _08004694
_080047E4:
	movs r2, #0
	str r2, [r1]
	bl campan_start_seg
	b _08004694
_080047EE:
	movs r0, #0
	b _08004784
	.byte 0x00, 0x00
_080047F4:
	.4byte 0x02021D70
_080047F8:
	.4byte 0x02021DDC
_080047FC:
	.4byte 0x02021DE0
_08004800:
	.4byte 0x02021DE4
_08004804:
	.4byte 0x02021D7C
_08004808:
	.4byte _08004740
_0800480C:
	.4byte 0x020219F0
_08004810:
	.4byte 0x02021D78
_08004814:
	.4byte gUnk_0804FEDC
