@ asm/act_red_zinger.s: ROM 0x0291EC-0x02AA40 (rom, VMA 0x080291EC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_red_zinger
	.thumb_func
	.type init_red_zinger, %function
init_red_zinger: @ 080291EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	sub sp, #4
	cmp r7, #0
	bne _08029200
	b _080292E8
_08029200:
	ldr r0, _0802923C
	movs r1, #0x37
	strh r0, [r7]
	movs r2, #0x13
	adds r0, r7, #0
	bl obj_setup_sprite
	adds r2, r7, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r4, #0x18
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r3, _08029240
	adds r6, r1, r3
	strh r4, [r6, #0xa]
	bl sub_08002FE0
	adds r1, r7, #0
	adds r1, #0xa0
	movs r5, #1
	ldr r4, [r1, #0x10]
	rsbs r2, r5, #0
	str r2, [r1, #0x20]
	str r2, [r1, #0x24]
	str r2, [r1, #0x28]
	movs r0, #0x56
	lsls r2, r4, #1
	adds r3, r0, r7
	b _08029244
_0802923C:
	.4byte 0x00000001
_08029240:
	.4byte 0x02018F34
_08029244:
	mov r8, r2
	mov sb, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	ldr r3, _08029304
	mov sl, r3
	bl _call_via_r10
	adds r6, r0, #0
	lsls r5, r6, #0x10
	asrs r4, r5, #0x10
	adds r5, r7, #0
	adds r5, #0x54
	movs r2, #0
	ldrsh r0, [r5, r2]
	ldr r6, _08029308
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	asrs r2, r1, #0xc
	mov r4, r8
	muls r4, r2, r4
	adds r1, r4, #0
	asrs r0, r1, #0xc
	str r0, [r7, #0x3c]
	movs r3, #0
	ldrsh r0, [r5, r3]
	bl _call_via_r10
	lsls r4, r0, #0x10
	asrs r3, r4, #0x10
	mov r1, r8
	muls r1, r3, r1
	asrs r2, r1, #0xc
	rsbs r4, r2, #0
	str r4, [r7, #0x40]
	mov r3, sb
	movs r2, #0
	ldrsh r0, [r3, r2]
	bl _call_via_r6
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	asrs r2, r1, #0xc
	mov r0, r8
	muls r0, r2, r0
	adds r1, r0, #0
	asrs r2, r1, #0xc
	movs r0, #0x80
	str r2, [r7, #0x44]
	lsls r1, r0, #3
	movs r2, #0xa0
	str r1, [sp]
	adds r0, r7, #0
	lsls r1, r2, #3
	movs r3, #0
	movs r2, #0
	bl sub_08001C28
	adds r0, r7, #0
	bl obj_add_vector_hit
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080292E8:
	ldr r0, _0802930C
	movs r4, #0xcd
	str r0, [sp]
	ldr r1, _08029310
	ldr r0, _08029314
	ldr r2, _08029318
	lsls r3, r4, #1
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08029200
	.byte 0x00, 0x00
_08029304:
	.4byte sin_fx
_08029308:
	.4byte cos_fx
_0802930C:
	.4byte gUnk_08052DF0
_08029310:
	.4byte gUnk_08052DFC
_08029314:
	.4byte gUnk_08052E14
_08029318:
	.4byte gUnk_08052E50

	.global act_red_zinger
	.thumb_func
	.type act_red_zinger, %function
act_red_zinger: @ 0802931C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0x54
	cmp r7, #0
	bne _08029334
	.2byte 0xF000, 0xFC74 @ bl #0x8029c1c
_08029334:
	adds r0, r7, #0
	adds r0, #0xa0
	str r0, [sp, #0x44]
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _0802934C
	subs r3, #2
	str r3, [r0, #4]
	cmp r3, #0
	bge _0802934C
	.2byte 0xF000, 0xFC64 @ bl #0x8029c14
_0802934C:
	ldr r2, [sp, #0x44]
	ldr r3, [r2]
	cmp r3, #1
	bne _08029356
	b _080298A2
_08029356:
	cmp r3, #1
	ble _0802935C
	b _08029694
_0802935C:
	cmp r3, #0
	bne _08029362
	b _080295AE
_08029362:
	adds r4, r7, #0
	adds r4, #0x5a
_08029366:
	ldr r1, [r7, #0x24]
	adds r0, r7, #0
	adds r0, #0x84
	str r1, [r0]
	ldr r2, [r7, #0x28]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r7, #0x2c]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r7, #0x24]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x28]
	str r2, [r7, #0x30]
	adds r2, r2, r3
	ldr r3, [r7, #0x40]
	str r2, [r7, #0x24]
	adds r2, r1, r3
	ldr r0, [r7, #0x2c]
	str r2, [r7, #0x28]
	ldr r2, [r7, #0x44]
	str r1, [r7, #0x34]
	adds r1, r0, r2
	str r0, [r7, #0x38]
	str r1, [r7, #0x2c]
	adds r0, r7, #0
	ldr r2, _080296D4
	bl _call_via_r2
	ldrh r0, [r4]
	bl sub_08002FE0
	ldr r0, [sp, #0x44]
	ldr r3, [r0]
	cmp r3, #1
	bgt _080293D6
	cmp r3, #0
	blt _080293D6
	ldr r1, _080296D8
	mov r8, r1
	mov r3, r8
	adds r3, #0x8c
	ldr r4, [r3]
	cmp r4, #7
	beq _080294A2
_080293C0:
	ldr r1, _080296DC
	ldr r2, [sp, #0x44]
	ldr r3, [r1]
	ldr r0, [r2, #0x34]
	cmp r3, r0
	beq _0802948E
_080293CC:
	mov r4, r8
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r1, #3
	beq _0802947E
_080293D6:
	ldr r3, [sp, #0x44]
	ldr r1, [r3]
	subs r1, #2
	cmp r1, #1
	bls _0802946C
	ldr r4, [r7, #0x44]
	ldr r6, [r7, #0x3c]
	ldr r0, [r7, #0x40]
	asrs r3, r4, #2
	asrs r5, r6, #2
	mov r8, r3
	asrs r6, r0, #2
	bl sub_08002E78
	adds r4, r0, #0
	cmp r4, #0
	beq _0802942A
	ldr r2, [r7, #0x24]
	str r2, [r4]
	ldr r1, [r7, #0x28]
	str r1, [r4, #4]
	ldr r0, [r7, #0x2c]
	str r0, [r4, #8]
	bl lfsr_next
	asrs r2, r0, #9
	adds r3, r5, r2
	str r3, [r4, #0xc]
	bl lfsr_next
	asrs r1, r0, #9
	adds r2, r6, r1
	str r2, [r4, #0x10]
	bl lfsr_next
	ldr r2, _080296E0
	asrs r3, r0, #9
	add r3, r8
	movs r1, #0xa
	str r3, [r4, #0x14]
	str r1, [r4, #0x18]
	str r2, [r4, #0x1c]
_0802942A:
	bl sub_08002E78
	adds r4, r0, #0
	cmp r4, #0
	beq _0802946C
	ldr r1, [r7, #0x24]
	adds r0, r1, r5
	str r0, [r4]
	ldr r2, [r7, #0x28]
	adds r1, r2, r6
	str r1, [r4, #4]
	ldr r0, [r7, #0x2c]
	add r0, r8
	str r0, [r4, #8]
	bl lfsr_next
	asrs r2, r0, #9
	adds r3, r5, r2
	str r3, [r4, #0xc]
	bl lfsr_next
	asrs r1, r0, #9
	adds r2, r6, r1
	str r2, [r4, #0x10]
	bl lfsr_next
	asrs r3, r0, #9
	ldr r0, _080296E0
	add r3, r8
	movs r1, #0xa
	str r3, [r4, #0x14]
	str r1, [r4, #0x18]
	str r0, [r4, #0x1c]
_0802946C:
	add sp, #0x54
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802947E:
	ldr r2, [r7, #0x28]
	cmp r2, #0
	bgt _080293D6
	adds r0, r7, #0
	movs r1, #0
	bl destroy_red_zinger
	b _080293D6
_0802948E:
	movs r0, #1
	rsbs r4, r0, #0
	adds r0, r7, #0
	adds r0, #0xcc
	str r4, [r1]
	bl gamesfx_stop
	ldr r0, _080296D8
	mov r8, r0
	b _080293CC
_080294A2:
	ldr r5, _080296E4
	ldr r1, [r0, #0xc]
	ldr r2, [r5]
	cmp r1, r2
	bne _080294AE
	b _080293C0
_080294AE:
	ldr r4, [r0, #8]
	cmp r4, r2
	bne _080294B6
	b _080293C0
_080294B6:
	ldr r3, [r7, #0x24]
	ldr r4, _080296E8
	movs r1, #0xa0
	adds r0, r3, r4
	lsls r4, r1, #7
	adds r1, r3, r4
	ldr r3, _080296EC
	ldr r2, [r3]
	ldr r3, _080296F0
	ldr r3, [r3]
	bl sub_0802C42C
	ldr r2, [sp, #0x44]
	str r0, [r2, #0x38]
	ldr r3, [r7, #0x2c]
	ldr r1, _080296E8
	adds r0, r3, r1
	adds r1, r3, r4
	ldr r4, _080296F4
	ldr r2, [r4]
	ldr r4, _080296F8
	ldr r3, [r4]
	bl sub_0802C42C
	ldr r1, [sp, #0x44]
	str r0, [r1, #0x3c]
	ldr r2, [r5]
	lsls r4, r2, #2
	ldr r2, _080296FC
	ldr r1, [r2, r4]
	ldr r4, [sp, #0x44]
	ldr r2, [r1, #0x64]
	ldr r3, [r4, #0x38]
	ands r3, r2
	cmp r3, #0
	beq _0802958E
	ldr r2, [r1, #0x68]
	ands r2, r0
	cmp r2, #0
	beq _0802958E
	ldr r3, [r1, #0x24]
	ldr r6, [r7, #0x24]
	ldr r0, [r7, #0x28]
	subs r5, r3, r6
	ldr r6, [r1, #0x28]
	ldr r3, [r1, #0x2c]
	subs r2, r6, r0
	ldr r0, [r7, #0x2c]
	mov sl, r2
	subs r6, r3, r0
	mov r0, sl
	adds r1, r5, #0
	muls r1, r5, r1
	mov r3, sl
	muls r3, r0, r3
	adds r2, r6, #0
	muls r2, r6, r2
	adds r0, r1, r3
	adds r1, r0, r2
	asrs r0, r1, #0xc
	str r0, [r4, #0x30]
	movs r4, #0x80
	lsls r1, r4, #9
	cmp r0, r1
	bgt _08029570
	ldr r2, _080296DC
	movs r4, #1
	ldr r3, [r2]
	rsbs r0, r4, #0
	cmp r3, r0
	beq _08029546
	b _080293CC
_08029546:
	ldr r3, [sp, #0x44]
	ldr r4, [r3, #0x34]
	movs r0, #2
	str r4, [r2]
	movs r2, #0x7f
	str r1, [sp, #4]
	movs r1, #0xa
	str r2, [sp]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r2, r7, #0
	movs r4, #0
	ldr r0, _08029700
	ldr r1, _08029704
	movs r3, #0xdd
	str r4, [sp, #0x10]
	bl gamesfx_play_cb
	ldr r2, [sp, #0x44]
	str r0, [r2, #0x2c]
	b _080293CC
_08029570:
	ldr r1, _080296DC
	ldr r2, [sp, #0x44]
	ldr r3, [r1]
	ldr r0, [r2, #0x34]
	cmp r3, r0
	beq _0802957E
	b _080293CC
_0802957E:
	movs r0, #1
	rsbs r4, r0, #0
	adds r0, r7, #0
	str r4, [r1]
	adds r0, #0xcc
	bl gamesfx_stop
	b _080293CC
_0802958E:
	ldr r1, _080296DC
	ldr r2, [sp, #0x44]
	ldr r3, [r1]
	ldr r4, [r2, #0x34]
	cmp r3, r4
	bne _080295A8
	movs r4, #1
	rsbs r0, r4, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xcc
	bl gamesfx_stop
_080295A8:
	ldr r1, _080296D8
	mov r8, r1
	b _080293CC
_080295AE:
	ldr r3, [sp, #0x44]
	ldr r4, [r3, #4]
	cmp r4, #0
	beq _0802968A
	ldr r1, [sp, #0x44]
	ldr r0, [r1, #0x10]
	ldr r6, [r1, #0x14]
	cmp r0, r6
	bge _08029686
	ldr r3, [sp, #0x44]
	ldr r2, [r3, #0x18]
_080295C4:
	ldr r6, [sp, #0x44]
	ldr r0, [r6, #0x10]
	lsls r3, r2, #1
	lsls r1, r0, #1
	adds r4, r1, r3
	adds r1, r0, r3
	str r4, [sp, #0x50]
	ldr r3, _08029708
	str r1, [r6, #0x10]
	movs r4, #0x56
	adds r1, r4, r7
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r8, r3
	mov sl, r1
	bl _call_via_r8
	adds r2, r0, #0
	lsls r0, r2, #0x10
	movs r6, #0x54
	asrs r4, r0, #0x10
	adds r0, r6, r7
	mov sb, r0
	ldr r6, _0802970C
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r1, [sp, #0x50]
	asrs r4, r2, #0xc
	muls r4, r1, r4
	asrs r0, r4, #0xc
	str r0, [r7, #0x3c]
	mov r4, sb
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r8
	ldr r4, [sp, #0x50]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r4, #0
	muls r2, r3, r2
	asrs r1, r2, #0xc
	rsbs r4, r1, #0
	str r4, [r7, #0x40]
	mov r3, sl
	movs r2, #0
	ldrsh r0, [r3, r2]
	bl _call_via_r6
	adds r2, r0, #0
	lsls r0, r2, #0x10
	mov r2, sb
	asrs r4, r0, #0x10
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	adds r2, r1, #0
	muls r2, r4, r2
	ldr r0, [sp, #0x50]
	asrs r6, r2, #0xc
	muls r6, r0, r6
	asrs r4, r6, #0xc
	str r4, [r7, #0x44]
	mov r0, sb
	ldrh r4, [r0]
	ldr r6, _08029710
	adds r0, r4, #0
	movs r1, #0
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r1, r3, #0x13
	subs r2, r4, r1
	mov r1, sb
	strh r2, [r1]
	ldrh r4, [r1]
	movs r1, #0
	adds r0, r4, #0
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	subs r1, r4, r2
	adds r4, r7, #0
	mov r2, sb
	adds r4, #0x5a
	strh r1, [r2]
	b _08029366
_08029686:
	movs r2, #0
	b _080295C4
_0802968A:
	adds r0, r7, #0
	movs r1, #0
	bl destroy_red_zinger
	b _08029362
_08029694:
	cmp r3, #2
	beq _08029720
	cmp r3, #3
	beq _0802969E
	b _08029362
_0802969E:
	adds r4, r7, #0
	adds r4, #0x5a
	ldrh r0, [r4]
	movs r1, #0x18
	muls r0, r1, r0
	ldr r2, _08029714
	adds r0, #8
	adds r1, r0, r2
	ldrh r0, [r1, #2]
	adds r0, #8
	strh r0, [r1, #2]
	ldrh r3, [r1]
	ldr r0, _08029718
	ands r0, r3
	lsls r1, r0, #5
	ldr r2, _0802971C
	adds r1, #0x18
	ldr r0, [r2, r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080296CC
	b _08029366
_080296CC:
	adds r0, r7, #0
	bl obj_free
	b _08029366
_080296D4:
	.4byte sub_03003750
_080296D8:
	.4byte gGameSetup
_080296DC:
	.4byte gRedZingerBuzzOwner
_080296E0:
	.4byte 0x00000513
_080296E4:
	.4byte gLocalPlayerIndex
_080296E8:
	.4byte 0xFFFFB000
_080296EC:
	.4byte 0x02004284
_080296F0:
	.4byte 0x0200428C
_080296F4:
	.4byte 0x02004290
_080296F8:
	.4byte 0x02004298
_080296FC:
	.4byte gRacerObjects
_08029700:
	.4byte sub_08029E4C
_08029704:
	.4byte red_zinger_sfx_pitch_cb
_08029708:
	.4byte sin_fx
_0802970C:
	.4byte cos_fx
_08029710:
	.4byte _03000814
_08029714:
	.4byte 0x02018F34
_08029718:
	.4byte 0x00007FFF
_0802971C:
	.4byte 0x0201AA4C
_08029720:
	ldr r3, [sp, #0x44]
	ldr r2, [r3, #0xc]
	ldr r4, _08029AC0
	lsls r0, r2, #2
	ldr r2, [r4, r0]
	mov fp, r2
	mov r4, fp
	adds r4, #0xa0
	movs r1, #0xa0
	ldr r2, [r4]
	lsls r3, r1, #5
	movs r1, #0x80
	ands r3, r2
	lsls r0, r1, #3
	cmp r3, r0
	beq _0802976A
	adds r0, r7, #0
	mov r1, fp
	bl destroy_red_zinger
	ldr r2, [r4]
	movs r0, #0x80
	lsls r1, r0, #7
	ands r1, r2
	cmp r1, #0
	bne _08029756
	b _08029362
_08029756:
	ldr r3, [sp, #0x44]
	ldr r1, [r3, #4]
	cmp r1, #0xe
	ble _08029760
	b _08029362
_08029760:
	movs r1, #0x80
	lsls r0, r1, #0xf
	orrs r2, r0
	str r2, [r4]
	b _08029362
_0802976A:
	ldr r3, [sp, #0x44]
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _0802981C
	mov r3, fp
	adds r3, #0x56
	movs r0, #0
	ldrsh r6, [r3, r0]
	ldr r1, _08029AC4
	adds r0, r6, #0
	mov sb, r1
	bl _call_via_r9
	mov sl, r0
	mov r2, sl
	ldr r3, _08029AC8
	lsls r5, r2, #0x10
	asrs r2, r5, #0x10
	mov sl, r3
	adds r0, r6, #0
	mov r8, r2
	bl _call_via_r10
	mov r4, sp
	strh r0, [r4, #0x1c]
	ldrh r3, [r4, #0x1c]
	lsls r1, r3, #0x10
	asrs r4, r1, #0x10
	str r1, [sp, #0x18]
	str r4, [sp, #0x48]
	mov r3, fp
	adds r3, #0x54
	movs r2, #0
	ldrsh r5, [r3, r2]
	adds r0, r5, #0
	bl _call_via_r9
	adds r2, r0, #0
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	bl _call_via_r10
	ldr r3, [sp, #0x48]
	adds r5, r3, #0
	muls r5, r4, r5
	lsls r6, r0, #0x10
	asrs r2, r6, #0x10
	rsbs r3, r2, #0
	ldr r6, _08029ACC
	mov r2, r8
	muls r2, r4, r2
	asrs r1, r5, #0xc
	muls r1, r6, r1
	asrs r4, r2, #0xc
	muls r4, r6, r4
	asrs r5, r1, #0xc
	adds r1, r3, #0
	muls r1, r6, r1
	mov r2, fp
	ldr r0, [r2, #0x24]
	asrs r6, r4, #0xc
	ldr r4, [r7, #0x24]
	asrs r3, r1, #0xc
	adds r1, r0, r5
	subs r2, r4, r1
	mov r4, fp
	mov sl, r3
	ldr r3, [r4, #0x28]
	ldr r0, [r7, #0x28]
	add r3, sl
	subs r1, r0, r3
	ldr r0, [r4, #0x2c]
	adds r3, r0, r6
	ldr r0, [r7, #0x2c]
	subs r0, r0, r3
	ldr r3, [r4, #0x3c]
	asrs r2, r2, #3
	subs r3, r3, r2
	str r3, [r7, #0x3c]
	ldr r3, [r4, #0x40]
	asrs r1, r1, #3
	subs r2, r3, r1
	str r2, [r7, #0x40]
	ldr r1, [r4, #0x44]
	asrs r3, r0, #3
	subs r4, r1, r3
	str r4, [r7, #0x44]
	b _08029362
_0802981C:
	ldr r1, _08029AD0
	ands r2, r1
	str r2, [r4]
	adds r0, r7, #0
	mov r1, fp
	bl destroy_red_zinger
	mov r2, fp
	ldrb r3, [r2, #2]
	movs r0, #0
	cmp r3, #1
	beq _08029892
	cmp r3, #2
	beq _08029884
	cmp r3, #0x35
	beq _08029876
_0802983C:
	cmp r0, #0
	bne _08029842
	b _08029362
_08029842:
	ldr r0, [sp, #0x44]
	ldr r2, [r0, #8]
	ldr r4, _08029AC0
	lsls r1, r2, #2
	ldr r0, [r4, r1]
	mov r1, fp
	bl sub_08020210
	ldr r3, [sp, #0x44]
	ldr r0, [r3, #8]
	lsls r2, r0, #2
	ldr r0, [r4, r2]
	mov r1, fp
	bl sub_0802026C
	ldr r1, _08029AD4
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #6
	beq _0802986C
	b _08029362
_0802986C:
	mov r0, fp
	ldr r1, _08029AD8
	bl sub_08014264
	b _08029362
_08029876:
	ldr r3, [sp, #0x44]
	mov r0, fp
	ldr r1, [r3, #8]
	movs r2, #0
	bl sub_08027FBC
	b _0802983C
_08029884:
	ldr r2, [sp, #0x44]
	mov r0, fp
	ldr r1, [r2, #8]
	movs r2, #0
	bl sub_0800E35C
	b _0802983C
_08029892:
	ldr r4, [sp, #0x44]
	mov r0, fp
	ldr r1, [r4, #8]
	movs r2, #0
	movs r3, #0
	bl player_weapon_hit
	b _0802983C
_080298A2:
	ldr r6, [sp, #0x44]
	ldr r2, [r6, #0xc]
	ldr r4, _08029AC0
	lsls r1, r2, #2
	ldr r2, [r4, r1]
	ldr r3, [r7, #0x30]
	ldr r5, [r2, #0x30]
	mov fp, r2
	subs r0, r5, r3
	asrs r5, r0, #4
	mov r0, fp
	ldr r1, [r0, #0x34]
	ldr r6, [r7, #0x34]
	subs r4, r1, r6
	asrs r3, r4, #4
	ldr r6, [r0, #0x38]
	mov ip, r3
	ldr r3, [r7, #0x38]
	subs r1, r6, r3
	asrs r6, r1, #4
	ldr r1, [r7, #0x3c]
	mov lr, r1
	mov r4, lr
	muls r4, r5, r4
	asrs r0, r4, #8
	ldr r4, [r7, #0x40]
	mov r2, ip
	muls r2, r4, r2
	asrs r5, r2, #8
	adds r2, r0, r5
	ldr r0, [r7, #0x44]
	adds r5, r0, #0
	muls r5, r6, r5
	asrs r6, r5, #8
	adds r1, r2, r6
	mov r2, fp
	ldr r5, [r2, #0x24]
	ldr r3, [r7, #0x24]
	subs r6, r5, r3
	ldr r3, [r2, #0x28]
	ldr r2, [r7, #0x28]
	asrs r5, r6, #4
	subs r6, r3, r2
	mov r2, fp
	asrs r3, r6, #4
	ldr r6, [r2, #0x2c]
	ldr r2, [r7, #0x2c]
	mov sl, r3
	subs r3, r6, r2
	asrs r6, r3, #4
	mov r3, lr
	muls r3, r5, r3
	asrs r2, r3, #8
	mov r3, sl
	muls r3, r4, r3
	asrs r4, r3, #8
	adds r3, r0, #0
	muls r3, r6, r3
	adds r2, r2, r4
	asrs r4, r3, #8
	adds r0, r2, r4
	cmp r1, #0
	blt _08029926
	cmp r0, #0
	bgt _08029926
	b _08029C00
_08029926:
	ldr r0, [sp, #0x44]
	ldr r3, [r0, #0x10]
	ldr r5, [r0, #0x14]
	cmp r3, r5
	blt _08029932
	b _08029BFC
_08029932:
	ldr r2, [r0, #0x18]
_08029934:
	ldr r0, [sp, #0x44]
	ldr r6, [r0, #0x10]
	lsls r5, r2, #1
	lsls r4, r6, #1
	adds r3, r4, r5
	ldr r4, [sp, #0x44]
	str r3, [sp, #0x50]
	adds r0, r6, r5
	str r0, [r4, #0x10]
	mov r4, fp
	ldr r5, [r4, #0x24]
	ldr r3, [r7, #0x24]
	ldr r0, [r4, #0x28]
	ldr r6, [r7, #0x28]
	subs r1, r5, r3
	asrs r5, r1, #4
	subs r1, r0, r6
	asrs r3, r1, #4
	ldr r6, [r4, #0x2c]
	mov sl, r3
	ldr r3, [r7, #0x2c]
	subs r0, r6, r3
	asrs r6, r0, #4
	adds r2, r6, #0
	muls r2, r6, r2
	adds r4, r5, #0
	muls r4, r5, r4
	ldr r1, _08029ADC
	adds r0, r4, r2
	bl _call_via_r1
	ldr r3, [sp, #0x44]
	str r0, [sp, #0x4c]
	str r0, [r3, #0x1c]
	movs r2, #0x80
	ldr r4, [sp, #0x4c]
	lsls r0, r2, #4
	cmp r4, r0
	blt _08029984
	b _08029B5E
_08029984:
	adds r1, r7, #0
	adds r1, #0x56
	str r1, [sp, #0x14]
	ldr r0, _08029AE0
	ldrh r4, [r1]
	mov r8, r0
	adds r1, r6, #0
	adds r0, r5, #0
	bl _call_via_r8
	add r3, sp, #0x40
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov sb, r2
	str r6, [sp, #0x3c]
	mov r1, sb
	ldr r6, _08029AE4
	adds r0, r4, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r3, r2, #0x12
	ldr r0, [sp, #0x14]
	subs r1, r4, r3
	strh r1, [r0]
	ldrh r4, [r0]
	mov r1, sb
	adds r0, r4, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r3, r2, #0x12
	ldr r2, [sp, #0x14]
	subs r1, r4, r3
	strh r1, [r2]
	movs r3, #0x54
	adds r1, r3, r7
	ldrh r4, [r1]
	mov sb, r1
	str r4, [sp, #0x38]
	ldr r1, [sp, #0x4c]
	mov r0, sl
	bl _call_via_r8
	adds r1, r0, #0
	rsbs r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	ldr r0, [sp, #0x38]
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r1, r3, #0x12
	ldr r3, [sp, #0x38]
	subs r2, r3, r1
	str r2, [sp, #0x34]
	mov r0, sp
	ldrh r3, [r0, #0x34]
	mov r1, sb
	strh r3, [r1]
	ldrh r1, [r1]
	mov r8, r1
	mov r0, r8
	adds r1, r4, #0
	bl _call_via_r6
	lsls r6, r0, #0x10
	asrs r1, r6, #0x12
	mov r2, r8
	subs r4, r2, r1
	str r4, [sp, #0x30]
	mov r3, sp
	ldrh r2, [r3, #0x30]
	mov r4, sb
	strh r2, [r4]
	mov r4, fp
	adds r4, #0xa0
	ldr r1, [r4]
	movs r3, #0x80
	lsls r6, r3, #0x11
	ands r1, r6
	cmp r1, #0
	beq _08029A38
	adds r0, r7, #0
	movs r1, #0
	bl destroy_red_zinger
_08029A38:
	ldr r0, [sp, #0x44]
	movs r3, #1
	ldr r6, [r0, #0x24]
	rsbs r2, r3, #0
	cmp r6, r2
	beq _08029AE8
_08029A44:
	ldr r6, [sp, #0x14]
	movs r4, #0
	ldrsh r0, [r6, r4]
	ldr r6, _08029AC8
	bl _call_via_r6
	ldr r1, _08029AC4
	adds r2, r0, #0
	lsls r0, r2, #0x10
	mov r3, sb
	mov r8, r1
	asrs r4, r0, #0x10
	movs r2, #0
	ldrsh r0, [r3, r2]
	bl _call_via_r8
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r1, [sp, #0x50]
	asrs r4, r2, #0xc
	muls r4, r1, r4
	asrs r0, r4, #0xc
	str r0, [r7, #0x3c]
	mov r4, sb
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r6
	ldr r2, [sp, #0x50]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r4, r2, #0
	muls r4, r3, r4
	asrs r0, r4, #0xc
	rsbs r2, r0, #0
	str r2, [r7, #0x40]
	ldr r4, [sp, #0x14]
	movs r2, #0
	ldrsh r0, [r4, r2]
	bl _call_via_r8
	adds r1, r0, #0
	lsls r0, r1, #0x10
	mov r2, sb
	asrs r4, r0, #0x10
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl _call_via_r8
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	ldr r0, [sp, #0x50]
	asrs r2, r1, #0xc
	muls r2, r0, r2
	asrs r4, r2, #0xc
	str r4, [r7, #0x44]
	b _08029362
	.byte 0x00, 0x00
_08029AC0:
	.4byte gRacerObjects
_08029AC4:
	.4byte cos_fx
_08029AC8:
	.4byte sin_fx
_08029ACC:
	.4byte 0xFFFFFCE0
_08029AD0:
	.4byte 0xFFFFFBFF
_08029AD4:
	.4byte gGameSetup
_08029AD8:
	.4byte 0x00001999
_08029ADC:
	.4byte isqrt
_08029AE0:
	.4byte atan2_fx
_08029AE4:
	.4byte _03000814
_08029AE8:
	mov r2, fp
	ldrb r1, [r2, #2]
	cmp r1, #1
	bne _08029A44
	ldr r3, _08029C38
	ldr r6, [r4, #4]
	ldr r4, [r3]
	cmp r6, r4
	bne _08029A44
	ldr r6, [r0, #0x1c]
	movs r2, #0x80
	lsls r4, r2, #4
	subs r1, r4, r6
	lsls r0, r1, #0xf
	asrs r3, r0, #0xb
	cmp r3, #0
	blt _08029B5A
	movs r0, #0x80
	lsls r4, r0, #8
	cmp r3, r4
	ble _08029B14
	adds r3, r4, #0
_08029B14:
	movs r1, #0x80
	ldr r0, [sp, #0x44]
	lsls r2, r1, #8
	ldr r6, [r0, #0x1c]
	adds r1, r3, r2
	movs r3, #0x80
	lsls r4, r3, #4
	subs r0, r4, r6
	lsls r6, r0, #7
	subs r4, r6, r0
	asrs r3, r4, #0xb
	cmp r3, #0
	blt _08029B56
	cmp r3, #0x7f
	ble _08029B34
	movs r3, #0x7f
_08029B34:
	movs r2, #1
	movs r0, #0xa
	str r3, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	movs r6, #0
	ldr r0, _08029C3C
	ldr r1, _08029C40
	adds r2, r7, #0
	movs r3, #0xdd
	str r6, [sp, #0x10]
	bl gamesfx_play_cb
	ldr r4, [sp, #0x44]
	str r0, [r4, #0x24]
	b _08029A44
_08029B56:
	movs r3, #0
	b _08029B34
_08029B5A:
	movs r3, #0
	b _08029B14
_08029B5E:
	adds r1, r7, #0
	adds r1, #0x56
	str r1, [sp, #0x14]
	ldr r0, _08029C44
	ldrh r4, [r1]
	mov r8, r0
	adds r1, r6, #0
	adds r0, r5, #0
	bl _call_via_r8
	mov r1, sp
	strh r0, [r1, #0x2c]
	ldrh r0, [r1, #0x2c]
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov fp, r2
	str r6, [sp, #0x28]
	mov r1, fp
	ldr r6, _08029C48
	adds r0, r4, #0
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	ldr r0, [sp, #0x14]
	subs r1, r4, r2
	strh r1, [r0]
	ldrh r4, [r0]
	mov r1, fp
	adds r0, r4, #0
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	ldr r3, [sp, #0x14]
	subs r1, r4, r2
	strh r1, [r3]
	movs r4, #0x54
	adds r1, r4, r7
	ldrh r2, [r1]
	mov sb, r1
	mov r0, sl
	ldr r1, [sp, #0x4c]
	mov fp, r2
	bl _call_via_r8
	adds r2, r0, #0
	rsbs r1, r2, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	mov r0, fp
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r2, r3, #0x13
	mov r3, fp
	subs r1, r3, r2
	str r1, [sp, #0x24]
	mov r0, sp
	ldrh r2, [r0, #0x24]
	mov r1, sb
	strh r2, [r1]
	ldrh r1, [r1]
	mov r8, r1
	mov r0, r8
	adds r1, r4, #0
	bl _call_via_r6
	lsls r6, r0, #0x10
	asrs r4, r6, #0x13
	mov r2, r8
	subs r3, r2, r4
	str r3, [sp, #0x20]
	mov r3, sp
	ldrh r1, [r3, #0x20]
	mov r4, sb
	strh r1, [r4]
	b _08029A44
_08029BFC:
	movs r2, #0
	b _08029934
_08029C00:
	ldr r0, [sp, #0x44]
	movs r1, #0x3c
	movs r4, #0
	str r4, [r0]
	str r1, [r0, #4]
	ldr r0, _08029C4C
	bl AGBPrintf
	bl _08029362
	.byte 0x00, 0x21, 0x41, 0x60, 0xFF, 0xF7, 0x98, 0xFB, 0x0C, 0x48, 0xE6, 0x24, 0x00, 0x90, 0x0C, 0x49
	.byte 0x0C, 0x48, 0x0D, 0x4A, 0x63, 0x00, 0x08, 0xF0, 0x17, 0xFC, 0x08, 0xF0, 0xAB, 0xFC, 0xFF, 0xEF
	.byte 0xFF, 0xF7, 0x7E, 0xFB
_08029C38:
	.4byte gLocalPlayerIndex
_08029C3C:
	.4byte sub_08029E8C
_08029C40:
	.4byte sub_08029EB0
_08029C44:
	.4byte atan2_fx
_08029C48:
	.4byte _03000814
_08029C4C:
	.4byte gUnk_08052E60
	.4byte gUnk_08052DF0
	.4byte gUnk_08052DFC
	.4byte gUnk_08052E14
	.4byte gUnk_08052E78

	.global react_red_zinger
	.thumb_func
	.type react_red_zinger, %function
react_red_zinger: @ 08029C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	sub sp, #8
	adds r7, r1, #0
	cmp r5, #0
	bne _08029C72
	b _08029DCE
_08029C72:
	cmp r7, #0
	bne _08029C78
	b _08029DB6
_08029C78:
	ldrb r1, [r7, #2]
	cmp r1, #1
	beq _08029CEA
	cmp r1, #2
	beq _08029C9A
	cmp r1, #0x35
	beq _08029D3C
	adds r0, r5, #0
	movs r1, #0
	bl destroy_red_zinger
_08029C8E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08029C9A:
	adds r6, r7, #0
	adds r6, #0xa0
	ldr r0, [r6]
	movs r2, #0xd8
	lsls r3, r2, #4
	ands r0, r3
	cmp r0, #0
	bne _08029D3C
	adds r4, r5, #0
	adds r4, #0xa0
	str r1, [r4]
	ldr r1, [r6, #4]
	movs r2, #0x3c
	str r1, [r4, #0xc]
	str r2, [r4, #4]
	adds r0, r5, #0
	bl obj_remove_vector_hit
	ldr r1, [r6]
	movs r3, #0x80
	lsls r0, r3, #3
	orrs r1, r0
	adds r0, r5, #0
	str r1, [r6]
	adds r0, #0xc0
	bl gamesfx_stop
	ldr r1, _08029DE8
	ldr r0, [r4, #0x34]
	ldr r3, [r1]
	cmp r3, r0
	bne _08029C8E
	movs r2, #1
	rsbs r0, r2, #0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xcc
	bl gamesfx_stop
	b _08029C8E
_08029CEA:
	adds r4, r7, #0
	adds r4, #0xa0
	ldr r2, [r4]
	movs r0, #0x80
	lsls r1, r0, #7
	ands r1, r2
	cmp r1, #0
	beq _08029D30
	adds r0, r5, #0
	adds r1, r7, #0
	adds r5, #0xa0
	bl destroy_red_zinger
	ldr r1, [r5, #8]
	adds r0, r7, #0
	movs r2, #0
	movs r3, #0
	bl player_weapon_hit
	cmp r0, #0
	beq _08029C8E
	ldr r0, [r5, #8]
	ldr r4, _08029DEC
	lsls r2, r0, #2
	ldr r0, [r4, r2]
	adds r1, r7, #0
	bl sub_08020210
	ldr r1, [r5, #8]
	lsls r2, r1, #2
	ldr r0, [r4, r2]
	adds r1, r7, #0
	bl sub_0802026C
	b _08029C8E
_08029D30:
	movs r1, #0xd8
	lsls r3, r1, #4
	ands r3, r2
	mov r8, r3
	cmp r3, #0
	beq _08029D46
_08029D3C:
	adds r0, r5, #0
	adds r1, r7, #0
	bl destroy_red_zinger
	b _08029C8E
_08029D46:
	adds r6, r5, #0
	adds r6, #0xa0
	movs r0, #2
	str r0, [r6]
	ldr r1, [r4, #4]
	movs r2, #0x3c
	str r2, [r6, #4]
	str r1, [r6, #0xc]
	adds r0, r5, #0
	bl obj_remove_vector_hit
	movs r3, #0x80
	ldr r1, [r4]
	lsls r0, r3, #3
	orrs r1, r0
	adds r0, r5, #0
	str r1, [r4]
	adds r0, #0xc0
	bl gamesfx_stop
	adds r0, r5, #0
	adds r0, #0xc4
	bl gamesfx_stop
	ldr r1, _08029DE8
	ldr r0, [r6, #0x34]
	ldr r3, [r1]
	cmp r3, r0
	beq _08029DA6
_08029D80:
	ldr r3, _08029DF0
	ldr r0, [r4, #4]
	ldr r1, [r3]
	cmp r0, r1
	beq _08029D8C
	b _08029C8E
_08029D8C:
	mov r3, r8
	movs r2, #0xa
	str r3, [sp, #4]
	movs r3, #0x80
	str r2, [sp]
	movs r0, #0xdc
	lsls r2, r3, #9
	movs r1, #0xb4
	movs r3, #1
	bl gamesfx_play
	str r0, [r6, #0x28]
	b _08029C8E
_08029DA6:
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r5, #0
	str r2, [r1]
	adds r0, #0xcc
	bl gamesfx_stop
	b _08029D80
_08029DB6:
	ldr r0, _08029DF4
	ldr r1, _08029DF8
	str r0, [sp]
	ldr r2, _08029DFC
	ldr r0, _08029E00
	ldr r3, _08029E04
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08029C78
_08029DCE:
	ldr r0, _08029E08
	ldr r1, _08029DF8
	str r0, [sp]
	ldr r2, _08029DFC
	ldr r0, _08029E00
	ldr r3, _08029E0C
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08029C72
	.byte 0x00, 0x00
_08029DE8:
	.4byte gRedZingerBuzzOwner
_08029DEC:
	.4byte gRacerObjects
_08029DF0:
	.4byte gLocalPlayerIndex
_08029DF4:
	.4byte gUnk_08052E88
_08029DF8:
	.4byte gUnk_08052DFC
_08029DFC:
	.4byte gUnk_08052E94
_08029E00:
	.4byte gUnk_08052E14
_08029E04:
	.4byte 0x00000387
_08029E08:
	.4byte gUnk_08052DF0
_08029E0C:
	.4byte 0x00000386

	.global sub_08029E10
	.thumb_func
	.type sub_08029E10, %function
sub_08029E10: @ 08029E10
	ldr r0, _08029E20
	movs r1, #0
	str r1, [r0]
	ldr r0, _08029E24
	subs r1, #1
	str r1, [r0]
	bx lr
	.byte 0x00, 0x00
_08029E20:
	.4byte 0x0202EC00
_08029E24:
	.4byte gRedZingerBuzzOwner

	.global red_zinger_sfx_pitch_cb
	.thumb_func
	.type red_zinger_sfx_pitch_cb, %function
red_zinger_sfx_pitch_cb: @ 08029E28
	push {lr}
	ldr r2, _08029E44
	adds r1, r0, #0
	ldr r0, [r2]
	ldr r2, _08029E48
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	movs r3, #0x80
	lsls r2, r3, #9
	bl sub_08020130
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08029E44:
	.4byte gLocalPlayerIndex
_08029E48:
	.4byte gRacerObjects

	.global sub_08029E4C
	.thumb_func
	.type sub_08029E4C, %function
sub_08029E4C: @ 08029E4C
	adds r0, #0xa0
	ldr r2, [r0, #0x30]
	movs r0, #0x80
	lsls r1, r0, #9
	subs r0, r1, r2
	lsls r2, r0, #7
	subs r1, r2, r0
	asrs r0, r1, #0x10
	bx lr
	.byte 0x00, 0x00

	.global sub_08029E60
	.thumb_func
	.type sub_08029E60, %function
sub_08029E60: @ 08029E60
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #4]
	ldr r1, _08029E88
	muls r1, r3, r1
	asrs r0, r1, #8
	cmp r0, #0xb4
	ble _08029E80
	movs r0, #0xb4
_08029E72:
	cmp r0, #0
	beq _08029E7A
_08029E76:
	pop {r1}
	bx r1
_08029E7A:
	movs r1, #1
	rsbs r0, r1, #0
	b _08029E76
_08029E80:
	cmp r0, #0
	bge _08029E72
	movs r0, #0
	b _08029E72
_08029E88:
	.4byte 0x00000133

	.global sub_08029E8C
	.thumb_func
	.type sub_08029E8C, %function
sub_08029E8C: @ 08029E8C
	push {lr}
	adds r0, #0xa0
	ldr r3, [r0, #0x1c]
	movs r0, #0x80
	lsls r1, r0, #4
	subs r2, r1, r3
	lsls r0, r2, #7
	subs r1, r0, r2
	asrs r0, r1, #0xb
	cmp r0, #0
	blt _08029EAC
	cmp r0, #0x7f
	ble _08029EA8
	movs r0, #0x7f
_08029EA8:
	pop {r1}
	bx r1
_08029EAC:
	movs r0, #0
	b _08029EA8

	.global sub_08029EB0
	.thumb_func
	.type sub_08029EB0, %function
sub_08029EB0: @ 08029EB0
	push {lr}
	adds r0, #0xa0
	ldr r2, [r0, #0x1c]
	movs r0, #0x80
	lsls r1, r0, #4
	subs r0, r1, r2
	lsls r1, r0, #0xf
	asrs r0, r1, #0xb
	cmp r0, #0
	blt _08029ED8
	movs r2, #0x80
	lsls r3, r2, #8
	cmp r0, r3
	ble _08029ECE
	adds r0, r3, #0
_08029ECE:
	movs r2, #0x80
	lsls r1, r2, #8
	adds r0, r0, r1
	pop {r1}
	bx r1
_08029ED8:
	movs r0, #0
	b _08029ECE

	.global destroy_blue_zinger
	.thumb_func
	.type destroy_blue_zinger, %function
destroy_blue_zinger: @ 08029EDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _08029FF0
	adds r5, r7, #0
	adds r5, #0x5a
	mov sl, r2
	ldrh r2, [r5]
	movs r4, #0x18
	muls r2, r4, r2
	add r2, sl
	ldrh r3, [r2, #0xa]
	sub sp, #0x14
	mov r8, r3
	adds r6, r1, #0
	bl obj_destroy_sprite
	movs r2, #0x23
	adds r0, r7, #0
	movs r1, #0x49
	bl obj_setup_sprite
	ldrh r0, [r5]
	muls r0, r4, r0
	mov r1, r8
	add r0, sl
	strh r1, [r0, #0xa]
	adds r0, r7, #0
	adds r0, #0xc4
	bl gamesfx_stop
	adds r0, r7, #0
	adds r0, #0xc8
	bl gamesfx_stop
	adds r0, r7, #0
	adds r0, #0xcc
	bl gamesfx_stop
	adds r4, r7, #0
	ldr r1, _08029FF4
	adds r4, #0xa0
	ldr r3, [r1]
	ldr r0, [r4, #0x3c]
	cmp r3, r0
	beq _08029FDE
_08029F3C:
	cmp r6, #0
	beq _08029FBC
	ldr r1, [r6, #0x3c]
	str r1, [r7, #0x3c]
	ldr r2, [r6, #0x40]
	str r2, [r7, #0x40]
	ldr r0, [r6, #0x44]
	adds r1, r6, #0
	str r0, [r7, #0x44]
	ldr r2, _08029FF8
	adds r1, #0xa0
	ldr r0, [r1, #4]
	ldr r1, [r2]
	cmp r0, r1
	beq _08029F9A
_08029F5A:
	movs r3, #0x7f
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	movs r3, #0xd2
	bl gamesfx_play_at
_08029F7C:
	ldr r2, [r4]
	cmp r2, #3
	beq _08029F88
	adds r0, r7, #0
	bl obj_remove_vector_hit
_08029F88:
	movs r1, #4
	str r1, [r4]
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08029F9A:
	ldr r2, _08029FFC
	adds r2, #0x8c
	ldr r0, [r2]
	cmp r0, #7
	bne _08029F5A
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xd2
	bl gamesfx_play
	b _08029F7C
_08029FBC:
	movs r3, #0x7f
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r2, [r7, #0x2c]
	str r3, [sp]
	movs r3, #0x80
	lsls r3, r3, #9
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r3, #0xa
	str r3, [sp, #0xc]
	movs r3, #0xd2
	str r6, [sp, #0x10]
	bl gamesfx_play_at
	b _08029F7C
_08029FDE:
	movs r2, #1
	rsbs r0, r2, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xd4
	bl gamesfx_stop
	b _08029F3C
	.byte 0x00, 0x00
_08029FF0:
	.4byte 0x02018F34
_08029FF4:
	.4byte gBlueZingerBuzzOwner
_08029FF8:
	.4byte gLocalPlayerIndex
_08029FFC:
	.4byte gGameSetup

	.global sub_0802A000
	.thumb_func
	.type sub_0802A000, %function
sub_0802A000: @ 0802A000
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r0, _0802A194
	ldr r3, [r1, #4]
	adds r0, #0xa8
	mov sl, r3
	ldrb r3, [r0]
	movs r0, #0
	mov sb, r0
	mov r8, r3
	movs r0, #1
	sub sp, #0x14
	rsbs r7, r0, #0
	cmp sl, r8
	bne _0802A02C
	b _0802A18C
_0802A02C:
	ldr r2, _0802A198
	lsls r0, r3, #2
	ldr r1, [r2, r0]
	movs r2, #0x8c
	lsls r0, r2, #1
	adds r3, r1, r0
	movs r2, #0
	ldrsh r3, [r3, r2]
	adds r2, r4, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	subs r0, r3, r2
	cmp r0, #0
	bgt _0802A04A
	b _0802A140
_0802A04A:
	movs r2, #1
	movs r7, #1
_0802A04E:
	mov sb, r2
_0802A050:
	mov r2, sb
	cmp r2, #0
	beq _0802A0EC
	movs r0, #0x17
	bl obj_new
	ldr r1, [r4, #0x3c]
	adds r6, r0, #0
	ldr r0, [r4, #0x24]
	lsls r3, r1, #1
	adds r5, r0, r3
	str r5, [r6, #0x24]
	ldr r2, [r4, #0x28]
	str r2, [r6, #0x28]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x2c]
	lsls r3, r1, #1
	adds r5, r0, r3
	str r5, [r6, #0x2c]
	adds r1, r4, #0
	adds r1, #0x56
	movs r2, #0x8d
	ldrh r0, [r1]
	lsls r3, r2, #1
	adds r5, r6, #0
	adds r1, r4, r3
	adds r5, #0x56
	ldrh r2, [r1]
	strh r0, [r5]
	adds r5, r6, #0
	adds r5, #0xa0
	str r2, [r5, #0x20]
	adds r0, r6, #0
	movs r1, #0
	bl obj_initialise
	adds r1, r6, #0
	mov r2, sl
	adds r1, #0x90
	str r2, [r5, #8]
	str r4, [r1]
	ldr r0, [r4, #0x50]
	movs r3, #0x8c
	str r0, [r5, #0x10]
	lsls r2, r3, #1
	adds r3, r4, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	movs r0, #0x96
	str r1, [r5, #0x30]
	str r7, [r5]
	str r0, [r5, #4]
	cmp r7, #2
	beq _0802A13A
	movs r0, #1
	rsbs r2, r0, #0
	str r2, [r5, #0xc]
_0802A0C2:
	movs r2, #0x96
	lsls r1, r2, #3
	str r1, [r5, #0x14]
	movs r1, #0xa
	str r1, [r5, #0x18]
	ldr r2, _0802A194
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	cmp r3, #2
	beq _0802A130
_0802A0D6:
	ldr r3, _0802A19C
	ldr r0, [r3]
	cmp sl, r0
	beq _0802A104
_0802A0DE:
	ldr r2, _0802A1A0
	ldr r1, [r2]
	str r1, [r5, #0x3c]
	adds r1, #1
	str r1, [r2]
	cmp r1, #0
	blt _0802A0FE
_0802A0EC:
	mov r0, sb
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_0802A0FE:
	movs r0, #0
	str r0, [r2]
	b _0802A0EC
_0802A104:
	adds r0, r2, #0
	adds r0, #0x8c
	ldr r2, [r0]
	cmp r2, #7
	bne _0802A0DE
	movs r0, #0xb4
	movs r2, #0x80
	str r0, [sp]
	str r1, [sp, #0xc]
	lsls r0, r2, #9
	movs r1, #0
	movs r2, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r1, [sp, #0x10]
	ldr r0, _0802A1A4
	adds r2, r6, #0
	movs r3, #0xd9
	bl gamesfx_play_cb
	str r0, [r5, #0x24]
	b _0802A0DE
_0802A130:
	ldr r0, _0802A1A8
	str r0, [r5, #0x14]
	movs r0, #0xe
	str r0, [r5, #0x18]
	b _0802A0D6
_0802A13A:
	mov r3, r8
	str r3, [r5, #0xc]
	b _0802A0C2
_0802A140:
	ldr r2, [r1, #0x24]
	ldr r3, [r4, #0x24]
	subs r0, r2, r3
	ldr r3, [r4, #0x2c]
	ldr r2, [r1, #0x2c]
	subs r1, r2, r3
	ldr r2, _0802A1AC
	bl _call_via_r2
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	adds r3, r4, #0
	adds r3, #0x56
	movs r2, #0
	ldrsh r1, [r3, r2]
	subs r2, r1, r0
	movs r0, #0xc0
	lsls r1, r0, #6
	adds r3, r2, r1
	lsls r1, r0, #7
	cmp r3, r1
	bhi _0802A174
	movs r3, #1
	movs r7, #2
	mov sb, r3
	b _0802A050
_0802A174:
	ldrb r3, [r4, #2]
	cmp r3, #1
	beq _0802A184
	cmp r3, #2
	beq _0802A180
	b _0802A050
_0802A180:
	movs r7, #0
	b _0802A050
_0802A184:
	movs r0, #1
	movs r7, #0
	mov sb, r0
	b _0802A050
_0802A18C:
	movs r2, #1
	movs r7, #0
	b _0802A04E
	.byte 0x00, 0x00
_0802A194:
	.4byte gGameSetup
_0802A198:
	.4byte gRacerObjects
_0802A19C:
	.4byte gLocalPlayerIndex
_0802A1A0:
	.4byte 0x0202EC08
_0802A1A4:
	.4byte sub_0802AC3C
_0802A1A8:
	.4byte 0x00000684
_0802A1AC:
	.4byte atan2_fx

	.global act_blue_zinger
	.thumb_func
	.type act_blue_zinger, %function
act_blue_zinger: @ 0802A1B0
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	adds r0, #0xa0
	str r0, [sp, #0x14]
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _0802A1D6
	subs r3, #2
	str r3, [r0, #4]
	cmp r3, #0
	bge _0802A1D6
	.2byte 0xF000, 0xFC21 @ bl #0x802aa18
_0802A1D6:
	ldr r0, [sp, #0x14]
	ldr r3, [r0]
	cmp r3, #4
	bhi _0802A25E
	ldr r0, _0802A484
	lsls r4, r3, #2
	ldr r1, [r4, r0]
	mov pc, r1
	.byte 0x00, 0x00
	.global _0802A1E8
_0802A1E8:
	.4byte _0802A1FC
	.4byte _0802A4C4
	.4byte _0802A5EA
	.4byte _0802A894
	.4byte _0802A9E2
	.global _0802A1FC
_0802A1FC:
	ldr r3, [sp, #0x14]
	ldr r1, [r3, #4]
	cmp r1, #0
	bne _0802A206
	b _0802A478
_0802A206:
	ldr r2, [sp, #0x14]
	ldr r0, [r2, #0x10]
	ldr r4, [r2, #0x14]
	cmp r0, r4
	blt _0802A212
	b _0802A474
_0802A212:
	ldr r1, [sp, #0x14]
	ldr r2, [r1, #0x18]
_0802A216:
	ldr r4, [sp, #0x14]
	ldr r3, [r4, #0x10]
	lsls r2, r2, #1
	lsls r1, r3, #1
	adds r0, r1, r2
	str r0, [sp, #0x1c]
	adds r0, r3, r2
	str r0, [r4, #0x10]
	adds r4, r7, #0
	adds r4, #0x56
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r2, _0802A488
	bl _call_via_r2
	ldr r2, [sp, #0x1c]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	adds r3, r2, #0
	muls r3, r1, r3
	movs r0, #0
	asrs r1, r3, #0xc
	str r1, [r7, #0x3c]
	str r0, [r7, #0x40]
	ldr r2, _0802A48C
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r2
	lsls r4, r0, #0x10
	ldr r1, [sp, #0x1c]
	asrs r3, r4, #0x10
	adds r2, r1, #0
	muls r2, r3, r2
	asrs r4, r2, #0xc
_0802A25C:
	str r4, [r7, #0x44]
_0802A25E:
	adds r4, r7, #0
	adds r4, #0x5a
_0802A262:
	ldr r1, [r7, #0x24]
	adds r0, r7, #0
	adds r0, #0x84
	str r1, [r0]
	ldr r2, [r7, #0x28]
	adds r0, #4
	str r2, [r0]
	ldr r1, [r7, #0x2c]
	adds r0, #4
	str r1, [r0]
	ldr r2, [r7, #0x24]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x28]
	str r2, [r7, #0x30]
	adds r2, r2, r3
	ldr r3, [r7, #0x40]
	ldr r0, [r7, #0x2c]
	str r1, [r7, #0x34]
	str r2, [r7, #0x24]
	adds r2, r1, r3
	ldr r1, [r7, #0x44]
	str r2, [r7, #0x28]
	adds r2, r0, r1
	str r0, [r7, #0x38]
	str r2, [r7, #0x2c]
	adds r0, r7, #0
	ldr r1, _0802A490
	bl _call_via_r1
	ldrh r0, [r4]
	bl sub_08002FE0
	ldr r0, [sp, #0x14]
	ldr r3, [r0]
	cmp r3, #2
	bgt _0802A2C4
	cmp r3, #0
	blt _0802A2C4
	ldr r2, _0802A494
	adds r2, #0x8c
	ldr r4, [r2]
	cmp r4, #7
	beq _0802A37C
_0802A2B8:
	ldr r1, _0802A498
	ldr r4, [sp, #0x14]
	ldr r3, [r1]
	ldr r0, [r4, #0x3c]
	cmp r3, r0
	beq _0802A36C
_0802A2C4:
	ldr r3, [sp, #0x14]
	ldr r1, [r3]
	subs r1, #3
	cmp r1, #1
	bls _0802A35A
	ldr r5, [r7, #0x44]
	ldr r6, [r7, #0x3c]
	ldr r2, [r7, #0x40]
	asrs r3, r5, #2
	asrs r4, r6, #2
	mov r8, r3
	asrs r6, r2, #2
	bl sub_08002E78
	adds r5, r0, #0
	cmp r5, #0
	beq _0802A318
	ldr r2, [r7, #0x24]
	str r2, [r5]
	ldr r1, [r7, #0x28]
	str r1, [r5, #4]
	ldr r0, [r7, #0x2c]
	str r0, [r5, #8]
	bl lfsr_next
	asrs r2, r0, #9
	adds r3, r4, r2
	str r3, [r5, #0xc]
	bl lfsr_next
	asrs r1, r0, #9
	adds r2, r6, r1
	str r2, [r5, #0x10]
	bl lfsr_next
	asrs r3, r0, #9
	ldr r0, _0802A49C
	add r3, r8
	movs r1, #0xa
	str r3, [r5, #0x14]
	str r1, [r5, #0x18]
	str r0, [r5, #0x1c]
_0802A318:
	bl sub_08002E78
	adds r5, r0, #0
	cmp r5, #0
	beq _0802A35A
	ldr r1, [r7, #0x24]
	adds r0, r1, r4
	str r0, [r5]
	ldr r2, [r7, #0x28]
	adds r1, r2, r6
	str r1, [r5, #4]
	ldr r0, [r7, #0x2c]
	add r0, r8
	str r0, [r5, #8]
	bl lfsr_next
	asrs r2, r0, #9
	adds r3, r4, r2
	str r3, [r5, #0xc]
	bl lfsr_next
	asrs r1, r0, #9
	adds r2, r6, r1
	str r2, [r5, #0x10]
	bl lfsr_next
	asrs r3, r0, #9
	ldr r0, _0802A49C
	add r3, r8
	movs r1, #0xa
	str r3, [r5, #0x14]
	str r1, [r5, #0x18]
	str r0, [r5, #0x1c]
_0802A35A:
	add sp, #0x20
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802A36C:
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r7, #0
	str r2, [r1]
	adds r0, #0xd4
	bl gamesfx_stop
	b _0802A2C4
_0802A37C:
	ldr r5, _0802A4A0
	ldr r1, [r0, #0xc]
	ldr r2, [r5]
	cmp r1, r2
	beq _0802A2B8
	ldr r4, [r0, #8]
	cmp r4, r2
	beq _0802A2B8
	ldr r3, [r7, #0x24]
	ldr r4, _0802A4A4
	movs r1, #0xa0
	adds r0, r3, r4
	lsls r4, r1, #7
	adds r1, r3, r4
	ldr r3, _0802A4A8
	ldr r2, [r3]
	ldr r3, _0802A4AC
	ldr r3, [r3]
	bl sub_0802C42C
	ldr r2, [sp, #0x14]
	str r0, [r2, #0x40]
	ldr r3, [r7, #0x2c]
	ldr r1, _0802A4A4
	adds r0, r3, r1
	adds r1, r3, r4
	ldr r4, _0802A4B0
	ldr r2, [r4]
	ldr r4, _0802A4B4
	ldr r3, [r4]
	bl sub_0802C42C
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x44]
	ldr r2, [r5]
	lsls r4, r2, #2
	ldr r2, _0802A4B8
	ldr r1, [r2, r4]
	ldr r4, [sp, #0x14]
	ldr r2, [r1, #0x64]
	ldr r3, [r4, #0x40]
	ands r3, r2
	cmp r3, #0
	beq _0802A456
	ldr r2, [r1, #0x68]
	ands r2, r0
	cmp r2, #0
	beq _0802A456
	ldr r3, [r1, #0x24]
	ldr r5, [r7, #0x24]
	ldr r0, [r7, #0x28]
	subs r6, r3, r5
	ldr r5, [r1, #0x28]
	ldr r3, [r1, #0x2c]
	subs r2, r5, r0
	ldr r0, [r7, #0x2c]
	mov sb, r2
	subs r5, r3, r0
	mov r0, sb
	adds r1, r6, #0
	muls r1, r6, r1
	mov r3, sb
	muls r3, r0, r3
	adds r2, r5, #0
	muls r2, r5, r2
	adds r0, r1, r3
	adds r1, r0, r2
	asrs r0, r1, #0xc
	str r0, [r4, #0x38]
	movs r4, #0x80
	lsls r1, r4, #9
	cmp r0, r1
	bgt _0802A446
	ldr r2, _0802A498
	movs r3, #1
	ldr r0, [r2]
	rsbs r4, r3, #0
	cmp r0, r4
	beq _0802A41C
	b _0802A2C4
_0802A41C:
	ldr r0, [sp, #0x14]
	ldr r3, [r0, #0x3c]
	movs r0, #0x7f
	str r3, [r2]
	str r0, [sp]
	str r1, [sp, #4]
	movs r2, #2
	movs r0, #0xa
	movs r1, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r2, r7, #0
	ldr r0, _0802A4BC
	ldr r1, _0802A4C0
	movs r3, #0xdd
	bl gamesfx_play_cb
	ldr r2, [sp, #0x14]
	str r0, [r2, #0x34]
	b _0802A2C4
_0802A446:
	ldr r1, _0802A498
	ldr r4, [sp, #0x14]
	ldr r3, [r1]
	ldr r0, [r4, #0x3c]
	cmp r3, r0
	beq _0802A454
	b _0802A2C4
_0802A454:
	b _0802A464
_0802A456:
	ldr r1, _0802A498
	ldr r0, [sp, #0x14]
	ldr r2, [r1]
	ldr r3, [r0, #0x3c]
	cmp r2, r3
	beq _0802A464
	b _0802A2C4
_0802A464:
	movs r0, #1
	rsbs r2, r0, #0
	adds r0, r7, #0
	str r2, [r1]
	adds r0, #0xd4
	bl gamesfx_stop
	b _0802A2C4
_0802A474:
	movs r2, #0
	b _0802A216
_0802A478:
	adds r0, r7, #0
	movs r1, #0
	bl destroy_blue_zinger
	b _0802A25E
	.byte 0x00, 0x00
_0802A484:
	.4byte _0802A1E8
_0802A488:
	.4byte sin_fx
_0802A48C:
	.4byte cos_fx
_0802A490:
	.4byte sub_03003750
_0802A494:
	.4byte gGameSetup
_0802A498:
	.4byte gBlueZingerBuzzOwner
_0802A49C:
	.4byte 0x00000513
_0802A4A0:
	.4byte gLocalPlayerIndex
_0802A4A4:
	.4byte 0xFFFFB000
_0802A4A8:
	.4byte 0x02004284
_0802A4AC:
	.4byte 0x0200428C
_0802A4B0:
	.4byte 0x02004290
_0802A4B4:
	.4byte 0x02004298
_0802A4B8:
	.4byte gRacerObjects
_0802A4BC:
	.4byte sub_0802AC28
_0802A4C0:
	.4byte blue_zinger_sfx_pitch_cb
	.global _0802A4C4
_0802A4C4:
	ldr r0, [sp, #0x14]
	ldr r6, [r0, #0x10]
	ldr r5, [r0, #0x14]
	cmp r6, r5
	blt _0802A4D0
	b _0802A5E6
_0802A4D0:
	ldr r2, [r0, #0x18]
_0802A4D2:
	ldr r0, [sp, #0x14]
	ldr r5, [r0, #0x10]
	lsls r6, r2, #1
	lsls r4, r5, #1
	adds r3, r4, r6
	ldr r4, [sp, #0x14]
	adds r0, r5, r6
	str r3, [sp, #0x1c]
	str r0, [r4, #0x10]
	adds r0, r7, #0
	bl sub_080122AC
	movs r3, #0xfa
	ldr r2, [r7, #0x28]
	lsls r1, r3, #4
	cmp r2, r1
	bge _0802A5B4
	movs r4, #0x54
	adds r0, r4, r7
	ldrh r4, [r0]
	movs r6, #0xf0
	lsls r5, r6, #8
	mov sl, r0
	adds r1, r5, #0
	ldr r6, _0802A870
	adds r0, r4, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r1, r2, #0x14
	subs r3, r4, r1
	mov r1, sl
	strh r3, [r1]
	ldrh r4, [r1]
	adds r1, r5, #0
	adds r0, r4, #0
	bl _call_via_r6
	lsls r5, r0, #0x10
	asrs r2, r5, #0x14
	subs r1, r4, r2
	mov r2, sl
	strh r1, [r2]
_0802A528:
	movs r6, #0x56
	adds r2, r6, r7
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldr r6, _0802A874
	mov r8, r2
	bl _call_via_r6
	adds r2, r0, #0
	lsls r5, r2, #0x10
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	asrs r4, r5, #0x10
	ldr r5, _0802A878
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r4, [sp, #0x1c]
	asrs r1, r2, #0xc
	muls r1, r4, r1
	asrs r0, r1, #0xc
	str r0, [r7, #0x3c]
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r4, #0
	muls r1, r3, r1
	asrs r2, r1, #0xc
	rsbs r4, r2, #0
	str r4, [r7, #0x40]
	mov r4, r8
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r5
	adds r1, r0, #0
	lsls r0, r1, #0x10
	mov r2, sl
	asrs r4, r0, #0x10
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl _call_via_r5
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	ldr r0, [sp, #0x1c]
	asrs r2, r1, #0xc
	muls r2, r0, r2
	asrs r1, r2, #0xc
	str r1, [r7, #0x44]
	adds r0, r7, #0
	bl racemonitorBlueZingerProgress
	cmp r0, #0
	bne _0802A5AC
	b _0802A25E
_0802A5AC:
	ldr r4, [sp, #0x14]
	movs r0, #2
	str r0, [r4]
	b _0802A25E
_0802A5B4:
	movs r0, #0x54
	adds r3, r0, r7
	ldrh r6, [r3]
	ldr r5, _0802A870
	adds r0, r6, #0
	movs r1, #0
	mov sl, r3
	bl _call_via_r5
	lsls r3, r0, #0x10
	asrs r4, r3, #0x14
	subs r2, r6, r4
	mov r0, sl
	strh r2, [r0]
	ldrh r6, [r0]
	movs r1, #0
	adds r0, r6, #0
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r3, r1, #0x14
	subs r5, r6, r3
	mov r1, sl
	strh r5, [r1]
	b _0802A528
_0802A5E6:
	movs r2, #0
	b _0802A4D2
	.global _0802A5EA
_0802A5EA:
	ldr r1, [sp, #0x14]
	ldr r3, [r1, #0x10]
	ldr r5, [r1, #0x14]
	cmp r3, r5
	blt _0802A5F6
	b _0802A86C
_0802A5F6:
	ldr r2, [r1, #0x18]
_0802A5F8:
	ldr r4, [sp, #0x14]
	ldr r5, [r4, #0x10]
	lsls r3, r2, #1
	lsls r6, r5, #1
	adds r0, r6, r3
	str r0, [sp, #0x1c]
	adds r6, r5, r3
	ldr r2, [r4, #0xc]
	str r6, [r4, #0x10]
	ldr r5, _0802A87C
	lsls r0, r2, #2
	ldr r2, [r5, r0]
	ldr r1, [r7, #0x24]
	ldr r6, [r2, #0x24]
	mov fp, r2
	subs r0, r6, r1
	asrs r6, r0, #4
	mov r0, fp
	ldr r5, [r0, #0x28]
	ldr r3, [r7, #0x28]
	subs r1, r5, r3
	asrs r3, r1, #4
	ldr r5, [r0, #0x2c]
	mov sb, r3
	ldr r3, [r7, #0x2c]
	subs r0, r5, r3
	asrs r5, r0, #4
	adds r1, r6, #0
	muls r1, r6, r1
	adds r2, r5, #0
	muls r2, r5, r2
	adds r0, r1, r2
	ldr r2, _0802A880
	bl _call_via_r2
	str r0, [sp, #0x18]
	str r0, [r4, #0x1c]
	movs r4, #0x56
	adds r1, r4, r7
	ldrh r4, [r1]
	mov r8, r1
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r5, _0802A884
	bl _call_via_r5
	adds r1, r0, #0
	lsls r6, r1, #0x10
	lsrs r5, r6, #0x10
	adds r1, r5, #0
	ldr r6, _0802A870
	adds r0, r4, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r3, r2, #0x13
	subs r1, r4, r3
	mov r3, r8
	strh r1, [r3]
	ldrh r4, [r3]
	adds r1, r5, #0
	adds r0, r4, #0
	bl _call_via_r6
	lsls r5, r0, #0x10
	asrs r2, r5, #0x13
	subs r1, r4, r2
	mov r0, r8
	strh r1, [r0]
	ldr r1, [sp, #0x18]
	movs r0, #0xfa
	lsls r4, r0, #2
	cmp r1, r4
	blt _0802A68E
	b _0802A7FE
_0802A68E:
	movs r5, #0x54
	adds r3, r5, r7
	ldr r2, _0802A884
	mov r0, sb
	ldrh r5, [r3]
	mov sl, r3
	bl _call_via_r2
	adds r1, r0, #0
	rsbs r3, r1, #0
	lsls r0, r3, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	adds r0, r5, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r3, r5, r1
	mov r0, sl
	strh r3, [r0]
	ldrh r5, [r0]
	adds r1, r4, #0
	adds r0, r5, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r1, r2, #0x13
	subs r4, r5, r1
	mov r1, sl
	strh r4, [r1]
_0802A6CC:
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r6, _0802A874
	bl _call_via_r6
	adds r2, r0, #0
	lsls r5, r2, #0x10
	mov r1, sl
	movs r3, #0
	ldrsh r0, [r1, r3]
	asrs r4, r5, #0x10
	ldr r5, _0802A878
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r1, [sp, #0x1c]
	asrs r4, r2, #0xc
	muls r4, r1, r4
	asrs r0, r4, #0xc
	str r0, [r7, #0x3c]
	mov r4, sl
	movs r3, #0
	ldrsh r0, [r4, r3]
	bl _call_via_r6
	ldr r2, [sp, #0x1c]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r4, r2, #0
	muls r4, r3, r4
	asrs r2, r4, #0xc
	rsbs r4, r2, #0
	str r4, [r7, #0x40]
	mov r3, r8
	movs r2, #0
	ldrsh r0, [r3, r2]
	bl _call_via_r5
	adds r1, r0, #0
	lsls r0, r1, #0x10
	mov r2, sl
	asrs r4, r0, #0x10
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl _call_via_r5
	lsls r2, r0, #0x10
	asrs r3, r2, #0x10
	adds r1, r3, #0
	muls r1, r4, r1
	ldr r2, [sp, #0x1c]
	asrs r0, r1, #0xc
	muls r0, r2, r0
	asrs r1, r0, #0xc
	str r1, [r7, #0x44]
	movs r4, #0x80
	ldr r2, [sp, #0x18]
	lsls r3, r4, #4
	cmp r2, r3
	bge _0802A766
	mov r3, fp
	adds r3, #0xa0
	ldr r0, [r3]
	movs r1, #0x80
	lsls r4, r1, #0x11
	ands r0, r4
	cmp r0, #0
	beq _0802A766
	adds r0, r7, #0
	movs r1, #0
	bl destroy_blue_zinger
	b _0802A25E
_0802A766:
	ldr r4, [sp, #0x14]
	movs r3, #1
	ldr r0, [r4, #0x28]
	rsbs r2, r3, #0
	cmp r0, r2
	beq _0802A774
	b _0802A25E
_0802A774:
	movs r0, #0x80
	ldr r2, [sp, #0x18]
	lsls r1, r0, #4
	cmp r2, r1
	blt _0802A780
	b _0802A25E
_0802A780:
	mov r2, fp
	ldrb r4, [r2, #2]
	cmp r4, #1
	beq _0802A78A
	b _0802A25E
_0802A78A:
	mov r3, fp
	ldr r2, _0802A888
	adds r3, #0xa0
	ldr r4, [r3, #4]
	ldr r0, [r2]
	cmp r4, r0
	beq _0802A79A
	b _0802A25E
_0802A79A:
	ldr r0, [sp, #0x14]
	ldr r2, [r0, #0x1c]
	adds r4, r1, #0
	subs r0, r4, r2
	lsls r1, r0, #0xf
	asrs r3, r1, #0xb
	cmp r3, #0
	blt _0802A7FA
	movs r2, #0x80
	lsls r4, r2, #8
	cmp r3, r4
	ble _0802A7B4
	adds r3, r4, #0
_0802A7B4:
	movs r1, #0x80
	ldr r4, [sp, #0x14]
	lsls r2, r1, #8
	ldr r0, [r4, #0x1c]
	adds r1, r3, r2
	movs r3, #0x80
	lsls r4, r3, #4
	subs r2, r4, r0
	lsls r0, r2, #7
	subs r4, r0, r2
	asrs r3, r4, #0xb
	cmp r3, #0
	blt _0802A7F6
	cmp r3, #0x7f
	ble _0802A7D4
	movs r3, #0x7f
_0802A7D4:
	str r1, [sp, #4]
	movs r2, #0xa
	movs r1, #1
	movs r0, #0
	str r3, [sp]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, _0802A88C
	ldr r0, _0802A890
	adds r2, r7, #0
	movs r3, #0xdd
	bl gamesfx_play_cb
	ldr r4, [sp, #0x14]
	str r0, [r4, #0x28]
	b _0802A25E
_0802A7F6:
	movs r3, #0
	b _0802A7D4
_0802A7FA:
	movs r3, #0
	b _0802A7B4
_0802A7FE:
	movs r3, #0xfa
	ldr r0, [r7, #0x28]
	lsls r4, r3, #4
	cmp r0, r4
	bge _0802A83C
	movs r5, #0x54
	adds r3, r5, r7
	ldrh r4, [r3]
	movs r0, #0xf0
	lsls r5, r0, #8
	adds r1, r5, #0
	adds r0, r4, #0
	mov sl, r3
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r1, r2, #0x14
	subs r3, r4, r1
	mov r0, sl
	strh r3, [r0]
	ldrh r4, [r0]
	adds r1, r5, #0
	adds r0, r4, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r1, r2, #0x14
	subs r6, r4, r1
	mov r1, sl
	strh r6, [r1]
	b _0802A6CC
_0802A83C:
	movs r0, #0x54
	adds r2, r0, r7
	ldrh r5, [r2]
	movs r1, #0
	adds r0, r5, #0
	mov sl, r2
	bl _call_via_r6
	lsls r4, r0, #0x10
	asrs r2, r4, #0x14
	subs r1, r5, r2
	mov r3, sl
	strh r1, [r3]
	ldrh r5, [r3]
	movs r1, #0
	adds r0, r5, #0
	bl _call_via_r6
	lsls r3, r0, #0x10
	asrs r4, r3, #0x14
	subs r6, r5, r4
	mov r0, sl
	strh r6, [r0]
	b _0802A6CC
_0802A86C:
	movs r2, #0
	b _0802A5F8
_0802A870:
	.4byte _03000814
_0802A874:
	.4byte sin_fx
_0802A878:
	.4byte cos_fx
_0802A87C:
	.4byte gRacerObjects
_0802A880:
	.4byte isqrt
_0802A884:
	.4byte atan2_fx
_0802A888:
	.4byte gLocalPlayerIndex
_0802A88C:
	.4byte sub_0802AC8C
_0802A890:
	.4byte sub_0802AC68
	.global _0802A894
_0802A894:
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0xc]
	ldr r4, _0802AA20
	lsls r1, r2, #2
	ldr r2, [r4, r1]
	mov fp, r2
	mov r4, fp
	adds r4, #0xa0
	movs r0, #0xc0
	ldr r2, [r4]
	lsls r3, r0, #5
	movs r0, #0x80
	ands r3, r2
	lsls r1, r0, #4
	cmp r3, r1
	beq _0802A8DE
	adds r0, r7, #0
	mov r1, fp
	bl destroy_blue_zinger
	ldr r2, [r4]
	movs r1, #0x80
	lsls r0, r1, #7
	ands r0, r2
	cmp r0, #0
	bne _0802A8CA
	b _0802A25E
_0802A8CA:
	ldr r3, [sp, #0x14]
	ldr r0, [r3, #4]
	cmp r0, #0xe
	ble _0802A8D4
	b _0802A25E
_0802A8D4:
	movs r0, #0x80
	lsls r1, r0, #0xf
	orrs r2, r1
	str r2, [r4]
	b _0802A25E
_0802A8DE:
	ldr r3, [sp, #0x14]
	ldr r1, [r3, #4]
	cmp r1, #0
	beq _0802A982
	mov r3, fp
	adds r3, #0x56
	movs r2, #0
	ldrsh r5, [r3, r2]
	ldr r3, _0802AA24
	adds r0, r5, #0
	mov sb, r3
	bl _call_via_r9
	mov sl, r0
	mov r0, sl
	ldr r1, _0802AA28
	lsls r6, r0, #0x10
	asrs r0, r6, #0x10
	mov sl, r1
	mov r8, r0
	adds r0, r5, #0
	bl _call_via_r10
	mov r3, fp
	adds r2, r0, #0
	adds r3, #0x54
	lsls r4, r2, #0x10
	movs r2, #0
	ldrsh r6, [r3, r2]
	adds r0, r6, #0
	bl _call_via_r9
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r5, r4, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	bl _call_via_r10
	adds r6, r5, #0
	muls r6, r4, r6
	lsls r1, r0, #0x10
	asrs r2, r1, #0x10
	ldr r1, _0802AA2C
	asrs r5, r6, #0xc
	muls r5, r1, r5
	asrs r6, r5, #0xc
	mov r5, r8
	muls r5, r4, r5
	asrs r4, r5, #0xc
	muls r4, r1, r4
	rsbs r3, r2, #0
	adds r2, r3, #0
	muls r2, r1, r2
	asrs r5, r4, #0xc
	mov r4, fp
	asrs r3, r2, #0xc
	ldr r2, [r4, #0x24]
	ldr r1, [r7, #0x24]
	mov sb, r3
	adds r0, r2, r6
	ldr r3, [r4, #0x28]
	subs r2, r1, r0
	ldr r0, [r7, #0x28]
	add r3, sb
	subs r1, r0, r3
	ldr r0, [r4, #0x2c]
	adds r3, r0, r5
	ldr r0, [r7, #0x2c]
	subs r0, r0, r3
	ldr r3, [r4, #0x3c]
	asrs r2, r2, #3
	subs r3, r3, r2
	str r3, [r7, #0x3c]
	ldr r3, [r4, #0x40]
	asrs r1, r1, #3
	subs r2, r3, r1
	str r2, [r7, #0x40]
	ldr r2, [r4, #0x44]
	asrs r1, r0, #3
	subs r4, r2, r1
	b _0802A25C
_0802A982:
	ldr r0, _0802AA30
	ands r2, r0
	mov r1, fp
	adds r0, r7, #0
	str r2, [r4]
	bl destroy_blue_zinger
	mov r1, fp
	ldrb r3, [r1, #2]
	movs r0, #0
	cmp r3, #1
	beq _0802A9D2
	cmp r3, #2
	beq _0802A9C4
_0802A99E:
	cmp r0, #0
	bne _0802A9A4
	b _0802A25E
_0802A9A4:
	ldr r3, [sp, #0x14]
	ldr r1, [r3, #8]
	ldr r4, _0802AA20
	lsls r2, r1, #2
	ldr r0, [r4, r2]
	mov r1, fp
	bl sub_08020210
	ldr r3, [sp, #0x14]
	ldr r0, [r3, #8]
	lsls r1, r0, #2
	ldr r0, [r4, r1]
	mov r1, fp
	bl sub_0802026C
	b _0802A25E
_0802A9C4:
	ldr r2, [sp, #0x14]
	mov r0, fp
	ldr r1, [r2, #8]
	movs r2, #0
	bl sub_0800E35C
	b _0802A99E
_0802A9D2:
	ldr r4, [sp, #0x14]
	mov r0, fp
	ldr r1, [r4, #8]
	movs r2, #0
	movs r3, #0
	bl player_weapon_hit
	b _0802A99E
	.global _0802A9E2
_0802A9E2:
	adds r4, r7, #0
	adds r4, #0x5a
	ldrh r1, [r4]
	movs r0, #0x18
	muls r1, r0, r1
	ldr r2, _0802AA34
	adds r1, #8
	adds r0, r1, r2
	ldrh r1, [r0, #2]
	adds r1, #8
	strh r1, [r0, #2]
	ldrh r3, [r0]
	ldr r1, _0802AA38
	ands r1, r3
	lsls r0, r1, #5
	ldr r2, _0802AA3C
	adds r0, #0x18
	ldr r1, [r2, r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0802AA10
	b _0802A262
_0802AA10:
	adds r0, r7, #0
	bl obj_free
	b _0802A262
	.byte 0x00, 0x21, 0x41, 0x60, 0xFF, 0xF7, 0xDB, 0xFB
_0802AA20:
	.4byte gRacerObjects
_0802AA24:
	.4byte cos_fx
_0802AA28:
	.4byte sin_fx
_0802AA2C:
	.4byte 0xFFFFFCE0
_0802AA30:
	.4byte 0xFFFFF7FF
_0802AA34:
	.4byte 0x02018F34
_0802AA38:
	.4byte 0x00007FFF
_0802AA3C:
	.4byte 0x0201AA4C
