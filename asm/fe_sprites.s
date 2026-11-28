@ asm/fe_sprites.s: ROM 0x017F54-0x018E1C (rom, VMA 0x08017F54)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global fe_spr_plot
	.thumb_func
	.type fe_spr_plot, %function
fe_spr_plot: @ 08017F54
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x24
	adds r7, r2, #0
	mov sb, r0
	mov sl, r1
	str r3, [sp, #0x20]
	cmp r7, #0
	bne _08017F70
	b _08018290
_08017F70:
	ldr r1, [sp, #0x20]
	cmp r1, #0
	bne _08017F78
	b _08018278
_08017F78:
	ldrh r1, [r7]
	ldr r3, [sp, #0x48]
	adds r4, r7, r1
	lsls r1, r3, #1
	ldrh r6, [r1, r4]
	ldrh r2, [r7, #2]
	lsls r0, r6, #4
	adds r6, r4, r0
	adds r0, r7, r2
	ldrh r4, [r1, r0]
	adds r1, r0, r4
	str r1, [sp, #0x1c]
	movs r2, #0xe
	ldrsh r4, [r7, r2]
	add r4, sb
	adds r0, r4, #0
	subs r0, #0x78
	cmp r0, #0
	bge _08017FA0
	b _08018274
_08017FA0:
	movs r4, #0x10
	ldrsh r2, [r7, r4]
	add r2, sl
	adds r1, r2, #0
	subs r1, #0x50
	cmp r1, #0
	bge _08017FB0
	b _08018270
_08017FB0:
	movs r2, #0x12
	ldrsh r3, [r7, r2]
	movs r4, #0x14
	ldrsh r2, [r7, r4]
	adds r3, #0x78
	adds r2, #0x50
	cmp r0, r3
	blt _08017FC2
	b _080180D8
_08017FC2:
	cmp r1, r2
	blt _08017FC8
	b _080180D8
_08017FC8:
	movs r2, #0x80
	ldr r1, [sp, #0x4c]
	lsls r0, r2, #1
	movs r3, #0
	ands r0, r1
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	cmp r0, #0
	beq _08018054
	ldr r4, [sp, #0x50]
	movs r2, #0x1f
	lsrs r1, r4, #9
	ands r1, r2
	lsls r4, r1, #5
	ldr r1, _080182A8
	adds r0, r4, r1
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r5, r1, #0
	adds r5, #8
	asrs r3, r0, #0x10
	adds r0, r4, r5
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r5, r1, #0
	adds r5, #0x10
	mov fp, r3
	asrs r3, r0, #0x10
	adds r0, r4, r5
	ldrh r5, [r0]
	adds r1, #0x18
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r4, r1
	ldrh r4, [r0]
	lsls r2, r4, #0x10
	mov r8, r3
	asrs r4, r2, #0x10
	mov r0, fp
	muls r0, r4, r0
	mov r3, r8
	muls r3, r5, r3
	subs r1, r0, r3
	lsls r0, r1, #8
	cmp r0, #0
	bge _0801802A
	b _08018264
_0801802A:
	ldr r2, _080182AC
	bl _call_via_r2
_08018030:
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r1, r2, #8
	mov r2, r8
	muls r2, r0, r2
	str r1, [sp, #0x18]
	rsbs r1, r2, #0
	asrs r2, r1, #8
	adds r1, r0, #0
	muls r1, r5, r1
	str r2, [sp, #0x14]
	rsbs r2, r1, #0
	asrs r1, r2, #8
	mov r2, fp
	muls r2, r0, r2
	str r1, [sp, #0x10]
	asrs r1, r2, #8
	str r1, [sp, #0xc]
_08018054:
	ldrh r0, [r6]
	cmp r0, #0
	beq _080180D8
	ldr r4, [sp, #0x1c]
	ldrh r1, [r4]
	cmp r1, #0
	beq _080180D8
	ldr r1, _080182B0
	ldr r3, [r1]
	movs r4, #0
	cmp r4, r3
	bge _0801807E
	ldr r2, _080182B4
	mov ip, r3
_08018070:
	ldm r2!, {r0}
	cmp r0, r6
	bne _08018078
	b _0801825C
_08018078:
	adds r4, #1
	cmp r4, ip
	blt _08018070
_0801807E:
	ldr r0, [r1]
	ldr r4, _080182B4
	adds r2, r0, #1
	lsls r5, r0, #2
	str r2, [r1]
	str r6, [r4, r5]
	lsls r4, r0, #1
	ldr r0, _080182B8
	ldr r5, _080182BC
	ldr r2, [r0]
	strh r2, [r5, r4]
	ldr r3, _080182C0
	ldrh r1, [r6]
	ands r3, r1
	adds r6, r2, r3
	str r6, [r0]
	ldrh r2, [r5, r4]
_080180A0:
	ldr r1, [sp, #0x54]
	adds r3, r2, r1
	ldr r2, [sp, #0x20]
	str r3, [sp, #0x54]
	cmp r2, #0
	beq _080180BE
	adds r0, r2, #0
	ldr r1, _080182C4
	bl _call_via_r1
	ldr r4, [sp, #0x54]
	lsls r3, r0, #0x1c
	lsrs r2, r3, #0x10
	adds r6, r4, r2
	str r6, [sp, #0x54]
_080180BE:
	ldr r4, [sp, #0x1c]
	ldr r6, [sp, #0x1c]
	ldrh r0, [r4]
	adds r6, #2
	cmp r0, #0x7f
	bls _080180EA
	ldr r0, _080182C8
	adds r1, r7, #0
	ldr r2, [sp, #0x20]
	bl AGBPrintf
	bl AGBPrintFlush
_080180D8:
	add sp, #0x24
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080180EA:
	ldr r3, [sp, #0x1c]
	movs r0, #0
	ldrh r1, [r3]
	mov r8, r0
	cmp r8, r1
	bge _080180D8
	ldr r3, _080182CC
	ldr r4, _080182D0
	ldr r7, _080182D4
	mov ip, r3
	mov lr, r4
	mov fp, r7
_08018102:
	ldrh r4, [r6]
	lsrs r1, r4, #0xe
	lsls r2, r1, #2
	ldrh r1, [r6, #2]
	ldr r5, _080182D8
	lsrs r7, r1, #0xe
	ldr r3, _080182DC
	orrs r2, r7
	ldrb r7, [r5, r2]
	ldrb r5, [r3, r2]
	movs r2, #0x80
	lsls r0, r2, #2
	ldr r2, [sp, #0x4c]
	ands r0, r2
	cmp r0, #0
	beq _08018126
	lsls r7, r7, #1
	lsls r5, r5, #1
_08018126:
	movs r0, #0x80
	lsls r2, r0, #1
	ldr r0, [sp, #0x4c]
	ands r2, r0
	cmp r2, #0
	beq _080181B6
	lsls r0, r4, #0x18
	lsls r3, r1, #0x18
	asrs r1, r0, #0x18
	ldr r0, [sp, #0x18]
	asrs r2, r3, #0x18
	adds r3, r2, #0
	muls r3, r0, r3
	ldr r0, [sp, #0x14]
	str r3, [sp, #4]
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r0, [sp, #4]
	adds r3, r0, r3
	str r3, [sp, #4]
	asrs r0, r3, #8
	ldr r3, [sp, #0x10]
	muls r2, r3, r2
	ldr r3, [sp, #0xc]
	muls r1, r3, r1
	adds r3, r2, r1
	asrs r2, r3, #8
	mov r3, ip
	ldr r1, [r3]
	ldr r3, _080182E0
	add r2, sl
	ands r3, r4
	subs r2, r2, r5
	movs r4, #0xff
	ands r2, r4
	ldr r4, [sp, #0x4c]
	orrs r3, r2
	orrs r3, r4
	lsls r1, r1, #3
	mov r4, lr
	strh r3, [r1, r4]
	ldr r3, _080182E4
	ldrh r4, [r6, #2]
	add r0, sb
	ands r3, r4
	mov r2, fp
	subs r4, r0, r7
	ands r4, r2
	ldr r2, [sp, #0x50]
	orrs r3, r4
	ldr r4, _080182E8
	orrs r3, r2
	strh r3, [r1, r4]
_08018190:
	mov r3, ip
	ldr r2, [r3]
	ldr r4, [sp, #0x54]
	ldrh r3, [r6, #4]
	adds r1, r3, r4
	ldr r4, _080182EC
	lsls r0, r2, #3
	mov r3, ip
	adds r2, #1
	strh r1, [r0, r4]
	str r2, [r3]
	ldr r3, [sp, #0x1c]
	movs r4, #1
	ldrh r2, [r3]
	add r8, r4
	adds r6, #6
	cmp r8, r2
	blt _08018102
	b _080180D8
_080181B6:
	movs r2, #0x80
	ldr r0, [sp, #0x50]
	lsls r1, r2, #6
	ands r1, r0
	cmp r1, #0
	beq _0801823A
	mov r3, ip
	ldr r2, [r3]
	lsls r1, r2, #3
	ldr r2, _080182E0
	lsls r0, r4, #0x18
	ands r2, r4
	asrs r3, r0, #0x18
	mov r4, sl
	subs r0, r4, r3
	subs r4, r0, r5
	movs r0, #0xff
	ands r4, r0
	orrs r2, r4
	ldr r4, [sp, #0x4c]
	orrs r2, r4
	mov r4, lr
	strh r2, [r1, r4]
_080181E4:
	movs r4, #0x80
	ldr r0, [sp, #0x50]
	lsls r1, r4, #5
	ands r1, r0
	cmp r1, #0
	beq _08018216
	mov r0, ip
	ldr r1, [r0]
	ldrh r0, [r6, #2]
	lsls r3, r1, #3
	lsls r4, r0, #0x18
	ldr r1, _080182E4
	asrs r2, r4, #0x18
	mov r4, sb
	ands r1, r0
	subs r0, r4, r2
	subs r4, r0, r7
	mov r0, fp
	ands r4, r0
	ldr r0, [sp, #0x50]
	orrs r1, r4
	ldr r2, _080182E8
	orrs r1, r0
	strh r1, [r3, r2]
	b _08018190
_08018216:
	mov r0, ip
	ldr r1, [r0]
	ldrh r4, [r6, #2]
	lsls r3, r1, #3
	ldr r1, _080182E4
	lsls r0, r4, #0x18
	ands r1, r4
	asrs r4, r0, #0x18
	add r4, sb
	subs r0, r4, r7
	mov r4, fp
	ands r0, r4
	ldr r2, [sp, #0x50]
	orrs r1, r0
	ldr r4, _080182E8
	orrs r1, r2
	strh r1, [r3, r4]
	b _08018190
_0801823A:
	mov r0, ip
	ldr r2, [r0]
	lsls r1, r2, #3
	ldr r2, _080182E0
	lsls r0, r4, #0x18
	ands r2, r4
	asrs r4, r0, #0x18
	add r4, sl
	subs r0, r4, r5
	movs r4, #0xff
	ldr r3, [sp, #0x4c]
	ands r0, r4
	orrs r2, r0
	orrs r2, r3
	mov r3, lr
	strh r2, [r1, r3]
	b _080181E4
_0801825C:
	ldr r0, _080182BC
	lsls r6, r4, #1
	ldrh r2, [r0, r6]
	b _080180A0
_08018264:
	rsbs r0, r0, #0
	ldr r1, _080182AC
	bl _call_via_r1
	rsbs r0, r0, #0
	b _08018030
_08018270:
	rsbs r1, r1, #0
	b _08017FB0
_08018274:
	rsbs r0, r0, #0
	b _08017FA0
_08018278:
	ldr r0, _080182F0
	ldr r1, _080182F4
	str r0, [sp]
	ldr r2, _080182F8
	ldr r0, _080182FC
	movs r3, #0x88
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08017F78
_08018290:
	ldr r0, _08018300
	ldr r1, _080182F4
	str r0, [sp]
	ldr r2, _080182F8
	ldr r0, _080182FC
	movs r3, #0x87
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08017F70
_080182A8:
	.4byte 0x0200000E
_080182AC:
	.4byte _03000570
_080182B0:
	.4byte 0x020243B4
_080182B4:
	.4byte 0x020243B8
_080182B8:
	.4byte 0x020243B0
_080182BC:
	.4byte 0x020245B8
_080182C0:
	.4byte 0x000003FF
_080182C4:
	.4byte sub_03003EB4
_080182C8:
	.4byte gUnk_080514FC
_080182CC:
	.4byte 0x020243AC
_080182D0:
	.4byte 0x02000008
_080182D4:
	.4byte 0x000001FF
_080182D8:
	.4byte gUnk_080537D8
_080182DC:
	.4byte gUnk_080537E4
_080182E0:
	.4byte 0xFFFFFF00
_080182E4:
	.4byte 0xFFFFFE00
_080182E8:
	.4byte 0x0200000A
_080182EC:
	.4byte 0x0200000C
_080182F0:
	.4byte gUnk_08051514
_080182F4:
	.4byte gUnk_08051520
_080182F8:
	.4byte gUnk_08051534
_080182FC:
	.4byte gUnk_08051540
_08018300:
	.4byte gUnk_0805157C

	.global sub_08018304
	.thumb_func
	.type sub_08018304, %function
sub_08018304: @ 08018304
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x34
	str r0, [sp, #0x30]
	str r1, [sp, #0x2c]
	ldrh r1, [r2]
	lsls r3, r3, #1
	adds r0, r2, r1
	ldrh r6, [r3, r0]
	lsls r1, r6, #4
	adds r6, r0, r1
	adds r6, #2
	str r6, [sp, #0x20]
	ldrh r0, [r2, #2]
	adds r6, r2, r0
	ldrh r1, [r3, r6]
	adds r0, r6, r1
	movs r1, #0
	str r0, [sp, #0x28]
	str r1, [sp, #0x24]
	ldrh r6, [r0]
	cmp r1, r6
	bge _080183D8
	ldr r3, [sp, #0x5c]
	lsls r2, r3, #3
	str r2, [sp, #8]
_08018340:
	ldr r3, [sp, #0x24]
	movs r4, #6
	adds r0, r3, #0
	muls r0, r4, r0
	ldr r2, [sp, #0x28]
	adds r4, r0, r2
	ldrh r0, [r4, #2]
	lsrs r1, r0, #0xe
	lsls r2, r1, #2
	ldrh r1, [r4, #4]
	ldr r3, _08018540
	lsrs r5, r1, #0xe
	orrs r2, r5
	ldrb r5, [r3, r2]
	lsls r3, r5, #1
	mov lr, r3
	ldr r3, _08018544
	ldrb r3, [r3, r2]
	lsls r0, r0, #0x18
	lsls r2, r3, #1
	str r2, [sp, #0x1c]
	asrs r2, r0, #0x18
	subs r0, r2, r3
	lsls r2, r1, #0x18
	asrs r3, r2, #0x18
	subs r1, r3, r5
	ldrh r2, [r4, #6]
	ldr r3, _08018548
	ands r3, r2
	lsls r2, r3, #5
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x30]
	adds r3, r2, r1
	ldr r2, [sp, #8]
	mov r8, r3
	cmp r8, r2
	bge _080183CE
	ldr r3, [sp, #0x2c]
	ldr r1, [sp, #0x60]
	adds r0, r3, r0
	lsls r3, r1, #3
	mov sb, r3
	str r0, [sp, #0x14]
	cmp r0, sb
	bge _080183CE
	mov r2, r8
	add r2, lr
	cmp r2, #0
	blt _080183CE
	ldr r1, [sp, #0x1c]
	adds r3, r0, r1
	cmp r3, #0
	blt _080183CE
	mov r0, r8
	cmp r0, #0
	blt _0801847A
	ldr r0, [sp, #0x14]
	cmp r0, #0
	blt _0801847A
	ldr r1, [sp, #8]
	cmp r2, r1
	bgt _0801847A
	cmp r3, sb
	bgt _0801847A
	movs r1, #0
	mov sl, r1
_080183C4:
	ldr r0, [sp, #0x1c]
	cmp sl, r0
	blt _080183EA
	ldr r3, [sp, #0x28]
	ldrh r6, [r3]
_080183CE:
	ldr r2, [sp, #0x24]
	adds r2, #1
	str r2, [sp, #0x24]
	cmp r2, r6
	blt _08018340
_080183D8:
	add sp, #0x34
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080183EA:
	movs r4, #0
	cmp r4, lr
	bge _08018474
	mov r0, lr
	mov r3, sl
	asrs r7, r3, #3
	asrs r2, r0, #3
	adds r0, r2, #0
	muls r0, r7, r0
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x5c]
	add r5, sl
	asrs r1, r5, #3
	mov fp, r0
	adds r0, r6, #0
	muls r0, r1, r0
	movs r7, #7
	adds r6, r7, #0
	movs r2, #1
	ands r6, r5
	mov r5, sl
	mov ip, r2
	mov sb, r0
	ands r5, r7
_0801841A:
	asrs r1, r4, #3
	add r1, fp
	lsls r2, r1, #3
	adds r1, r2, r5
	mov r3, r8
	adds r0, r3, r4
	adds r2, r4, #0
	lsls r3, r1, #2
	ldr r1, [sp, #0x18]
	ands r2, r7
	asrs r2, r2, #1
	adds r3, r3, r1
	adds r3, r3, r2
	ldr r2, [sp, #0x20]
	ldrb r1, [r2, r3]
	adds r3, r4, #0
	mov r2, ip
	ands r3, r2
	lsls r2, r3, #2
	asrs r1, r2
	movs r2, #0xf
	ands r1, r2
	asrs r2, r0, #3
	add r2, sb
	lsls r3, r2, #3
	adds r2, r3, r6
	adds r3, r0, #0
	ands r3, r7
	asrs r3, r3, #1
	str r3, [sp]
	ldr r3, [sp, #0x58]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r3, [sp]
	adds r2, r2, r3
	mov r3, ip
	ands r0, r3
	lsls r3, r0, #2
	ldrb r0, [r2]
	lsls r1, r3
	orrs r1, r0
	adds r4, #1
	strb r1, [r2]
	cmp r4, lr
	blt _0801841A
_08018474:
	movs r6, #1
	add sl, r6
	b _080183C4
_0801847A:
	movs r2, #0
	mov sl, r2
	ldr r2, [sp, #0x1c]
	cmp sl, r2
	bge _080183CE
_08018484:
	movs r4, #0
	cmp r4, lr
	bge _08018530
	mov r0, sl
	mov r1, lr
	ldr r5, [sp, #0x14]
	asrs r7, r0, #3
	asrs r0, r1, #3
	adds r1, r0, #0
	muls r1, r7, r1
	add r5, sl
	ldr r3, [sp, #0x5c]
	asrs r6, r5, #3
	adds r7, r3, #0
	muls r7, r6, r7
	str r1, [sp, #0x10]
	movs r1, #7
	movs r2, #1
	mov ip, r1
	mov fp, r2
	str r7, [sp, #0xc]
	mov r2, ip
	adds r7, r5, #0
	mov r6, sl
	ands r7, r2
	ands r6, r2
_080184B8:
	mov r3, r8
	ldr r2, [sp, #8]
	adds r0, r3, r4
	cmp r0, r2
	bge _0801852A
	cmp r5, sb
	bge _0801852A
	cmp r0, #0
	blt _0801852A
	cmp r5, #0
	blt _0801852A
	ldr r2, [sp, #0x10]
	asrs r1, r4, #3
	adds r3, r2, r1
	lsls r1, r3, #3
	adds r3, r1, r6
	adds r2, r4, #0
	mov r1, ip
	ands r2, r1
	ldr r1, [sp, #0x18]
	lsls r3, r3, #2
	asrs r2, r2, #1
	adds r3, r3, r1
	adds r3, r3, r2
	ldr r2, [sp, #0x20]
	ldrb r1, [r2, r3]
	mov r2, fp
	adds r3, r4, #0
	ands r3, r2
	lsls r2, r3, #2
	asrs r1, r2
	ldr r3, [sp, #0xc]
	movs r2, #0xf
	ands r1, r2
	asrs r2, r0, #3
	adds r2, r3, r2
	lsls r2, r2, #3
	adds r3, r2, r7
	str r3, [sp, #4]
	mov r2, ip
	adds r3, r0, #0
	ands r3, r2
	asrs r2, r3, #1
	ldr r3, [sp, #4]
	str r2, [sp]
	lsls r2, r3, #2
	ldr r3, [sp, #0x58]
	adds r2, r2, r3
	ldr r3, [sp]
	adds r2, r2, r3
	mov r3, fp
	ands r0, r3
	lsls r3, r0, #2
	ldrb r0, [r2]
	lsls r1, r3
	orrs r1, r0
	strb r1, [r2]
_0801852A:
	adds r4, #1
	cmp r4, lr
	blt _080184B8
_08018530:
	movs r3, #1
	ldr r6, [sp, #0x1c]
	add sl, r3
	cmp sl, r6
	blt _08018484
	ldr r0, [sp, #0x28]
	ldrh r6, [r0]
	b _080183CE
_08018540:
	.4byte gUnk_080537D8
_08018544:
	.4byte gUnk_080537E4
_08018548:
	.4byte 0x000003FF

	.global sub_0801854C
	.thumb_func
	.type sub_0801854C, %function
sub_0801854C: @ 0801854C
	push {r4, lr}
	ldr r1, _08018594
	ldrh r4, [r1]
	lsls r3, r0, #1
	adds r2, r4, r1
	ldrh r4, [r3, r2]
	sub sp, #4
	lsls r0, r4, #4
	adds r1, r2, r0
	ldr r4, _0801858C
	mov r2, sp
	adds r2, #2
	strh r4, [r2]
	ldr r4, _08018598
	adds r0, r1, #2
	str r2, [r4]
	str r0, [r4, #4]
	ldr r2, _0801859C
	ldrh r0, [r1]
	ands r2, r0
	lsls r3, r2, #4
	movs r2, #0x81
	lsls r2, r2, #0x18
	orrs r3, r2
	str r3, [r4, #8]
	ldr r2, _08018590
	ldr r3, [r4, #8]
	orrs r0, r2
	strh r0, [r1]
	add sp, #4
	b _080185A0
	.byte 0x00, 0x00
_0801858C:
	.4byte 0x00000000
_08018590:
	.4byte 0x00008000
_08018594:
	.4byte 0x02024394
_08018598:
	.4byte 0x040000D4
_0801859C:
	.4byte 0x000003FF
_080185A0:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	.global sub_080185A8
	.thumb_func
	.type sub_080185A8, %function
sub_080185A8: @ 080185A8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #8
	str r1, [sp]
	ldr r4, _08018638
	ldr r1, [r4]
	adds r7, r1, #0
	adds r1, #1
	str r1, [r4]
	ldr r3, _0801863C
	lsls r1, r7, #1
	ldr r4, [r3]
	ldr r6, _08018640
	mov sl, r1
	ldr r1, _08018644
	lsls r5, r4, #1
	mov r8, r5
	subs r2, r1, r6
	add r2, r8
	mov r5, sl
	strh r2, [r6, r5]
	ldr r2, _08018648
	ldr r5, [r2]
	mov lr, r1
	lsls r6, r5, #5
	ldr r1, _0801864C
	ldr r5, _08018650
	mov sb, r2
	subs r2, r5, r1
	mov fp, r3
	adds r3, r6, r2
	lsrs r2, r3, #4
	str r2, [sp, #4]
	mov r2, sp
	ldrh r3, [r2, #4]
	mov ip, r1
	mov r2, ip
	mov r1, sl
	strh r3, [r2, r1]
	mov r3, lr
	mov r1, r8
	mov r2, sp
	strh r0, [r3, r1]
	ldrh r3, [r2]
	strh r3, [r5, r6]
	lsls r5, r0, #1
	adds r1, r5, r0
	adds r4, r4, r1
	adds r4, #1
	mov r3, fp
	str r4, [r3]
	mov r5, sb
	ldr r2, [sp]
	ldr r5, [r5]
	adds r0, r5, r2
	adds r0, #1
	mov r1, sb
	str r0, [r1]
	add sp, #8
	adds r0, r7, #0
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08018638:
	.4byte 0x020246B8
_0801863C:
	.4byte 0x020247C0
_08018640:
	.4byte 0x020246BC
_08018644:
	.4byte 0x020247C4
_08018648:
	.4byte 0x02024FC4
_0801864C:
	.4byte 0x02024740
_08018650:
	.4byte 0x02024FD0

	.global sub_08018654
	.thumb_func
	.type sub_08018654, %function
sub_08018654: @ 08018654
	ldr r2, _08018690
	movs r1, #0
	str r1, [r2]
	ldr r0, _08018694
	ldr r2, _08018698
	str r1, [r0]
	ldr r3, _0801869C
	str r1, [r2]
	ldr r2, _080186A0
	subs r0, r3, r2
	ldr r3, _080186A4
	strh r0, [r2]
	subs r0, r3, r2
	strh r0, [r2, #2]
	ldr r3, _08018688
	ldr r0, _0801868C
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	strh r3, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r1, [r2, #0x10]
	strh r0, [r2, #0x12]
	strh r3, [r2, #0x14]
	b _080186A8
_08018688:
	.4byte 0x000000A0
_0801868C:
	.4byte 0x000000F0
_08018690:
	.4byte 0x020246B8
_08018694:
	.4byte 0x020247C0
_08018698:
	.4byte 0x02024FC4
_0801869C:
	.4byte 0x02024740
_080186A0:
	.4byte 0x02024394
_080186A4:
	.4byte 0x020246BC
_080186A8:
	bx lr
	.byte 0x00, 0x00

	.global fe_spr_init
	.thumb_func
	.type fe_spr_init, %function
fe_spr_init: @ 080186AC
	push {lr}
	ldr r0, _080186CC
	ldr r1, _080186D0
	bl AGBPrintf
	ldr r0, _080186D4
	movs r1, #0
	str r1, [r0]
	ldr r2, _080186D8
	ldr r0, _080186DC
	str r1, [r2]
	str r1, [r0]
	ldr r0, _080186E0
	str r1, [r0]
	pop {r0}
	bx r0
_080186CC:
	.4byte gUnk_08051588
_080186D0:
	.4byte gUnk_08051594
_080186D4:
	.4byte 0x020243AC
_080186D8:
	.4byte 0x020243B0
_080186DC:
	.4byte 0x020243B4
_080186E0:
	.4byte 0x02024390

	.global sub_080186E4
	.thumb_func
	.type sub_080186E4, %function
sub_080186E4: @ 080186E4
	push {lr}
	b _080186F0
_080186E8:
	ldrh r3, [r0, #4]
	subs r1, #1
	lsls r2, r3, #4
	adds r0, r0, r2
_080186F0:
	cmp r1, #0
	ble _080186FA
	ldrh r2, [r0, #4]
	cmp r2, #0
	bne _080186E8
_080186FA:
	pop {r1}
	bx r1
	.byte 0xC0, 0x46

	.global sub_08018700
	.thumb_func
	.type sub_08018700, %function
sub_08018700: @ 08018700
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r3, sb
	adds r6, r1, #0
	str r3, [sp]
	adds r5, r0, #0
	mov r8, sb
	cmp r6, #0
	ble _0801873E
	movs r1, #0xa
	adds r0, r6, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_08018700
	movs r1, #0xa
	adds r5, r0, #0
	adds r0, r6, #0
	bl __modsi3
	mov r4, r8
	subs r4, #4
	ldr r2, [r4]
	ldrb r1, [r2, r0]
	strb r1, [r5]
	adds r5, #1
_0801873E:
	adds r0, r5, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	.global sub_08018750
	.thumb_func
	.type sub_08018750, %function
sub_08018750: @ 08018750
	push {r4, r5, r6, lr}
	mov r6, sb
	push {r6}
	adds r6, r1, #0
	ldr r1, _080187C8
	adds r5, r0, #0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	ldr r2, _080187CC
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	movs r1, #0xfe
	lsls r2, r1, #1
	adds r1, r0, r2
	ldr r0, [r1]
	ldrh r2, [r0]
	lsls r1, r2, #1
	adds r2, r0, r1
	adds r0, r2, #0
	sub sp, #8
	adds r0, #0x1a
	str r0, [sp, #4]
	cmp r6, #0
	beq _080187BE
	adds r4, r5, #0
	cmp r6, #0
	ble _080187AC
	movs r1, #0xa
	adds r0, r6, #0
	bl __divsi3
	add r3, sp, #8
	adds r1, r0, #0
	mov sb, r3
	adds r0, r5, #0
	bl sub_08018700
	movs r1, #0xa
	adds r4, r0, #0
	adds r0, r6, #0
	bl __modsi3
	ldr r2, [sp, #4]
	ldrb r5, [r2, r0]
	strb r5, [r4]
	adds r4, #1
_080187AC:
	adds r5, r4, #0
_080187AE:
	movs r1, #0x4e
	strb r1, [r5]
	add sp, #8
	pop {r3}
	mov sb, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_080187BE:
	ldrb r0, [r2, #0x1a]
	strb r0, [r5]
	adds r5, #1
	b _080187AE
	.byte 0x00, 0x00
_080187C8:
	.4byte gGameSetup
_080187CC:
	.4byte gUnk_0863FDC0

	.global sub_080187D0
	.thumb_func
	.type sub_080187D0, %function
sub_080187D0: @ 080187D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r7, _080188B0
	mov r8, r2
	adds r5, r0, #0
	movs r2, #0x18
	ldrsh r0, [r7, r2]
	ldr r6, _080188B4
	adds r4, r1, #0
	lsls r1, r0, #2
	ldr r0, [r6, r1]
	movs r7, #0xfe
	lsls r6, r7, #1
	adds r1, r0, r6
	ldr r6, [r1]
	ldrh r7, [r6]
	lsls r2, r7, #1
	adds r0, r6, r2
	adds r6, r0, #0
	movs r1, #0x3c
	adds r0, r4, #0
	bl __modsi3
	movs r1, #0x64
	muls r0, r1, r0
	movs r1, #0x3c
	bl __divsi3
	movs r1, #0x3c
	mov sl, r0
	adds r0, r4, #0
	bl __divsi3
	movs r1, #0x3c
	bl __modsi3
	movs r2, #0xe1
	adds r7, r0, #0
	lsls r1, r2, #4
	adds r0, r4, #0
	bl __divsi3
	adds r4, r0, #0
	adds r6, #0x1a
	cmp r4, #0
	ble _080188A8
_08018830:
	cmp r4, #9
	ble _080188A2
	movs r1, #0xa
	adds r0, r4, #0
	bl __divsi3
	ldrb r1, [r6, r0]
	adds r0, r4, #0
	strb r1, [r5]
	movs r1, #0xa
	bl __modsi3
	ldrb r2, [r6, r0]
	adds r5, #1
	strb r2, [r5]
_0801884E:
	adds r5, #1
	ldrb r2, [r6, #0xa]
	strb r2, [r5]
	adds r5, #1
_08018856:
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, r0]
	adds r0, r7, #0
	strb r1, [r5]
	movs r1, #0xa
	bl __modsi3
	ldrb r2, [r6, r0]
	adds r5, #1
	strb r2, [r5]
	ldrb r0, [r6, #0xb]
	adds r5, #1
	strb r0, [r5]
	movs r1, #0xa
	mov r0, sl
	bl __divsi3
	ldrb r1, [r6, r0]
	adds r5, #1
	strb r1, [r5]
	mov r0, sl
	movs r1, #0xa
	bl __modsi3
	ldrb r2, [r6, r0]
	adds r5, #1
	movs r1, #0x4e
	strb r2, [r5]
	strb r1, [r5, #1]
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080188A2:
	ldrb r0, [r6, r4]
	strb r0, [r5]
	b _0801884E
_080188A8:
	mov r3, r8
	cmp r3, #0
	bne _08018830
	b _08018856
_080188B0:
	.4byte gGameSetup
_080188B4:
	.4byte gUnk_0863FDC0

	.global sub_080188B8
	.thumb_func
	.type sub_080188B8, %function
sub_080188B8: @ 080188B8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x38
	str r0, [sp, #0x34]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x28]
	str r1, [sp, #0x30]
	ldr r0, _0801896C
	ldr r3, [sp, #0x5c]
	ldrh r1, [r0]
	adds r2, r1, r0
	lsls r1, r3, #1
	ldrh r3, [r1, r2]
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #0x20]
	ldrh r2, [r0, #2]
	adds r3, r2, r0
	ldrh r0, [r1, r3]
	adds r1, r3, r0
	movs r0, #0
	str r1, [sp, #0x24]
	str r0, [sp, #0x1c]
	ldrh r3, [r1]
	mov ip, r3
	cmp r0, ip
	bge _080189C8
_080188F6:
	ldr r3, [sp, #0x1c]
	movs r4, #6
	adds r1, r3, #0
	muls r1, r4, r1
	ldr r2, [sp, #0x24]
	adds r4, r1, r2
	ldrh r2, [r4, #2]
	lsrs r7, r2, #0xe
	lsls r0, r7, #2
	ldrh r7, [r4, #4]
	ldr r5, _08018970
	lsrs r6, r7, #0xe
	orrs r0, r6
	ldrb r6, [r5, r0]
	ldr r5, _08018974
	lsls r3, r2, #0x18
	ldrb r1, [r5, r0]
	ldr r5, [sp, #0x28]
	asrs r2, r3, #0x18
	lsls r3, r7, #0x18
	subs r0, r5, r2
	asrs r5, r3, #0x18
	ldr r3, [sp, #0x2c]
	subs r7, r3, r5
	ldrh r3, [r4, #6]
	ldr r5, _08018968
	adds r2, r7, r6
	ands r5, r3
	mov sl, r2
	ldr r2, [sp, #0x20]
	lsls r7, r5, #5
	adds r5, r2, r7
	adds r5, #2
	lsrs r7, r6, #2
	lsrs r6, r1, #2
	str r5, [sp, #0x18]
	str r7, [sp, #0x14]
	str r6, [sp, #0x10]
	ldr r5, [sp, #0x30]
	ldr r3, [r5]
	ldr r7, [sp, #0x30]
	str r3, [sp, #0xc]
	ldr r5, [r7, #0xc]
	ldr r2, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r3, [r2, #8]
	lsrs r2, r5, #0x10
	mov sb, r2
	ldr r2, _08018978
	adds r7, r0, r1
	ldrb r0, [r6]
	ands r2, r5
	mov fp, r3
	mov r8, r2
	mov r5, sl
	b _0801897C
	.byte 0x00, 0x00
_08018968:
	.4byte 0x000003FF
_0801896C:
	.4byte 0x02024394
_08018970:
	.4byte gUnk_080537D8
_08018974:
	.4byte gUnk_080537E4
_08018978:
	.4byte 0x0000FFFF
_0801897C:
	cmp r0, #0x4e
	beq _080189BE
_08018980:
	ldrb r3, [r6]
	adds r6, #1
	cmp r3, #0x4f
	beq _080189E0
	cmp r3, #0x50
	beq _080189DA
	lsls r0, r3, #1
	mov r2, fp
	adds r4, r0, r2
	ldrb r3, [r4]
	cmp r3, #0xff
	beq _080189AE
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	str r1, [sp]
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp, #0xc]
	bl sub_08018304
_080189AE:
	ldrb r2, [r4, #1]
	adds r5, r5, r2
_080189B2:
	ldrb r0, [r6]
	cmp r0, #0x4e
	bne _08018980
	ldr r1, [sp, #0x24]
	ldrh r3, [r1]
	mov ip, r3
_080189BE:
	ldr r3, [sp, #0x1c]
	adds r3, #1
	str r3, [sp, #0x1c]
	cmp r3, ip
	blt _080188F6
_080189C8:
	add sp, #0x38
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080189DA:
	mov r5, sl
	add r7, r8
	b _080189B2
_080189E0:
	add r5, sb
	b _080189B2

	.global sub_080189E4
	.thumb_func
	.type sub_080189E4, %function
sub_080189E4: @ 080189E4
	push {lr}
	ldr r3, _08018A0C
	movs r2, #0x18
	ldrsh r3, [r3, r2]
	ldr r2, _08018A10
	lsls r3, r3, #2
	ldr r3, [r2, r3]
	lsls r2, r0, #2
	ldr r0, [r2, r3]
	cmp r1, #0
	ble _08018A04
	lsls r2, r1, #1
	ldrh r1, [r2, r0]
_080189FE:
	adds r0, r0, r1
	pop {r1}
	bx r1
_08018A04:
	ldrh r2, [r0]
	lsls r1, r2, #1
	b _080189FE
	.byte 0x00, 0x00
_08018A0C:
	.4byte gGameSetup
_08018A10:
	.4byte gUnk_0863FDC0

	.global sub_08018A14
	.thumb_func
	.type sub_08018A14, %function
sub_08018A14: @ 08018A14
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, _08018A70
	adds r4, r0, #0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	ldr r2, _08018A74
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	movs r1, #0xfe
	lsls r2, r1, #1
	adds r1, r0, r2
	ldr r2, [r1]
	ldrh r0, [r2]
	lsls r1, r0, #1
	adds r0, r2, r1
	movs r2, #0x80
	lsls r1, r2, #8
	ands r1, r5
	cmp r1, #0
	beq _08018A60
	movs r2, #0
	movs r6, #0x1f
	movs r1, #0
_08018A44:
	adds r3, r5, #0
	asrs r3, r1
	ands r3, r6
	ldrb r3, [r0, r3]
	strb r3, [r4, r2]
	adds r2, #1
	adds r1, #5
	cmp r2, #2
	ble _08018A44
_08018A56:
	movs r0, #0x4e
	strb r0, [r4, #3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_08018A60:
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r2, [r1]
	strb r2, [r4, #2]
	strb r2, [r4, #1]
	strb r2, [r4]
	b _08018A56
	.byte 0x00, 0x00
_08018A70:
	.4byte gGameSetup
_08018A74:
	.4byte gUnk_0863FDC0

	.global sub_08018A78
	.thumb_func
	.type sub_08018A78, %function
sub_08018A78: @ 08018A78
	push {r4, r5, lr}
	ldrb r3, [r0]
	ldr r5, [r1, #8]
	ldrh r4, [r1, #0xe]
	movs r2, #0
	movs r1, #0
	cmp r3, #0x4e
	beq _08018AA6
_08018A88:
	ldrb r3, [r0]
	adds r0, #1
	cmp r3, #0x4f
	beq _08018AC2
	cmp r3, #0x4f
	bgt _08018AB4
	cmp r3, #0x4e
	beq _08018AA0
_08018A98:
	lsls r3, r3, #1
	adds r3, r3, r5
	ldrb r3, [r3, #1]
	adds r2, r2, r3
_08018AA0:
	ldrb r3, [r0]
	cmp r3, #0x4e
	bne _08018A88
_08018AA6:
	cmp r2, r1
	ble _08018AAC
	adds r1, r2, #0
_08018AAC:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
_08018AB4:
	cmp r3, #0x50
	bne _08018A98
	cmp r2, r1
	ble _08018ABE
	adds r1, r2, #0
_08018ABE:
	movs r2, #0
	b _08018AA0
_08018AC2:
	adds r2, r2, r4
	b _08018AA0
	.byte 0x00, 0x00

	.global sub_08018AC8
	.thumb_func
	.type sub_08018AC8, %function
sub_08018AC8: @ 08018AC8
	push {lr}
	ldrh r2, [r1, #0xc]
	ldrb r3, [r0]
	adds r1, r2, #0
	cmp r3, #0x4e
	beq _08018AE2
_08018AD4:
	ldrb r3, [r0]
	adds r0, #1
	cmp r3, #0x50
	beq _08018AE8
_08018ADC:
	ldrb r3, [r0]
	cmp r3, #0x4e
	bne _08018AD4
_08018AE2:
	adds r0, r2, #0
	pop {r1}
	bx r1
_08018AE8:
	adds r2, r2, r1
	b _08018ADC

	.global sub_08018AEC
	.thumb_func
	.type sub_08018AEC, %function
sub_08018AEC: @ 08018AEC
	push {lr}
	ldrb r1, [r0]
	movs r2, #0
	cmp r1, #0x4e
	beq _08018B0A
_08018AF6:
	ldrb r3, [r0]
	adds r0, #1
	cmp r3, #0x50
	bgt _08018B02
	cmp r3, #0x4e
	bge _08018B04
_08018B02:
	adds r2, #1
_08018B04:
	ldrb r1, [r0]
	cmp r1, #0x4e
	bne _08018AF6
_08018B0A:
	adds r0, r2, #0
	pop {r1}
	bx r1

	.global sub_08018B10
	.thumb_func
	.type sub_08018B10, %function
sub_08018B10: @ 08018B10
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r0, #0
	mov sl, r2
	ldr r0, [r1]
	sub sp, #0x1c
	mov sb, r3
	mov r3, sl
	str r0, [sp, #0x18]
	cmp r3, #0
	beq _08018BAA
_08018B2E:
	ldr r2, [r1, #8]
	str r2, [sp, #0x14]
	ldr r2, _08018BB0
	ldr r5, [r1, #0xc]
	ldrb r0, [r6]
	lsrs r1, r5, #0x10
	ands r2, r5
	str r1, [sp, #0x10]
	mov fp, r2
	mov r5, sb
	ldr r7, [sp, #0x40]
	cmp r0, #0x4e
	beq _08018B88
	movs r3, #0
	mov r8, r3
_08018B4C:
	ldrb r3, [r6]
	adds r6, #1
	cmp r3, #0x4f
	beq _08018BA4
	cmp r3, #0x4f
	bgt _08018B9A
	cmp r3, #0x4e
	beq _08018B82
_08018B5C:
	ldr r0, [sp, #0x14]
	lsls r1, r3, #1
	adds r4, r1, r0
	ldrb r3, [r4]
	cmp r3, #0xff
	beq _08018B7E
	str r3, [sp]
	mov r3, r8
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp, #0x18]
	mov r3, sl
	bl fe_spr_plot
_08018B7E:
	ldrb r2, [r4, #1]
	adds r5, r5, r2
_08018B82:
	ldrb r0, [r6]
	cmp r0, #0x4e
	bne _08018B4C
_08018B88:
	add sp, #0x1c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08018B9A:
	cmp r3, #0x50
	bne _08018B5C
	mov r5, sb
	add r7, fp
	b _08018B82
_08018BA4:
	ldr r3, [sp, #0x10]
	adds r5, r5, r3
	b _08018B82
_08018BAA:
	ldr r2, [r1, #4]
	mov sl, r2
	b _08018B2E
_08018BB0:
	.4byte 0x0000FFFF

	.global sub_08018BB4
	.thumb_func
	.type sub_08018BB4, %function
sub_08018BB4: @ 08018BB4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r5, [r1]
	sub sp, #0x10
	str r5, [sp, #0xc]
	adds r6, r0, #0
	ldr r0, [r1, #0xc]
	mov r8, r2
	ldr r2, [r1, #8]
	lsrs r1, r0, #0x10
	mov sb, r1
	ldr r1, _08018C38
	ands r1, r0
	ldrb r0, [r6]
	mov fp, r2
	mov sl, r1
	mov r5, r8
	adds r7, r3, #0
	cmp r0, #0x4e
	beq _08018C1C
_08018BE4:
	ldrb r3, [r6]
	adds r6, #1
	cmp r3, #0x4f
	beq _08018C34
	cmp r3, #0x50
	beq _08018C2E
	lsls r1, r3, #1
	mov r2, fp
	adds r4, r1, r2
	ldrb r3, [r4]
	cmp r3, #0xff
	beq _08018C12
	ldr r2, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r2, [sp]
	ldr r2, [sp, #0x3c]
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp, #0xc]
	bl sub_08018304
_08018C12:
	ldrb r1, [r4, #1]
	adds r5, r5, r1
_08018C16:
	ldrb r0, [r6]
	cmp r0, #0x4e
	bne _08018BE4
_08018C1C:
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08018C2E:
	mov r5, r8
	add r7, sl
	b _08018C16
_08018C34:
	add r5, sb
	b _08018C16
_08018C38:
	.4byte 0x0000FFFF

	.global sub_08018C3C
	.thumb_func
	.type sub_08018C3C, %function
sub_08018C3C: @ 08018C3C
	ldr r1, _08018C50
	movs r2, #0x18
	ldrsh r3, [r1, r2]
	ldr r2, _08018C54
	lsls r1, r3, #2
	ldr r3, [r2, r1]
	lsls r2, r0, #2
	ldr r1, [r2, r3]
	ldrh r0, [r1]
	bx lr
_08018C50:
	.4byte gGameSetup
_08018C54:
	.4byte gUnk_0863FDC0

	.global sub_08018C58
	.thumb_func
	.type sub_08018C58, %function
sub_08018C58: @ 08018C58
	push {lr}
	ldr r0, _08018D0C
	movs r2, #0x16
	ldrsh r3, [r0, r2]
	cmp r3, #1
	beq _08018CD8
	cmp r3, #1
	bgt _08018CA2
	cmp r3, #0
	beq _08018C70
_08018C6C:
	pop {r0}
	bx r0
_08018C70:
	ldr r0, _08018D10
	ldr r1, _08018D14
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #5
	movs r2, #0x80
	ldr r3, _08018D18
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	ldr r2, _08018D1C
	str r1, [r0, #8]
	movs r1, #0xc0
	ldr r3, [r0, #8]
	str r2, [r0]
	lsls r2, r1, #0x13
	ldr r1, _08018D20
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08018D24
	bl pal_load
	b _08018C6C
_08018CA2:
	cmp r3, #2
	bne _08018C6C
	ldr r0, _08018D10
	ldr r1, _08018D28
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #5
	movs r2, #0x80
	ldr r3, _08018D18
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, _08018D2C
	movs r2, #0xc0
	ldr r3, [r0, #8]
	str r1, [r0]
	lsls r1, r2, #0x13
	ldr r2, _08018D20
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08018D30
	bl pal_load
	b _08018C6C
_08018CD8:
	ldr r0, _08018D10
	ldr r1, _08018D34
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #5
	movs r2, #0x80
	ldr r3, _08018D18
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, _08018D38
	movs r2, #0xc0
	ldr r3, [r0, #8]
	str r1, [r0]
	lsls r1, r2, #0x13
	ldr r2, _08018D20
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08018D3C
	bl pal_load
	b _08018C6C
	.byte 0x00, 0x00
_08018D0C:
	.4byte gGameSetup
_08018D10:
	.4byte 0x040000D4
_08018D14:
	.4byte gUnk_080AFD54
_08018D18:
	.4byte 0x06004000
_08018D1C:
	.4byte gUnk_081BEF14
_08018D20:
	.4byte 0x80000400
_08018D24:
	.4byte gUnk_08055C50
_08018D28:
	.4byte gUnk_080B4D56
_08018D2C:
	.4byte gUnk_081BF418
_08018D30:
	.4byte gUnk_08055E50
_08018D34:
	.4byte gUnk_080B9D18
_08018D38:
	.4byte gUnk_081BF91C
_08018D3C:
	.4byte gUnk_08056050

	.global sub_08018D40
	.thumb_func
	.type sub_08018D40, %function
sub_08018D40: @ 08018D40
	push {lr}
	ldr r0, _08018DEC
	ldrh r3, [r0]
	sub sp, #0x10
	cmp r3, #6
	bhi _08018D8E
	ldr r2, _08018DF0
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.global _08018D54
_08018D54:
	.4byte _08018DC2
	.4byte _08018DAA
	.4byte _08018D70
	.4byte _08018D8E
	.4byte _08018DC2
	.4byte _08018DD6
	.4byte _08018DD6
	.global _08018D70
_08018D70:
	movs r1, #1
	ldr r0, _08018DF4
	bl sub_080186E4
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r1, #0x14
	movs r0, #0xc
	ldr r3, _08018DF8
_08018D8A:
	bl fe_spr_plot
	.global _08018D8E
_08018D8E:
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0
	movs r1, #0x14
	ldr r2, _08018DFC
	ldr r3, _08018E00
	bl fe_spr_plot
	add sp, #0x10
	pop {r0}
	bx r0
	.global _08018DAA
_08018DAA:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r1, #0x14
	movs r0, #0xc
	ldr r2, _08018E04
	ldr r3, _08018E08
	bl fe_spr_plot
	b _08018D8E
	.global _08018DC2
_08018DC2:
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xc
	movs r1, #0x14
	ldr r2, _08018E0C
	ldr r3, _08018E10
	b _08018D8A
	.global _08018DD6
_08018DD6:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0xc
	movs r1, #0x14
	ldr r2, _08018E14
	ldr r3, _08018E18
	b _08018D8A
	.byte 0x00, 0x00
_08018DEC:
	.4byte gGameSetup
_08018DF0:
	.4byte _08018D54
_08018DF4:
	.4byte gUnk_08294EC0
_08018DF8:
	.4byte gUnk_0863F180
_08018DFC:
	.4byte gUnk_08629A40
_08018E00:
	.4byte gUnk_0863FB60
_08018E04:
	.4byte gUnk_08629D40
_08018E08:
	.4byte gUnk_0863FBC0
_08018E0C:
	.4byte gUnk_08629BC0
_08018E10:
	.4byte gUnk_0863FB80
_08018E14:
	.4byte gUnk_08629C80
_08018E18:
	.4byte gUnk_0863FBA0
