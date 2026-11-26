@ asm/weapon.s: ROM 0x02C0E0-0x02C45C (rom, VMA 0x0802C0E0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global weaponAllocate
	.thumb_func
	.type weaponAllocate, %function
weaponAllocate: @ 0802C0E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r3, _0802C1B0
	movs r2, #0
	ldrsh r1, [r3, r2]
	sub sp, #4
	movs r4, #0
	cmp r1, #1
	beq _0802C194
	movs r1, #0x85
	lsls r2, r1, #1
	adds r3, r2, r0
	ldrh r1, [r3]
	adds r5, r0, #0
	adds r5, #0xa0
	mov r8, r3
	cmp r1, #0
	beq _0802C118
_0802C108:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802C118:
	ldr r1, [r5]
	movs r3, #8
	ands r1, r3
	cmp r1, #0
	bne _0802C108
	bl sub_0800A804
	adds r4, r0, #0
	bl sub_08000B78
	adds r7, r0, #0
	ldr r0, _0802C1B4
	mov lr, r0
	ldr r0, _0802C1B8
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
_0802C148:
	ldr r3, [r4]
	mov r0, lr
	muls r0, r3, r0
	adds r3, r0, #0
	asrs r0, r3, #8
	adds r1, r1, r0
	cmp r7, r1
	bge _0802C160
	mov r4, sl
	adds r6, r2, #0
	add r4, ip
	movs r2, #9
_0802C160:
	adds r2, #1
	adds r4, #0x20
	cmp r2, #8
	ble _0802C148
	ldr r4, [r5]
	movs r1, #1
	orrs r4, r1
	mov r2, r8
	str r4, [r5]
	strh r6, [r2]
	movs r4, #1
	cmp r6, #0
	bne _0802C108
	ldr r2, _0802C1BC
	movs r3, #0xa5
	str r2, [sp]
	ldr r0, _0802C1C0
	ldr r1, _0802C1C4
	ldr r2, _0802C1C8
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C108
_0802C194:
	ldr r0, _0802C1CC
	movs r3, #0x97
	str r0, [sp]
	ldr r1, _0802C1C4
	ldr r0, _0802C1C0
	ldr r2, _0802C1C8
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C108
	.byte 0x00, 0x00
_0802C1B0:
	.4byte 0x0202D74C
_0802C1B4:
	.4byte 0x00028F5C
_0802C1B8:
	.4byte 0x0202EC44
_0802C1BC:
	.4byte gUnk_080533D8
_0802C1C0:
	.4byte gUnk_080533E4
_0802C1C4:
	.4byte gUnk_08053420
_0802C1C8:
	.4byte gUnk_08053430
_0802C1CC:
	.4byte gUnk_08053440

	.global weaponManager
	.thumb_func
	.type weaponManager, %function
weaponManager: @ 0802C1D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	bne _0802C1DC
	b _0802C3F2
_0802C1DC:
	ldrb r1, [r5, #2]
	movs r6, #0x80
	adds r1, #0xff
	lsls r4, r1, #0x18
	lsls r2, r6, #0x11
	cmp r4, r2
	bls _0802C200
	ldr r7, _0802C25C
	ldr r0, _0802C260
	ldr r1, _0802C264
	ldr r2, _0802C268
	ldr r3, _0802C26C
	str r7, [sp]
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_0802C200:
	movs r4, #0x85
	lsls r3, r4, #1
	adds r4, r5, r3
	ldrh r0, [r4]
	adds r7, r5, #0
	movs r6, #0
	adds r7, #0xa0
	cmp r0, #0
	bne _0802C214
	b _0802C3B0
_0802C214:
	ldr r1, [r7]
	ldr r0, _0802C270
	ands r1, r0
	cmp r1, #2
	beq _0802C274
_0802C21E:
	adds r0, r5, #0
	adds r0, #0xfc
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldrh r2, [r0]
	cmp r3, #0
	beq _0802C236
	subs r1, r2, #2
	lsls r2, r1, #0x10
	strh r1, [r0]
	cmp r2, #0
	ble _0802C248
_0802C236:
	ldr r0, [r7]
	movs r1, #3
	rsbs r3, r1, #0
	ands r0, r3
	str r0, [r7]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802C248:
	ldr r2, _0802C258
	strh r2, [r0]
	ldr r0, [r7]
	movs r1, #5
	rsbs r3, r1, #0
	ands r0, r3
	str r0, [r7]
	b _0802C236
_0802C258:
	.4byte 0x00000000
_0802C25C:
	.4byte gUnk_08053444
_0802C260:
	.4byte gUnk_080533E4
_0802C264:
	.4byte gUnk_08053420
_0802C268:
	.4byte gUnk_08053484
_0802C26C:
	.4byte 0x00000173
_0802C270:
	.4byte 0x0000219E
_0802C274:
	ldrh r3, [r4]
	subs r3, #1
	cmp r3, #9
	bls _0802C27E
	b _0802C398
_0802C27E:
	ldr r2, _0802C2F0
	lsls r0, r3, #2
	ldr r1, [r0, r2]
	mov pc, r1
	.byte 0x00, 0x00
	.global _0802C288
_0802C288:
	.4byte _0802C2B0
	.4byte _0802C2F4
	.4byte _0802C2FE
	.4byte _0802C30C
	.4byte _0802C31A
	.4byte _0802C330
	.4byte _0802C34E
	.4byte _0802C360
	.4byte _0802C372
	.4byte _0802C37E
	.global _0802C2B0
_0802C2B0:
	adds r0, r5, #0
	bl sub_0802AE80
_0802C2B6:
	ldr r2, _0802C2E4
_0802C2B8:
	movs r6, #1
	strh r2, [r4]
_0802C2BC:
	cmp r6, #0
	beq _0802C236
	ldr r0, [r7]
	movs r3, #5
	orrs r0, r3
	str r0, [r7]
	ldrb r1, [r5, #2]
	cmp r1, #1
	beq _0802C2D8
	adds r0, r5, #0
	ldr r1, _0802C2E8
	adds r0, #0xfc
	strh r1, [r0]
	b _0802C236
_0802C2D8:
	adds r1, r5, #0
	ldr r2, _0802C2EC
	adds r1, #0xfc
	strh r2, [r1]
	b _0802C236
	.byte 0x00, 0x00
_0802C2E4:
	.4byte 0x00000000
_0802C2E8:
	.4byte 0x0000001E
_0802C2EC:
	.4byte 0x0000000F
_0802C2F0:
	.4byte _0802C288
	.global _0802C2F4
_0802C2F4:
	adds r0, r5, #0
	bl sub_0802AE80
	ldr r1, _0802C324
	b _0802C36C
	.global _0802C2FE
_0802C2FE:
	adds r0, r5, #0
	bl sub_08028F20
	cmp r0, #0
	beq _0802C2BC
	ldr r0, _0802C328
	b _0802C38A
	.global _0802C30C
_0802C30C:
	adds r0, r5, #0
	bl sub_08028F20
	cmp r0, #0
	beq _0802C2BC
	ldr r2, _0802C32C
	b _0802C2B8
	.global _0802C31A
_0802C31A:
	adds r0, r5, #0
	bl sub_0802B5B0
	b _0802C36A
	.byte 0x00, 0x00
_0802C324:
	.4byte 0x00000009
_0802C328:
	.4byte 0x00000000
_0802C32C:
	.4byte 0x0000000A
	.global _0802C330
_0802C330:
	ldrb r3, [r5, #2]
	cmp r3, #1
	beq _0802C346
	cmp r3, #2
	beq _0802C33E
_0802C33A:
	ldr r0, _0802C35C
	b _0802C38A
_0802C33E:
	adds r0, r5, #0
	bl sub_0800E840
	b _0802C33A
_0802C346:
	adds r0, r5, #0
	bl sub_0800A9FC
	b _0802C33A
	.global _0802C34E
_0802C34E:
	ldrb r6, [r5, #2]
	cmp r6, #1
	bne _0802C2B6
	adds r0, r5, #0
	bl sub_0802BCC0
	b _0802C2B6
_0802C35C:
	.4byte 0x00000000
	.global _0802C360
_0802C360:
	adds r0, r5, #0
	bl sub_0802A000
	cmp r0, #0
	beq _0802C2BC
_0802C36A:
	ldr r1, _0802C390
_0802C36C:
	movs r6, #1
	strh r1, [r4]
	b _0802C2BC
	.global _0802C372
_0802C372:
	adds r0, r5, #0
	bl sub_0802AE80
	movs r6, #1
	strh r6, [r4]
	b _0802C2BC
	.global _0802C37E
_0802C37E:
	adds r0, r5, #0
	bl sub_08028F20
	cmp r0, #0
	beq _0802C2BC
	ldr r0, _0802C394
_0802C38A:
	movs r6, #1
	strh r0, [r4]
	b _0802C2BC
_0802C390:
	.4byte 0x00000000
_0802C394:
	.4byte 0x00000003
_0802C398:
	ldr r2, _0802C410
	ldr r0, _0802C414
	str r2, [sp]
	ldr r1, _0802C418
	ldr r2, _0802C41C
	ldr r3, _0802C420
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C2BC
_0802C3B0:
	ldr r0, [r7]
	ldr r3, _0802C424
	ands r0, r3
	cmp r0, #2
	beq _0802C3BC
	b _0802C21E
_0802C3BC:
	ldrb r2, [r5, #2]
	cmp r2, #1
	beq _0802C3C4
	b _0802C21E
_0802C3C4:
	movs r4, #0x81
	lsls r1, r4, #1
	adds r4, r5, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0802C3D4
	b _0802C21E
_0802C3D4:
	adds r0, r5, #0
	bl sub_08028250
	ldr r0, [r7]
	movs r3, #4
	orrs r0, r3
	str r0, [r7]
	ldrh r1, [r4]
	adds r0, r5, #0
	ldr r2, _0802C40C
	subs r1, #1
	adds r0, #0xfc
	strh r1, [r4]
	strh r2, [r0]
	b _0802C236
_0802C3F2:
	ldr r0, _0802C428
	movs r4, #0xb9
	str r0, [sp]
	ldr r1, _0802C418
	ldr r0, _0802C414
	ldr r2, _0802C41C
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802C1DC
_0802C40C:
	.4byte 0x0000000A
_0802C410:
	.4byte gUnk_08053440
_0802C414:
	.4byte gUnk_080533E4
_0802C418:
	.4byte gUnk_08053420
_0802C41C:
	.4byte gUnk_08053484
_0802C420:
	.4byte 0x0000020E
_0802C424:
	.4byte 0x0000219E
_0802C428:
	.4byte gUnk_08053494

	.global sub_0802C42C
	.thumb_func
	.type sub_0802C42C, %function
sub_0802C42C: @ 0802C42C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	asrs r0, r3, #5
	adds r6, r1, #0
	adds r1, r0, #1
	movs r5, #0
	movs r4, #1
	adds r3, r1, r2
	movs r0, #0x1f
_0802C43E:
	cmp r7, r3
	bgt _0802C448
	cmp r6, r2
	blt _0802C448
	orrs r5, r4
_0802C448:
	subs r0, #1
	adds r3, r3, r1
	adds r2, r2, r1
	lsls r4, r4, #1
	cmp r0, #0
	bge _0802C43E
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
