@ asm/act_boss_marker.s: ROM 0x026254-0x027474 (rom, VMA 0x08026254)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_boss_marker
	.thumb_func
	.type init_boss_marker, %function
init_boss_marker: @ 08026254
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08026278
_0802625E:
	ldr r2, _08026274
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #1
	strh r2, [r4]
	add sp, #4
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	pop {r4}
	pop {r0}
	bx r0
_08026274:
	.4byte 0x00000001
_08026278:
	ldr r0, _08026290
	ldr r1, _08026294
	str r0, [sp]
	ldr r2, _08026298
	ldr r0, _0802629C
	movs r3, #0x16
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802625E
_08026290:
	.4byte gUnk_08052AE8
_08026294:
	.4byte gUnk_08052AF4
_08026298:
	.4byte gUnk_08052B0C
_0802629C:
	.4byte gUnk_08052B20

	.global act_boss_marker
	.thumb_func
	.type act_boss_marker, %function
act_boss_marker: @ 080262A0
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _080262FC
_080262AA:
	adds r4, r5, #0
	adds r4, #0xa0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080262DA
_080262B4:
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x10]
	cmp r2, r1
	beq _080262CA
	cmp r2, #0
	beq _080262D2
	adds r0, r5, #0
	bl obj_add_draw
_080262C6:
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x10]
_080262CA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_080262D2:
	adds r0, r5, #0
	bl obj_remove_draw
	b _080262C6
_080262DA:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #3
	bl obj_setup_sprite
	adds r2, r5, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _08026318
	adds r0, r1, r3
	ldr r1, _08026314
	strh r1, [r0, #0xa]
	movs r1, #1
	str r1, [r4, #4]
	b _080262B4
_080262FC:
	ldr r0, _0802631C
	ldr r1, _08026320
	str r0, [sp]
	ldr r2, _08026324
	ldr r0, _08026328
	movs r3, #0x28
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080262AA
_08026314:
	.4byte 0x00000040
_08026318:
	.4byte 0x02018F34
_0802631C:
	.4byte gUnk_08052AE8
_08026320:
	.4byte gUnk_08052AF4
_08026324:
	.4byte gUnk_08052B5C
_08026328:
	.4byte gUnk_08052B20

	.global react_boss_marker
	.thumb_func
	.type react_boss_marker, %function
react_boss_marker: @ 0802632C
	push {r4, lr}
	sub sp, #4
	adds r4, r1, #0
	cmp r0, #0
	beq _0802635A
_08026336:
	cmp r4, #0
	beq _08026342
_0802633A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08026342:
	ldr r0, _08026374
	ldr r1, _08026378
	str r0, [sp]
	ldr r2, _0802637C
	ldr r0, _08026380
	movs r3, #0x47
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802633A
_0802635A:
	ldr r0, _08026384
	ldr r1, _08026378
	str r0, [sp]
	ldr r2, _0802637C
	ldr r0, _08026380
	movs r3, #0x46
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08026336
	.byte 0x00, 0x00
_08026374:
	.4byte gUnk_08052B6C
_08026378:
	.4byte gUnk_08052AF4
_0802637C:
	.4byte gUnk_08052B78
_08026380:
	.4byte gUnk_08052B20
_08026384:
	.4byte gUnk_08052AE8

	.global sub_08026388
	.thumb_func
	.type sub_08026388, %function
sub_08026388: @ 08026388
	push {lr}
	ldr r2, _080263E8
	movs r1, #2
	ldrsh r0, [r2, r1]
	sub sp, #4
	cmp r0, #1
	beq _08026410
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _080263EC
	adds r0, #0x38
_080263A6:
	ldr r1, [r3, r0]
	ldrh r3, [r1]
	ldr r0, _080263F0
	strh r3, [r0]
	ldrh r0, [r1, #2]
	ldr r2, _080263F4
	lsls r3, r0, #0x10
	strh r0, [r2]
	asrs r0, r3, #0x10
	movs r3, #0x2c
	muls r3, r0, r3
	ldr r2, _080263F8
	adds r1, #4
	str r1, [r2]
	adds r1, r1, r3
	ldr r3, _080263FC
	str r1, [r3]
	cmp r0, #0
	beq _08026408
_080263CC:
	mov r0, sp
	ldr r1, _080263E4
	adds r0, #2
	strh r1, [r0]
	ldr r2, _08026400
	ldr r1, _08026404
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080263E4:
	.4byte 0x00000000
_080263E8:
	.4byte gGameSetup
_080263EC:
	.4byte gUnk_087146C0
_080263F0:
	.4byte 0x0202EBFC
_080263F4:
	.4byte 0x0202EBFE
_080263F8:
	.4byte 0x0202EBF4
_080263FC:
	.4byte 0x0202EBF8
_08026400:
	.4byte 0x010000F0
_08026404:
	.4byte 0x0202EA14
_08026408:
	ldr r0, _08026424
	bl AGBPrintf
	b _080263CC
_08026410:
	adds r0, r2, #0
	adds r0, #0x86
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x94
	muls r0, r2, r0
	ldr r3, _08026428
	adds r0, #0x3c
	b _080263A6
	.byte 0x00, 0x00
_08026424:
	.4byte gUnk_08052B8C
_08026428:
	.4byte gUnk_087146C0

	.global sub_0802642C
	.thumb_func
	.type sub_0802642C, %function
sub_0802642C: @ 0802642C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x10
	adds r6, r1, #0
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x28]
	mov ip, r0
	ldr r0, [r6, #0x60]
	str r3, [sp, #4]
	lsls r3, r0, #2
	str r2, [sp, #8]
	adds r2, r3, #0
	adds r2, #0x30
	str r3, [sp]
	ldr r3, [r6, r2]
	adds r2, r0, #1
	mov sl, r3
	adds r3, r2, #0
	cmp r2, #0
	bge _0802645E
	b _080267DC
_0802645E:
	asrs r5, r3, #2
	lsls r4, r5, #2
	subs r1, r2, r4
	lsls r3, r1, #2
	mov fp, r3
	adds r2, r0, #2
	adds r3, #0x30
	ldr r7, [r6, r3]
	adds r3, r2, #0
	cmp r2, #0
	bge _08026476
	b _080267D8
_08026476:
	asrs r5, r3, #2
	lsls r4, r5, #2
	subs r1, r2, r4
	lsls r3, r1, #2
	mov sb, r3
	adds r3, #0x30
	ldr r3, [r6, r3]
	mov lr, r3
	adds r3, r0, #3
	adds r1, r3, #0
	cmp r3, #0
	bge _08026490
	b _080267D4
_08026490:
	asrs r5, r1, #2
	lsls r0, r5, #2
	subs r2, r3, r0
	lsls r1, r2, #2
	adds r4, r1, #0
	adds r4, #0x30
	ldr r3, [r6, r4]
	lsls r4, r7, #1
	adds r5, r4, r7
	mov r2, sl
	mov r8, r3
	subs r3, r5, r2
	mov r5, lr
	lsls r2, r5, #1
	add r2, lr
	subs r0, r3, r2
	add r0, r8
	mov r2, ip
	muls r2, r0, r2
	adds r3, r2, #0
	asrs r2, r3, #0xc
	mov r0, ip
	muls r0, r2, r0
	adds r3, r0, #0
	asrs r0, r3, #0xc
	mov r2, ip
	muls r2, r0, r2
	mov r3, sl
	asrs r0, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r7, #2
	adds r3, r7, r3
	subs r2, r2, r3
	lsls r3, r5, #2
	adds r7, r2, r3
	mov r5, r8
	subs r3, r7, r5
	mov r5, ip
	muls r5, r3, r5
	asrs r7, r5, #0xc
	mov r2, ip
	muls r2, r7, r2
	adds r5, r2, #0
	asrs r2, r5, #0xc
	adds r0, r0, r2
	mov r5, sl
	mov r2, lr
	subs r7, r2, r5
	mov r5, ip
	muls r5, r7, r5
	adds r2, r5, #0
	ldr r7, [sp]
	asrs r5, r2, #0xc
	adds r2, r0, r5
	adds r3, r2, r4
	adds r7, #0x40
	asrs r0, r3, #1
	ldr r3, [r6, r7]
	mov sl, r3
	mov r3, fp
	adds r3, #0x40
	ldr r7, [r6, r3]
	mov r3, sb
	adds r3, #0x40
	ldr r3, [r6, r3]
	adds r5, r1, #0
	adds r5, #0x40
	mov lr, r3
	ldr r3, [r6, r5]
	lsls r5, r7, #1
	adds r4, r5, r7
	mov r2, sl
	mov r8, r3
	subs r3, r4, r2
	mov r4, lr
	lsls r2, r4, #1
	add r2, lr
	subs r4, r3, r2
	add r4, r8
	mov r2, ip
	muls r2, r4, r2
	adds r4, r2, #0
	asrs r2, r4, #0xc
	mov r4, ip
	muls r4, r2, r4
	adds r2, r4, #0
	asrs r4, r2, #0xc
	mov r2, ip
	muls r2, r4, r2
	mov r3, sl
	asrs r4, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r7, #2
	adds r3, r7, r3
	mov r7, lr
	subs r2, r2, r3
	lsls r3, r7, #2
	adds r2, r2, r3
	mov r3, r8
	subs r7, r2, r3
	mov r3, ip
	muls r3, r7, r3
	asrs r7, r3, #0xc
	mov r2, ip
	muls r2, r7, r2
	adds r3, r2, #0
	asrs r2, r3, #0xc
	adds r4, r4, r2
	mov r7, sl
	mov r2, lr
	subs r3, r2, r7
	mov r2, ip
	muls r2, r3, r2
	adds r7, r2, #0
	asrs r2, r7, #0xc
	adds r7, r4, r2
	adds r3, r7, r5
	ldr r5, [sp]
	adds r5, #0x50
	asrs r4, r3, #1
	ldr r3, [r6, r5]
	mov sl, r3
	mov r3, fp
	adds r3, #0x50
	ldr r7, [r6, r3]
	mov r3, sb
	adds r3, #0x50
	adds r1, #0x50
	ldr r3, [r6, r3]
	ldr r1, [r6, r1]
	lsls r5, r7, #1
	mov lr, r3
	adds r2, r5, r7
	mov r8, r1
	mov r1, sl
	subs r3, r2, r1
	mov r1, lr
	lsls r2, r1, #1
	add r2, lr
	subs r1, r3, r2
	add r1, r8
	mov r2, ip
	muls r2, r1, r2
	adds r1, r2, #0
	asrs r2, r1, #0xc
	mov r1, ip
	muls r1, r2, r1
	adds r2, r1, #0
	asrs r1, r2, #0xc
	mov r2, ip
	muls r2, r1, r2
	mov r3, sl
	asrs r1, r2, #0xc
	lsls r2, r3, #1
	lsls r3, r7, #2
	adds r3, r7, r3
	mov r7, lr
	subs r2, r2, r3
	lsls r3, r7, #2
	adds r2, r2, r3
	mov r3, r8
	subs r7, r2, r3
	mov r3, ip
	muls r3, r7, r3
	asrs r7, r3, #0xc
	mov r2, ip
	muls r2, r7, r2
	adds r3, r2, #0
	asrs r2, r3, #0xc
	adds r1, r1, r2
	mov r7, sl
	mov r2, lr
	subs r3, r2, r7
	mov r7, ip
	muls r7, r3, r7
	adds r3, r7, #0
	asrs r7, r3, #0xc
	adds r2, r1, r7
	adds r3, r2, r5
	ldr r5, [sp, #8]
	str r0, [r5]
	ldr r5, [sp, #4]
	ldr r7, [sp, #0x34]
	asrs r1, r3, #1
	str r4, [r5]
	str r1, [r7]
	ldr r7, [sp, #0xc]
	ldr r3, [r7, #0x24]
	subs r2, r0, r3
	ldr r3, [r7, #0x2c]
	asrs r0, r2, #8
	subs r2, r1, r3
	asrs r3, r2, #8
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r3, #0
	muls r0, r3, r0
	asrs r2, r2, #8
	asrs r1, r0, #8
	adds r0, r2, r1
	cmp r0, #0x32
	bgt _08026626
	b _080267D0
_08026626:
	movs r1, #0x20
	rsbs r2, r1, #0
_0802662A:
	ldr r1, [r6, #0x24]
	lsls r2, r2, #1
	lsls r0, r1, #1
	mov fp, r2
	adds r2, r0, r2
	cmp r2, #0
	ble _0802663E
	ldr r1, [r6, #0x28]
	adds r0, r1, r2
	str r0, [r6, #0x28]
_0802663E:
	movs r3, #0x80
	ldr r1, [r6, #0x28]
	lsls r2, r3, #5
	cmp r1, r2
	bge _0802664A
	b _0802678E
_0802664A:
	ldr r1, [r6, #0x2c]
	movs r4, #0x2c
	muls r1, r4, r1
	ldr r2, _080267E0
	ldr r5, [r2]
	ldr r0, _080267E4
	adds r7, r5, r1
	ldrh r1, [r7, #6]
	ldr r4, [r0]
	ldrh r5, [r7, #8]
	lsls r7, r1, #2
	adds r3, r7, r4
	ldrh r2, [r3]
	mov sb, r1
	mov sl, r2
	cmp r5, #1
	ble _080266E0
	movs r4, #0
	cmp r5, #0
	beq _08026682
	adds r1, r3, #2
	adds r2, r5, #0
_08026676:
	ldrh r0, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r0
	cmp r2, #0
	bne _08026676
_08026682:
	movs r3, #0x80
	lsls r7, r3, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _0802668E
	b _080267CC
_0802668E:
	adds r0, r7, #0
	ldr r2, _080267E8
	bl _call_via_r2
	adds r1, r7, #0
	eors r1, r4
	mov r8, r0
	cmp r1, #0
	bge _080266A2
	b _080267C4
_080266A2:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	bge _080266E0
	ldr r0, _080267E4
	ldr r7, [r0]
	mov r0, sb
	lsls r3, r0, #2
	adds r1, r3, r7
	adds r3, r0, r5
	lsls r3, r3, #2
	mov lr, r3
_080266C0:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _080266D8
	ldrh r1, [r1]
	mov r2, lr
	mov sl, r1
	adds r1, r2, r7
	adds r2, r5, #0
_080266D8:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _080266C0
_080266E0:
	movs r7, #0x2c
	mov r1, sl
	muls r1, r7, r1
	mov r3, sl
	str r3, [r6, #0x2c]
	ldr r0, _080267E0
	ldr r2, [r0]
	ldr r4, [r6, #0x60]
	adds r0, r2, r1
	lsls r1, r4, #2
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r1, #0x30
	lsls r7, r5, #8
	str r7, [r6, r1]
	ldr r5, [r6, #0x60]
	lsls r1, r5, #2
	movs r5, #2
	ldrsh r3, [r0, r5]
	adds r1, #0x40
	lsls r7, r3, #8
	str r7, [r6, r1]
	ldr r7, [r6, #0x60]
	lsls r1, r7, #2
	movs r7, #4
	ldrsh r3, [r0, r7]
	adds r1, #0x50
	lsls r3, r3, #8
	str r3, [r6, r1]
	ldr r1, [r6, #0x60]
	adds r2, r1, #1
	adds r3, r2, #0
	cmp r2, #0
	blt _080267C0
_08026724:
	asrs r1, r3, #2
	lsls r3, r1, #2
	subs r1, r2, r3
	str r1, [r6, #0x60]
	movs r1, #0
	str r1, [r6, #0x28]
	adds r2, r6, #0
	adds r2, #0xe4
	movs r1, #1
	ldr r3, [r2]
	rsbs r1, r1, #0
	cmp r3, r1
	beq _080267B0
_0802673E:
	ldrh r2, [r0, #0x10]
	cmp r2, #0
	beq _08026766
	movs r1, #0xae
	lsls r3, r1, #1
	adds r1, r6, r3
	ldr r4, [r1]
	lsls r2, r4, #2
	movs r4, #0xb2
	lsls r4, r4, #1
	adds r3, r2, r4
	ldr r2, [r6, #0x2c]
	str r2, [r6, r3]
	ldr r2, [r1]
	adds r2, #1
	str r2, [r1]
	cmp r2, #9
	ble _08026766
	movs r2, #0
	str r2, [r1]
_08026766:
	ldrh r1, [r0, #0xe]
	cmp r1, #0
	beq _0802678E
	movs r3, #0xc8
	lsls r5, r3, #1
	adds r1, r6, r5
	ldr r7, [r1]
	movs r0, #0xcc
	lsls r2, r7, #2
	lsls r7, r0, #1
	adds r0, r2, r7
	ldr r2, [r6, #0x2c]
	str r2, [r6, r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #9
	ble _0802678E
	movs r2, #0
	str r2, [r1]
_0802678E:
	ldr r1, [r6, #0x24]
	add r1, fp
	str r1, [r6, #0x24]
	cmp r1, #0
	blt _080267AA
_08026798:
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080267AA:
	movs r0, #0
	str r0, [r6, #0x24]
	b _08026798
_080267B0:
	adds r3, r0, #0
	adds r3, #0x29
	ldrb r1, [r3]
	cmp r1, #0
	beq _0802673E
	ldr r1, [r6, #0x2c]
	str r1, [r2]
	b _0802673E
_080267C0:
	adds r3, r1, #4
	b _08026724
_080267C4:
	mov r3, r8
	rsbs r3, r3, #0
	mov r8, r3
	b _080266A2
_080267CC:
	rsbs r1, r4, #0
	b _0802668E
_080267D0:
	movs r2, #0x20
	b _0802662A
_080267D4:
	adds r1, r0, #6
	b _08026490
_080267D8:
	adds r3, r0, #5
	b _08026476
_080267DC:
	adds r3, r0, #4
	b _0802645E
_080267E0:
	.4byte 0x0202EBF4
_080267E4:
	.4byte 0x0202EBF8
_080267E8:
	.4byte udiv

	.global sub_080267EC
	.thumb_func
	.type sub_080267EC, %function
sub_080267EC: @ 080267EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	movs r3, #0xc6
	adds r4, r0, #0
	adds r7, r1, #0
	lsls r0, r3, #1
	adds r2, r7, r0
	ldr r0, [r2]
	cmp r0, #1
	bne _08026806
	b _0802691A
_08026806:
	movs r4, #0x80
	adds r2, r4, r7
	ldr r4, [r2]
	lsls r6, r4, #0x18
	asrs r0, r6, #0x10
	ldr r6, _080269B0
	mov r8, r2
	bl _call_via_r6
	lsls r5, r0, #0x10
	asrs r3, r5, #0x10
	adds r1, r3, #0
	muls r1, r3, r1
	movs r0, #0x84
	adds r3, r0, r7
	ldr r2, [r3]
	asrs r5, r1, #0xc
	adds r1, r2, #0
	muls r1, r5, r1
	adds r4, #2
	lsls r0, r4, #0x18
	asrs r5, r1, #0xc
	asrs r2, r0, #0x10
	mov r1, r8
	str r4, [r1]
	adds r0, r2, #0
	mov sl, r3
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	asrs r6, r2, #0xc
	mov r2, sl
	ldr r4, [r2]
	muls r4, r6, r4
	asrs r1, r4, #0xc
	subs r2, r1, r5
	asrs r4, r2, #1
	movs r5, #0x64
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r6, [r7, #0x7c]
	adds r0, r6, r2
	lsls r6, r1, #0x10
	lsrs r5, r6, #0x10
	str r0, [r7, #0x7c]
	ldr r6, _080269B4
	ldrh r0, [r7, #0xc]
	adds r1, r5, #0
	bl _call_via_r6
	ldr r4, [r7, #0xc]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	subs r4, r4, r2
	lsls r3, r4, #0x10
	str r4, [r7, #0xc]
	lsrs r0, r3, #0x10
	adds r1, r5, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	subs r3, r4, r2
	ldrh r0, [r7]
	str r3, [r7, #0xc]
	adds r1, r5, #0
	bl _call_via_r6
	ldr r4, [r7]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	subs r4, r4, r2
	lsls r3, r4, #0x10
	str r4, [r7]
	lsrs r0, r3, #0x10
	adds r1, r5, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	subs r3, r4, r2
	str r3, [r7]
	mov r1, r8
	ldr r4, [r1]
	cmp r4, #0x3f
	ble _080268D6
	bl multi_lfsr_next
	movs r5, #0xfa
	lsls r2, r5, #5
	muls r2, r0, r2
	ldr r1, _080269B8
	lsrs r0, r2, #0x10
	adds r5, r0, r1
	movs r4, #0
	mov r1, r8
	str r4, [r1]
	ldr r1, [r7, #0x7c]
	mov r2, sl
	subs r0, r5, r1
	str r0, [r2]
_080268D6:
	movs r3, #8
	ldrsh r5, [r7, r3]
	ldr r4, _080269BC
	adds r0, r5, #0
	bl _call_via_r4
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	ldr r1, _080269B0
	adds r0, r5, #0
	bl _call_via_r1
	ldr r1, [r7, #0x7c]
	adds r3, r4, #0
	muls r3, r1, r3
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	asrs r2, r3, #0xc
	ldr r3, [r7, #0x64]
	adds r3, r3, r2
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r1, [r7, #0x6c]
	str r3, [r7, #0x70]
	asrs r3, r2, #0xc
	subs r0, r1, r3
	str r0, [r7, #0x78]
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802691A:
	ldr r0, _080269C0
	ldr r1, [r0]
	ldr r6, [r4, #0x24]
	ldr r5, [r1, #0x24]
	ldr r2, [r4, #0x2c]
	subs r0, r5, r6
	ldr r6, [r1, #0x2c]
	ldr r5, _080269C4
	subs r1, r6, r2
	bl _call_via_r5
	adds r4, r0, #0
	ldr r0, [r7, #8]
	subs r2, r4, r0
	lsls r6, r2, #0x10
	lsrs r5, r6, #0x10
	ldrh r0, [r7, #0xc]
	ldr r6, _080269B4
	adds r1, r5, #0
	bl _call_via_r6
	ldr r4, [r7, #0xc]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x14
	subs r4, r4, r2
	lsls r3, r4, #0x10
	adds r1, r5, #0
	str r4, [r7, #0xc]
	lsrs r0, r3, #0x10
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r5, r1, #0x14
	subs r2, r4, r5
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	str r2, [r7, #0xc]
	adds r0, r3, #0
	ldr r1, _080269B0
	bl _call_via_r1
	lsls r5, r0, #0x10
	asrs r2, r5, #0x10
	movs r4, #0xc8
	adds r5, r2, #0
	muls r5, r4, r5
	ldr r1, [r7, #0x7c]
	asrs r3, r5, #0xc
	asrs r0, r5, #0xd
	movs r4, #0x64
	adds r2, r1, r3
	adds r1, r0, #0
	muls r1, r4, r1
	lsls r3, r1, #0x10
	lsrs r5, r3, #0x10
	ldrh r0, [r7]
	adds r1, r5, #0
	str r2, [r7, #0x7c]
	bl _call_via_r6
	ldr r4, [r7]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x14
	subs r4, r4, r1
	lsls r3, r4, #0x10
	adds r1, r5, #0
	str r4, [r7]
	lsrs r0, r3, #0x10
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r5, r2, #0x14
	subs r1, r4, r5
	str r1, [r7]
	b _080268D6
_080269B0:
	.4byte sin_fx
_080269B4:
	.4byte _03000814
_080269B8:
	.4byte 0xFFFFF060
_080269BC:
	.4byte cos_fx
_080269C0:
	.4byte gRacerObjects
_080269C4:
	.4byte atan2_fx

	.global sub_080269C8
	.thumb_func
	.type sub_080269C8, %function
sub_080269C8: @ 080269C8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	movs r3, #0xc6
	adds r7, r1, #0
	lsls r2, r3, #1
	adds r1, r7, r2
	mov sb, r0
	ldr r0, [r1]
	sub sp, #4
	cmp r0, #1
	bne _080269E8
	b _08026AD2
_080269E8:
	movs r4, #0x88
	adds r2, r4, r7
	ldr r4, [r2]
	lsls r6, r4, #0x18
	asrs r0, r6, #0x10
	ldr r6, _08026B54
	mov sl, r2
	bl _call_via_r6
	lsls r5, r0, #0x10
	asrs r3, r5, #0x10
	adds r1, r3, #0
	muls r1, r3, r1
	movs r0, #0x8c
	adds r3, r0, r7
	ldr r2, [r3]
	asrs r5, r1, #0xc
	adds r1, r2, #0
	muls r1, r5, r1
	adds r4, #2
	mov r0, sl
	str r4, [r0]
	lsls r0, r4, #0x18
	asrs r2, r0, #0x10
	adds r0, r2, #0
	asrs r5, r1, #0xc
	mov fp, r3
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r4, r3, #0
	muls r4, r3, r4
	mov r1, fp
	ldr r6, [r1]
	asrs r2, r4, #0xc
	muls r6, r2, r6
	asrs r1, r6, #0xc
	subs r4, r1, r5
	asrs r3, r4, #1
	movs r5, #0x64
	mov r8, r3
	rsbs r0, r5, #0
	mov r2, r8
	muls r2, r0, r2
	str r4, [sp]
	lsls r6, r2, #0x10
	lsrs r5, r6, #0x10
	ldrh r0, [r7, #4]
	ldr r6, _08026B58
	adds r1, r5, #0
	bl _call_via_r6
	ldr r4, [r7, #4]
	lsls r1, r0, #0x10
	asrs r3, r1, #0x14
	subs r4, r4, r3
	lsls r2, r4, #0x10
	str r4, [r7, #4]
	lsrs r0, r2, #0x10
	adds r1, r5, #0
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x14
	mov r2, r8
	subs r4, r4, r3
	str r4, [r7, #4]
	str r2, [r7, #0x14]
	mov r0, sl
	ldr r2, [r0]
	cmp r2, #0x3f
	ble _08026AAA
	bl multi_lfsr_next
	ldr r1, _08026B5C
	muls r1, r0, r1
	mov r3, sb
	adds r3, #0xa0
	ldr r0, [r3, #8]
	lsrs r2, r1, #0x10
	cmp r0, #4
	beq _08026AC4
	adds r1, r7, #0
	adds r1, #0xe0
	ldr r0, [r1]
	adds r3, r2, r0
	movs r2, #0xfa
	lsls r1, r2, #1
	adds r2, r3, r1
_08026A9C:
	movs r0, #0
	mov r1, sl
	str r0, [r1]
	ldr r1, [r7, #0x74]
	subs r0, r2, r1
	mov r2, fp
	str r0, [r2]
_08026AAA:
	ldr r1, [r7, #0x74]
	ldr r3, [sp]
	adds r2, r1, r3
	str r2, [r7, #0x74]
_08026AB2:
	add sp, #4
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08026AC4:
	adds r1, r7, #0
	adds r1, #0xe0
	ldr r0, [r1]
	adds r1, r2, r0
	ldr r0, _08026B60
	adds r2, r1, r0
	b _08026A9C
_08026AD2:
	ldr r1, _08026B64
	ldr r5, [r1]
	mov r0, sb
	ldr r6, [r5, #0x24]
	ldr r2, [r0, #0x24]
	ldr r4, [r0, #0x28]
	subs r1, r6, r2
	ldr r2, [r5, #0x28]
	ldr r3, [r5, #0x2c]
	subs r6, r2, r4
	ldr r2, [r0, #0x2c]
	subs r5, r3, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r5, r0, #0
	adds r0, r2, r5
	ldr r1, _08026B68
	bl _call_via_r1
	ldr r5, _08026B6C
	adds r1, r0, #0
	adds r0, r6, #0
	bl _call_via_r5
	adds r4, r0, #0
	lsls r3, r4, #0x10
	rsbs r6, r3, #0
	lsrs r5, r6, #0x10
	ldrh r0, [r7, #4]
	ldr r6, _08026B58
	adds r1, r5, #0
	bl _call_via_r6
	ldr r4, [r7, #4]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x14
	subs r4, r4, r1
	lsls r3, r4, #0x10
	str r4, [r7, #4]
	lsrs r0, r3, #0x10
	adds r1, r5, #0
	bl _call_via_r6
	lsls r2, r0, #0x10
	asrs r1, r2, #0x14
	subs r3, r4, r1
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	str r3, [r7, #4]
	ldr r2, _08026B54
	adds r0, r4, #0
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	movs r2, #0xc8
	adds r1, r3, #0
	muls r1, r2, r1
	asrs r3, r1, #0xc
	ldr r1, [r7, #0x74]
	subs r0, r1, r3
	str r0, [r7, #0x74]
	b _08026AB2
_08026B54:
	.4byte sin_fx
_08026B58:
	.4byte _03000814
_08026B5C:
	.4byte 0x00001388
_08026B60:
	.4byte 0x00000BB8
_08026B64:
	.4byte gRacerObjects
_08026B68:
	.4byte isqrt
_08026B6C:
	.4byte atan2_fx

	.global sub_08026B70
	.thumb_func
	.type sub_08026B70, %function
sub_08026B70: @ 08026B70
	push {r4, r5, lr}
	sub sp, #0x14
	movs r4, #0x7f
	movs r3, #0x80
	str r4, [sp]
	lsls r4, r3, #9
	str r4, [sp, #4]
	movs r4, #2
	str r4, [sp, #8]
	movs r4, #4
	adds r5, r0, #0
	str r4, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	adds r4, r5, #0
	ldr r1, [r5, #0x28]
	movs r3, #0xf1
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x2c]
	adds r4, #0xa0
	bl gamesfx_play_at
	ldr r0, [r4]
	movs r3, #0x80
	lsls r1, r3, #5
	ands r0, r1
	cmp r0, #0
	beq _08026BB0
_08026BA8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
_08026BB0:
	adds r0, r5, #0
	bl sub_08004168
	ldr r2, [r4]
	movs r0, #0x86
	lsls r1, r0, #6
	ands r1, r2
	cmp r1, #0
	bne _08026BA8
	movs r3, #0x80
	lsls r3, r3, #0xe
	orrs r2, r3
	str r2, [r4]
	movs r2, #0x84
	lsls r3, r2, #1
	adds r2, r5, r3
	ldr r3, _08026C08
	ldr r0, _08026C0C
	strh r3, [r2]
	movs r3, #0x92
	lsls r2, r3, #1
	adds r3, r0, r2
	str r1, [r3]
	ldr r2, _08026C10
	movs r1, #4
	ldrsh r3, [r2, r1]
	cmp r3, #8
	beq _08026C4E
	ldr r1, [r4, #4]
	lsls r3, r1, #1
	adds r3, #4
	ldrsh r3, [r2, r3]
	ldr r1, _08026C14
_08026BF2:
	lsls r3, r3, #2
	ldr r2, [r1, r3]
	movs r1, #0x92
	lsls r3, r1, #1
	adds r1, r5, r3
	ldr r3, _08026C18
	muls r2, r3, r2
	ldr r3, [r1]
	asrs r2, r2, #0xc
	subs r3, r3, r2
	b _08026C1C
_08026C08:
	.4byte 0x00000014
_08026C0C:
	.4byte 0x0202EA14
_08026C10:
	.4byte gGameSetup
_08026C14:
	.4byte gUnk_0884EFEC
_08026C18:
	.4byte 0x00000CCC
_08026C1C:
	str r3, [r1]
	cmp r3, #0
	bgt _08026BA8
	ldr r1, [r4]
	movs r3, #0x80
	orrs r1, r3
	adds r2, r0, #0
	movs r3, #0xf
	str r1, [r4]
	adds r2, #0xc0
	rsbs r1, r3, #0
	str r1, [r2]
	ldr r1, [r0, #0x14]
	adds r2, #4
	str r1, [r2]
	subs r2, #8
	movs r1, #0
	str r1, [r2]
	movs r2, #0x9c
	lsls r3, r2, #1
	str r1, [r0, #0x14]
	adds r2, r0, r3
	movs r0, #7
	str r0, [r2]
	b _08026BA8
_08026C4E:
	ldr r1, [r4, #4]
	lsls r3, r1, #1
	adds r3, #4
	ldrsh r3, [r2, r3]
	ldr r1, _08026C5C
	b _08026BF2
	.byte 0x00, 0x00
_08026C5C:
	.4byte gUnk_0884F010

	.global sub_08026C60
	.thumb_func
	.type sub_08026C60, %function
sub_08026C60: @ 08026C60
	push {r4, r5, r6, r7, lr}
	adds r0, #0xa0
	adds r5, r1, #0
	movs r3, #0x80
	ldr r1, [r0]
	lsls r0, r3, #0xe
	ands r1, r0
	cmp r1, #0
	beq _08026D2A
	movs r2, #0x92
	lsls r4, r2, #1
	adds r2, r5, r4
	ldr r1, [r2]
	cmp r1, #0
	beq _08026CF4
_08026C7E:
	movs r4, #0x88
	movs r1, #0x86
	lsls r3, r1, #1
	lsls r7, r4, #1
	adds r4, r5, r7
	adds r7, r3, r5
	ldr r1, [r4]
	ldr r0, [r7]
	subs r6, r1, r0
	asrs r2, r6, #3
	mov ip, r7
	movs r0, #0x8c
	subs r7, r1, r2
	movs r6, #0x8a
	str r7, [r4]
	lsls r3, r0, #1
	lsls r1, r6, #1
	adds r0, r5, r3
	adds r6, r5, r1
	ldr r2, [r6]
	ldr r1, [r0]
	subs r7, r1, r2
	asrs r2, r7, #3
	subs r7, r1, r2
	str r7, [r0]
	movs r1, #0x90
	movs r7, #0x8e
	lsls r2, r7, #1
	lsls r3, r1, #1
	adds r1, r5, r3
	adds r5, r5, r2
	ldr r3, [r5]
	ldr r2, [r1]
	subs r7, r2, r3
	asrs r3, r7, #3
	subs r7, r2, r3
	str r7, [r1]
	mov r7, ip
	ldr r2, [r4]
	ldr r3, [r7]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r4]
	ldr r2, [r0]
	ldr r3, [r6]
	subs r3, r2, r3
	asrs r3, r3, #3
	subs r2, r2, r3
	str r2, [r0]
	ldr r2, [r1]
	ldr r3, [r5]
	subs r0, r2, r3
	asrs r3, r0, #3
	subs r0, r2, r3
_08026CEC:
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08026CF4:
	movs r0, #1
	str r0, [r2]
	movs r2, #0x86
	lsls r1, r2, #1
	adds r7, r5, r1
	bl multi_lfsr_next
	lsls r6, r0, #0x10
	asrs r4, r6, #0x12
	movs r0, #0x8a
	lsls r3, r0, #1
	str r4, [r7]
	adds r6, r5, r3
	bl multi_lfsr_next
	lsls r2, r0, #0x10
	asrs r1, r2, #0x12
	movs r4, #0x8e
	str r1, [r6]
	lsls r0, r4, #1
	adds r6, r5, r0
	bl multi_lfsr_next
	lsls r3, r0, #0x10
	asrs r7, r3, #0x12
	str r7, [r6]
	b _08026C7E
_08026D2A:
	movs r4, #0x88
	lsls r2, r4, #1
	adds r4, r5, r2
	ldr r7, [r4]
	asrs r3, r7, #3
	subs r1, r7, r3
	movs r0, #0x8c
	str r1, [r4]
	lsls r2, r0, #1
	adds r0, r5, r2
	ldr r7, [r0]
	asrs r3, r7, #3
	subs r1, r7, r3
	movs r2, #0x90
	str r1, [r0]
	lsls r7, r2, #1
	adds r1, r5, r7
	ldr r3, [r1]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r1]
	ldr r3, [r4]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r4]
	ldr r3, [r0]
	asrs r2, r3, #3
	subs r3, r3, r2
	str r3, [r0]
	ldr r3, [r1]
	asrs r2, r3, #3
	subs r0, r3, r2
	b _08026CEC

	.global sub_08026D6C
	.thumb_func
	.type sub_08026D6C, %function
sub_08026D6C: @ 08026D6C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	adds r7, r1, #0
	movs r3, #0xc0
	movs r1, #0xc4
	adds r0, r1, r7
	adds r1, r3, r7
	mov sl, r0
	mov r8, r1
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r4, [r7, #0x74]
	adds r2, r1, r0
	lsls r6, r2, #1
	adds r2, r4, r6
	adds r6, r7, #0
	adds r6, #0xbc
	mov fp, r2
	ldr r2, [r6]
	cmp r2, #0
	bne _08026DA4
	b _08026F1A
_08026DA4:
	ldr r0, [r6]
	cmp r0, #1
	beq _08026E02
_08026DAA:
	mov r3, r8
	ldr r0, [r3]
	lsls r3, r0, #1
	mov r0, sl
	ldr r4, [r0]
	adds r1, r4, r3
	str r1, [r0]
	mov r1, fp
	str r1, [r7, #0x74]
	ldr r2, [r0]
	movs r0, #0x64
	rsbs r4, r0, #0
	muls r2, r4, r2
	adds r1, r7, #0
	movs r0, #0xc0
	adds r1, #0xb8
	lsls r3, r0, #6
	str r2, [r1]
	cmp r2, r3
	ble _08026DFA
_08026DD2:
	str r3, [r1]
_08026DD4:
	ldrh r1, [r1]
	ldrh r0, [r7, #4]
	ldr r2, _08026F44
	bl _call_via_r2
	ldr r4, [r7, #4]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x13
	subs r4, r4, r2
	str r4, [r7, #4]
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08026DFA:
	ldr r3, _08026F48
	cmp r2, r3
	bge _08026DD4
	b _08026DD2
_08026E02:
	mov r3, sl
	ldr r2, [r3]
	cmp r2, #0
	ble _08026E82
	mov r0, r8
	ldr r4, [r0]
	cmp r4, #0
	ble _08026E82
	adds r6, r2, #0
	muls r6, r2, r6
	rsbs r5, r6, #0
	adds r0, r5, #0
	cmp r5, #0
	blt _08026E7E
_08026E1E:
	ldr r1, _08026F4C
	movs r4, #0x28
	mov sb, r1
	movs r1, #0x28
	bl _call_via_r9
	adds r1, r5, #0
	rsbs r3, r4, #0
	eors r1, r3
	cmp r1, #0
	blt _08026E7A
_08026E34:
	mov r2, fp
	adds r3, r2, r0
	adds r0, r7, #0
	adds r0, #0xe0
	ldr r1, [r0]
	movs r2, #0xfa
	lsls r0, r2, #1
	adds r4, r1, r0
	cmp r3, r4
	blt _08026DAA
	mov r2, fp
	adds r0, #0x3c
	subs r3, r1, r2
	adds r4, r3, r0
	adds r0, r5, #0
	cmp r5, #0
	blt _08026E76
_08026E56:
	adds r1, r4, #0
	cmp r4, #0
	blt _08026E72
_08026E5C:
	bl _call_via_r9
	adds r1, r5, #0
	eors r1, r4
	cmp r1, #0
	blt _08026E6E
_08026E68:
	mov r1, r8
	str r0, [r1]
	b _08026DAA
_08026E6E:
	rsbs r0, r0, #0
	b _08026E68
_08026E72:
	rsbs r1, r4, #0
	b _08026E5C
_08026E76:
	adds r0, r6, #0
	b _08026E56
_08026E7A:
	rsbs r0, r0, #0
	b _08026E34
_08026E7E:
	adds r0, r6, #0
	b _08026E1E
_08026E82:
	ldr r3, [r6]
	str r3, [sp]
	cmp r3, #1
	beq _08026E8C
	b _08026DAA
_08026E8C:
	mov r3, sl
	ldr r2, [r3]
	cmp r2, #0
	bgt _08026E96
	b _08026DAA
_08026E96:
	mov r0, r8
	ldr r4, [r0]
	cmp r4, #0
	ble _08026EA0
	b _08026DAA
_08026EA0:
	adds r5, r2, #0
	muls r5, r2, r5
	movs r0, #0xe0
	adds r3, r0, r7
	ldr r1, [r3]
	mov r0, fp
	movs r4, #0x8c
	adds r2, r5, #0
	rsbs r5, r2, #0
	mov sb, r3
	subs r3, r1, r0
	lsls r0, r4, #2
	adds r4, r3, r0
	adds r0, r5, #0
	cmp r5, #0
	blt _08026F16
_08026EC0:
	adds r1, r4, #0
	cmp r4, #0
	blt _08026F12
_08026EC6:
	ldr r2, _08026F4C
	bl _call_via_r2
	adds r2, r5, #0
	eors r2, r4
	cmp r2, #0
	blt _08026F0E
_08026ED4:
	mov r2, r8
	str r0, [r2]
	mov r0, sb
	ldr r2, [r0]
	movs r0, #0xfa
	lsls r3, r0, #1
	adds r4, r2, r3
	cmp fp, r4
	bge _08026EE8
	b _08026DAA
_08026EE8:
	movs r4, #0
	mov r2, sl
	mov r0, r8
	str r4, [r2]
	str r4, [r0]
	str r4, [r6]
	ldr r0, [sp, #4]
	adds r0, #0xa0
	ldr r4, [r0]
	movs r3, #0x81
	rsbs r1, r3, #0
	ands r4, r1
	str r4, [r0]
	movs r3, #0x9c
	lsls r2, r3, #1
	ldr r1, [sp]
	adds r4, r7, r2
	str r1, [r4]
	b _08026DAA
_08026F0E:
	rsbs r0, r0, #0
	b _08026ED4
_08026F12:
	rsbs r1, r4, #0
	b _08026EC6
_08026F16:
	adds r0, r2, #0
	b _08026EC0
_08026F1A:
	cmp r0, #0
	blt _08026F20
	b _08026DA4
_08026F20:
	cmp r1, #0
	blt _08026F26
	b _08026DA4
_08026F26:
	ldr r0, _08026F50
	cmp fp, r0
	blt _08026F2E
	b _08026DAA
_08026F2E:
	movs r4, #0x9c
	mov r0, r8
	lsls r3, r4, #1
	movs r1, #0xf
	str r1, [r0]
	movs r2, #9
	adds r0, r7, r3
	movs r4, #1
	str r2, [r0]
	str r4, [r6]
	b _08026DAA
_08026F44:
	.4byte _03000814
_08026F48:
	.4byte 0xFFFFD000
_08026F4C:
	.4byte udiv
_08026F50:
	.4byte 0xFFFFF449

	.global sub_08026F54
	.thumb_func
	.type sub_08026F54, %function
sub_08026F54: @ 08026F54
	push {r4, r5, r6, r7, lr}
	ldr r4, _08026FE0
	ldr r3, [r4, #0x10]
	asrs r1, r3, #4
	adds r6, r1, #0
	muls r6, r1, r6
	asrs r5, r6, #0xc
	muls r5, r1, r5
	mov ip, r0
	asrs r0, r5, #0xc
	muls r0, r1, r0
	ldr r3, [r4]
	asrs r6, r0, #8
	ldr r0, [r4, #0x14]
	lsls r5, r0, #8
	cmp r3, #0
	ble _08026FDC
	adds r0, r3, #0
_08026F78:
	movs r3, #0x90
	movs r1, #0x8c
	lsls r2, r3, #1
	lsls r7, r1, #1
	adds r3, r4, r2
	adds r1, r4, r7
	ldr r7, [r3]
	ldr r3, [r1]
	adds r2, r7, r3
	movs r7, #0x88
	lsls r3, r7, #1
	adds r7, r4, r3
	ldr r1, [r7]
	adds r7, r2, r1
	subs r2, r6, r5
	subs r3, r2, r0
	movs r0, #0xa0
	lsls r1, r0, #8
	adds r0, r3, r1
	movs r1, #0x98
	lsls r2, r1, #1
	adds r1, r4, r2
	ldr r2, [r1]
	subs r3, r2, r0
	asrs r3, r3, #3
	subs r0, r2, r3
	str r0, [r1]
	ldr r2, _08026FE4
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #4]
	cmp r2, #4
	beq _08026FC6
	ldr r2, _08026FE8
	ldr r0, [r2]
	ldr r2, _08026FEC
	lsls r1, r0, #2
	ldr r0, [r2, r1]
_08026FC6:
	movs r2, #0x98
	lsls r3, r2, #1
	adds r2, r4, r3
	ldr r1, [r2]
	adds r2, r1, r7
	mov r1, ip
	bl sub_08020130
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08026FDC:
	rsbs r0, r3, #0
	b _08026F78
_08026FE0:
	.4byte 0x0202EA14
_08026FE4:
	.4byte 0x0200436C
_08026FE8:
	.4byte gLocalPlayerIndex
_08026FEC:
	.4byte gRacerObjects

	.global sub_08026FF0
	.thumb_func
	.type sub_08026FF0, %function
sub_08026FF0: @ 08026FF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	movs r3, #0x96
	adds r6, r0, #0
	lsls r2, r3, #1
	adds r7, r1, #0
	adds r1, r6, r2
	ldr r0, [r1]
	sub sp, #0x14
	cmp r0, #0
	bne _0802700C
	b _0802726E
_0802700C:
	movs r2, #0x9c
	lsls r0, r2, #1
	adds r1, r0, r7
	ldr r3, [r1]
	mov r8, r1
	cmp r3, #1
	bne _0802701C
	b _080271D2
_0802701C:
	cmp r3, #5
	bne _08027022
	b _0802715A
_08027022:
	cmp r3, #7
	bne _08027028
	b _08027118
_08027028:
	cmp r3, #9
	beq _0802703A
_0802702C:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802703A:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	movs r4, #0x98
	bl gamesfx_release
	lsls r2, r4, #1
	movs r4, #0x9a
	movs r1, #0x80
	lsls r3, r4, #1
	lsls r5, r1, #7
	adds r0, r7, r2
	adds r1, r7, r3
	movs r2, #0x40
	str r5, [r0]
	str r2, [r1]
	ldr r2, _080272C8
	adds r5, r2, #0
	adds r5, #0xc4
	ldr r1, [r5]
	cmp r1, #0
	ble _08027112
	lsls r0, r1, #1
	adds r4, r0, r1
	lsls r5, r4, #0x10
	asrs r3, r5, #8
_0802706E:
	movs r1, #0x98
	lsls r5, r1, #1
	adds r1, r2, r5
	ldr r5, [r1]
	subs r4, r5, r3
	asrs r2, r4, #3
	subs r0, r5, r2
	str r0, [r1]
	ldr r4, _080272CC
	ldr r0, [r4]
	adds r5, r0, #0
	adds r5, #0xa0
	ldr r2, [r5, #4]
	cmp r2, #4
	beq _08027096
	ldr r2, _080272D0
	ldr r0, [r2]
	ldr r5, _080272D4
	lsls r4, r0, #2
	ldr r0, [r5, r4]
_08027096:
	ldr r2, [r1]
	adds r1, r6, #0
	bl sub_08020130
	ldr r1, _080272C8
	adds r4, r1, #0
	adds r4, #0xc4
	ldr r2, [r4]
	cmp r2, #0
	ble _0802710E
	movs r5, #0xa0
	muls r5, r2, r5
	asrs r3, r5, #8
_080270B0:
	movs r5, #0x9a
	lsls r4, r5, #1
	adds r5, r1, r4
	ldr r2, [r5]
	subs r4, r2, r3
	asrs r3, r4, #3
	subs r4, r2, r3
	str r4, [r5]
	movs r5, #0x98
	lsls r3, r5, #1
	adds r5, r6, r3
	ldr r1, [r5]
	movs r5, #0x80
	lsls r3, r5, #9
	subs r5, r3, r1
	muls r5, r4, r5
	movs r2, #0x96
	asrs r4, r5, #0x10
	lsls r3, r2, #1
	movs r5, #0x94
	lsls r1, r5, #1
	adds r2, r7, r3
	ldr r3, [r2]
	adds r5, r6, r1
	str r4, [sp]
	str r0, [sp, #4]
	movs r4, #1
	movs r0, #1
	movs r1, #0
	str r4, [sp, #8]
	str r1, [sp, #0x10]
	rsbs r4, r0, #0
	ldr r1, _080272D8
	ldr r0, _080272DC
	adds r2, r6, #0
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	beq _0802702C
	movs r0, #0x9c
	lsls r1, r0, #1
	adds r0, r7, r1
	movs r2, #0xa
	str r2, [r0]
	b _0802702C
_0802710E:
	movs r3, #0xa0
	b _080270B0
_08027112:
	movs r1, #0xc0
	lsls r3, r1, #0xa
	b _0802706E
_08027118:
	movs r4, #0x94
	lsls r2, r4, #1
	adds r0, r6, r2
	bl gamesfx_stop
	movs r5, #0x94
	lsls r3, r5, #1
	movs r0, #0x7f
	movs r1, #0x80
	lsls r4, r1, #9
	adds r5, r6, r3
	str r0, [sp]
	movs r2, #1
	movs r3, #1
	movs r0, #0
	str r4, [sp, #4]
	str r2, [sp, #8]
	rsbs r4, r3, #0
	str r0, [sp, #0x10]
	movs r1, #0
	adds r2, r6, #0
	movs r3, #4
	str r4, [sp, #0xc]
	bl gamesfx_play_cb
	str r0, [r5]
	cmp r0, r4
	bne _08027152
	b _0802702C
_08027152:
	movs r0, #8
	mov r1, r8
	str r0, [r1]
	b _0802702C
_0802715A:
	movs r4, #0x94
	lsls r2, r4, #1
	adds r0, r6, r2
	bl gamesfx_stop
	ldr r1, _080272C8
	movs r3, #0xec
	lsls r0, r3, #1
	adds r4, r1, r0
	ldr r2, [r1, #0x10]
	ldr r0, [r4]
	adds r4, r0, #0
	muls r4, r2, r4
	asrs r3, r4, #0x10
	cmp r3, r0
	ble _0802717C
	adds r3, r0, #0
_0802717C:
	movs r4, #0x9a
	lsls r2, r4, #1
	adds r4, r1, r2
	ldr r0, [r4]
	subs r2, r0, r3
	asrs r3, r2, #3
	subs r2, r0, r3
	str r2, [r4]
	movs r4, #0x98
	lsls r3, r4, #1
	adds r0, r6, r3
	ldr r3, [r0]
	movs r4, #0x80
	lsls r0, r4, #9
	subs r4, r0, r3
	muls r4, r2, r4
	asrs r2, r4, #0x10
	movs r4, #0x94
	lsls r3, r4, #1
	str r2, [sp]
	str r0, [sp, #4]
	movs r2, #2
	movs r0, #0x1e
	movs r1, #0
	adds r4, r6, r3
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r2, r6, #0
	movs r3, #0xdf
	ldr r0, _080272E0
	bl gamesfx_play_cb
	movs r2, #1
	rsbs r3, r2, #0
	str r0, [r4]
	cmp r0, r3
	bne _080271CA
	b _0802702C
_080271CA:
	movs r1, #6
	mov r2, r8
	str r1, [r2]
	b _0802702C
_080271D2:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	movs r5, #0x98
	bl gamesfx_stop
	lsls r1, r5, #1
	movs r5, #0x9a
	adds r0, r7, r1
	movs r2, #0x80
	lsls r1, r5, #1
	lsls r4, r2, #7
	adds r2, r7, r1
	movs r1, #0
	str r4, [r0]
	str r1, [r2]
	adds r0, r6, #0
	mov sl, r1
	bl sub_08026F54
	ldr r1, _080272C8
	movs r3, #0xec
	lsls r4, r3, #1
	adds r5, r1, r4
	ldr r2, [r1, #0x10]
	ldr r4, [r5]
	adds r5, r4, #0
	muls r5, r2, r5
	asrs r3, r5, #0x10
	cmp r3, r4
	ble _08027212
	adds r3, r4, #0
_08027212:
	movs r4, #0x9a
	lsls r5, r4, #1
	adds r4, r1, r5
	ldr r2, [r4]
	subs r5, r2, r3
	asrs r3, r5, #3
	subs r5, r2, r3
	str r5, [r4]
	movs r4, #0x98
	lsls r3, r4, #1
	adds r4, r6, r3
	ldr r1, [r4]
	movs r4, #0x80
	lsls r3, r4, #9
	subs r4, r3, r1
	muls r4, r5, r4
	movs r2, #0x96
	lsls r3, r2, #1
	asrs r5, r4, #0x10
	adds r2, r7, r3
	movs r4, #0x94
	ldr r3, [r2]
	lsls r1, r4, #1
	str r0, [sp, #4]
	mov r2, sl
	movs r0, #0x1e
	adds r4, r6, r1
	str r5, [sp]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r1, _080272E4
	adds r2, r6, #0
	movs r5, #2
	ldr r0, _080272E0
	str r5, [sp, #8]
	bl gamesfx_play_cb
	movs r1, #1
	rsbs r2, r1, #0
	str r0, [r4]
	cmp r0, r2
	bne _08027268
	b _0802702C
_08027268:
	mov r0, r8
	str r5, [r0]
	b _0802702C
_0802726E:
	movs r4, #0x9c
	lsls r3, r4, #1
	adds r4, r7, r3
	ldr r3, [r4]
	cmp r3, #2
	beq _080272B8
	cmp r3, #6
	beq _080272A8
	cmp r3, #8
	beq _08027298
	cmp r3, #0xa
	beq _08027288
	b _0802702C
_08027288:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	bl gamesfx_stop
	movs r2, #9
	str r2, [r4]
	b _0802702C
_08027298:
	movs r0, #0x94
	lsls r1, r0, #1
	adds r0, r6, r1
	bl gamesfx_stop
	movs r2, #7
	str r2, [r4]
	b _0802702C
_080272A8:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	bl gamesfx_stop
	movs r1, #5
	str r1, [r4]
	b _0802702C
_080272B8:
	movs r0, #0x94
	lsls r3, r0, #1
	adds r0, r6, r3
	bl gamesfx_stop
	movs r2, #1
	str r2, [r4]
	b _0802702C
_080272C8:
	.4byte 0x0202EA14
_080272CC:
	.4byte 0x0200436C
_080272D0:
	.4byte gLocalPlayerIndex
_080272D4:
	.4byte gRacerObjects
_080272D8:
	.4byte sub_08028140
_080272DC:
	.4byte sub_080280F8
_080272E0:
	.4byte sub_080280B0
_080272E4:
	.4byte sub_08026F54

	.global sub_080272E8
	.thumb_func
	.type sub_080272E8, %function
sub_080272E8: @ 080272E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0xb0
	adds r5, r1, #0
	lsls r2, r4, #1
	adds r4, r5, r2
	ldr r7, [r4]
	movs r1, #0xb2
	lsls r3, r1, #1
	lsls r6, r7, #2
	adds r1, r6, r3
	ldr r2, [r5, r1]
	movs r1, #1
	rsbs r3, r1, #0
	mov lr, r3
	cmp r2, lr
	beq _0802733A
	movs r6, #0x2c
	muls r2, r6, r2
	ldr r1, _08027470
	ldr r6, [r1]
	adds r1, r6, r2
	movs r3, #0x1c
	ldrsh r2, [r1, r3]
	mov ip, r2
	ldr r2, [r0, #0x30]
	mov r6, ip
	muls r6, r2, r6
	asrs r2, r6, #8
	movs r3, #0x1e
	ldrsh r6, [r1, r3]
	ldr r3, [r0, #0x38]
	muls r3, r6, r3
	ldr r1, [r1, #0x20]
	asrs r3, r3, #8
	adds r2, r2, r3
	adds r3, r2, r1
	cmp r3, #0
	bge _0802733A
	b _08027422
_0802733A:
	movs r6, #0xca
	lsls r1, r6, #1
	adds r6, r5, r1
	ldr r4, [r6]
	lsls r2, r4, #2
	mov ip, r4
	movs r4, #0xcc
	lsls r3, r4, #1
	adds r4, r2, r3
	ldr r2, [r5, r4]
	movs r4, #1
	rsbs r3, r4, #0
	mov r8, r3
	cmp r2, r8
	beq _08027384
	movs r7, #0x2c
	muls r2, r7, r2
	ldr r1, _08027470
	ldr r4, [r1]
	adds r1, r4, r2
	movs r2, #0x1c
	ldrsh r4, [r1, r2]
	ldr r2, [r0, #0x30]
	mov lr, r4
	mov r7, lr
	muls r7, r2, r7
	asrs r4, r7, #8
	movs r3, #0x1e
	ldrsh r7, [r1, r3]
	ldr r3, [r0, #0x38]
	muls r3, r7, r3
	asrs r3, r3, #8
	adds r2, r4, r3
	ldr r4, [r1, #0x20]
	adds r3, r2, r4
	cmp r3, #0
	blt _080273CC
_08027384:
	movs r4, #0xc6
	lsls r1, r4, #1
	adds r4, r5, r1
	ldr r2, [r4]
	cmp r2, #0
	beq _080273AA
	movs r3, #0x81
	lsls r2, r3, #1
	adds r3, r0, r2
	adds r1, r0, #0
	movs r2, #0
	ldrsh r0, [r3, r2]
	adds r1, #0xa0
	cmp r0, #0
	ble _080273B4
	ldr r0, [r1]
	movs r3, #2
	orrs r0, r3
_080273A8:
	str r0, [r1]
_080273AA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080273B4:
	adds r1, r5, #0
	movs r3, #0
	adds r1, #0x8c
	str r3, [r4]
	str r3, [r1]
	subs r1, #8
	str r3, [r1]
	movs r0, #0x40
	adds r1, #4
	str r0, [r1]
	subs r1, #8
	b _080273A8
_080273CC:
	ldr r3, [r0, #0x24]
	mov r2, lr
	muls r2, r3, r2
	ldr r3, [r0, #0x2c]
	muls r3, r7, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r2, r2, r3
	adds r3, r2, r4
	cmp r3, #0
	blt _08027384
	adds r4, r0, #0
	adds r4, #0xa0
	ldr r2, [r4, #8]
	cmp r2, #1
	beq _0802740A
_080273EC:
	mov r4, ip
	lsls r2, r4, #2
	movs r4, #0xcc
	lsls r3, r4, #1
	adds r4, r2, r3
	mov r2, r8
	str r2, [r5, r4]
	ldr r1, [r6]
	adds r1, #1
	str r1, [r6]
	cmp r1, #9
	ble _08027384
	movs r1, #0
	str r1, [r6]
	b _08027384
_0802740A:
	movs r3, #0xc6
	lsls r4, r3, #1
	adds r3, r5, r4
	str r2, [r3]
	movs r4, #0x81
	lsls r2, r4, #1
	ldrh r3, [r1, #0xe]
	adds r4, r0, r2
	strh r3, [r4]
	ldr r2, [r6]
	mov ip, r2
	b _080273EC
_08027422:
	ldr r3, [r0, #0x24]
	mov r2, ip
	muls r2, r3, r2
	ldr r3, [r0, #0x2c]
	muls r3, r6, r3
	asrs r2, r2, #8
	asrs r3, r3, #8
	adds r6, r2, r3
	adds r3, r6, r1
	cmp r3, #0
	bge _0802743A
	b _0802733A
_0802743A:
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, [r1, #8]
	cmp r2, #3
	beq _08027462
_08027444:
	movs r6, #0xb2
	lsls r2, r7, #2
	lsls r3, r6, #1
	adds r6, r2, r3
	mov r2, lr
	str r2, [r5, r6]
	ldr r1, [r4]
	adds r1, #1
	str r1, [r4]
	cmp r1, #9
	bgt _0802745C
	b _0802733A
_0802745C:
	movs r1, #0
	str r1, [r4]
	b _0802733A
_08027462:
	ldr r7, [r1]
	movs r3, #2
	orrs r7, r3
	str r7, [r1]
	ldr r7, [r4]
	b _08027444
	.byte 0x00, 0x00
_08027470:
	.4byte 0x0202EBF4
