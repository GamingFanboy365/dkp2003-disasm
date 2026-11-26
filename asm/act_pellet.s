@ asm/act_pellet.s: ROM 0x028588-0x02896C (rom, VMA 0x08028588)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global act_pellet
	.thumb_func
	.type act_pellet, %function
act_pellet: @ 08028588
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r0, #0
	sub sp, #0xc
	cmp r6, #0
	bne _0802859E
	b _08028810
_0802859E:
	adds r3, r6, #0
	adds r3, #0xa0
	str r3, [sp, #8]
	movs r1, #1
	ldr r2, [r3, #0xc]
	rsbs r0, r1, #0
	cmp r2, r0
	bne _080285B0
	b _0802871A
_080285B0:
	ldr r5, _08028828
	lsls r4, r2, #2
	ldr r0, [r5, r4]
	ldr r1, [r6, #0x24]
	ldr r7, [r0, #0x24]
	ldr r3, [r0, #0x28]
	ldr r5, [r6, #0x28]
	subs r4, r7, r1
	subs r7, r3, r5
	ldr r1, [r6, #0x2c]
	ldr r5, [r0, #0x2c]
	adds r0, r7, #0
	muls r0, r7, r0
	subs r2, r5, r1
	adds r1, r4, #0
	muls r1, r4, r1
	mov fp, r2
	adds r5, r1, r0
	mov r1, fp
	muls r1, r2, r1
	ldr r2, _0802882C
	adds r0, r5, r1
	bl _call_via_r2
	lsls r4, r4, #0xc
	adds r5, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _080285EC
	b _0802880C
_080285EC:
	adds r1, r5, #0
	cmp r5, #0
	bge _080285F4
	b _08028808
_080285F4:
	ldr r3, _08028830
	bl _call_via_r3
	adds r2, r5, #0
	eors r2, r4
	str r0, [sp, #4]
	cmp r2, #0
	bge _08028606
	b _08028800
_08028606:
	lsls r4, r7, #0xc
	adds r0, r4, #0
	cmp r4, #0
	bge _08028610
	b _080287FC
_08028610:
	adds r1, r5, #0
	cmp r5, #0
	bge _08028618
	b _080287F8
_08028618:
	ldr r3, _08028830
	bl _call_via_r3
	adds r7, r5, #0
	eors r7, r4
	mov sb, r0
	cmp r7, #0
	bge _0802862A
	b _080287F0
_0802862A:
	mov r1, fp
	lsls r4, r1, #0xc
	adds r0, r4, #0
	cmp r4, #0
	bge _08028636
	b _080287EC
_08028636:
	adds r1, r5, #0
	cmp r5, #0
	bge _0802863E
	b _080287E8
_0802863E:
	ldr r7, _08028830
	bl _call_via_r7
	adds r2, r4, #0
	eors r2, r5
	cmp r2, #0
	bge _0802864E
	b _080287E4
_0802864E:
	ldr r3, [r6, #0x40]
	ldr r1, [r6, #0x44]
	ldr r5, [r6, #0x3c]
	mov r8, r3
	ldr r2, [sp, #4]
	mov sl, r1
	mov r1, r8
	adds r7, r2, #0
	muls r7, r5, r7
	mov r4, sb
	muls r4, r1, r4
	mov fp, r0
	asrs r1, r4, #0xc
	asrs r0, r7, #0xc
	adds r4, r0, r1
	mov r1, sl
	mov r7, fp
	muls r7, r1, r7
	movs r0, #0x80
	asrs r1, r7, #0xc
	adds r7, r4, r1
	ldr r3, [sp, #4]
	lsls r4, r0, #5
	subs r0, r4, r7
	adds r7, r0, #0
	muls r7, r3, r7
	mov r4, sb
	muls r4, r0, r4
	asrs r2, r7, #0xc
	adds r7, r5, r2
	asrs r2, r4, #0xc
	add r8, r2
	mov r5, fp
	muls r5, r0, r5
	mov r1, r8
	mov r0, r8
	muls r0, r1, r0
	adds r2, r7, #0
	muls r2, r7, r2
	asrs r4, r5, #0xc
	add sl, r4
	adds r5, r2, r0
	mov r2, sl
	mov r1, sl
	muls r1, r2, r1
	ldr r4, _0802882C
	adds r0, r5, r1
	bl _call_via_r4
	lsls r4, r7, #0xc
	adds r5, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _080286BC
	b _080287E0
_080286BC:
	adds r1, r5, #0
	cmp r5, #0
	bge _080286C4
	b _080287DC
_080286C4:
	ldr r3, _08028830
	bl _call_via_r3
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	bge _080286D4
	b _080287D8
_080286D4:
	mov r3, r8
	lsls r4, r3, #0xc
	str r0, [r6, #0x3c]
	adds r0, r4, #0
	cmp r4, #0
	bge _080286E2
	b _080287D4
_080286E2:
	adds r1, r5, #0
	cmp r5, #0
	bge _080286EA
	b _080287D0
_080286EA:
	adds r7, r5, #0
	ldr r3, _08028830
	eors r7, r4
	bl _call_via_r3
	cmp r7, #0
	blt _080287CC
_080286F8:
	mov r3, sl
	lsls r4, r3, #0xc
	str r0, [r6, #0x40]
	adds r0, r4, #0
	cmp r4, #0
	blt _080287C8
_08028704:
	adds r1, r5, #0
	cmp r5, #0
	blt _080287C4
_0802870A:
	ldr r7, _08028830
	bl _call_via_r7
	adds r2, r4, #0
	eors r2, r5
	cmp r2, #0
	blt _080287C0
_08028718:
	str r0, [r6, #0x44]
_0802871A:
	ldr r0, [r6, #0x24]
	adds r4, r6, #0
	adds r4, #0x84
	str r0, [r4]
	ldr r1, [r6, #0x28]
	adds r4, #4
	str r1, [r4]
	ldr r7, [r6, #0x2c]
	adds r4, #4
	str r7, [r4]
	ldr r2, _08028834
	ldr r3, [r6, #0x3c]
	muls r3, r2, r3
	asrs r7, r3, #0xc
	ldr r3, [r6, #0x40]
	muls r3, r2, r3
	asrs r3, r3, #0xc
	mov r8, r3
	ldr r3, [r6, #0x44]
	muls r3, r2, r3
	ldr r1, [r6, #0x24]
	ldr r0, [r6, #0x28]
	ldr r4, [r6, #0x2c]
	asrs r3, r3, #0xc
	mov sl, r3
	str r0, [r6, #0x34]
	adds r3, r1, r7
	str r4, [r6, #0x38]
	add r0, r8
	add r4, sl
	str r1, [r6, #0x30]
	str r3, [r6, #0x24]
	str r0, [r6, #0x28]
	ldr r2, _08028838
	adds r0, r6, #0
	str r4, [r6, #0x2c]
	bl _call_via_r2
	ldr r0, [sp, #8]
	ldr r1, [r6, #0x24]
	ldr r2, [r0]
	str r1, [r2]
	ldr r0, [r6, #0x28]
	str r0, [r2, #4]
	ldr r1, [r6, #0x2c]
	str r1, [r2, #8]
	ldr r3, [sp, #8]
	ldr r0, [r3, #4]
	subs r0, #2
	str r0, [r3, #4]
	cmp r0, #0
	ble _080287AE
	movs r1, #0xfa
	ldr r3, [r6, #0x28]
	lsls r0, r1, #5
	cmp r3, r0
	bls _0802879C
	ldr r1, [r2, #0x18]
	cmp r1, #0
	beq _08028796
	movs r0, #1
	str r0, [r2, #0x18]
_08028796:
	adds r0, r6, #0
	bl sub_08001FE8
_0802879C:
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080287AE:
	ldr r1, [r2, #0x18]
	cmp r1, #0
	beq _080287B8
	movs r0, #1
	str r0, [r2, #0x18]
_080287B8:
	adds r0, r6, #0
	bl sub_08001FE8
	b _0802879C
_080287C0:
	rsbs r0, r0, #0
	b _08028718
_080287C4:
	rsbs r1, r5, #0
	b _0802870A
_080287C8:
	rsbs r0, r4, #0
	b _08028704
_080287CC:
	rsbs r0, r0, #0
	b _080286F8
_080287D0:
	rsbs r1, r5, #0
	b _080286EA
_080287D4:
	rsbs r0, r4, #0
	b _080286E2
_080287D8:
	rsbs r0, r0, #0
	b _080286D4
_080287DC:
	rsbs r1, r5, #0
	b _080286C4
_080287E0:
	rsbs r0, r4, #0
	b _080286BC
_080287E4:
	rsbs r0, r0, #0
	b _0802864E
_080287E8:
	rsbs r1, r5, #0
	b _0802863E
_080287EC:
	rsbs r0, r4, #0
	b _08028636
_080287F0:
	mov r3, sb
	rsbs r3, r3, #0
	mov sb, r3
	b _0802862A
_080287F8:
	rsbs r1, r5, #0
	b _08028618
_080287FC:
	rsbs r0, r4, #0
	b _08028610
_08028800:
	adds r1, r0, #0
	rsbs r0, r1, #0
	str r0, [sp, #4]
	b _08028606
_08028808:
	rsbs r1, r5, #0
	b _080285F4
_0802880C:
	rsbs r0, r4, #0
	b _080285EC
_08028810:
	ldr r0, _0802883C
	ldr r1, _08028840
	str r0, [sp]
	ldr r2, _08028844
	ldr r0, _08028848
	movs r3, #0xed
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802859E
_08028828:
	.4byte 0x0200434C
_0802882C:
	.4byte sub_03000744
_08028830:
	.4byte sub_0300034C
_08028834:
	.4byte 0x00001388
_08028838:
	.4byte sub_03003750
_0802883C:
	.4byte 0x08052C68
_08028840:
	.4byte 0x08052C74
_08028844:
	.4byte 0x08052C88
_08028848:
	.4byte 0x08052C94

	.global init_pellet
	.thumb_func
	.type init_pellet, %function
init_pellet: @ 0802884C
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080288B6
_08028856:
	ldr r0, _08028864
	strh r0, [r4]
	bl sub_08002E78
	cmp r0, #0
	beq _080288AE
	b _08028868
_08028864:
	.4byte 0x00000001
_08028868:
	ldr r2, [r4, #0x24]
	str r2, [r0]
	ldr r1, [r4, #0x28]
	str r1, [r0, #4]
	ldr r2, [r4, #0x2c]
	movs r1, #0
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	movs r2, #0x3c
	adds r1, r4, #0
	str r2, [r0, #0x18]
	adds r1, #0xa0
	adds r2, #0xee
	str r2, [r0, #0x1c]
	str r0, [r1]
	movs r2, #0x80
	movs r0, #0x1e
	str r0, [r1, #4]
	lsls r1, r2, #3
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0
	movs r3, #0
	bl sub_08001C28
	adds r0, r4, #0
	bl obj_add_vector_hit
_080288A6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_080288AE:
	adds r0, r4, #0
	bl sub_08001FE8
	b _080288A6
_080288B6:
	ldr r0, _080288D0
	ldr r1, _080288D4
	str r0, [sp]
	ldr r2, _080288D8
	ldr r0, _080288DC
	movs r3, #0xbe
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08028856
	.byte 0x00, 0x00
_080288D0:
	.4byte 0x08052C68
_080288D4:
	.4byte 0x08052C74
_080288D8:
	.4byte 0x08052CD0
_080288DC:
	.4byte 0x08052C94

	.global react_pellet
	.thumb_func
	.type react_pellet, %function
react_pellet: @ 080288E0
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	adds r5, r1, #0
	cmp r4, #0
	beq _0802893A
_080288EC:
	cmp r5, #0
	beq _08028922
_080288F0:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r2, [r0]
	ldr r1, [r4, #0x30]
	str r1, [r2]
	ldr r0, [r4, #0x34]
	str r0, [r2, #4]
	ldr r1, [r4, #0x38]
	str r1, [r2, #8]
	ldr r1, [r2, #0x18]
	movs r0, #0
	str r0, [r2, #0xc]
	str r0, [r2, #0x10]
	str r0, [r2, #0x14]
	cmp r1, #0
	beq _08028914
	movs r1, #1
	str r1, [r2, #0x18]
_08028914:
	adds r0, r4, #0
	bl sub_08001FE8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08028922:
	ldr r0, _08028954
	ldr r1, _08028958
	str r0, [sp]
	ldr r2, _0802895C
	ldr r0, _08028960
	ldr r3, _08028964
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080288F0
_0802893A:
	ldr r0, _08028968
	movs r3, #0xa2
	str r0, [sp]
	ldr r1, _08028958
	ldr r0, _08028960
	ldr r2, _0802895C
	lsls r3, r3, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080288EC
_08028954:
	.4byte 0x08052CDC
_08028958:
	.4byte 0x08052C74
_0802895C:
	.4byte 0x08052CE8
_08028960:
	.4byte 0x08052C94
_08028964:
	.4byte 0x00000145
_08028968:
	.4byte 0x08052C68
