@ asm/act_hits.s: ROM 0x013A64-0x013C10 (rom, VMA 0x08013A64)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_hits
	.thumb_func
	.type init_hits, %function
init_hits: @ 08013A64
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08013A84
_08013A6E:
	ldr r1, _08013A80
	movs r0, #0x19
	strh r1, [r4]
	strb r0, [r4, #2]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08013A80:
	.4byte 0x00000001
_08013A84:
	ldr r0, _08013A9C
	ldr r1, _08013AA0
	str r0, [sp]
	ldr r2, _08013AA4
	ldr r0, _08013AA8
	movs r3, #0x35
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013A6E
_08013A9C:
	.4byte gUnk_08050FA4
_08013AA0:
	.4byte gUnk_08050FB0
_08013AA4:
	.4byte gUnk_08050FC0
_08013AA8:
	.4byte gUnk_08050FCC

	.global act_hits
	.thumb_func
	.type act_hits, %function
act_hits: @ 08013AAC
	push {lr}
	sub sp, #4
	cmp r0, #0
	beq _08013ACC
_08013AB4:
	ldr r2, _08013AE4
	ldr r0, [r2]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013AC6
	ldr r0, _08013AE8
	bl _call_via_r0
_08013AC6:
	add sp, #4
	pop {r0}
	bx r0
_08013ACC:
	ldr r0, _08013AEC
	ldr r1, _08013AF0
	str r0, [sp]
	ldr r2, _08013AF4
	ldr r0, _08013AF8
	movs r3, #0x3f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013AB4
_08013AE4:
	.4byte gFrameCount
_08013AE8:
	.4byte sub_030028D8
_08013AEC:
	.4byte gUnk_08050FA4
_08013AF0:
	.4byte gUnk_08050FB0
_08013AF4:
	.4byte gUnk_08051008
_08013AF8:
	.4byte gUnk_08050FCC

	.global act_sfx
	.thumb_func
	.type act_sfx, %function
act_sfx: @ 08013AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _08013C00
	adds r2, r1, #0
	adds r2, #0x8c
	ldr r0, [r2]
	cmp r0, #7
	beq _08013B78
	ldr r0, _08013C04
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0xa0
	ldr r0, [r2, #4]
	cmp r0, #4
	beq _08013B2E
_08013B20:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08013B2E:
	ldr r2, _08013C08
	ldr r6, [r2]
	ldr r5, _08013C0C
	lsls r0, r6, #2
	ldr r6, [r5, r0]
	ldr r3, [r1, #0x24]
	ldr r5, [r6, #0x24]
	subs r0, r5, r3
	ldr r2, [r1, #0x28]
	asrs r5, r0, #8
	ldr r0, [r6, #0x28]
	subs r3, r0, r2
	asrs r0, r3, #8
	ldr r2, [r1, #0x2c]
	ldr r3, [r6, #0x2c]
	subs r3, r3, r2
	asrs r1, r3, #8
	adds r2, r0, #0
	muls r2, r0, r2
	adds r3, r5, #0
	muls r3, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	adds r3, r3, r2
	adds r2, r3, r0
	movs r0, #0x80
	lsls r1, r0, #9
	cmp r2, r1
	bge _08013B20
	movs r0, #0x98
	lsls r3, r0, #1
	adds r0, r6, r3
	movs r1, #0x96
	str r2, [r0]
	lsls r2, r1, #1
	adds r1, r6, r2
	b _08013BF8
_08013B78:
	ldr r6, _08013C08
	ldr r2, [r6]
	ldr r0, _08013C0C
	lsls r7, r2, #2
	ldr r6, [r0, r7]
	movs r7, #0x80
	lsls r3, r7, #4
	mov r8, r3
	movs r3, #0
	mov lr, r3
	adds r3, r1, #0
	adds r3, #0x88
	movs r1, #0
	ldrsh r3, [r3, r1]
	movs r7, #0
	cmp lr, r3
	bge _08013BE2
	mov sb, r2
	mov sl, r3
	mov ip, r0
_08013BA0:
	cmp r7, sb
	beq _08013BD8
	mov r2, ip
	ldr r4, [r2]
	ldr r0, [r6, #0x24]
	ldr r5, [r4, #0x24]
	ldr r3, [r6, #0x28]
	subs r1, r5, r0
	ldr r0, [r4, #0x28]
	asrs r5, r1, #8
	subs r1, r0, r3
	asrs r0, r1, #8
	ldr r2, [r6, #0x2c]
	ldr r1, [r4, #0x2c]
	subs r3, r1, r2
	asrs r1, r3, #8
	adds r2, r5, #0
	muls r2, r5, r2
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r2, r3
	adds r3, r1, #0
	muls r3, r1, r3
	adds r2, r0, r3
	cmp r2, r8
	bge _08013BD8
	mov lr, r4
	mov r8, r2
_08013BD8:
	movs r2, #4
	adds r7, #1
	add ip, r2
	cmp r7, sl
	blt _08013BA0
_08013BE2:
	mov r1, lr
	cmp r1, #0
	beq _08013B20
	movs r2, #0x98
	lsls r1, r2, #1
	add r1, lr
	mov r2, r8
	movs r3, #0x96
	str r2, [r1]
	lsls r1, r3, #1
	add r1, lr
_08013BF8:
	movs r0, #1
	str r0, [r1]
	b _08013B20
	.byte 0x00, 0x00
_08013C00:
	.4byte gGameSetup
_08013C04:
	.4byte 0x0200436C
_08013C08:
	.4byte gLocalPlayerIndex
_08013C0C:
	.4byte gRacerObjects
