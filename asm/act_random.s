@ asm/act_random.s: ROM 0x012430-0x01250C (rom, VMA 0x08012430)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_random
	.thumb_func
	.type init_random, %function
init_random: @ 08012430
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _08012486
_0801243A:
	ldr r2, _08012474
	adds r4, r5, #0
	adds r4, #0xa0
	movs r1, #0
	strh r2, [r5]
	str r1, [r4]
	str r1, [r4, #4]
	adds r4, r5, #0
	adds r4, #0x9c
	ldr r0, [r4]
	ldr r2, [r0, #0xc]
	adds r0, r5, #0
	ldrb r1, [r2, #1]
	movs r2, #1
	bl obj_setup_sprite
	adds r1, r5, #0
	adds r1, #0x5a
	ldrh r2, [r1]
	movs r0, #0x18
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	ldrh r2, [r0, #2]
	lsls r3, r2, #2
	ldr r2, _08012478
	adds r0, r1, r2
	b _0801247C
_08012474:
	.4byte 0x00000001
_08012478:
	.4byte 0x02018F34
_0801247C:
	strh r3, [r0, #0xa]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08012486:
	ldr r0, _080124A0
	ldr r1, _080124A4
	str r0, [sp]
	ldr r2, _080124A8
	ldr r0, _080124AC
	movs r3, #0x1b
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801243A
	.byte 0x00, 0x00
_080124A0:
	.4byte 0x08050AA0
_080124A4:
	.4byte 0x08050AAC
_080124A8:
	.4byte 0x08050AC0
_080124AC:
	.4byte 0x08050ACC

	.global react_random
	.thumb_func
	.type react_random, %function
react_random: @ 080124B0
	push {r4, lr}
	sub sp, #4
	adds r4, r1, #0
	cmp r0, #0
	beq _080124DE
_080124BA:
	cmp r4, #0
	beq _080124C6
_080124BE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_080124C6:
	ldr r0, _080124F8
	ldr r1, _080124FC
	str r0, [sp]
	ldr r2, _08012500
	ldr r0, _08012504
	movs r3, #0x52
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080124BE
_080124DE:
	ldr r0, _08012508
	ldr r1, _080124FC
	str r0, [sp]
	ldr r2, _08012500
	ldr r0, _08012504
	movs r3, #0x51
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080124BA
	.byte 0x00, 0x00
_080124F8:
	.4byte 0x08050B08
_080124FC:
	.4byte 0x08050AAC
_08012500:
	.4byte 0x08050B14
_08012504:
	.4byte 0x08050ACC
_08012508:
	.4byte 0x08050AA0
