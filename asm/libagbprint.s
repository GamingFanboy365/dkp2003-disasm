@ asm/libagbprint.s: ROM 0x03222C-0x0325DC (rom, VMA 0x0803222C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global AGBPrintInit
	.thumb_func
	.type AGBPrintInit, %function
AGBPrintInit: @ 0803222C
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	ldr r0, _080322A8
	str r0, [r7]
	ldr r0, _080322AC
	str r0, [r7, #4]
	ldr r0, _080322B0
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7, #4]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r7]
	ldrh r3, [r2, #6]
	movs r4, #0
	ands r3, r4
	adds r4, r3, #0
	strh r4, [r2, #6]
	ldrh r2, [r1, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	strh r3, [r1, #4]
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xfd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, [r7, #8]
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
_080322A8:
	.4byte 0x09FE20F8
_080322AC:
	.4byte 0x04000204
_080322B0:
	.4byte 0x09FE2FFE

	.global AGBPutcInternal
	.thumb_func
	.type AGBPutcInternal, %function
AGBPutcInternal: @ 080322B4
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	ldr r0, _08032334
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #2]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	lsls r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #0x14
	adds r0, r1, r2
	str r0, [r7, #8]
	ldr r0, _08032338
	str r0, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #4]
	ldrh r2, [r1, #6]
	lsls r1, r2, #0x10
	lsrs r2, r1, #0x10
	lsrs r1, r2, #1
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	movs r1, #0x20
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r7, #4]
	ldrh r2, [r1, #6]
	movs r3, #1
	adds r1, r2, #0
	ands r1, r3
	adds r3, r1, #0
	lsls r2, r3, #0x10
	lsrs r1, r2, #0x10
	cmp r1, #0
	beq _0803233C
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	movs r3, #0xff
	adds r1, r2, #0
	ands r1, r3
	adds r2, r7, #0
	ldrb r3, [r2]
	adds r2, r3, #0
	lsls r3, r2, #8
	adds r2, r3, #0
	adds r3, r1, #0
	orrs r3, r2
	adds r1, r3, #0
	b _08032354
_08032334:
	.4byte 0x09FE20F8
_08032338:
	.4byte 0x09FE2FFE
_0803233C:
	adds r2, r7, #0
	adds r2, #0x10
	ldrh r3, [r2]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r2, r3, #0
	ands r2, r4
	adds r3, r7, #0
	ldrb r4, [r3]
	adds r3, r4, #0
	orrs r3, r2
	adds r1, r3, #0
_08032354:
	strh r1, [r0]
	ldr r0, [r7, #4]
	ldrh r1, [r0, #6]
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	lsrs r0, r1, #1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x10
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #4]
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r0, [r7, #0xc]
	movs r1, #0
	strh r1, [r0]
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global AGBPutc
	.thumb_func
	.type AGBPutc, %function
AGBPutc: @ 080323A0
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	ldr r0, _080323F8
	str r0, [r7, #4]
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r7, #4]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, r7, #0
	ldrb r1, [r0]
	adds r0, r1, #0
	bl AGBPutcInternal
	ldr r0, [r7, #4]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _080323FC
	str r0, [r7, #0xc]
	ldr r1, [r7, #0xc]
	ldrh r0, [r1, #6]
	ldr r1, [r7, #0xc]
	ldrh r2, [r1, #4]
	subs r1, r2, #1
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r0, r1
	bne _080323F0
	bl AGBPrintFlush1Block
_080323F0:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
_080323F8:
	.4byte 0x04000204
_080323FC:
	.4byte 0x09FE20F8

	.global AGBPrint
	.thumb_func
	.type AGBPrint, %function
AGBPrint: @ 08032400
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, _08032430
	str r0, [r7, #4]
	ldr r0, _08032434
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #8]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
_08032424:
	ldr r0, [r7]
	ldrb r1, [r0]
	cmp r1, #0
	bne _08032438
	b _0803244A
	.byte 0x00, 0x00
_08032430:
	.4byte 0x09FE20F8
_08032434:
	.4byte 0x04000204
_08032438:
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl AGBPutc
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08032424
_0803244A:
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

	.global AGBPrintf
	.thumb_func
	.type AGBPrintf, %function
AGBPrintf: @ 0803245C
	push {r0, r1, r2, r3}
	push {r7, lr}
	sub sp, #0x104
	mov r7, sp
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r7, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	str r0, [r2]
	adds r0, r7, #0
	adds r1, r7, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r7, r1
	ldr r2, [r3]
	movs r3, #0x86
	lsls r3, r3, #1
	adds r3, r3, r7
	ldr r1, [r3]
	bl vsprintf
	adds r1, r7, #0
	adds r0, r1, #0
	bl AGBPrint
	add sp, #0x104
	pop {r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.byte 0x00, 0x00

	.global AGBPrintTransferDataInternal
	.thumb_func
	.type AGBPrintTransferDataInternal, %function
AGBPrintTransferDataInternal: @ 080324A0
	push {r4, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	ldr r0, _08032508
	str r0, [r7, #0x18]
	ldr r0, _0803250C
	str r0, [r7, #0x1c]
	ldr r0, _08032510
	str r0, [r7, #4]
	ldr r0, _08032514
	str r0, [r7, #8]
	adds r0, r7, #0
	adds r0, #0xc
	ldr r1, [r7, #8]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08032518
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #0x10]
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	ldr r3, _0803251C
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	cmp r0, #0
	beq _08032536
_080324F2:
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r1, #6]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldrh r0, [r0, #4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	bne _08032520
	b _08032534
_08032508:
	.4byte 0x09FE2FFE
_0803250C:
	.4byte 0x09FE20F8
_08032510:
	.4byte 0x09FE209D
_08032514:
	.4byte 0x04000208
_08032518:
	.4byte 0x04000204
_0803251C:
	.4byte 0x0000FFFE
_08032520:
	ldr r0, [r7, #0x18]
	movs r1, #0x20
	strh r1, [r0]
	ldr r4, [r7, #4]
	bl _call_via_r4
	ldr r0, [r7, #0x18]
	movs r1, #0
	strh r1, [r0]
	b _080324F2
_08032534:
	b _0803255C
_08032536:
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r1, #6]
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldrh r0, [r0, #4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _0803255C
	ldr r0, [r7, #0x18]
	movs r1, #0x20
	strh r1, [r0]
	ldr r4, [r7, #4]
	bl _call_via_r4
	ldr r0, [r7, #0x18]
	movs r1, #0
	strh r1, [r0]
_0803255C:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x14
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0xc
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #0x20
	pop {r4, r7}
	pop {r0}
	bx r0

	.global AGBPrintFlush1Block
	.thumb_func
	.type AGBPrintFlush1Block, %function
AGBPrintFlush1Block: @ 08032578
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl AGBPrintTransferDataInternal
	pop {r7}
	pop {r0}
	bx r0

	.global AGBPrintFlush
	.thumb_func
	.type AGBPrintFlush, %function
AGBPrintFlush: @ 08032588
	push {r7, lr}
	mov r7, sp
	movs r0, #1
	bl AGBPrintTransferDataInternal
	pop {r7}
	pop {r0}
	bx r0

	.global AGBAssert
	.thumb_func
	.type AGBAssert, %function
AGBAssert: @ 08032598
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _080325C4
	ldr r0, _080325C0
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080325D0
_080325C0:
	.4byte gUnk_0884CC48
_080325C4:
	ldr r0, _080325D8
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl AGBPrintf
_080325D0:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
_080325D8:
	.4byte gUnk_0884CC7C
