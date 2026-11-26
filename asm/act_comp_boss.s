@ asm/act_comp_boss.s: ROM 0x027474-0x028588 (rom, VMA 0x08027474)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_comp_boss
	.thumb_func
	.type init_comp_boss, %function
init_comp_boss: @ 08027474
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0x1c
	cmp r7, #0
	bne _0802748A
	b _08027908
_0802748A:
	ldr r2, _080274C4
	ldr r0, _080274C8
	strh r2, [r7]
	mov sl, r0
	adds r0, r7, #0
	bl sub_080036BC
	mov sb, r0
	ldr r0, _080274CC
	movs r2, #0
	ldrsh r5, [r0, r2]
	movs r6, #0x2c
	adds r4, r5, #0
	muls r4, r6, r4
	ldr r0, _080274D0
	ldr r1, [r0]
	adds r5, r1, r4
	str r5, [sp, #0x18]
	ldr r1, _080274D4
	ldrh r3, [r5, #6]
	ldr r6, [r1]
	ldr r2, [sp, #0x18]
	lsls r4, r3, #2
	mov fp, r3
	adds r3, r4, r6
	ldrh r5, [r2, #8]
	mov lr, r1
	b _080274D8
	.byte 0x00, 0x00
_080274C4:
	.4byte 0x00000001
_080274C8:
	.4byte 0x0202EA14
_080274CC:
	.4byte 0x0202EBFC
_080274D0:
	.4byte 0x0202EBF4
_080274D4:
	.4byte 0x0202EBF8
_080274D8:
	ldrh r1, [r3]
	str r1, [sp, #0xc]
	cmp r5, #1
	ble _0802755C
	movs r4, #0
	cmp r5, #0
	beq _080274F6
	adds r1, r3, #2
	adds r2, r5, #0
_080274EA:
	ldrh r6, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r6
	cmp r2, #0
	bne _080274EA
_080274F6:
	movs r3, #0x80
	lsls r6, r3, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _08027502
	b _08027904
_08027502:
	adds r0, r6, #0
	ldr r2, _080277F8
	bl _call_via_r2
	adds r1, r6, #0
	eors r1, r4
	mov r8, r0
	cmp r1, #0
	bge _08027516
	b _080278FC
_08027516:
	bl sub_08000B78
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	blt _08027526
	b _080278F4
_08027526:
	ldr r0, _080277FC
	mov r1, fp
	ldr r6, [r0]
	mov lr, r0
	lsls r0, r1, #2
	adds r1, r0, r6
	mov r0, fp
	adds r3, r0, r5
	lsls r3, r3, #2
	mov fp, r3
_0802753A:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _08027552
	ldrh r3, [r1]
	mov r2, fp
	str r3, [sp, #0xc]
	adds r1, r2, r6
	adds r2, r5, #0
_08027552:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _0802753A
	ldr r0, _08027800
_0802755C:
	ldr r3, [sp, #0xc]
	movs r2, #0x2c
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r5, [r0]
	adds r1, r5, r6
	str r1, [sp, #0x14]
	ldrh r5, [r1, #6]
	mov fp, r5
	ldrh r5, [r1, #8]
	mov r1, lr
	ldr r2, [r1]
	mov r4, fp
	lsls r6, r4, #2
	adds r3, r6, r2
	ldrh r4, [r3]
	str r4, [sp, #8]
	cmp r5, #1
	ble _080275FC
	movs r4, #0
	cmp r5, #0
	beq _08027598
	adds r1, r3, #2
	adds r2, r5, #0
_0802758C:
	ldrh r0, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r0
	cmp r2, #0
	bne _0802758C
_08027598:
	movs r1, #0x80
	lsls r6, r1, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _080275A4
	b _080278F0
_080275A4:
	ldr r2, _080277F8
	adds r0, r6, #0
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	mov r8, r0
	cmp r2, #0
	bge _080275B8
	b _080278E8
_080275B8:
	bl sub_08000B78
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	blt _080275C8
	b _080278E0
_080275C8:
	ldr r3, _080277FC
	mov r0, fp
	ldr r6, [r3]
	mov lr, r3
	lsls r3, r0, #2
	adds r1, r3, r6
	adds r3, r0, r5
	lsls r3, r3, #2
	mov fp, r3
_080275DA:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _080275F2
	ldrh r3, [r1]
	mov r2, fp
	str r3, [sp, #8]
	adds r1, r2, r6
	adds r2, r5, #0
_080275F2:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _080275DA
	ldr r0, _08027800
_080275FC:
	ldr r3, [sp, #8]
	movs r2, #0x2c
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r5, [r0]
	adds r4, r5, r6
	str r4, [sp, #0x10]
	mov r1, lr
	ldrh r5, [r4, #6]
	ldrh r6, [r4, #8]
	ldr r4, [r1]
	lsls r1, r5, #2
	adds r2, r1, r4
	ldrh r4, [r2]
	mov fp, r5
	str r4, [sp, #4]
	cmp r6, #1
	ble _08027698
	movs r5, #0
	cmp r6, #0
	beq _08027636
	adds r2, #2
	adds r1, r6, #0
_0802762A:
	ldrh r0, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r0
	cmp r1, #0
	bne _0802762A
_08027636:
	movs r1, #0x80
	lsls r4, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _08027642
	b _080278DC
_08027642:
	ldr r2, _080277F8
	adds r0, r4, #0
	bl _call_via_r2
	adds r2, r4, #0
	eors r2, r5
	mov r8, r0
	cmp r2, #0
	bge _08027656
	b _080278D4
_08027656:
	bl sub_08000B78
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r6
	bge _08027696
	ldr r4, _080277FC
	ldr r2, [r4]
	mov r4, fp
	lsls r0, r4, #2
	adds r4, r0, r2
	mov r0, fp
	adds r3, r0, r6
	lsls r3, r3, #2
	mov lr, r3
_08027676:
	ldrh r3, [r4, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r5, r5, r3
	cmp ip, r5
	bge _0802768E
	ldrh r3, [r4]
	mov r1, lr
	str r3, [sp, #4]
	adds r4, r1, r2
	adds r1, r6, #0
_0802768E:
	adds r1, #1
	adds r4, #4
	cmp r1, r6
	blt _08027676
_08027696:
	ldr r0, _08027800
_08027698:
	ldr r1, [sp, #4]
	movs r5, #0x2c
	muls r5, r1, r5
	ldr r3, [sp, #0x18]
	ldr r4, [r0]
	adds r2, r4, r5
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r5, r0, #8
	mov r0, sl
	str r5, [r0, #0x30]
	ldr r5, [sp, #0x14]
	movs r4, #0
	ldrsh r3, [r5, r4]
	lsls r4, r3, #8
	str r4, [r0, #0x34]
	ldr r3, [sp, #0x10]
	movs r0, #0
	ldrsh r5, [r3, r0]
	lsls r0, r5, #8
	mov r5, sl
	str r0, [r5, #0x38]
	movs r0, #0
	ldrsh r3, [r2, r0]
	lsls r4, r3, #8
	str r4, [r5, #0x3c]
	ldr r3, [sp, #0x18]
	movs r4, #2
	ldrsh r0, [r3, r4]
	lsls r5, r0, #8
	mov r0, sl
	str r5, [r0, #0x40]
	ldr r5, [sp, #0x14]
	movs r4, #2
	ldrsh r3, [r5, r4]
	lsls r4, r3, #8
	str r4, [r0, #0x44]
	ldr r3, [sp, #0x10]
	movs r0, #2
	ldrsh r5, [r3, r0]
	lsls r0, r5, #8
	mov r5, sl
	str r0, [r5, #0x48]
	movs r0, #2
	ldrsh r3, [r2, r0]
	lsls r4, r3, #8
	str r4, [r5, #0x4c]
	ldr r3, [sp, #0x18]
	movs r4, #4
	ldrsh r0, [r3, r4]
	lsls r5, r0, #8
	mov r0, sl
	str r5, [r0, #0x50]
	ldr r5, [sp, #0x14]
	movs r4, #4
	ldrsh r3, [r5, r4]
	lsls r4, r3, #8
	str r4, [r0, #0x54]
	ldr r3, [sp, #0x10]
	movs r0, #4
	ldrsh r5, [r3, r0]
	lsls r0, r5, #8
	mov r5, sl
	str r0, [r5, #0x58]
	movs r0, #4
	ldrsh r4, [r2, r0]
	lsls r0, r4, #8
	str r0, [r5, #0x5c]
	mov r3, sl
	str r1, [r5, #0x2c]
	movs r1, #1
	movs r0, #0
	rsbs r4, r1, #0
	adds r3, #0xe4
	str r0, [r5, #0x60]
	str r4, [r3]
	ldr r2, [r7, #0x24]
	adds r1, r7, #0
	adds r1, #0x84
	str r2, [r1]
	ldr r2, [r7, #0x28]
	adds r1, #4
	str r2, [r1]
	ldr r2, [r7, #0x2c]
	adds r1, #4
	str r2, [r1]
	ldr r2, [r7, #0x28]
	ldr r1, [r7, #0x24]
	str r2, [r7, #0x34]
	ldr r2, [r7, #0x2c]
	str r1, [r7, #0x30]
	str r2, [r7, #0x38]
	str r1, [r5, #0x64]
	ldr r1, [r7, #0x28]
	str r1, [r5, #0x68]
	ldr r2, [r7, #0x2c]
	str r2, [r5, #0x6c]
	ldr r1, [r7, #0x24]
	str r1, [r5, #0x70]
	ldr r2, [r7, #0x28]
	str r2, [r5, #0x74]
	ldr r1, [r7, #0x2c]
	str r1, [r5, #0x78]
	movs r5, #0x92
	lsls r2, r5, #1
	movs r3, #0x80
	adds r1, r7, #0
	adds r1, #0xa0
	adds r5, r7, r2
	lsls r2, r3, #9
	str r4, [r1, #8]
	str r2, [r5]
	movs r2, #0x94
	lsls r3, r2, #1
	adds r2, r7, r3
	str r4, [r2]
	movs r5, #0x96
	lsls r2, r5, #1
	mov r5, sb
	ldr r3, [r5, #0x14]
	add r2, sl
	str r3, [r2]
	movs r3, #0x94
	lsls r2, r3, #1
	ldr r3, [r5, #0x18]
	add r2, sl
	str r3, [r2]
	movs r3, #0x9c
	lsls r2, r3, #1
	add r2, sl
	movs r3, #0xec
	str r0, [r2]
	lsls r2, r3, #1
	ldr r3, [r5, #0x1c]
	add r2, sl
	str r3, [r2]
	movs r3, #0xee
	lsls r2, r3, #1
	ldr r3, [r5, #0x20]
	add r2, sl
	movs r5, #0x85
	str r3, [r2]
	lsls r2, r5, #1
	adds r5, r7, r2
	ldr r2, _080277F4
	strh r2, [r5]
	adds r2, r7, #0
	ldrh r5, [r1, #0xe]
	adds r2, #0x56
	strh r5, [r2]
	strh r5, [r1, #0x38]
	ldr r5, [r7, #0x24]
	str r5, [r1, #0x3c]
	ldr r2, [r7, #0x28]
	str r2, [r1, #0x40]
	movs r2, #0x81
	ldr r5, [r7, #0x2c]
	lsls r3, r2, #1
	adds r2, r7, r3
	str r5, [r1, #0x44]
	strh r0, [r2]
	movs r2, #0xe
	ldrsh r3, [r1, r2]
	movs r1, #0xae
	lsls r2, r1, #1
	add r2, sl
	movs r1, #0xb0
	mov r5, sl
	str r3, [r5, #8]
	str r0, [r2]
	lsls r2, r1, #1
	add r2, sl
	movs r1, #0xb2
	b _08027804
_080277F4:
	.4byte 0x0000000B
_080277F8:
	.4byte sub_0300034C
_080277FC:
	.4byte 0x0202EBF8
_08027800:
	.4byte 0x0202EBF4
_08027804:
	str r0, [r2]
	lsls r2, r1, #1
	add r2, sl
	movs r3, #9
_0802780C:
	subs r3, #1
	stm r2!, {r4}
	cmp r3, #0
	bge _0802780C
	movs r0, #0xc8
	lsls r1, r0, #1
	add r1, sl
	movs r0, #0
	movs r2, #0xca
	str r0, [r1]
	lsls r1, r2, #1
	add r1, sl
	str r0, [r1]
	movs r2, #1
	movs r0, #0xcc
	rsbs r1, r2, #0
	lsls r2, r0, #1
	add r2, sl
	movs r3, #9
_08027832:
	subs r3, #1
	stm r2!, {r1}
	cmp r3, #0
	bge _08027832
	movs r0, #0xe0
	lsls r1, r0, #1
	mov r0, sb
	ldr r3, [r0, #0x2c]
	add r1, sl
	str r3, [r1]
	movs r3, #0xe2
	lsls r1, r3, #1
	ldr r3, [r0, #0x30]
	add r1, sl
	str r3, [r1]
	movs r3, #0xe4
	lsls r1, r3, #1
	ldr r3, [r0, #0x34]
	add r1, sl
	str r3, [r1]
	movs r3, #0xe6
	lsls r1, r3, #1
	ldr r3, [r0, #0x4c]
	add r1, sl
	str r3, [r1]
	movs r3, #0xe8
	lsls r1, r3, #1
	ldr r3, [r0, #0x50]
	add r1, sl
	str r3, [r1]
	movs r3, #0xea
	lsls r1, r3, #1
	ldr r3, [r0, #0x54]
	add r1, sl
	str r3, [r1]
	mov r2, sl
	ldr r1, [r0, #0x44]
	adds r2, #0xdc
	str r1, [r2]
	ldr r1, [r0, #0x48]
	adds r2, #4
	str r1, [r2]
	movs r3, #0x9e
	lsls r1, r3, #1
	ldr r3, [r0, #0x4c]
	add r1, sl
	str r3, [r1]
	movs r3, #0xa0
	lsls r1, r3, #1
	ldr r3, [r0, #0x58]
	add r1, sl
	str r3, [r1]
	movs r3, #0xa2
	lsls r1, r3, #1
	ldr r3, [r0, #0x50]
	add r1, sl
	str r3, [r1]
	movs r3, #0xa4
	lsls r1, r3, #1
	ldr r3, [r0, #0x5c]
	add r1, sl
	str r3, [r1]
	movs r3, #0xa6
	lsls r1, r3, #1
	ldr r3, [r0, #0x54]
	add r1, sl
	str r3, [r1]
	movs r3, #0xa8
	lsls r1, r3, #1
	ldr r3, [r0, #0x60]
	add r1, sl
	str r3, [r1]
	add sp, #0x1c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080278D4:
	mov r4, r8
	rsbs r4, r4, #0
	mov r8, r4
	b _08027656
_080278DC:
	rsbs r1, r5, #0
	b _08027642
_080278E0:
	ldr r3, _08027920
	ldr r0, _08027924
	mov lr, r3
	b _080275FC
_080278E8:
	mov r2, r8
	rsbs r2, r2, #0
	mov r8, r2
	b _080275B8
_080278F0:
	rsbs r1, r4, #0
	b _080275A4
_080278F4:
	ldr r3, _08027920
	ldr r0, _08027924
	mov lr, r3
	b _0802755C
_080278FC:
	mov r3, r8
	rsbs r3, r3, #0
	mov r8, r3
	b _08027516
_08027904:
	rsbs r1, r4, #0
	b _08027502
_08027908:
	ldr r0, _08027928
	ldr r1, _0802792C
	str r0, [sp]
	ldr r2, _08027930
	ldr r0, _08027934
	ldr r3, _08027938
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802748A
_08027920:
	.4byte 0x0202EBF8
_08027924:
	.4byte 0x0202EBF4
_08027928:
	.4byte 0x08052BD0
_0802792C:
	.4byte 0x08052BDC
_08027930:
	.4byte 0x08052BF0
_08027934:
	.4byte 0x08052C00
_08027938:
	.4byte 0x0000063A

	.global act_comp_boss
	.thumb_func
	.type act_comp_boss, %function
act_comp_boss: @ 0802793C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0x20
	cmp r7, #0
	bne _08027952
	b _08027F84
_08027952:
	movs r1, #0xa0
	adds r0, r1, r7
	ldr r1, _08027B34
	mov r8, r1
	ldr r1, [r0, #8]
	mov sl, r0
	cmp r1, #0
	bne _08027964
	b _08027EE0
_08027964:
	cmp r1, #0
	bgt _0802796A
	b _08027E7A
_0802796A:
	cmp r1, #4
	ble _08027970
	b _08027E56
_08027970:
	add r0, sp, #0x14
	str r0, [sp]
	add r2, sp, #0x1c
	add r3, sp, #0x18
	adds r0, r7, #0
	mov r1, r8
	bl sub_0802642C
	mov r2, r8
	ldr r6, [r2, #0x64]
	ldr r1, [sp, #0x1c]
	ldr r4, [r2, #0x6c]
	ldr r5, [sp, #0x14]
	subs r0, r1, r6
	subs r1, r5, r4
	ldr r6, _08027B38
	bl _call_via_r6
	adds r2, r0, #0
	mov r3, r8
	lsls r4, r2, #0x10
	ldrh r0, [r3, #8]
	lsrs r1, r4, #0x10
	ldr r5, _08027B3C
	ldr r6, [r3, #8]
	bl _call_via_r5
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r3, r6, r1
	mov r0, r8
	str r3, [r0, #8]
	mov r1, r8
	adds r0, r7, #0
	bl sub_080267EC
	mov r1, sl
	ldr r3, [r1, #8]
	cmp r3, #4
	bne _080279C2
	b _08027DBE
_080279C2:
	cmp r3, #2
	bne _080279C8
	b _08027D24
_080279C8:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r2, #0xb9
	lsls r4, r2, #3
	adds r6, r0, #0
	muls r6, r4, r6
	movs r5, #0x84
	lsls r0, r5, #1
	add r0, r8
	asrs r3, r6, #0x10
	ldr r6, [r0]
	lsls r2, r3, #1
	adds r4, r2, r6
	movs r2, #8
	ldrsh r6, [r1, r2]
	ldr r5, _08027B40
	adds r0, r6, #0
	bl _call_via_r5
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r5, r0, #0x10
	ldr r1, _08027B44
	adds r0, r6, #0
	bl _call_via_r1
	lsls r6, r0, #0x10
	asrs r2, r6, #0x10
	adds r1, r4, #0
	muls r1, r2, r1
	mov r0, r8
	ldr r6, [r0, #0x64]
	asrs r3, r1, #0xc
	adds r1, r6, r3
	adds r6, r4, #0
	muls r6, r5, r6
	ldr r5, [r0, #0x6c]
	asrs r3, r6, #0xc
	str r1, [r0, #0x64]
_08027A16:
	adds r1, r5, r3
_08027A18:
	str r1, [r0, #0x6c]
	mov r1, sl
	ldr r5, [r1]
	movs r1, #0x80
	ands r5, r1
	cmp r5, #0
	bne _08027A28
	b _08027D1A
_08027A28:
	adds r0, r7, #0
	mov r1, r8
	bl sub_08026D6C
_08027A30:
	adds r0, r7, #0
	mov r1, r8
	bl sub_08026C60
	movs r6, #0xf4
	movs r3, #0xf6
	adds r1, r6, r7
	adds r5, r7, #0
	adds r0, r7, #0
	adds r4, r7, #0
	adds r2, r3, r7
	adds r6, r7, #0
	adds r5, #0x54
	adds r0, #0x56
	adds r4, #0x58
	mov fp, r1
	mov sb, r2
	adds r6, #0xf8
	str r5, [sp, #0x10]
	str r0, [sp, #0xc]
	str r4, [sp, #8]
_08027A5A:
	mov r0, sl
	ldr r5, [r0]
	movs r1, #0x80
	lsls r0, r1, #9
	ands r5, r0
	cmp r5, #0
	bne _08027A6A
	b _08027D04
_08027A6A:
	ldr r0, [r7, #0x24]
	ldr r4, [r7, #0x28]
	ldr r5, [r7, #0x2c]
	str r0, [r7, #0x30]
	str r4, [r7, #0x34]
	str r5, [r7, #0x38]
	mov r1, r8
	ldr r1, [r1, #0x70]
	str r1, [r7, #0x24]
	mov r3, r8
	ldr r2, [r3, #0x74]
	str r2, [r7, #0x28]
	mov lr, r1
	ldr r1, [r3, #0x78]
	mov r3, lr
	subs r0, r3, r0
	str r0, [r7, #0x3c]
	subs r3, r1, r5
	subs r0, r2, r4
	str r1, [r7, #0x2c]
	str r0, [r7, #0x40]
	ldr r1, _08027B48
	str r3, [r7, #0x44]
	adds r0, r7, #0
	bl _call_via_r1
	ldr r1, [r7, #0x28]
	cmp r1, #0
	bge _08027AA6
	b _08027CF0
_08027AA6:
	cmp r1, #0
	ble _08027AB6
	ldrh r0, [r7]
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _08027AB6
	b _08027CDE
_08027AB6:
	mov r3, r8
	mov r0, r8
	adds r3, #0xec
	ldr r1, [r3]
	ldr r5, [r0, #4]
	adds r2, r5, r1
	movs r1, #0x8c
	lsls r5, r1, #1
	add r5, r8
	ldr r1, [r5]
	adds r5, r1, r2
	ldr r2, [sp, #0x10]
	strh r5, [r2]
	ldr r5, [r0, #8]
	ldr r1, [r0, #0xc]
	adds r2, r5, r1
	movs r1, #0x90
	lsls r5, r1, #1
	add r5, r8
	ldr r1, [r5]
	adds r5, r1, r2
	ldr r1, [sp, #0xc]
	strh r5, [r1]
	movs r5, #0x88
	ldr r1, [r0]
	lsls r0, r5, #1
	add r0, r8
	ldr r3, [r0]
	adds r5, r1, r3
	ldr r1, [sp, #8]
	strh r5, [r1]
	ldr r1, _08027B30
	mov r2, fp
	mov r3, sb
	strh r1, [r2]
	strh r1, [r3]
	mov r0, r8
	ldr r2, [r0, #8]
	strh r2, [r6]
	ldr r6, [r0, #0x10]
	lsls r0, r6, #0xc
	asrs r3, r0, #0x10
	mov r0, sl
	ldr r5, [r0, #0x20]
	adds r6, r5, r3
	str r6, [r0, #0x20]
	mov r3, r8
	ldr r5, [r3, #0x10]
	lsls r6, r5, #0xb
	ldr r5, [r0, #0x24]
	asrs r3, r6, #0x10
	adds r6, r5, r3
	str r6, [r0, #0x24]
	movs r3, #0x80
	ldr r6, [r0]
	lsls r5, r3, #0xe
	ands r6, r5
	cmp r6, #0
	beq _08027B60
	b _08027B4C
	.byte 0x00, 0x00
_08027B30:
	.4byte 0x00000000
_08027B34:
	.4byte 0x0202EA14
_08027B38:
	.4byte sub_030001E8
_08027B3C:
	.4byte 0x03000814
_08027B40:
	.4byte sub_03000134
_08027B44:
	.4byte sub_03000138
_08027B48:
	.4byte sub_03003750
_08027B4C:
	movs r2, #0x84
	lsls r3, r2, #1
	adds r2, r7, r3
	ldrh r0, [r2]
	subs r0, #2
	lsls r6, r0, #0x10
	strh r0, [r2]
	cmp r6, #0
	bgt _08027B60
	b _08027CC6
_08027B60:
	mov r2, sl
	ldr r5, [r2]
	movs r6, #0x80
	lsls r1, r6, #0xd
	ands r5, r1
	cmp r5, #0
	beq _08027B74
	adds r0, r7, #0
	bl sub_080041BC
_08027B74:
	adds r0, r7, #0
	mov r1, r8
	bl sub_08026FF0
	ldr r0, _08027BE4
	adds r0, #0x8c
	ldr r2, [r0]
	cmp r2, #6
	bls _08027B8E
	adds r0, r7, #0
	mov r1, r8
	bl sub_080272E8
_08027B8E:
	adds r0, r7, #0
	bl weaponbossManager
	cmp r0, #0
	beq _08027BAC
	mov r0, sl
	ldr r5, [r0, #8]
	cmp r5, #3
	bne _08027BA2
	b _08027CBA
_08027BA2:
	movs r1, #0x85
	lsls r6, r1, #1
	ldr r5, _08027BE0
	adds r0, r7, r6
	strh r5, [r0]
_08027BAC:
	movs r6, #0x96
	lsls r5, r6, #1
	adds r2, r7, r5
	movs r5, #0
	str r5, [r2]
	mov r6, r8
	adds r6, #0xe4
	movs r3, #1
	rsbs r1, r3, #0
	ldr r2, [r6]
	mov ip, r1
	cmp r2, ip
	beq _08027C00
	movs r0, #0x2c
	muls r2, r0, r2
	ldr r1, _08027BE8
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r7, #0x30]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r2, r0, #8
	b _08027BEC
	.byte 0x00, 0x00
_08027BE0:
	.4byte 0x00000000
_08027BE4:
	.4byte 0x0202D74C
_08027BE8:
	.4byte 0x0202EBF4
_08027BEC:
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #0x38]
	muls r3, r0, r3
	ldr r1, [r1, #0x20]
	asrs r3, r3, #8
	adds r2, r2, r3
	adds r3, r2, r1
	cmp r3, #0
	blt _08027C12
_08027C00:
	add sp, #0x20
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08027C12:
	ldr r3, [r7, #0x24]
	adds r2, r4, #0
	muls r2, r3, r2
	ldr r3, [r7, #0x2c]
	muls r3, r0, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r0, r2, r3
	adds r3, r0, r1
	cmp r3, #0
	blt _08027C00
	mov r0, ip
	str r0, [r6]
	mov r1, sl
	ldr r2, [r1, #8]
	cmp r2, #3
	beq _08027C88
	cmp r2, #1
	bne _08027C00
	movs r1, #2
	mov r0, sl
	str r1, [r0, #8]
	adds r1, #0xfe
	add r1, r8
	movs r4, #0x82
	str r5, [r1]
	lsls r1, r4, #1
	add r1, r8
	movs r3, #0x85
	str r2, [r1]
	ldr r0, _08027C84
	lsls r2, r3, #1
	adds r4, r7, r2
	strh r0, [r4]
	mov r0, r8
	mov r4, r8
	movs r3, #0xc6
	adds r0, #0x8c
	adds r4, #0x88
	movs r1, #0x40
	str r5, [r0]
	lsls r2, r3, #1
	str r1, [r4]
	add r2, r8
	ldr r3, [r2]
	cmp r3, #1
	bne _08027C00
	mov r3, r8
	adds r3, #0x84
	str r5, [r2]
	str r5, [r0]
	str r5, [r3]
	subs r3, #4
	str r1, [r4]
	str r1, [r3]
	b _08027C00
	.byte 0x00, 0x00
_08027C84:
	.4byte 0x0000000B
_08027C88:
	movs r2, #4
	str r2, [r1, #8]
	movs r1, #0xb9
	mov r2, r8
	lsls r0, r1, #3
	adds r2, #0xf0
	movs r1, #7
	mov r3, r8
	str r0, [r2]
	adds r3, #0xf8
	rsbs r0, r1, #0
	adds r2, #4
	str r0, [r2]
	str r5, [r3]
	mov r3, r8
	movs r1, #0x40
	adds r3, #0x8c
	subs r2, #0x6c
	movs r0, #0x85
	str r1, [r2]
	str r5, [r3]
	lsls r3, r0, #1
	adds r1, r7, r3
	strh r5, [r1]
	b _08027C00
_08027CBA:
	movs r2, #0x85
	lsls r3, r2, #1
	ldr r1, _08027CE8
	adds r6, r7, r3
	strh r1, [r6]
	b _08027BAC
_08027CC6:
	strh r1, [r2]
	mov r1, sl
	ldr r0, [r1]
	ldr r3, _08027CEC
	movs r6, #0x92
	ands r0, r3
	lsls r5, r6, #1
	str r0, [r1]
	add r5, r8
	movs r1, #0
	str r1, [r5]
	b _08027B60
_08027CDE:
	adds r0, r7, #0
	bl sub_080021E8
	b _08027AB6
	.byte 0x00, 0x00
_08027CE8:
	.4byte 0x0000000B
_08027CEC:
	.4byte 0xFFDFFFFF
_08027CF0:
	ldrh r3, [r7]
	movs r5, #0x10
	ands r5, r3
	cmp r5, #0
	bne _08027CFC
	b _08027AA6
_08027CFC:
	adds r0, r7, #0
	bl obj_remove_draw
	b _08027AB6
_08027D04:
	ldr r0, [r7, #0x24]
	adds r4, r7, #0
	adds r4, #0x84
	str r0, [r4]
	ldr r5, [r7, #0x28]
	adds r4, #4
	str r5, [r4]
	ldr r2, [r7, #0x2c]
	adds r4, #4
	str r2, [r4]
	b _08027A6A
_08027D1A:
	adds r0, r7, #0
	mov r1, r8
	bl sub_080269C8
	b _08027A30
_08027D24:
	movs r0, #0x82
	lsls r1, r0, #1
	add r1, r8
	ldr r3, [r1]
	cmp r3, #0
	ble _08027D9C
	movs r3, #0x80
	lsls r2, r3, #1
	add r2, r8
	ldr r4, [r2]
	adds r4, #2
	str r4, [r2]
	cmp r4, #0x3f
	ble _08027D4A
	movs r6, #1
	rsbs r5, r6, #0
	str r5, [r1]
	movs r1, #0x40
	str r1, [r2]
_08027D4A:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r2, #0xb9
	lsls r4, r2, #3
	adds r6, r0, #0
	muls r6, r4, r6
	movs r5, #0x84
	lsls r0, r5, #1
	add r0, r8
	asrs r3, r6, #0x10
	ldr r6, [r0]
	lsls r2, r3, #1
	adds r4, r2, r6
	movs r2, #8
	ldrsh r6, [r1, r2]
	ldr r5, _08027FA0
	adds r0, r6, #0
	bl _call_via_r5
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r5, r0, #0x10
	ldr r1, _08027FA4
	adds r0, r6, #0
	bl _call_via_r1
	lsls r6, r0, #0x10
	asrs r2, r6, #0x10
	adds r1, r4, #0
	muls r1, r2, r1
	mov r0, r8
	ldr r6, [r0, #0x64]
	asrs r3, r1, #0xc
	adds r1, r6, r3
	adds r6, r4, #0
	muls r6, r5, r6
	ldr r4, [r0, #0x6c]
	asrs r3, r6, #0xc
	str r1, [r0, #0x64]
	adds r1, r4, r3
	b _08027A18
_08027D9C:
	cmp r3, #0
	bge _08027D4A
	movs r4, #0x80
	lsls r2, r4, #1
	add r2, r8
	ldr r0, [r2]
	subs r0, #2
	str r0, [r2]
	cmp r0, #0
	bgt _08027D4A
	movs r5, #0
	movs r6, #3
	mov r0, sl
	str r6, [r0, #8]
	str r5, [r1]
	str r5, [r2]
	b _08027D4A
_08027DBE:
	mov r0, r8
	adds r0, #0xf4
	ldr r2, [r0]
	cmp r2, #0
	blt _08027E3C
	cmp r2, #0
	ble _08027DDA
	mov r2, r8
	adds r2, #0xf8
	ldr r1, [r2]
	subs r1, #2
	str r1, [r2]
	cmp r1, #0
	ble _08027E24
_08027DDA:
	mov r1, r8
	adds r1, #0xf0
_08027DDE:
	ldr r4, [r1]
	ldr r6, [r0]
	lsls r5, r4, #1
	lsls r2, r6, #1
	adds r6, r5, r2
	adds r5, r4, r2
	str r5, [r1]
	mov r3, r8
	movs r2, #8
	ldrsh r5, [r3, r2]
	ldr r4, _08027FA0
	adds r0, r5, #0
	bl _call_via_r4
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	ldr r5, _08027FA4
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	adds r5, r6, #0
	muls r5, r2, r5
	mov r0, r8
	ldr r1, [r0, #0x64]
	asrs r3, r5, #0xc
	adds r5, r1, r3
	adds r1, r6, #0
	muls r1, r4, r1
	str r5, [r0, #0x64]
	ldr r5, [r0, #0x6c]
	asrs r3, r1, #0xc
	b _08027A16
_08027E24:
	movs r6, #1
	mov r1, sl
	str r6, [r1, #8]
	movs r4, #0xb9
	mov r1, r8
	movs r6, #0
	adds r1, #0xf0
	lsls r5, r4, #3
	str r5, [r1]
	str r6, [r0]
	str r6, [r2]
	b _08027DDE
_08027E3C:
	mov r1, r8
	adds r1, #0xf8
	ldr r5, [r1]
	adds r5, #2
	str r5, [r1]
	cmp r5, #0x3f
	ble _08027DDA
	rsbs r4, r2, #0
	movs r2, #0x40
	str r4, [r0]
	str r2, [r1]
	subs r1, #8
	b _08027DDE
_08027E56:
	movs r1, #0xf4
	adds r2, r1, r7
	adds r4, r7, #0
	adds r6, r7, #0
	adds r3, r7, #0
	adds r6, #0x56
	adds r3, #0x58
	adds r4, #0x54
	mov fp, r2
	movs r2, #0xf6
	str r6, [sp, #0xc]
	str r3, [sp, #8]
	adds r6, r7, #0
	adds r3, r2, r7
	str r4, [sp, #0x10]
	mov sb, r3
	adds r6, #0xf8
	b _08027A5A
_08027E7A:
	movs r4, #1
	rsbs r3, r4, #0
	cmp r1, r3
	beq _08027EA6
	movs r5, #0xf4
	adds r2, r5, r7
	adds r6, r7, #0
	adds r6, #0x58
	mov fp, r2
	movs r2, #0xf6
	adds r0, r7, #0
	adds r1, r7, #0
	str r6, [sp, #8]
	adds r3, r2, r7
	adds r6, r7, #0
	adds r0, #0x54
	adds r1, #0x56
	mov sb, r3
	adds r6, #0xf8
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	b _08027A5A
_08027EA6:
	adds r0, r7, #0
	bl sub_080040A4
	movs r2, #0x9c
	lsls r0, r2, #1
	add r0, r8
	movs r4, #1
	adds r6, r7, #0
	str r4, [r0]
	movs r1, #0
	mov r0, sl
	adds r6, #0x54
	movs r4, #0xf4
	movs r3, #0xf6
	str r1, [r0, #8]
	adds r5, r7, #0
	str r6, [sp, #0x10]
	adds r2, r7, #0
	adds r0, r4, r7
	adds r1, r3, r7
	adds r6, r7, #0
	adds r5, #0x56
	adds r2, #0x58
	mov fp, r0
	mov sb, r1
	adds r6, #0xf8
	str r5, [sp, #0xc]
	str r2, [sp, #8]
	b _08027A5A
_08027EE0:
	mov r2, r8
	movs r5, #0x80
	lsls r6, r5, #9
	movs r3, #8
	ldrsh r5, [r2, r3]
	movs r0, #0xb9
	str r6, [r2, #0x10]
	lsls r6, r0, #4
	str r1, [sp, #4]
	adds r0, r5, #0
	ldr r2, _08027FA4
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r4, r3, #0
	muls r4, r6, r4
	mov r0, r8
	ldr r1, [r0, #0x64]
	asrs r2, r4, #0xc
	adds r4, r1, r2
	str r4, [r0, #0x64]
	ldr r2, _08027FA0
	adds r0, r5, #0
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r5, r3, #0
	muls r5, r6, r5
	mov r0, r8
	ldr r1, [r0, #0x6c]
	asrs r2, r5, #0xc
	ldr r5, [r0, #0x68]
	adds r6, r1, r2
	str r4, [r0, #0x70]
	str r5, [r0, #0x74]
	str r6, [r0, #0x6c]
	str r6, [r0, #0x78]
	adds r4, r7, #0
	ldr r6, [sp, #4]
	adds r4, #0x54
	adds r1, r4, #0
	str r4, [sp, #0x10]
	strh r6, [r1]
	adds r3, r7, #0
	ldr r5, [r0, #8]
	adds r3, #0x56
	adds r1, r7, #0
	adds r4, r3, #0
	adds r1, #0x58
	str r3, [sp, #0xc]
	adds r2, r1, #0
	strh r5, [r4]
	movs r5, #0xf4
	str r1, [sp, #8]
	strh r6, [r2]
	adds r2, r5, r7
	mov fp, r2
	mov r3, fp
	strh r6, [r3]
	movs r3, #0xf6
	adds r0, r3, r7
	mov sb, r0
	mov r2, sb
	strh r6, [r2]
	mov r0, r8
	ldr r4, [r0, #8]
	adds r6, r7, #0
	adds r6, #0xf8
	strh r4, [r6]
	ldr r0, _08027FA8
	ldr r5, [r0]
	movs r1, #2
	ands r5, r1
	cmp r5, #0
	bne _08027F7C
	b _08027A5A
_08027F7C:
	movs r4, #3
	mov r1, sl
	str r4, [r1, #8]
	b _08027A5A
_08027F84:
	ldr r0, _08027FAC
	movs r4, #0xe0
	str r0, [sp]
	ldr r1, _08027FB0
	ldr r0, _08027FB4
	ldr r2, _08027FB8
	lsls r3, r4, #3
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08027952
	.byte 0x00, 0x00
_08027FA0:
	.4byte sub_03000134
_08027FA4:
	.4byte sub_03000138
_08027FA8:
	.4byte 0x0300566C
_08027FAC:
	.4byte 0x08052BD0
_08027FB0:
	.4byte 0x08052BDC
_08027FB4:
	.4byte 0x08052C00
_08027FB8:
	.4byte 0x08052C3C

	.global sub_08027FBC
	.thumb_func
	.type sub_08027FBC, %function
sub_08027FBC: @ 08027FBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0xa0
	adds r7, r2, #0
	movs r3, #0x8c
	ldr r2, [r0]
	lsls r4, r3, #5
	ands r4, r2
	ldr r1, _08028048
	movs r5, #0
	cmp r4, #0
	beq _08027FDC
_08027FD4:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08027FDC:
	movs r3, #0x80
	orrs r2, r3
	str r2, [r0]
	adds r2, r1, #0
	adds r2, #0xc0
	subs r3, #0x8f
	str r3, [r2]
	ldr r3, [r1, #0x14]
	adds r2, #4
	str r3, [r2]
	adds r2, r1, #0
	adds r2, #0xbc
	str r5, [r2]
	movs r2, #0x9c
	str r5, [r1, #0x14]
	lsls r5, r2, #1
	adds r2, r1, r5
	movs r5, #7
	str r5, [r2]
	movs r3, #0x40
	subs r2, #0xb0
	str r3, [r2]
	adds r2, r1, #0
	adds r2, #0x8c
	str r4, [r2]
	ldr r2, _0802804C
	movs r1, #4
	ldrsh r3, [r2, r1]
	movs r5, #1
	cmp r3, #8
	beq _0802803A
	ldr r1, [r0, #4]
	lsls r3, r1, #1
	adds r3, #4
	ldrsh r0, [r2, r3]
	lsls r1, r0, #2
	ldr r0, _08028050
_08028026:
	ldr r2, [r0, r1]
	muls r2, r7, r2
	movs r0, #0x92
	lsls r1, r0, #1
	adds r0, r6, r1
	ldr r3, [r0]
	asrs r2, r2, #0xc
	subs r1, r3, r2
	str r1, [r0]
	b _08027FD4
_0802803A:
	ldr r1, [r0, #4]
	lsls r3, r1, #1
	adds r3, #4
	ldrsh r0, [r2, r3]
	lsls r1, r0, #2
	ldr r0, _08028054
	b _08028026
_08028048:
	.4byte 0x0202EA14
_0802804C:
	.4byte 0x0202D74C
_08028050:
	.4byte 0x0884EFEC
_08028054:
	.4byte 0x0884F010

	.global sub_08028058
	.thumb_func
	.type sub_08028058, %function
sub_08028058: @ 08028058
	ldr r2, _08028064
	ldr r3, [r2, #0x64]
	str r3, [r0]
	ldr r0, [r2, #0x6c]
	str r0, [r1]
	bx lr
_08028064:
	.4byte 0x0202EA14

	.global sub_08028068
	.thumb_func
	.type sub_08028068, %function
sub_08028068: @ 08028068
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #8]
	ldr r2, _080280A8
	cmp r3, #3
	beq _08028096
	cmp r3, #1
	beq _08028086
	movs r1, #0x84
	lsls r0, r1, #1
	adds r1, r2, r0
	movs r0, #0
	str r0, [r1]
_08028082:
	pop {r0}
	bx r0
_08028086:
	movs r3, #0x84
	lsls r0, r3, #1
	adds r2, r2, r0
	ldr r0, _080280AC
	adds r3, r1, r0
	asrs r1, r3, #3
	str r1, [r2]
	b _08028082
_08028096:
	movs r0, #0x84
	lsls r3, r0, #1
	adds r2, r2, r3
	movs r3, #0xe0
	lsls r0, r3, #6
	subs r3, r0, r1
	asrs r0, r3, #3
	str r0, [r2]
	b _08028082
_080280A8:
	.4byte 0x0202EA14
_080280AC:
	.4byte 0xFFFFC800

	.global sub_080280B0
	.thumb_func
	.type sub_080280B0, %function
sub_080280B0: @ 080280B0
	push {r4, r5, lr}
	ldr r4, _080280F4
	movs r3, #0xec
	adds r5, r0, #0
	lsls r0, r3, #1
	adds r2, r4, r0
	ldr r1, [r2]
	ldr r0, [r4, #0x10]
	adds r3, r1, #0
	muls r3, r0, r3
	asrs r0, r3, #0x10
	cmp r0, r1
	ble _080280CC
	adds r0, r1, #0
_080280CC:
	movs r1, #0x9a
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	movs r3, #0x98
	str r0, [r1]
	lsls r1, r3, #1
	adds r3, r5, r1
	ldr r1, [r3]
	movs r3, #0x80
	lsls r3, r3, #9
	subs r3, r3, r1
	muls r3, r0, r3
	asrs r0, r3, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
_080280F4:
	.4byte 0x0202EA14

	.global sub_080280F8
	.thumb_func
	.type sub_080280F8, %function
sub_080280F8: @ 080280F8
	push {r4, lr}
	ldr r1, _0802813C
	adds r4, r0, #0
	adds r0, r1, #0
	adds r0, #0xc4
	ldr r2, [r0]
	cmp r2, #0
	ble _08028136
	movs r3, #0xa0
	muls r3, r2, r3
	asrs r0, r3, #8
_0802810E:
	movs r3, #0x9a
	lsls r2, r3, #1
	adds r1, r1, r2
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	movs r3, #0x98
	str r0, [r1]
	lsls r1, r3, #1
	adds r3, r4, r1
	ldr r1, [r3]
	movs r3, #0x80
	lsls r3, r3, #9
	subs r3, r3, r1
	muls r3, r0, r3
	asrs r0, r3, #0x10
	pop {r4}
	pop {r1}
	bx r1
_08028136:
	movs r0, #0xa0
	b _0802810E
	.byte 0x00, 0x00
_0802813C:
	.4byte 0x0202EA14

	.global sub_08028140
	.thumb_func
	.type sub_08028140, %function
sub_08028140: @ 08028140
	push {r4, r5, lr}
	ldr r4, _0802819C
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r2, [r0]
	cmp r2, #0
	ble _08028194
	lsls r1, r2, #1
	adds r0, r1, r2
	lsls r1, r0, #0x10
	asrs r0, r1, #8
_08028158:
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	str r0, [r1]
	ldr r1, _080281A0
	ldr r0, [r1]
	adds r2, r0, #0
	adds r2, #0xa0
	ldr r1, [r2, #4]
	cmp r1, #4
	beq _08028180
	ldr r0, _080281A4
	ldr r2, [r0]
	lsls r1, r2, #2
	ldr r2, _080281A8
	ldr r0, [r2, r1]
_08028180:
	movs r1, #0x98
	lsls r3, r1, #1
	adds r1, r4, r3
	ldr r2, [r1]
	adds r1, r5, #0
	bl sub_08020130
	pop {r4, r5}
	pop {r1}
	bx r1
_08028194:
	movs r2, #0xc0
	lsls r0, r2, #0xa
	b _08028158
	.byte 0x00, 0x00
_0802819C:
	.4byte 0x0202EA14
_080281A0:
	.4byte 0x0200436C
_080281A4:
	.4byte 0x0202DE58
_080281A8:
	.4byte 0x0200434C

	.global react_comp_boss
	.thumb_func
	.type react_comp_boss, %function
react_comp_boss: @ 080281AC
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	adds r4, r1, #0
	cmp r5, #0
	beq _08028216
_080281B8:
	cmp r4, #0
	beq _080281FE
_080281BC:
	ldrb r3, [r4, #2]
	cmp r3, #0x16
	beq _080281EE
	cmp r3, #0x16
	bgt _080281E2
	cmp r3, #0x15
	beq _080281D2
_080281CA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_080281D2:
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r1, [r2, #8]
	adds r0, r5, #0
	ldr r2, _08028230
	bl sub_08027FBC
	b _080281CA
_080281E2:
	cmp r3, #0x2b
	bne _080281CA
	adds r0, r5, #0
	bl sub_08026B70
	b _080281CA
_080281EE:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r1, [r0, #8]
	ldr r2, _08028230
	adds r0, r5, #0
	bl sub_08027FBC
	b _080281CA
_080281FE:
	ldr r0, _08028234
	ldr r1, _08028238
	str r0, [sp]
	ldr r2, _0802823C
	ldr r0, _08028240
	ldr r3, _08028244
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080281BC
_08028216:
	ldr r0, _08028248
	ldr r1, _08028238
	str r0, [sp]
	ldr r2, _0802823C
	ldr r0, _08028240
	ldr r3, _0802824C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080281B8
	.byte 0x00, 0x00
_08028230:
	.4byte 0x00002666
_08028234:
	.4byte 0x08052C4C
_08028238:
	.4byte 0x08052BDC
_0802823C:
	.4byte 0x08052C58
_08028240:
	.4byte 0x08052C00
_08028244:
	.4byte 0x00000843
_08028248:
	.4byte 0x08052BD0
_0802824C:
	.4byte 0x00000842

	.global sub_08028250
	.thumb_func
	.type sub_08028250, %function
sub_08028250: @ 08028250
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	mov fp, r0
	mov r3, fp
	adds r3, #0x58
	movs r1, #0
	ldrsh r5, [r3, r1]
	ldr r7, _08028560
	adds r0, r5, #0
	sub sp, #0x48
	bl _call_via_r7
	mov r8, r0
	mov r2, r8
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _08028564
	adds r0, r5, #0
	mov r8, r3
	mov sl, r2
	bl _call_via_r8
	mov r5, fp
	mov ip, r0
	mov r4, ip
	adds r5, #0x54
	str r5, [sp, #0x2c]
	lsls r6, r4, #0x10
	asrs r4, r6, #0x10
	mov sb, r4
	movs r1, #0
	ldrsh r4, [r5, r1]
	adds r0, r4, #0
	bl _call_via_r7
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r6, r0, #0x10
	adds r0, r4, #0
	bl _call_via_r8
	mov r2, fp
	lsls r1, r0, #0x10
	asrs r4, r1, #0x10
	adds r2, #0x56
	str r2, [sp, #0x28]
	str r4, [sp, #0x44]
	movs r3, #0
	ldrsh r4, [r2, r3]
	adds r0, r4, #0
	bl _call_via_r7
	mov r5, sp
	strh r0, [r5, #0x24]
	ldrh r7, [r5, #0x24]
	lsls r2, r7, #0x10
	asrs r3, r2, #0x10
	str r2, [sp, #0x20]
	str r3, [sp, #0x40]
	adds r0, r4, #0
	bl _call_via_r8
	adds r5, r0, #0
	lsls r1, r5, #0x10
	mov r5, fp
	adds r5, #0xa0
	str r5, [sp, #0x1c]
	ldr r3, _08028568
	ldr r0, [r5, #4]
	mov r8, r3
	lsls r7, r0, #1
	asrs r4, r1, #0x10
	adds r7, #4
	mov r1, r8
	ldrsh r0, [r1, r7]
	bl sub_080040EC
	ldr r3, [r0, #0x68]
	mov r5, sb
	mov ip, r3
	ldr r3, [sp, #0x40]
	rsbs r2, r5, #0
	adds r5, r3, #0
	muls r5, r2, r5
	ldr r1, [sp, #0x44]
	asrs r7, r5, #0xc
	mov r5, sl
	muls r5, r1, r5
	asrs r1, r5, #0xc
	adds r5, r4, #0
	muls r5, r1, r5
	asrs r3, r5, #0xc
	adds r5, r7, r3
	mov r7, ip
	muls r7, r5, r7
	adds r5, r4, #0
	muls r5, r6, r5
	ldr r0, [r0, #0x6c]
	adds r3, r7, #0
	asrs r7, r5, #0xc
	muls r7, r0, r7
	str r5, [sp, #0x18]
	asrs r2, r3, #0xc
	asrs r5, r7, #0xc
	adds r7, r2, r5
	mov r5, sl
	muls r5, r6, r5
	asrs r2, r5, #0xc
	mov r5, ip
	muls r5, r2, r5
	asrs r2, r5, #0xc
	ldr r5, [sp, #0x44]
	adds r3, r0, #0
	muls r3, r5, r3
	asrs r3, r3, #0xc
	subs r5, r2, r3
	mov r3, sb
	muls r3, r4, r3
	ldr r4, [sp, #0x40]
	asrs r2, r3, #0xc
	adds r3, r4, #0
	muls r3, r1, r3
	asrs r1, r3, #0xc
	adds r2, r2, r1
	mov r1, ip
	muls r1, r2, r1
	adds r3, r1, #0
	asrs r1, r3, #0xc
	adds r3, r4, #0
	muls r3, r6, r3
	asrs r6, r3, #0xc
	muls r6, r0, r6
	str r3, [sp, #0x14]
	asrs r4, r6, #0xc
	adds r6, r1, r4
	mov r4, fp
	ldr r0, [r4, #0x24]
	adds r2, r0, r7
	str r2, [sp, #0x3c]
	ldr r1, [r4, #0x28]
	adds r0, r1, r5
	str r0, [sp, #0x38]
	ldr r2, [r4, #0x2c]
	movs r5, #0
	adds r1, r2, r6
	str r1, [sp, #0x34]
	str r5, [sp, #0x30]
	movs r0, #1
	mov r4, r8
	rsbs r1, r0, #0
	movs r2, #0
	ldrsh r0, [r4, r2]
	mov sb, r1
	cmp r0, #3
	bne _08028390
	b _08028490
_08028390:
	movs r0, #1
	str r0, [sp, #0x30]
_08028394:
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _0802841C
	movs r0, #0x2b
	bl sub_08001F58
	ldr r3, [sp, #0x1c]
	adds r4, r0, #0
	ldr r1, [r3, #4]
	adds r2, r4, #0
	adds r2, #0xa0
	str r1, [r2, #8]
	mov r1, sb
	str r1, [r2, #0xc]
	ldr r3, [sp, #0x3c]
	str r3, [r4, #0x24]
	ldr r2, [sp, #0x38]
	str r2, [r4, #0x28]
	ldr r1, [sp, #0x34]
	str r1, [r4, #0x2c]
	ldr r5, [sp, #0x18]
	asrs r2, r5, #0xc
	str r2, [r4, #0x3c]
	ldr r3, [sp, #0x44]
	rsbs r5, r3, #0
	str r5, [r4, #0x40]
	ldr r5, [sp, #0x14]
	adds r2, r4, #0
	asrs r1, r5, #0xc
	str r1, [r4, #0x44]
	adds r2, #0x90
	mov r1, fp
	str r1, [r2]
	movs r1, #0
	bl obj_initialise
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r4, r1, #7
	ands r4, r0
	lsls r2, r4, #0x10
	lsrs r4, r2, #0x10
	cmp r4, #0
	beq _08028448
	ldr r0, [sp, #0x1c]
	ldr r3, _0802856C
	ldr r1, [r0, #4]
	ldr r0, [r3]
	cmp r1, r0
	beq _08028430
	mov r3, fp
	ldr r1, [r3, #0x28]
	ldr r2, [r3, #0x2c]
	ldr r0, [r3, #0x24]
	movs r3, #0x7f
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #4
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	movs r3, #0xf0
	bl gamesfx_play_at
_0802841C:
	ldr r0, [sp, #0x30]
	add sp, #0x48
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08028430:
	movs r1, #4
	movs r2, #0
	movs r3, #0x80
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xf0
	movs r3, #1
	bl gamesfx_play
	b _0802841C
_08028448:
	ldr r5, [sp, #0x1c]
	ldr r3, _0802856C
	ldr r1, [r5, #4]
	ldr r0, [r3]
	cmp r1, r0
	beq _0802847A
	mov r3, fp
	ldr r2, [r3, #0x2c]
	mov r1, fp
	movs r3, #0x7f
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #4
	str r3, [sp, #0xc]
	movs r3, #0xef
	str r4, [sp, #0x10]
	bl gamesfx_play_at
	b _0802841C
_0802847A:
	movs r2, #4
	movs r3, #0x80
	str r2, [sp]
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xef
	movs r3, #1
	str r4, [sp, #4]
	bl gamesfx_play
	b _0802841C
_08028490:
	ldr r1, [sp, #0x1c]
	ldr r2, _0802856C
	ldr r4, [r1, #4]
	ldr r7, [r2]
	cmp r4, r7
	beq _08028558
	ldr r6, _08028570
	ldr r3, [r6]
_080284A0:
	mov r8, r3
	mov r2, r8
	ldr r0, [sp, #0x3c]
	ldr r4, [r2, #0x24]
	ldr r6, [sp, #0x38]
	subs r7, r4, r0
	ldr r1, [r2, #0x28]
	ldr r0, [sp, #0x34]
	ldr r5, [r2, #0x2c]
	subs r4, r1, r6
	subs r6, r5, r0
	adds r1, r6, #0
	muls r1, r6, r1
	adds r5, r7, #0
	muls r5, r7, r5
	ldr r2, _08028574
	adds r0, r5, r1
	bl _call_via_r2
	ldr r3, _08028578
	adds r1, r0, #0
	mov sl, r3
	adds r0, r4, #0
	bl _call_via_r10
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	adds r1, r6, #0
	adds r0, r7, #0
	bl _call_via_r10
	rsbs r4, r5, #0
	adds r6, r0, #0
	ldr r5, [sp, #0x28]
	lsls r7, r6, #0x10
	lsrs r1, r7, #0x10
	ldrh r0, [r5]
	ldr r7, _0802857C
	bl _call_via_r7
	lsls r1, r4, #0x10
	lsls r2, r0, #0x10
	ldr r3, [sp, #0x2c]
	asrs r6, r2, #0x10
	lsrs r2, r1, #0x10
	adds r1, r2, #0
	ldrh r0, [r3]
	bl _call_via_r7
	ldr r4, [sp, #0x1c]
	ldr r2, [r4, #4]
	ldr r4, _0802856C
	ldr r1, [r4]
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r2, r1
	beq _08028536
	ldr r3, _08028580
	ldr r2, _08028584
	adds r1, r6, r3
	cmp r1, r2
	bls _08028520
	b _08028394
_08028520:
	ldr r4, _08028580
	adds r1, r0, r4
	cmp r1, r2
	bls _0802852A
	b _08028394
_0802852A:
	movs r2, #0xb6
	lsls r1, r2, #1
	movs r5, #1
	adds r3, r6, r1
	lsls r2, r2, #2
	b _0802853E
_08028536:
	ldr r1, _08028580
	ldr r2, _08028584
	movs r5, #1
	adds r3, r6, r1
_0802853E:
	str r5, [sp, #0x30]
	cmp r3, r2
	bls _08028546
	b _08028394
_08028546:
	adds r3, r0, r1
	cmp r3, r2
	bls _0802854E
	b _08028394
_0802854E:
	mov r3, r8
	adds r3, #0xa0
	ldr r3, [r3, #4]
	mov sb, r3
	b _08028394
_08028558:
	ldr r0, _08028570
	ldr r3, [r0, #4]
	b _080284A0
	.byte 0x00, 0x00
_08028560:
	.4byte sub_03000134
_08028564:
	.4byte sub_03000138
_08028568:
	.4byte 0x0202D74C
_0802856C:
	.4byte 0x0202DE58
_08028570:
	.4byte 0x0200434C
_08028574:
	.4byte sub_03000744
_08028578:
	.4byte sub_030001E8
_0802857C:
	.4byte 0x03000814
_08028580:
	.4byte 0x00000888
_08028584:
	.4byte 0x00001110
