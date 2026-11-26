@ asm/act_tideanim.s: ROM 0x012904-0x012A20 (rom, VMA 0x08012904)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global act_tideanim
	.thumb_func
	.type act_tideanim, %function
act_tideanim: @ 08012904
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801299C
_0801290E:
	adds r6, r4, #0
	adds r6, #0xa0
	ldrb r2, [r6]
	adds r0, r2, #0
	cmp r0, #0
	beq _08012928
	adds r1, r2, #0
	adds r1, #0xff
	strb r1, [r6]
_08012920:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08012928:
	adds r7, r4, #0
	adds r7, #0x9c
	ldr r4, [r7]
	ldr r0, [r4, #0xc]
	ldrb r3, [r0, #1]
	ldrb r4, [r0, #4]
	lsls r1, r3, #2
	ldrb r3, [r6, #1]
	adds r2, r4, #0
	muls r2, r3, r2
	ldr r3, _080129B4
	ldr r3, [r3, r1]
	ldr r5, _080129B8
	lsls r2, r2, #1
	adds r1, r3, r2
	str r1, [r5]
	ldrb r1, [r0, #3]
	ldr r2, _080129BC
	lsls r3, r1, #1
	adds r0, r3, r2
	str r0, [r5, #4]
	movs r0, #0x80
	lsls r2, r0, #0x18
	orrs r4, r2
	str r4, [r5, #8]
	lsrs r2, r1, #4
	adds r1, #0x10
	asrs r1, r1, #4
	ldr r3, [r5, #8]
	cmp r2, r1
	bge _0801297C
	ldr r4, _080129C0
	mov ip, r1
	ldr r1, [r4]
	movs r0, #1
_0801296E:
	adds r3, r0, #0
	lsls r3, r2
	adds r2, #1
	orrs r1, r3
	cmp r2, ip
	blt _0801296E
	str r1, [r4]
_0801297C:
	ldr r0, [r7]
	ldr r2, [r0, #0xc]
	ldrb r1, [r2, #2]
	lsrs r0, r1, #1
	ldrb r1, [r6, #1]
	adds r1, #1
	strb r0, [r6]
	lsls r0, r1, #0x18
	strb r1, [r6, #1]
	lsrs r1, r0, #0x18
	ldrb r0, [r2, #5]
	cmp r1, r0
	bne _08012920
	movs r2, #0
	strb r2, [r6, #1]
	b _08012920
_0801299C:
	ldr r0, _080129C4
	ldr r1, _080129C8
	str r0, [sp]
	ldr r2, _080129CC
	ldr r0, _080129D0
	movs r3, #0x34
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801290E
_080129B4:
	.4byte 0x0884E334
_080129B8:
	.4byte 0x040000D4
_080129BC:
	.4byte 0x0201BB18
_080129C0:
	.4byte 0x0201BAF0
_080129C4:
	.4byte 0x08050BA0
_080129C8:
	.4byte 0x08050BAC
_080129CC:
	.4byte 0x08050BC0
_080129D0:
	.4byte 0x08050BD0

	.global init_tideanim
	.thumb_func
	.type init_tideanim, %function
init_tideanim: @ 080129D4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080129F8
_080129DE:
	ldr r2, _080129F4
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0
	strh r2, [r4]
	strb r1, [r0]
	strb r1, [r0, #1]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_080129F4:
	.4byte 0x00000005
_080129F8:
	ldr r0, _08012A10
	ldr r1, _08012A14
	str r0, [sp]
	ldr r2, _08012A18
	ldr r0, _08012A1C
	movs r3, #0x2a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080129DE
_08012A10:
	.4byte 0x08050BA0
_08012A14:
	.4byte 0x08050BAC
_08012A18:
	.4byte 0x08050C0C
_08012A1C:
	.4byte 0x08050BD0
