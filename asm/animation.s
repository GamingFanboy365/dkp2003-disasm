@ asm/animation.s: ROM 0x003098-0x00423C (rom, VMA 0x08003098)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global anim_get
	.thumb_func
	.type anim_get, %function
anim_get: @ 08003098
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r7, r1, #0
	mov ip, r2
	cmp r2, #0
	beq _08003174
	cmp r7, #0
	beq _08003174
	ldr r5, _08003138
	adds r0, r5, #0
	adds r1, r5, #0
	movs r4, #1
	adds r0, #0x20
	adds r1, #0x3c
	movs r6, #0x3c
_080030BC:
	ldr r2, [r1]
	adds r1, #0x20
	cmp r2, #0
	beq _080030CA
	ldr r3, [r0, #4]
	cmp r3, r7
	beq _08003158
_080030CA:
	adds r4, #1
	adds r0, #0x20
	adds r6, #0x20
	cmp r4, #0x7f
	ble _080030BC
	ldr r0, [r5, #0x3c]
	movs r4, #1
	cmp r0, #0
	beq _080030EA
	adds r2, r5, #0
	adds r2, #0x3c
_080030E0:
	adds r2, #0x20
	ldr r0, [r2]
	adds r4, #1
	cmp r0, #0
	bne _080030E0
_080030EA:
	cmp r4, #0x7f
	bgt _08003140
	lsls r0, r4, #5
	adds r1, r0, #4
	mov r3, ip
	adds r2, r0, #0
	str r7, [r5, r1]
	adds r2, #8
	str r3, [r5, r0]
	movs r3, #0
	str r3, [r5, r2]
	adds r2, #4
	str r3, [r5, r2]
	adds r2, #4
	str r3, [r5, r2]
	adds r2, #4
	str r3, [r5, r2]
	adds r2, #4
	str r3, [r5, r2]
	adds r0, #0x1c
	movs r1, #1
	movs r2, #0x18
	str r1, [r5, r0]
	mov r1, r8
	muls r1, r2, r1
	ldr r0, _08003134
	ldr r2, _0800313C
	adds r1, #8
	orrs r4, r0
	strh r4, [r2, r1]
_08003126:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08003134:
	.4byte 0xFFFF8000
_08003138:
	.4byte 0x0201AA4C
_0800313C:
	.4byte 0x02018F34
_08003140:
	ldr r2, _08003190
	ldr r0, _08003194
	str r2, [sp]
	ldr r1, _08003198
	ldr r2, _0800319C
	movs r3, #0x39
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08003174
_08003158:
	ldr r3, [r0]
	cmp r3, ip
	bne _080030CA
	adds r1, r2, #1
	movs r0, #0x18
	str r1, [r5, r6]
	mov r1, r8
	muls r1, r0, r1
	ldr r2, _08003188
	ldr r0, _080031A0
	adds r1, #8
	orrs r4, r2
	strh r4, [r0, r1]
	b _08003126
_08003174:
	movs r0, #0x18
	mov r1, r8
	muls r1, r0, r1
	ldr r2, _0800318C
	adds r0, r1, #0
	ldr r3, _080031A0
	adds r0, #8
	strh r2, [r3, r0]
	b _08003126
	.byte 0x00, 0x00
_08003188:
	.4byte 0xFFFF8000
_0800318C:
	.4byte 0x00000000
_08003190:
	.4byte gUnk_0804FD64
_08003194:
	.4byte gUnk_0804FD6C
_08003198:
	.4byte gUnk_0804FDA8
_0800319C:
	.4byte gUnk_0804FDB8
_080031A0:
	.4byte 0x02018F34

	.global sub_080031A4
	.thumb_func
	.type sub_080031A4, %function
sub_080031A4: @ 080031A4
	push {r4, r5, r6, lr}
	ldr r2, _08003278
	ldr r0, [r2]
	movs r1, #5
	ands r0, r1
	cmp r0, #0
	beq _080031D4
	ldr r0, _0800327C
	movs r6, #1
_080031B6:
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _080031CC
	ldr r4, [r0]
	cmp r4, #0
	beq _080031CC
	ldr r3, [r0, #0xc]
	cmp r3, #0
	beq _080031DA
_080031C8:
	subs r3, #1
	str r3, [r0, #0xc]
_080031CC:
	adds r6, #1
	adds r0, #0x20
	cmp r6, #0x7f
	ble _080031B6
_080031D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_080031DA:
	ldr r3, [r0, #0x10]
	ldrb r5, [r4, r3]
	adds r3, #1
	str r3, [r0, #0x10]
	cmp r5, #0xff
	beq _08003208
	str r5, [r0, #8]
_080031E8:
	cmp r5, #0xff
	beq _080031DA
	ldr r2, _08003280
	ldr r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #7
	ands r1, r2
	cmp r1, #0
	beq _08003202
	ldr r1, [r0, #0x14]
	asrs r3, r1, #1
	str r3, [r0, #0xc]
	b _080031C8
_08003202:
	ldr r3, [r0, #0x14]
	str r3, [r0, #0xc]
	b _080031C8
_08003208:
	ldrb r2, [r4, r3]
	adds r3, #1
	str r3, [r0, #0x10]
	cmp r2, #4
	bhi _080031E8
	lsls r3, r2, #2
	ldr r2, _08003284
	ldr r1, [r3, r2]
	mov pc, r1
	.byte 0x00, 0x00
	.global _0800321C
_0800321C:
	.4byte _08003230
	.4byte _08003246
	.4byte _08003252
	.4byte _08003262
	.4byte _0800326C
	.global _08003230
_08003230:
	ldr r1, [r0, #0x10]
	adds r3, r4, r1
	ldrb r3, [r3, #1]
	ldrb r2, [r4, r1]
	lsls r3, r3, #8
	orrs r2, r3
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	adds r3, r1, r2
	str r3, [r0, #0x10]
	b _080031E8
	.global _08003246
_08003246:
	ldr r1, [r0, #0x10]
	ldrb r2, [r4, r1]
	adds r1, #1
	str r2, [r0, #0x14]
	str r1, [r0, #0x10]
	b _080031E8
	.global _08003252
_08003252:
	ldr r5, [r0, #0x18]
	movs r3, #2
	orrs r5, r3
	movs r1, #0
	str r5, [r0, #0x18]
	movs r5, #0
	str r1, [r0]
	b _080031E8
	.global _08003262
_08003262:
	ldr r1, [r0, #0x18]
	movs r3, #1
	orrs r1, r3
	str r1, [r0, #0x18]
	b _080031E8
	.global _0800326C
_0800326C:
	ldr r1, [r0, #0x18]
	movs r2, #2
	rsbs r3, r2, #0
	ands r1, r3
	str r1, [r0, #0x18]
	b _080031E8
_08003278:
	.4byte gFrameCount
_0800327C:
	.4byte 0x0201AA4C
_08003280:
	.4byte gModeFlags
_08003284:
	.4byte _0800321C

	.global sub_08003288
	.thumb_func
	.type sub_08003288, %function
sub_08003288: @ 08003288
	sub sp, #4
	mov r1, sp
	ldr r0, _080032A4
	adds r1, #2
	strh r0, [r1]
	ldr r0, _080032A8
	ldr r2, _080032AC
	str r1, [r0]
	ldr r1, _080032B0
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	add sp, #4
	b _080032B4
_080032A4:
	.4byte 0x00000000
_080032A8:
	.4byte 0x040000D4
_080032AC:
	.4byte 0x0201AA4C
_080032B0:
	.4byte 0x81000800
_080032B4:
	bx lr
	.byte 0x00, 0x00

	.global sub_080032B8
	.thumb_func
	.type sub_080032B8, %function
sub_080032B8: @ 080032B8
	push {r4, lr}
	movs r1, #0x18
	muls r1, r0, r1
	ldr r4, _080032F0
	adds r0, r1, #0
	adds r0, #8
	ldrh r2, [r4, r0]
	movs r3, #0x80
	lsls r1, r3, #8
	ands r1, r2
	cmp r1, #0
	beq _080032E0
	ldr r1, _080032F4
	ands r1, r2
	lsls r3, r1, #5
	ldr r1, _080032F8
	adds r3, #0x1c
	ldr r2, [r1, r3]
	subs r2, #1
	str r2, [r1, r3]
_080032E0:
	ldr r2, _080032EC
	strh r2, [r4, r0]
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080032EC:
	.4byte 0x00000000
_080032F0:
	.4byte 0x02018F34
_080032F4:
	.4byte 0x00007FFF
_080032F8:
	.4byte 0x0201AA4C

	.global sub_080032FC
	.thumb_func
	.type sub_080032FC, %function
sub_080032FC: @ 080032FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	cmp r2, #0
	beq _0800331E
	ldrh r3, [r2, #0xe]
	cmp r3, #0
	beq _0800331E
	movs r4, #6
	ldrsh r3, [r2, r4]
	cmp r0, r3
	blt _0800331E
	movs r4, #8
	ldrsh r3, [r2, r4]
	cmp r3, r0
	bge _0800332C
_0800331E:
	movs r0, #0
_08003320:
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0800332C:
	movs r4, #0xa
	ldrsh r3, [r2, r4]
	cmp r1, r3
	blt _0800331E
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	cmp r3, r1
	blt _0800331E
	movs r4, #4
	ldrsh r6, [r2, r4]
	movs r4, #2
	ldrsh r7, [r2, r4]
	movs r3, #0
	subs r4, r6, r1
	movs r1, #0x18
	subs r0, r7, r0
	mov lr, r3
	adds r7, r4, #0
	adds r3, r1, r2
	ldrh r2, [r2, #0xe]
	mvns r4, r7
	lsrs r1, r4, #0x1f
	mov r8, r2
	movs r4, #0
	adds r6, r0, #0
	mov ip, r3
	mov sl, r4
	cmp lr, r8
	bge _080033AA
_08003366:
	mov r4, ip
	movs r3, #2
	ldrsh r5, [r4, r3]
	subs r7, r7, r5
	movs r3, #0
	ldrsh r2, [r4, r3]
	mvns r3, r7
	lsrs r4, r3, #0x1f
	subs r6, r6, r2
	cmp r1, r4
	beq _0800339A
	mvns r1, r0
	mvns r3, r6
	lsrs r0, r1, #0x1f
	lsrs r1, r3, #0x1f
	cmp r0, r1
	beq _080033AE
	muls r2, r7, r2
	adds r0, r5, #0
	muls r0, r6, r0
	movs r1, #0
	cmp r2, r0
	blt _08003396
	movs r1, #1
_08003396:
	cmp r1, r4
	beq _080033B2
_0800339A:
	adds r1, r4, #0
	movs r4, #1
	movs r2, #4
	add sl, r4
	adds r0, r6, #0
	add ip, r2
	cmp sl, r8
	blt _08003366
_080033AA:
	mov r0, lr
	b _08003320
_080033AE:
	cmp r0, #0
	beq _0800339A
_080033B2:
	mov r2, lr
	movs r3, #0
	cmp r2, #0
	beq _080033BE
_080033BA:
	mov lr, r3
	b _0800339A
_080033BE:
	movs r3, #1
	b _080033BA
	.byte 0x00, 0x00

	.global sub_080033C4
	.thumb_func
	.type sub_080033C4, %function
sub_080033C4: @ 080033C4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #8
	ldr r7, _08003470
	str r1, [sp, #4]
	adds r7, #0x86
	movs r4, #0
	ldrsh r2, [r7, r4]
	movs r4, #0x94
	muls r2, r4, r2
	ldr r1, _08003474
	adds r7, r2, #0
	adds r7, #0x90
	adds r2, #0x40
	ldrh r4, [r1, r7]
	ldr r2, [r1, r2]
	adds r3, r7, r1
	mov r8, r4
	ldrh r7, [r3, #2]
	cmp r2, #0
	beq _08003468
	ldr r6, [r0, #0x24]
	asrs r5, r6, #8
	str r5, [sp]
	ldr r1, [r0, #0x2c]
	asrs r3, r1, #8
	mov fp, r3
	ldr r6, [r2]
	ldr r3, [r0, #0x64]
	ldr r0, [r0, #0x68]
	adds r4, r2, #0
	movs r5, #0
	mov sb, r3
	mov sl, r0
	adds r4, #0x14
	cmp r5, r6
	bge _08003450
_08003416:
	ldr r0, [r4, #0x10]
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08003440
	ldr r1, [r4, #0x14]
	mov r2, sl
	ands r1, r2
	cmp r1, #0
	beq _08003440
	ldr r0, [sp]
	mov r1, fp
	adds r2, r4, #0
	bl sub_080032FC
	cmp r0, #0
	beq _08003440
	ldrb r3, [r4]
	ldrb r7, [r4, #1]
	mov r8, r3
	adds r5, r6, #0
_08003440:
	ldrh r1, [r4, #0xe]
	lsls r0, r1, #2
	adds r2, r4, r0
	adds r4, r2, #0
	adds r5, #1
	adds r4, #0x18
	cmp r5, r6
	blt _08003416
_08003450:
	ldr r4, [sp, #4]
	str r7, [r4]
_08003454:
	mov r0, r8
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08003468:
	ldr r0, [sp, #4]
	str r7, [r0]
	b _08003454
	.byte 0x00, 0x00
_08003470:
	.4byte gGameSetup
_08003474:
	.4byte gUnk_087146C0

	.global fade_update
	.thumb_func
	.type fade_update, %function
fade_update: @ 08003478
	push {lr}
	ldr r0, _08003538
	ldr r1, [r0]
	cmp r1, #0
	beq _080034BC
	ldr r2, _0800353C
	ldr r3, [r2]
	movs r2, #0x80
	lsls r2, r2, #7
	ands r3, r2
	ldr r0, _08003540
	cmp r3, #0
	beq _08003532
	lsls r2, r1, #1
	ldr r1, [r0]
	adds r2, r1, r2
_08003498:
	str r2, [r0]
	ldr r0, _08003544
	ldr r2, [r0]
	cmp r2, #1
	beq _080034F6
	cmp r2, #1
	bgt _080034D0
	cmp r2, #0
	beq _080034C0
_080034AA:
	ldr r0, _08003540
_080034AC:
	ldr r1, [r0]
	ldr r0, _08003548
	asrs r2, r1, #8
	str r2, [r0]
	movs r3, #1
	ldr r0, _0800354C
	rsbs r1, r3, #0
	str r1, [r0]
_080034BC:
	pop {r0}
	bx r0
_080034C0:
	ldr r0, _08003540
	ldr r1, [r0]
	cmp r1, #0
	bge _080034AC
	ldr r1, _08003538
	str r2, [r0]
	str r2, [r1]
	b _080034E8
_080034D0:
	cmp r2, #2
	bne _080034AA
	ldr r0, _08003540
_080034D6:
	movs r3, #0x80
	ldr r1, [r0]
	lsls r2, r3, #6
	cmp r1, r2
	ble _080034AC
	ldr r1, _08003538
	movs r3, #0
	str r2, [r0]
	str r3, [r1]
_080034E8:
	ldr r1, _0800353C
	movs r2, #0x80
	ldr r3, [r1]
	lsls r2, r2, #4
	orrs r3, r2
	str r3, [r1]
	b _080034AC
_080034F6:
	ldr r1, _08003538
	ldr r2, [r1]
	cmp r2, #0
	ble _08003512
	ldr r0, _08003540
	movs r2, #0x80
	ldr r3, [r0]
	lsls r2, r2, #5
	cmp r3, r2
	blt _080034D6
	adds r3, r2, #0
	movs r2, #0
	str r3, [r0]
	b _08003522
_08003512:
	ldr r0, _08003540
	movs r2, #0x80
	ldr r3, [r0]
	lsls r2, r2, #5
	cmp r3, r2
	bgt _080034D6
	str r2, [r0]
	movs r2, #0
_08003522:
	str r2, [r1]
	ldr r1, _0800353C
	movs r2, #0x80
	ldr r3, [r1]
	lsls r2, r2, #4
	orrs r3, r2
	str r3, [r1]
	b _080034D6
_08003532:
	ldr r3, [r0]
	adds r2, r3, r1
	b _08003498
_08003538:
	.4byte gFadeStep
_0800353C:
	.4byte gModeFlags
_08003540:
	.4byte gFadeLevel
_08003544:
	.4byte gFadeMode
_08003548:
	.4byte gBrightness
_0800354C:
	.4byte gPalDirty

	.global pal_init
	.thumb_func
	.type pal_init, %function
pal_init: @ 08003550
	push {lr}
	movs r3, #1
	ldr r1, _08003584
	rsbs r0, r3, #0
	sub sp, #4
	str r0, [r1]
	ldr r2, _08003580
	mov r0, sp
	adds r0, #2
	strh r2, [r0]
	ldr r1, _08003588
	ldr r2, _0800358C
	bl CpuSet
	ldr r0, _08003590
	movs r3, #0x10
	str r3, [r0]
	ldr r0, _08003594
	movs r1, #0
	str r1, [r0, #0x50]
	str r1, [r0]
	add sp, #4
	b _08003598
	.byte 0x00, 0x00
_08003580:
	.4byte 0x00000000
_08003584:
	.4byte gPalDirty
_08003588:
	.4byte gPalBuffer
_0800358C:
	.4byte 0x01000100
_08003590:
	.4byte gBrightness
_08003594:
	.4byte 0x0201BA4C
_08003598:
	pop {r0}
	bx r0

	.global sub_0800359C
	.thumb_func
	.type sub_0800359C, %function
sub_0800359C: @ 0800359C
	push {lr}
	ldr r2, _080035BC
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #2
	ands r0, r1
	cmp r0, #0
	beq _080035B8
	ldr r2, _080035C0
_080035AE:
	movs r0, #0
	str r0, [r2]
	str r0, [r2, #0x48]
	pop {r0}
	bx r0
_080035B8:
	ldr r2, _080035C4
	b _080035AE
_080035BC:
	.4byte gModeFlags
_080035C0:
	.4byte 0x0201BA9C
_080035C4:
	.4byte 0x0201BA4C

	.global pal_load
	.thumb_func
	.type pal_load, %function
pal_load: @ 080035C8
	ldr r1, _080035E4
	ldr r2, _080035E8
	str r0, [r1]
	ldr r0, _080035EC
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r0, _080035F0
	ldr r3, [r1, #8]
	ldr r1, [r0]
	ldr r3, _080035F4
	orrs r1, r3
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_080035E4:
	.4byte 0x040000D4
_080035E8:
	.4byte gPalBuffer
_080035EC:
	.4byte 0x80000100
_080035F0:
	.4byte gPalDirty
_080035F4:
	.4byte 0x0000FFFF

	.global fade_to_black
	.thumb_func
	.type fade_to_black, %function
fade_to_black: @ 080035F8
	ldr r0, _0800361C
	ldr r1, [r0]
	ldr r0, _08003620
	lsls r2, r1, #8
	str r2, [r0]
	ldr r0, _08003624
	ldr r3, _08003628
	ldr r1, [r0]
	ands r1, r3
	str r1, [r0]
	ldr r0, _0800362C
	movs r1, #0x80
	rsbs r3, r1, #0
	str r3, [r0]
	ldr r0, _08003630
	movs r1, #0
	str r1, [r0]
	bx lr
_0800361C:
	.4byte gBrightness
_08003620:
	.4byte gFadeLevel
_08003624:
	.4byte gModeFlags
_08003628:
	.4byte 0xFFFFF7FF
_0800362C:
	.4byte gFadeStep
_08003630:
	.4byte gFadeMode

	.global fade_to_normal
	.thumb_func
	.type fade_to_normal, %function
fade_to_normal: @ 08003634
	push {lr}
	ldr r1, _08003668
	ldr r2, [r1]
	ldr r0, _0800366C
	lsls r1, r2, #8
	str r1, [r0]
	ldr r0, _08003670
	ldr r2, _08003674
	ldr r3, [r0]
	ands r3, r2
	movs r2, #0x80
	str r3, [r0]
	lsls r0, r2, #5
	cmp r1, r0
	ble _08003664
	movs r3, #0x80
	rsbs r2, r3, #0
_08003656:
	ldr r0, _08003678
	str r2, [r0]
	ldr r0, _0800367C
	movs r1, #1
	str r1, [r0]
	pop {r0}
	bx r0
_08003664:
	movs r2, #0x80
	b _08003656
_08003668:
	.4byte gBrightness
_0800366C:
	.4byte gFadeLevel
_08003670:
	.4byte gModeFlags
_08003674:
	.4byte 0xFFFFF7FF
_08003678:
	.4byte gFadeStep
_0800367C:
	.4byte gFadeMode

	.global fade_to_white
	.thumb_func
	.type fade_to_white, %function
fade_to_white: @ 08003680
	ldr r0, _080036A4
	ldr r1, [r0]
	ldr r0, _080036A8
	lsls r2, r1, #8
	str r2, [r0]
	ldr r0, _080036AC
	ldr r3, _080036B0
	ldr r1, [r0]
	ands r1, r3
	str r1, [r0]
	ldr r0, _080036B4
	movs r3, #0x80
	str r3, [r0]
	ldr r0, _080036B8
	movs r1, #2
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_080036A4:
	.4byte gBrightness
_080036A8:
	.4byte gFadeLevel
_080036AC:
	.4byte gModeFlags
_080036B0:
	.4byte 0xFFFFF7FF
_080036B4:
	.4byte gFadeStep
_080036B8:
	.4byte gFadeMode

	.global sub_080036BC
	.thumb_func
	.type sub_080036BC, %function
sub_080036BC: @ 080036BC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0xa0
	ldr r1, [r5, #4]
	ldr r7, _08003750
	lsls r4, r1, #1
	adds r4, #4
	ldrsh r0, [r7, r4]
	ldr r4, _08003754
	lsls r7, r0, #2
	ldr r3, [r4, r7]
	mov fp, r0
	ldr r0, [r3, #0x24]
	mov sl, r3
	str r0, [r5, #0x4c]
	mov r2, sl
	ldr r1, [r2, #0x24]
	movs r2, #0x80
	lsls r0, r2, #9
	sub sp, #0x14
	bl __divsi3
	str r0, [r5, #0x50]
	mov r3, sl
	movs r1, #0x87
	ldr r7, [r3, #0x10]
	lsls r3, r1, #1
	adds r5, r6, r3
	strh r7, [r5]
	mov r2, sl
	ldr r4, [r2, #0x28]
	movs r2, #0x80
	lsls r0, r2, #3
	lsls r1, r4, #8
	str r0, [sp]
	movs r2, #0
	adds r0, r6, #0
	movs r3, #0
	bl obj_set_hitbox
	adds r0, r6, #0
	bl obj_add_vector_hit
	mov r0, sl
	ldr r1, [r0, #4]
	movs r4, #0xec
	lsls r7, r1, #4
	mov r1, fp
	muls r1, r4, r1
	ldr r6, _08003758
	adds r7, #4
	ldr r5, [r6, r7]
	ldr r2, _0800375C
	str r5, [sp, #0xc]
	ldr r3, [r0, #0x7c]
	adds r0, r1, r2
	str r0, [sp, #0x10]
	ldr r0, _0800374C
	movs r2, #0
	mov lr, r0
	str r3, [sp, #8]
	movs r0, #0x1f
	mov r8, r2
	mov sb, r0
	movs r7, #0
	b _08003760
_0800374C:
	.4byte 0x0000001F
_08003750:
	.4byte gGameSetup
_08003754:
	.4byte gCharInfo
_08003758:
	.4byte gUnk_08713650
_0800375C:
	.4byte 0x0201BD30
_08003760:
	ldr r6, [sp, #0xc]
	ldrh r3, [r7, r6]
	ldr r1, [sp, #8]
	lsls r0, r3, #0x10
	mov r6, sb
	ands r6, r3
	lsrs r4, r0, #0x15
	mov r3, lr
	ands r3, r4
	ldrh r4, [r7, r1]
	lsrs r5, r0, #0x1a
	mov r0, lr
	ands r5, r0
	lsls r2, r4, #0x10
	mov r0, sb
	mov ip, r3
	ands r0, r4
	mov r3, lr
	lsrs r4, r2, #0x15
	lsrs r1, r2, #0x1a
	ands r4, r3
	ands r1, r3
	movs r3, #0xc
	mov r2, r8
	muls r2, r3, r2
	ldr r3, [sp, #0x10]
	adds r2, r2, r3
	lsls r3, r6, #0xa
	strh r3, [r2]
	mov r3, ip
	lsls r3, r3, #0xa
	str r3, [sp, #4]
	mov r3, sp
	ldrh r3, [r3, #4]
	subs r0, r0, r6
	strh r3, [r2, #2]
	lsls r3, r5, #0xa
	strh r3, [r2, #4]
	lsls r3, r0, #0xa
	mov r0, ip
	strh r3, [r2, #6]
	subs r3, r4, r0
	lsls r4, r3, #0xa
	subs r3, r1, r5
	lsls r0, r3, #0xa
	movs r3, #1
	add r8, r3
	strh r4, [r2, #8]
	strh r0, [r2, #0xa]
	mov r2, r8
	adds r7, #2
	cmp r2, #0xf
	ble _08003760
	movs r2, #0xec
	mov r1, fp
	muls r1, r2, r1
	ldr r0, _080037F4
	adds r2, r1, #0
	movs r3, #0
	adds r2, #8
	str r3, [r0, r2]
	adds r2, r1, #4
	str r3, [r0, r2]
	add sp, #0x14
	str r3, [r0, r1]
	mov r0, sl
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_080037F4:
	.4byte 0x0201BD24

	.global sub_080037F8
	.thumb_func
	.type sub_080037F8, %function
sub_080037F8: @ 080037F8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	movs r1, #0
	sub sp, #0x48
	str r1, [sp, #4]
	ldr r0, _08003914
	ldr r2, _08003918
	ldr r3, [r0]
	adds r1, r2, #0
	adds r1, #0x88
	mov ip, r3
	movs r0, #0
	ldrsh r3, [r1, r0]
	mov r0, ip
	movs r7, #0
	subs r1, r3, r0
	cmp r7, r1
	bge _080038B0
	lsls r3, r0, #1
	mov fp, r2
	add r1, sp, #0x24
	movs r2, #0
	adds r3, #4
	mov sl, ip
	mov sb, r1
	mov r8, r2
	mov lr, r3
_08003836:
	mov r2, ip
	add r0, sp, #8
	mov r1, r8
	str r2, [r0, r1]
	mov r0, lr
	mov r2, fp
	ldrsh r6, [r0, r2]
	lsls r0, r6, #2
	adds r0, #0x48
	ldr r2, [r2, r0]
	add r6, sp, #0x28
	mov r3, r8
	str r2, [r3, r6]
	adds r6, r7, #0
	cmp r7, #0
	ble _0800388C
	mov r1, sb
	ldr r0, [r1]
	cmp r2, r0
	bgt _0800388C
	add r3, sp, #8
	lsls r1, r7, #2
	add r2, sp, #0x28
	adds r5, r3, #0
	subs r0, r1, #4
	adds r4, r2, #0
_0800386A:
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	str r3, [r4, r1]
	str r2, [r4, r0]
	ldr r2, [r1, r5]
	ldr r3, [r0, r5]
	subs r6, #1
	str r3, [r1, r5]
	str r2, [r0, r5]
	subs r1, #4
	subs r0, #4
	cmp r6, #0
	ble _0800388C
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	cmp r2, r3
	ble _0800386A
_0800388C:
	ldr r1, [sp, #4]
	movs r2, #2
	adds r1, #1
	str r1, [sp, #4]
	add lr, r2
	ldr r2, _0800391C
	movs r0, #4
	movs r3, #1
	add ip, r3
	add sb, r0
	add r8, r0
	movs r0, #0
	ldrsh r3, [r2, r0]
	mov r2, sl
	adds r7, #1
	subs r1, r3, r2
	cmp r7, r1
	blt _08003836
_080038B0:
	ldr r1, [sp, #4]
	movs r2, #0
	lsls r7, r1, #2
	add r3, sp, #8
	add r0, sp, #0x28
	str r2, [r3, r7]
	str r2, [r0, r7]
	ldr r2, _08003918
	adds r1, r2, #0
	adds r1, #0x88
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r7, #0
	cmp r7, r3
	bge _08003902
	adds r6, r2, #0
	adds r5, r6, #0
	mov r8, r1
	adds r5, #0x3e
	movs r4, #0
_080038D8:
	add r3, sp, #8
	ldr r2, [r4, r3]
	strb r2, [r5]
	lsls r1, r2, #1
	adds r1, #4
	ldrsh r3, [r6, r1]
	add r0, sp, #0x28
	ldr r1, [r4, r0]
	ldr r0, _08003920
	str r1, [sp]
	adds r1, r7, #0
	bl AGBPrintf
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r7, #1
	adds r5, #1
	adds r4, #4
	cmp r7, r0
	blt _080038D8
_08003902:
	add sp, #0x48
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08003914:
	.4byte 0x0202DE5C
_08003918:
	.4byte gGameSetup
_0800391C:
	.4byte 0x0202D7D4
_08003920:
	.4byte gUnk_0804FDC4

	.global sub_08003924
	.thumb_func
	.type sub_08003924, %function
sub_08003924: @ 08003924
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	movs r0, #0
	mov fp, r0
	ldr r0, _08003A54
	ldr r2, _08003A58
	adds r0, #0x88
	ldr r1, [r2]
	movs r5, #0
	ldrsh r3, [r0, r5]
	movs r7, #0
	subs r0, r3, r1
	sub sp, #0x48
	mov ip, r1
	cmp r7, r0
	bge _080039D8
	movs r3, #0
	mov r5, ip
	ldr r0, _08003A54
	mov r8, r3
	lsls r3, r5, #1
	add r2, sp, #0x24
	adds r3, #4
	str r1, [sp, #4]
	mov sb, r0
	mov sl, r2
	mov lr, r3
_08003962:
	mov r1, ip
	add r3, sp, #8
	mov r0, r8
	str r1, [r3, r0]
	mov r5, lr
	mov r1, sb
	ldrsh r6, [r5, r1]
	lsls r5, r6, #2
	adds r5, #0x48
	ldr r2, [r1, r5]
	mov r3, r8
	add r1, sp, #0x28
	str r2, [r3, r1]
	adds r6, r7, #0
	cmp r7, #0
	ble _080039B8
	mov r0, sl
	ldr r1, [r0]
	cmp r2, r1
	bgt _080039B8
	add r4, sp, #8
	lsls r1, r7, #2
	add r3, sp, #0x28
	adds r5, r4, #0
	subs r0, r1, #4
	adds r4, r3, #0
_08003996:
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	str r3, [r4, r1]
	str r2, [r4, r0]
	ldr r2, [r1, r5]
	ldr r3, [r0, r5]
	subs r6, #1
	str r3, [r1, r5]
	str r2, [r0, r5]
	subs r1, #4
	subs r0, #4
	cmp r6, #0
	ble _080039B8
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	cmp r2, r3
	ble _08003996
_080039B8:
	ldr r5, _08003A5C
	movs r1, #1
	movs r3, #2
	add fp, r1
	add lr, r3
	add ip, r1
	movs r1, #0
	ldrsh r3, [r5, r1]
	ldr r5, [sp, #4]
	movs r2, #4
	adds r7, #1
	subs r0, r3, r5
	add sl, r2
	add r8, r2
	cmp r7, r0
	blt _08003962
_080039D8:
	ldr r1, _08003A58
	ldr r2, [r1]
	movs r7, #0
	cmp r7, r2
	bge _080039FC
	mov r3, fp
	add r4, sp, #8
	add r0, sp, #0x28
	movs r1, #0
	lsls r2, r3, #2
_080039EC:
	str r7, [r2, r4]
	ldr r5, _08003A58
	str r1, [r2, r0]
	ldr r3, [r5]
	adds r7, #1
	adds r2, #4
	cmp r7, r3
	blt _080039EC
_080039FC:
	ldr r2, _08003A54
	adds r2, #0x88
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r7, #0
	cmp r7, r1
	bge _08003A42
	ldr r6, _08003A54
	add r1, sp, #0x28
	adds r5, r6, #0
	mov r8, r1
	mov sl, r2
	adds r5, #0x3e
	movs r4, #0
_08003A18:
	add r0, sp, #8
	ldr r2, [r4, r0]
	strb r2, [r5]
	lsls r1, r2, #1
	adds r1, #4
	ldrsh r3, [r6, r1]
	mov r0, r8
	ldr r1, [r4, r0]
	ldr r0, _08003A60
	str r1, [sp]
	adds r1, r7, #0
	bl AGBPrintf
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r7, #1
	adds r5, #1
	adds r4, #4
	cmp r7, r0
	blt _08003A18
_08003A42:
	add sp, #0x48
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08003A54:
	.4byte gGameSetup
_08003A58:
	.4byte 0x0202DE5C
_08003A5C:
	.4byte 0x0202D7D4
_08003A60:
	.4byte gUnk_0804FDC4

	.global sub_08003A64
	.thumb_func
	.type sub_08003A64, %function
sub_08003A64: @ 08003A64
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r6, _08003DA8
	movs r2, #0
	movs r1, #1
	sub sp, #0x7c
	str r2, [sp, #0x18]
	mov sb, r1
	adds r1, r6, #0
	adds r1, #0x88
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp sb, r0
	bge _08003AAE
_08003A88:
	mov r3, sb
	lsls r0, r3, #1
	adds r5, r0, #4
	ldrsh r4, [r6, r5]
	ldr r2, _08003DAC
	lsls r5, r4, #2
	ldr r3, [r2, r5]
	ldr r1, [r3, #0x10]
	cmp r1, #0
	bne _08003A9E
	b _08003DB0
_08003A9E:
	adds r0, r6, #0
	movs r4, #1
	adds r0, #0x88
	add sb, r4
	movs r4, #0
	ldrsh r2, [r0, r4]
	cmp sb, r2
	blt _08003A88
_08003AAE:
	movs r0, #0
	ldr r3, [sp, #0x18]
	mov sb, r0
	cmp sb, r3
	bge _08003B46
	str r0, [sp, #0x10]
_08003ABA:
	mov r2, sb
	mov ip, sb
	cmp r2, #0
	ble _08003B36
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	add r1, sp, #0x5c
	subs r0, #4
	ldr r4, [r1, r2]
	ldr r6, [r1, r0]
	mov fp, r1
	cmp r4, r6
	blt _08003B36
	add r4, sp, #0x3c
	add r2, sp, #0x1c
	ldr r6, [sp, #0x10]
	mov lr, r4
	mov r8, r2
	mov sl, r1
	adds r5, r0, #0
_08003AE2:
	ldr r4, [r1, r6]
	ldr r7, [r1, r5]
	str r7, [r1, r6]
	str r4, [r1, r5]
	mov r3, lr
	ldr r0, [r6, r3]
	ldr r2, [r5, r3]
	mov r4, lr
	str r2, [r6, r4]
	str r0, [r5, r4]
	mov r0, r8
	ldr r1, [r5, r0]
	ldr r7, [r6, r0]
	str r1, [r6, r0]
	mov r1, ip
	lsls r4, r1, #2
	mov r2, ip
	str r7, [r5, r0]
	adds r1, r4, #0
	mov r7, ip
	subs r0, r4, #4
	cmp r2, #0
	ble _08003B1C
	mov r3, sl
	ldr r4, [r1, r3]
	ldr r2, [r0, r3]
	cmp r4, r2
	bne _08003B1C
	b _08003D58
_08003B1C:
	movs r0, #1
	rsbs r1, r0, #0
	add ip, r1
	mov r0, ip
	subs r6, #4
	subs r5, #4
	cmp r0, #0
	ble _08003B36
	mov r1, fp
	ldr r3, [r1, r6]
	ldr r4, [r1, r5]
	cmp r3, r4
	bge _08003AE2
_08003B36:
	ldr r2, [sp, #0x10]
	movs r1, #1
	ldr r6, [sp, #0x18]
	adds r2, #4
	add sb, r1
	str r2, [sp, #0x10]
	cmp sb, r6
	blt _08003ABA
_08003B46:
	ldr r0, [sp, #0x18]
	cmp r0, #3
	bne _08003B4E
	b _08003D32
_08003B4E:
	ldr r3, [sp, #0x18]
	cmp r3, #4
	bne _08003B56
	b _08003D02
_08003B56:
	ldr r6, _08003DA8
	movs r3, #0
	str r3, [sp, #0x18]
	adds r1, r6, #0
	movs r2, #1
	adds r1, #0x88
	mov sb, r2
	movs r4, #0
	ldrsh r2, [r1, r4]
	cmp sb, r2
	bge _08003B92
_08003B6C:
	mov r1, sb
	lsls r0, r1, #1
	adds r5, r0, #4
	ldrsh r4, [r6, r5]
	ldr r2, _08003DAC
	lsls r5, r4, #2
	ldr r1, [r2, r5]
	ldr r2, [r1, #0x10]
	cmp r2, #1
	bne _08003B82
	b _08003CDE
_08003B82:
	adds r1, r6, #0
	movs r4, #1
	adds r1, #0x88
	add sb, r4
	movs r4, #0
	ldrsh r2, [r1, r4]
	cmp sb, r2
	blt _08003B6C
_08003B92:
	movs r0, #0
	ldr r3, [sp, #0x18]
	mov sb, r0
	cmp sb, r3
	bge _08003C28
	str r0, [sp, #0x14]
_08003B9E:
	mov r2, sb
	mov ip, sb
	cmp r2, #0
	ble _08003C18
	ldr r0, [sp, #0x14]
	ldr r4, [sp, #0x14]
	add r1, sp, #0x5c
	subs r0, #4
	ldr r2, [r1, r4]
	ldr r4, [r1, r0]
	mov fp, r1
	cmp r2, r4
	blt _08003C18
	add r4, sp, #0x3c
	add r2, sp, #0x1c
	ldr r6, [sp, #0x14]
	mov lr, r4
	mov r8, r2
	mov sl, r1
	adds r5, r0, #0
_08003BC6:
	ldr r4, [r1, r6]
	ldr r7, [r1, r5]
	str r7, [r1, r6]
	str r4, [r1, r5]
	mov r3, lr
	ldr r0, [r6, r3]
	ldr r2, [r5, r3]
	mov r4, lr
	str r2, [r6, r4]
	str r0, [r5, r4]
	mov r0, r8
	ldr r1, [r5, r0]
	ldr r7, [r6, r0]
	str r1, [r6, r0]
	mov r1, ip
	lsls r2, r1, #2
	str r7, [r5, r0]
	adds r1, r2, #0
	subs r0, r2, #4
	mov r2, ip
	mov r7, ip
	cmp r2, #0
	ble _08003BFE
	mov r3, sl
	ldr r4, [r1, r3]
	ldr r2, [r0, r3]
	cmp r4, r2
	beq _08003C96
_08003BFE:
	movs r1, #1
	rsbs r3, r1, #0
	add ip, r3
	mov r0, ip
	subs r6, #4
	subs r5, #4
	cmp r0, #0
	ble _08003C18
	mov r1, fp
	ldr r4, [r1, r6]
	ldr r0, [r1, r5]
	cmp r4, r0
	bge _08003BC6
_08003C18:
	ldr r0, [sp, #0x14]
	movs r3, #1
	ldr r2, [sp, #0x18]
	adds r0, #4
	add sb, r3
	str r0, [sp, #0x14]
	cmp sb, r2
	blt _08003B9E
_08003C28:
	ldr r4, [sp, #0x18]
	cmp r4, #3
	beq _08003C6E
	ldr r1, [sp, #0x18]
	cmp r1, #4
	beq _08003C46
_08003C34:
	add sp, #0x7c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08003C46:
	ldr r2, [sp, #0x3c]
	ldr r1, _08003DA8
	lsls r0, r2, #2
	adds r0, #0x48
	movs r2, #0
	str r2, [r1, r0]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #2
	movs r2, #0x80
	adds r0, #0x48
	lsls r2, r2, #7
	str r2, [r1, r0]
	ldr r2, [sp, #0x44]
	lsls r0, r2, #2
	movs r2, #0x80
	adds r0, #0x48
	lsls r2, r2, #8
	str r2, [r1, r0]
	ldr r2, [sp, #0x48]
	b _08003C8A
_08003C6E:
	ldr r2, [sp, #0x3c]
	ldr r1, _08003DA8
	lsls r0, r2, #2
	movs r2, #0x80
	adds r0, #0x48
	lsls r2, r2, #7
	str r2, [r1, r0]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #2
	movs r2, #0x80
	adds r0, #0x48
	lsls r2, r2, #8
	str r2, [r1, r0]
	ldr r2, [sp, #0x44]
_08003C8A:
	lsls r0, r2, #2
	movs r2, #0xc0
	adds r0, #0x48
	lsls r2, r2, #8
	str r2, [r1, r0]
	b _08003C34
_08003C96:
	mov r3, r8
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	cmp r2, r3
	bge _08003BFE
_08003CA0:
	mov r2, fp
	str r4, [r1, r2]
	str r4, [r0, r2]
	mov r3, lr
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	mov r4, lr
	str r3, [r1, r4]
	str r2, [r0, r4]
	add r4, sp, #0x1c
	ldr r2, [r1, r4]
	ldr r3, [r0, r4]
	subs r7, #1
	add r4, sp, #0x1c
	str r3, [r1, r4]
	str r2, [r0, r4]
	subs r1, #4
	subs r0, #4
	cmp r7, #0
	ble _08003BFE
	mov r2, sl
	ldr r4, [r1, r2]
	ldr r3, [r0, r2]
	cmp r4, r3
	bne _08003BFE
	mov r3, r8
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	cmp r2, r3
	blt _08003CA0
	b _08003BFE
_08003CDE:
	ldr r3, [sp, #0x18]
	lsls r2, r3, #2
	adds r3, r0, #0
	adds r3, #0x2c
	ldrsh r3, [r6, r3]
	add r1, sp, #0x5c
	add r0, sp, #0x3c
	str r3, [r1, r2]
	str r4, [r0, r2]
	adds r4, r5, #0
	adds r4, #0x48
	ldr r1, [r6, r4]
	add r0, sp, #0x1c
	str r1, [r0, r2]
	ldr r4, [sp, #0x18]
	adds r4, #1
	str r4, [sp, #0x18]
	b _08003B82
_08003D02:
	ldr r0, [sp, #0x3c]
	ldr r4, _08003DA8
	lsls r6, r0, #2
	adds r6, #0x48
	movs r1, #0
	str r1, [r4, r6]
	ldr r2, [sp, #0x40]
	movs r0, #0x80
	lsls r6, r2, #2
	lsls r1, r0, #7
	adds r6, #0x48
	str r1, [r4, r6]
	ldr r2, [sp, #0x44]
	lsls r6, r2, #2
	lsls r1, r0, #8
	adds r6, #0x48
	str r1, [r4, r6]
	ldr r2, [sp, #0x48]
	movs r0, #0xc0
	lsls r6, r2, #2
	adds r6, #0x48
	lsls r1, r0, #8
	str r1, [r4, r6]
	b _08003B56
_08003D32:
	ldr r2, [sp, #0x3c]
	ldr r6, _08003DA8
	lsls r4, r2, #2
	movs r0, #0x80
	lsls r1, r0, #7
	adds r4, #0x48
	str r1, [r6, r4]
	ldr r2, [sp, #0x40]
	lsls r4, r2, #2
	lsls r1, r0, #8
	adds r4, #0x48
	str r1, [r6, r4]
	ldr r2, [sp, #0x44]
	movs r0, #0xc0
	lsls r4, r2, #2
	adds r4, #0x48
	lsls r1, r0, #8
	str r1, [r6, r4]
	b _08003B56
_08003D58:
	mov r3, r8
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	cmp r2, r3
	blt _08003D64
	b _08003B1C
_08003D64:
	adds r3, r4, #0
	mov r4, fp
	str r3, [r1, r4]
	str r3, [r0, r4]
	mov r3, lr
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	mov r4, lr
	str r3, [r1, r4]
	str r2, [r0, r4]
	add r4, sp, #0x1c
	ldr r2, [r1, r4]
	ldr r3, [r0, r4]
	subs r7, #1
	add r4, sp, #0x1c
	str r3, [r1, r4]
	str r2, [r0, r4]
	subs r1, #4
	subs r0, #4
	cmp r7, #0
	bgt _08003D90
	b _08003B1C
_08003D90:
	mov r2, sl
	ldr r4, [r1, r2]
	ldr r3, [r0, r2]
	cmp r4, r3
	beq _08003D9C
	b _08003B1C
_08003D9C:
	mov r3, r8
	ldr r2, [r1, r3]
	ldr r3, [r0, r3]
	cmp r2, r3
	blt _08003D64
	b _08003B1C
_08003DA8:
	.4byte gGameSetup
_08003DAC:
	.4byte gCharInfo
_08003DB0:
	ldr r3, [sp, #0x18]
	lsls r2, r3, #2
	adds r3, r0, #0
	adds r3, #0x2c
	ldrsh r3, [r6, r3]
	add r1, sp, #0x5c
	str r3, [r1, r2]
	add r1, sp, #0x3c
	str r4, [r1, r2]
	adds r0, r5, #0
	adds r0, #0x48
	ldr r1, [r6, r0]
	add r4, sp, #0x1c
	str r1, [r4, r2]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x18]
	b _08003A9E

	.global sub_08003DD4
	.thumb_func
	.type sub_08003DD4, %function
sub_08003DD4: @ 08003DD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08003EB4
	ldr r3, [r0]
	movs r6, #0
	mov ip, r0
	cmp r6, r3
	bge _08003EAC
	ldr r1, _08003EB8
	mov lr, r1
	mov r5, lr
	movs r4, #1
	movs r0, #4
	adds r1, r3, #0
_08003DF2:
	ldrsh r2, [r0, r5]
	adds r3, r4, #0
	lsls r3, r2
	subs r1, #1
	orrs r6, r3
	adds r0, #2
	cmp r1, #0
	bne _08003DF2
_08003E02:
	mov r2, lr
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #2
	beq _08003EA6
	movs r2, #0x80
	lsls r1, r2, #1
	orrs r6, r1
_08003E12:
	mov r1, lr
	movs r0, #0
	ldrsh r2, [r1, r0]
	cmp r2, #0
	beq _08003E72
	mov r2, lr
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #4
	beq _08003E30
_08003E26:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08003E30:
	mov r3, ip
	ldr r4, [r3]
	movs r0, #0x88
	lsls r1, r4, #1
	add r0, lr
	add r1, lr
	movs r7, #0
	mov r8, r0
	adds r5, r1, #4
_08003E42:
	bl multi_lfsr_next
	movs r2, #7
	ands r0, r2
	movs r2, #1
	lsls r2, r0
	adds r1, r2, #0
	ands r1, r6
	cmp r1, #0
	beq _08003E5C
_08003E56:
	cmp r7, #0
	bne _08003E26
	b _08003E42
_08003E5C:
	strh r0, [r5]
	orrs r6, r2
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r4, #1
	adds r5, #2
	cmp r4, r0
	bne _08003E56
	movs r7, #1
	b _08003E56
_08003E72:
	mov r3, ip
	ldr r1, [r3]
	movs r2, #0
	cmp r1, #7
	bgt _08003E26
_08003E7C:
	movs r0, #1
	lsls r0, r2
	ands r0, r6
	cmp r0, #0
	beq _08003E94
	movs r0, #1
_08003E88:
	adds r2, #1
	adds r3, r0, #0
	lsls r3, r2
	ands r3, r6
	cmp r3, #0
	bne _08003E88
_08003E94:
	lsls r3, r1, #1
	adds r3, #4
	mov r0, lr
	adds r1, #1
	strh r2, [r0, r3]
	adds r2, #1
	cmp r1, #7
	ble _08003E7C
	b _08003E26
_08003EA6:
	movs r0, #0x20
	orrs r6, r0
	b _08003E12
_08003EAC:
	ldr r0, _08003EB8
	mov lr, r0
	b _08003E02
	.byte 0x00, 0x00
_08003EB4:
	.4byte 0x0202DE5C
_08003EB8:
	.4byte gGameSetup

	.global sub_08003EBC
	.thumb_func
	.type sub_08003EBC, %function
sub_08003EBC: @ 08003EBC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov sl, r0
	mov r3, sl
	adds r3, #0xa0
	ldr r5, [r3, #4]
	ldr r7, _08004010
	lsls r4, r5, #1
	adds r4, #4
	ldrsh r0, [r7, r4]
	movs r2, #0xec
	mov r8, r0
	mov r7, r8
	muls r7, r2, r7
	ldr r4, _08004014
	adds r0, r7, #4
	ldr r1, [r4, r0]
	lsls r6, r1, #6
	lsrs r0, r6, #0x11
	ldr r5, _08004018
	bl _call_via_r5
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	adds r1, r2, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r4, #0xcc
	adds r5, r7, r4
	adds r0, #0xc
	adds r3, r0, r7
	mov sb, r5
	asrs r6, r1, #0xc
	mov ip, r3
	movs r7, #0
	mov fp, sb
_08003F0C:
	movs r1, #0xc
	adds r2, r7, #0
	muls r2, r1, r2
	add r2, ip
	movs r5, #2
	ldrsh r0, [r2, r5]
	movs r3, #6
	ldrsh r5, [r2, r3]
	mov lr, r5
	movs r3, #0
	ldrsh r4, [r2, r3]
	movs r3, #4
	ldrsh r1, [r2, r3]
	mov r3, lr
	muls r3, r6, r3
	asrs r5, r3, #0xc
	adds r4, r4, r5
	movs r3, #8
	ldrsh r5, [r2, r3]
	mov lr, r5
	mov r3, lr
	muls r3, r6, r3
	asrs r5, r3, #0xc
	adds r0, r0, r5
	movs r5, #0xa
	ldrsh r2, [r2, r5]
	adds r3, r2, #0
	muls r3, r6, r3
	asrs r5, r3, #0xc
	adds r2, r1, r5
	asrs r0, r0, #0xa
	asrs r3, r2, #0xa
	lsls r2, r3, #0xa
	lsls r3, r0, #5
	orrs r2, r3
	asrs r5, r4, #0xa
	mov r0, fp
	orrs r2, r5
	movs r3, #2
	adds r7, #1
	strh r2, [r0]
	add fp, r3
	cmp r7, #0xf
	ble _08003F0C
	mov r3, sl
	adds r3, #0xfe
	movs r2, #0
	ldrsh r1, [r3, r2]
	cmp r1, #0x77
	bgt _0800400A
	movs r4, #0xec
	mov r6, r8
	muls r6, r4, r6
	ldr r7, _08004014
	ldr r0, [r7, r6]
	cmp r0, #0
	beq _08003FC4
_08003F7E:
	movs r4, #0xec
	mov r0, r8
	muls r0, r4, r0
	adds r5, r0, #0
	adds r5, #8
	ldr r2, [r7, r0]
	ldr r4, [r7, r5]
	adds r0, #4
	lsls r3, r4, #1
	lsls r1, r2, #1
	adds r2, r3, r1
	ldr r3, [r7, r0]
	adds r4, r4, r1
	ldr r1, _0800401C
	adds r3, r3, r2
	ands r3, r1
	str r3, [r7, r0]
	str r4, [r7, r5]
	mov r3, sl
	adds r3, #0x5a
	ldrh r0, [r3]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _08004020
	adds r1, #0x10
	mov r0, sb
	str r0, [r3, r1]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08003FC4:
	adds r5, r6, #4
	ldr r0, [r7, r5]
	movs r2, #0x80
	adds r5, r6, #0
	lsls r4, r2, #0x16
	adds r5, #8
	adds r2, r0, r4
	ldr r4, [r7, r5]
	adds r5, r1, #0
	muls r5, r1, r5
	muls r4, r1, r4
	adds r0, r5, #0
	subs r5, r2, r4
	asrs r4, r0, #1
	adds r0, r5, #0
	cmp r5, #0
	blt _08004006
_08003FE6:
	adds r1, r4, #0
	cmp r4, #0
	blt _08004002
_08003FEC:
	ldr r2, _08004024
	bl _call_via_r2
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08003FFE
_08003FFA:
	str r0, [r7, r6]
	b _08003F7E
_08003FFE:
	rsbs r0, r0, #0
	b _08003FFA
_08004002:
	rsbs r1, r4, #0
	b _08003FEC
_08004006:
	rsbs r0, r5, #0
	b _08003FE6
_0800400A:
	ldr r7, _08004014
	b _08003F7E
	.byte 0x00, 0x00
_08004010:
	.4byte gGameSetup
_08004014:
	.4byte 0x0201BD24
_08004018:
	.4byte sin_fx
_0800401C:
	.4byte 0x03FFFFFF
_08004020:
	.4byte 0x02018F34
_08004024:
	.4byte udiv

	.global setup_char_bias
	.thumb_func
	.type setup_char_bias, %function
setup_char_bias: @ 08004028
	push {r4, r5, lr}
	ldr r4, _08004050
	ldr r5, _08004054
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x48
_08004034:
	movs r2, #4
	ldrsh r3, [r4, r2]
	lsls r2, r3, #3
	adds r2, r2, r3
	adds r3, r2, r1
	lsls r2, r3, #2
	ldr r3, [r5, r2]
	adds r1, #1
	stm r0!, {r3}
	cmp r1, #8
	ble _08004034
	pop {r4, r5}
	pop {r0}
	bx r0
_08004050:
	.4byte gGameSetup
_08004054:
	.4byte gCharBiasTable

	.global sub_08004058
	.thumb_func
	.type sub_08004058, %function
sub_08004058: @ 08004058
	push {r4, r5, r6, lr}
	ldr r0, _08004080
	ldr r6, _08004084
	adds r5, r0, #0
	adds r5, #0x48
	movs r4, #8
_08004064:
	bl multi_lfsr_next
	movs r1, #0x80
	ands r0, r6
	lsrs r2, r0, #1
	lsls r3, r1, #7
	adds r1, r2, r3
	subs r4, #1
	stm r5!, {r1}
	cmp r4, #0
	bge _08004064
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08004080:
	.4byte gGameSetup
_08004084:
	.4byte 0x0000FFFF

	.global clear_char_bias
	.thumb_func
	.type clear_char_bias, %function
clear_char_bias: @ 08004088
	push {lr}
	ldr r3, _080040A0
	movs r1, #0
	adds r3, #0x48
	movs r2, #8
_08004092:
	subs r2, #1
	stm r3!, {r1}
	cmp r2, #0
	bge _08004092
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080040A0:
	.4byte gGameSetup

	.global sub_080040A4
	.thumb_func
	.type sub_080040A4, %function
sub_080040A4: @ 080040A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r1, [r2, #4]
	ldr r2, _080040E0
	lsls r3, r1, #1
	adds r3, #4
	ldrsh r5, [r2, r3]
	ldr r2, _080040E4
	lsls r1, r5, #2
	ldr r5, [r2, r1]
	adds r4, #0x5a
	ldr r1, [r5, #4]
	movs r2, #0x13
	bl obj_setup_sprite
	ldrh r0, [r4]
	movs r3, #0x18
	muls r3, r0, r3
	ldr r2, _080040E8
	ldr r1, [r5, #0xc]
	adds r3, r3, r2
	strh r1, [r3, #0xa]
	bl sub_08002FE0
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080040E0:
	.4byte gGameSetup
_080040E4:
	.4byte gCharInfo
_080040E8:
	.4byte 0x02018F34

	.global char_info
	.thumb_func
	.type char_info, %function
char_info: @ 080040EC
	ldr r2, _080040F4
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	bx lr
_080040F4:
	.4byte gCharInfo

	.global sub_080040F8
	.thumb_func
	.type sub_080040F8, %function
sub_080040F8: @ 080040F8
	adds r0, #0xa0
	ldr r1, [r0, #4]
	ldr r0, _08004120
	lsls r3, r1, #1
	adds r3, #4
	ldrsh r2, [r0, r3]
	movs r1, #0xec
	muls r2, r1, r2
	ldr r0, _08004124
	adds r1, r2, #0
	movs r3, #0x80
	adds r1, #8
	lsls r3, r3, #0xd
	str r3, [r0, r1]
	movs r3, #0
	adds r1, r2, #4
	str r3, [r0, r1]
	str r3, [r0, r2]
	bx lr
	.byte 0x00, 0x00
_08004120:
	.4byte gGameSetup
_08004124:
	.4byte 0x0201BD24

	.global sub_08004128
	.thumb_func
	.type sub_08004128, %function
sub_08004128: @ 08004128
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r3, r2, #1
	ldr r2, _08004158
	adds r3, #4
	ldrsh r3, [r2, r3]
	ldr r2, _0800415C
	lsls r1, r3, #2
	ldr r3, [r2, r1]
	ldr r1, [r3, #4]
	ldr r2, _08004160
	lsls r3, r1, #4
	adds r3, #4
	adds r0, #0x5a
	ldr r1, [r2, r3]
	ldrh r3, [r0]
	movs r0, #0x18
	muls r0, r3, r0
	ldr r3, _08004164
	adds r0, #0x10
	str r1, [r3, r0]
	bx lr
	.byte 0x00, 0x00
_08004158:
	.4byte gGameSetup
_0800415C:
	.4byte gCharInfo
_08004160:
	.4byte gUnk_08713650
_08004164:
	.4byte 0x02018F34

	.global sub_08004168
	.thumb_func
	.type sub_08004168, %function
sub_08004168: @ 08004168
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r3, r2, #1
	ldr r2, _080041B0
	adds r3, #4
	ldrsh r3, [r2, r3]
	ldr r2, _080041B4
	lsls r4, r3, #2
	ldr r3, [r2, r4]
	adds r3, #0x80
	ldr r4, [r3]
	adds r3, r0, #0
	adds r3, #0x5a
	ldrh r2, [r3]
	movs r3, #0x18
	muls r3, r2, r3
	ldr r2, _080041B8
	adds r3, #0x10
	str r4, [r2, r3]
	movs r2, #0x83
	lsls r3, r2, #1
	adds r2, r0, r3
	ldr r3, _080041AC
	strh r3, [r2]
	movs r2, #0x80
	ldr r0, [r1]
	lsls r3, r2, #0xd
	orrs r0, r3
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
_080041AC:
	.4byte 0x0000000A
_080041B0:
	.4byte gGameSetup
_080041B4:
	.4byte gCharInfo
_080041B8:
	.4byte 0x02018F34

	.global sub_080041BC
	.thumb_func
	.type sub_080041BC, %function
sub_080041BC: @ 080041BC
	push {lr}
	movs r1, #0x83
	lsls r2, r1, #1
	adds r1, r0, r2
	ldrh r3, [r1]
	subs r3, #2
	strh r3, [r1]
	lsls r1, r3, #0x10
	cmp r1, #0
	ble _080041D4
_080041D0:
	pop {r0}
	bx r0
_080041D4:
	bl sub_080041DC
	b _080041D0
	.byte 0x00, 0x00

	.global sub_080041DC
	.thumb_func
	.type sub_080041DC, %function
sub_080041DC: @ 080041DC
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	lsls r3, r2, #1
	ldr r2, _08004228
	adds r3, #4
	ldrsh r3, [r2, r3]
	ldr r2, _0800422C
	lsls r4, r3, #2
	ldr r3, [r2, r4]
	ldr r4, [r3, #4]
	ldr r2, _08004230
	lsls r3, r4, #4
	adds r3, #4
	ldr r4, [r2, r3]
	adds r3, r0, #0
	adds r3, #0x5a
	ldrh r2, [r3]
	movs r3, #0x18
	muls r3, r2, r3
	ldr r2, _08004234
	adds r3, #0x10
	str r4, [r2, r3]
	movs r2, #0x83
	lsls r3, r2, #1
	adds r2, r0, r3
	ldr r3, _08004224
	strh r3, [r2]
	ldr r3, _08004238
	ldr r0, [r1]
	ands r0, r3
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
_08004224:
	.4byte 0x00000000
_08004228:
	.4byte gGameSetup
_0800422C:
	.4byte gCharInfo
_08004230:
	.4byte gUnk_08713650
_08004234:
	.4byte 0x02018F34
_08004238:
	.4byte 0xFFEFFFFF
