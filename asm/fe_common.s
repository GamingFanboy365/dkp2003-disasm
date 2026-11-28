@ asm/fe_common.s: ROM 0x018E1C-0x01D2EC (rom, VMA 0x08018E1C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global fe_draw_title
	.thumb_func
	.type fe_draw_title, %function
fe_draw_title: @ 08018E1C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r4, _08019180
	ldr r1, _08019184
	ldr r0, [r4]
	ldr r3, [r1, #4]
	sub sp, #0x20
	mov r8, r0
	ldr r7, [r4, #4]
	mov sl, r1
	cmp r3, #1
	bne _08018E3E
	b _080191B0
_08018E3E:
	cmp r3, #1
	ble _08018E44
	b _08018F9E
_08018E44:
	cmp r3, #0
	beq _08018E5A
_08018E48:
	add sp, #0x20
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08018E5A:
	movs r7, #0xca
	lsls r5, r7, #2
	add r5, sl
	str r3, [r5]
	mov r2, sl
	ldr r0, [r2]
	movs r1, #0
	bl fe_get_text
	adds r1, r4, #0
	adds r7, r0, #0
	bl fe_text_width
	movs r2, #0xf0
	subs r6, r2, r0
	lsrs r0, r6, #0x1f
	adds r1, r6, r0
	ldr r6, [r4, #8]
	str r6, [sp, #0x1c]
	asrs r3, r1, #1
	ldr r0, [r4, #0xc]
	ldr r1, _08019188
	lsrs r2, r0, #0x10
	ands r1, r0
	str r1, [sp, #0x18]
	str r2, [sp, #0x14]
	ldrb r0, [r7]
	mov sb, r3
	movs r1, #4
	mov r6, sb
	mov fp, r1
	cmp r0, #0x4e
	beq _08018F14
	movs r2, #0x28
	adds r1, r5, #0
	mov r8, r2
_08018EA2:
	ldrb r3, [r7]
	adds r7, #1
	cmp r3, #0x4f
	beq _08018F98
	cmp r3, #0x4f
	bgt _08018F8C
	cmp r3, #0x4e
	beq _08018F0E
_08018EB2:
	ldr r2, [sp, #0x1c]
	lsls r4, r3, #1
	adds r5, r4, r2
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _08018F0A
	ldr r2, [r1]
	mov r4, r8
	muls r4, r2, r4
	adds r0, r4, #0
	adds r0, #8
	mov r4, sl
	str r6, [r4, r0]
	ldr r3, _0801918C
	ldr r2, [r1]
	adds r0, r2, #0
	muls r0, r3, r0
	mov r4, r8
	muls r4, r2, r4
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	str r1, [sp, #0x10]
	ldr r1, _08019190
	bl _call_via_r1
	lsls r3, r0, #0x10
	asrs r2, r3, #0x1b
	mov r3, fp
	subs r1, r3, r2
	adds r4, #0xc
	mov r2, sl
	str r1, [r2, r4]
	ldr r1, [sp, #0x10]
	ldr r0, [r1]
	mov r2, r8
	muls r2, r0, r2
	ldrb r4, [r5]
	adds r3, r2, #0
	mov r0, sl
	adds r3, #0x18
	str r4, [r0, r3]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_08018F0A:
	ldrb r0, [r5, #1]
	adds r6, r6, r0
_08018F0E:
	ldrb r4, [r7]
	cmp r4, #0x4e
	bne _08018EA2
_08018F14:
	ldr r1, _08019184
	movs r7, #0xca
	mov sl, r1
	lsls r4, r7, #2
	add r4, sl
	ldr r3, [r4]
	cmp r3, #0x13
	bls _08018F3C
	ldr r1, _08019194
	ldr r0, _08019198
	str r1, [sp]
	ldr r2, _0801919C
	ldr r1, _080191A0
	movs r3, #0xd3
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r3, [r4]
_08018F3C:
	movs r7, #0
	cmp r7, r3
	bge _08018F84
_08018F42:
	movs r5, #0x28
	adds r4, r7, #0
	muls r4, r5, r4
	adds r6, r4, #0
	movs r5, #0
	mov r2, sl
	adds r6, #0x10
	str r5, [r2, r6]
	bl lfsr_next
	ldr r1, _080191A4
	lsls r2, r0, #5
	lsrs r3, r2, #8
	subs r2, r1, r3
	adds r6, r4, #0
	adds r1, r4, #0
	mov r0, sl
	adds r1, #0x1c
	adds r6, #0x14
	str r2, [r0, r6]
	str r5, [r0, r1]
	adds r1, #4
	str r5, [r0, r1]
	movs r2, #4
	adds r4, #0x2c
	movs r1, #0xca
	str r2, [r0, r4]
	lsls r0, r1, #2
	add r0, sl
	ldr r2, [r0]
	adds r7, #1
	cmp r7, r2
	blt _08018F42
_08018F84:
	movs r0, #1
	mov r1, sl
	str r0, [r1, #4]
	b _08018E48
_08018F8C:
	cmp r3, #0x50
	bne _08018EB2
	ldr r4, [sp, #0x18]
	mov r6, sb
	add fp, r4
	b _08018F0E
_08018F98:
	ldr r3, [sp, #0x14]
	adds r6, r6, r3
	b _08018F0E
_08018F9E:
	cmp r3, #2
	bne _08018FA4
	b _080190CE
_08018FA4:
	cmp r3, #3
	beq _08018FAA
	b _08018E48
_08018FAA:
	movs r0, #0xca
	lsls r1, r0, #2
	add r1, sl
	ldr r2, [r1]
	movs r6, #0
	cmp r6, r2
	bge _08019004
_08018FB8:
	movs r1, #0x28
	adds r2, r6, #0
	muls r2, r1, r2
	adds r3, r2, #0
	mov r0, sl
	adds r3, #0x10
	ldr r4, [r0, r3]
	adds r1, r2, #0
	adds r1, #8
	asrs r3, r4, #8
	ldr r4, [r0, r1]
	adds r0, r4, r3
	adds r3, r2, #0
	mov r4, sl
	adds r3, #0x14
	ldr r3, [r4, r3]
	adds r1, #4
	ldr r1, [r4, r1]
	asrs r3, r3, #8
	adds r2, #0x18
	adds r1, r1, r3
	ldr r3, [r4, r2]
	movs r2, #0
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	adds r3, r7, #0
	mov r2, r8
	bl fe_spr_plot
	movs r0, #0xca
	lsls r1, r0, #2
	add r1, sl
	ldr r2, [r1]
	adds r6, #1
	cmp r6, r2
	blt _08018FB8
_08019004:
	movs r3, #0xca
	lsls r2, r3, #2
	add r2, sl
	ldr r0, [r2]
	movs r6, #0
	cmp r6, r0
	bge _08019060
	mov r4, sl
	movs r5, #0
	mov sl, r2
_08019018:
	movs r1, #0x28
	adds r2, r6, #0
	muls r2, r1, r2
	adds r3, r2, #0
	adds r3, #0x10
	ldr r0, [r4, r3]
	adds r1, r2, #0
	adds r1, #8
	asrs r3, r0, #8
	ldr r0, [r4, r1]
	adds r0, r0, r3
	adds r3, r2, #0
	adds r3, #0x14
	ldr r3, [r4, r3]
	adds r1, #4
	ldr r1, [r4, r1]
	asrs r3, r3, #8
	adds r2, #0x18
	adds r1, r1, r3
	ldr r3, [r4, r2]
	adds r3, #1
	str r3, [sp]
	mov r2, r8
	adds r3, r7, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	mov r0, sl
	ldr r2, [r0]
	adds r6, #1
	cmp r6, r2
	blt _08019018
	ldr r1, _08019184
	mov sl, r1
_08019060:
	movs r1, #0xca
	lsls r0, r1, #2
	add r0, sl
	ldr r2, [r0]
	movs r6, #0
	cmp r6, r2
	blt _08019070
	b _08018E48
_08019070:
	movs r4, #0x28
	adds r5, r6, #0
	muls r5, r4, r5
	adds r2, r5, #0
	adds r2, #0x2c
	mov r4, sl
	ldr r0, [r4, r2]
	subs r0, #5
	str r0, [r4, r2]
	cmp r0, #0
	blt _08019096
_08019086:
	movs r1, #0xca
	lsls r0, r1, #2
	add r0, sl
	ldr r2, [r0]
	adds r6, #1
	cmp r6, r2
	blt _08019070
	b _08018E48
_08019096:
	adds r4, r5, #0
	mov r7, sl
	adds r4, #0x1c
	subs r2, #8
	ldr r3, [r7, r2]
	ldr r1, [r7, r4]
	adds r0, r1, r3
	str r0, [r7, r4]
	adds r1, r5, #0
	adds r0, r5, #0
	adds r0, #0x20
	adds r1, #0x28
	ldr r3, [r7, r0]
	ldr r2, [r7, r1]
	adds r1, r3, r2
	str r1, [r7, r0]
	adds r1, r5, #0
	adds r1, #0x10
	ldr r3, [r7, r1]
	ldr r2, [r7, r4]
	adds r3, r3, r2
	str r3, [r7, r1]
	adds r1, #4
	ldr r3, [r7, r1]
	ldr r2, [r7, r0]
	adds r0, r3, r2
	str r0, [r7, r1]
	b _08019086
_080190CE:
	movs r0, #0xca
	movs r3, #0
	lsls r2, r0, #2
	mov fp, r3
	adds r3, r1, r2
	ldr r4, [r3]
	cmp fp, r4
	bge _08019176
	adds r7, r1, #0
_080190E0:
	movs r1, #0x28
	mov r6, fp
	muls r6, r1, r6
	movs r2, #0x10
	adds r0, r2, r6
	adds r1, r6, #0
	ldr r4, [r7, r0]
	adds r1, #8
	ldr r5, [r7, r1]
	asrs r3, r4, #8
	adds r4, r5, r3
	mov sb, r0
	movs r0, #0x14
	str r4, [r7, r1]
	adds r3, r0, r6
	adds r4, r6, #0
	ldr r5, [r7, r3]
	adds r4, #0xc
	ldr r0, [r7, r4]
	asrs r2, r5, #8
	adds r5, r0, r2
	str r5, [r7, r4]
	ldr r4, [r7, r1]
	subs r5, #0x3c
	subs r4, #0x78
	adds r1, r4, #0
	muls r1, r4, r1
	adds r2, r5, #0
	muls r2, r5, r2
	adds r0, r1, r2
	ldr r2, _080191A8
	mov r8, r3
	bl _call_via_r2
	mov sl, r0
	mov r3, sl
	adds r0, r6, #0
	adds r0, #0x2c
	subs r3, #0x32
	adds r1, r6, #0
	str r3, [r7, r0]
	adds r1, #0x1c
	movs r0, #0
	str r0, [r7, r1]
	adds r1, #4
	str r0, [r7, r1]
	mov r2, r8
	mov r1, sb
	str r0, [r7, r1]
	str r0, [r7, r2]
	lsls r2, r4, #0xa
	movs r0, #0x24
	adds r3, r0, r6
	mov r1, sl
	adds r0, r2, #0
	mov r8, r3
	bl __divsi3
	mov r4, r8
	lsls r5, r5, #0xa
	str r0, [r7, r4]
	mov r1, sl
	adds r0, r5, #0
	bl __divsi3
	adds r6, #0x28
	str r0, [r7, r6]
	ldr r3, _080191AC
	movs r1, #1
	ldr r4, [r3]
	add fp, r1
	cmp fp, r4
	blt _080190E0
	ldr r2, _08019184
	mov sl, r2
_08019176:
	movs r0, #3
	mov r4, sl
	str r0, [r4, #4]
	b _08018E48
	.byte 0x00, 0x00
_08019180:
	.4byte gUnk_0863FDD8
_08019184:
	.4byte 0x0202CF10
_08019188:
	.4byte 0x0000FFFF
_0801918C:
	.4byte 0x00004444
_08019190:
	.4byte sin_fx
_08019194:
	.4byte gUnk_080515A0
_08019198:
	.4byte gUnk_080515F8
_0801919C:
	.4byte gUnk_08051634
_080191A0:
	.4byte gUnk_08051644
_080191A4:
	.4byte 0xFFFFE000
_080191A8:
	.4byte isqrt
_080191AC:
	.4byte 0x0202D238
_080191B0:
	movs r0, #0xca
	lsls r2, r0, #2
	add r2, sl
	ldr r1, [r2]
	movs r6, #0
	cmp r6, r1
	bge _08019208
_080191BE:
	movs r4, #0x28
	adds r2, r6, #0
	muls r2, r4, r2
	adds r3, r2, #0
	mov r4, sl
	adds r3, #0x10
	ldr r0, [r4, r3]
	adds r1, r2, #0
	adds r1, #8
	asrs r3, r0, #8
	ldr r0, [r4, r1]
	adds r0, r0, r3
	adds r3, r2, #0
	adds r3, #0x14
	ldr r3, [r4, r3]
	adds r1, #4
	ldr r1, [r4, r1]
	asrs r3, r3, #8
	adds r2, #0x18
	adds r1, r1, r3
	ldr r3, [r4, r2]
	movs r2, #0
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	adds r3, r7, #0
	mov r2, r8
	bl fe_spr_plot
	movs r0, #0xca
	lsls r2, r0, #2
	add r2, sl
	ldr r1, [r2]
	adds r6, #1
	cmp r6, r1
	blt _080191BE
_08019208:
	movs r3, #0xca
	lsls r2, r3, #2
	add r2, sl
	ldr r1, [r2]
	movs r6, #0
	cmp r6, r1
	bge _08019264
	mov r4, sl
	movs r5, #0
	mov sl, r2
_0801921C:
	movs r1, #0x28
	adds r2, r6, #0
	muls r2, r1, r2
	adds r3, r2, #0
	adds r3, #0x10
	ldr r0, [r4, r3]
	adds r1, r2, #0
	adds r1, #8
	asrs r3, r0, #8
	ldr r0, [r4, r1]
	adds r0, r0, r3
	adds r3, r2, #0
	adds r3, #0x14
	ldr r3, [r4, r3]
	adds r1, #4
	ldr r1, [r4, r1]
	asrs r3, r3, #8
	adds r2, #0x18
	adds r1, r1, r3
	ldr r3, [r4, r2]
	adds r3, #1
	str r3, [sp]
	mov r2, r8
	adds r3, r7, #0
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	mov r0, sl
	ldr r2, [r0]
	adds r6, #1
	cmp r6, r2
	blt _0801921C
	ldr r1, _080192E4
	mov sl, r1
_08019264:
	movs r3, #0xca
	lsls r2, r3, #2
	add r2, sl
	ldr r0, [r2]
	movs r6, #0
	cmp r6, r0
	blt _08019274
	b _08018E48
_08019274:
	mov r7, sl
	mov ip, r2
_08019278:
	movs r5, #0x28
	adds r0, r6, #0
	muls r0, r5, r0
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r2, [r7, r5]
	cmp r2, #0
	ble _080192D8
	adds r1, r0, #0
	adds r2, r0, #0
	mov r4, sl
	adds r1, #0x10
	adds r2, #0x1c
	ldr r3, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r3, r2
	str r3, [r4, r1]
	adds r4, r0, #0
	adds r4, #0x14
	mov r0, sl
	adds r1, #0x10
	ldr r2, [r0, r1]
	ldr r3, [r0, r4]
	adds r3, r3, r2
	str r3, [r0, r4]
	ldr r2, [r0, r1]
	adds r2, #0x40
	str r2, [r0, r1]
	ldr r3, [r0, r4]
	cmp r3, #0
	ble _080192CA
	rsbs r2, r3, #0
	str r2, [r0, r4]
	ldr r3, [r0, r1]
	lsls r2, r3, #7
	rsbs r3, r2, #0
	asrs r2, r3, #8
	str r2, [r0, r1]
	ldr r1, [r0, r5]
	subs r1, #1
	str r1, [r0, r5]
_080192CA:
	mov r2, ip
	ldr r1, [r2]
	adds r6, #1
	mov sl, r7
	cmp r6, r1
	blt _08019278
	b _08018E48
_080192D8:
	adds r2, r0, #0
	adds r2, #0x14
	movs r0, #0
	mov r1, sl
	str r0, [r1, r2]
	b _080192CA
_080192E4:
	.4byte 0x0202CF10

	.global fe_theme_palette
	.thumb_func
	.type fe_theme_palette, %function
fe_theme_palette: @ 080192E8
	push {lr}
	ldr r0, _0801930C
	movs r2, #0x16
	ldrsh r3, [r0, r2]
	cmp r3, #1
	beq _08019306
	cmp r3, #1
	bgt _080192FE
_080192F8:
	ldr r0, _08019310
_080192FA:
	pop {r1}
	bx r1
_080192FE:
	cmp r3, #2
	bne _080192F8
	ldr r0, _08019314
	b _080192FA
_08019306:
	ldr r0, _08019318
	b _080192FA
	.byte 0x00, 0x00
_0801930C:
	.4byte gGameSetup
_08019310:
	.4byte gUnk_0863F1A0
_08019314:
	.4byte gUnk_0863EE60
_08019318:
	.4byte gUnk_0863EE40

	.global fe_title_letters_start
	.thumb_func
	.type fe_title_letters_start, %function
fe_title_letters_start: @ 0801931C
	ldr r1, _08019328
	movs r2, #0
	str r2, [r1, #4]
	str r0, [r1]
	bx lr
	.byte 0x00, 0x00
_08019328:
	.4byte 0x0202CF10

	.global fe_title_letters_leave
	.thumb_func
	.type fe_title_letters_leave, %function
fe_title_letters_leave: @ 0801932C
	ldr r0, _08019334
	movs r1, #2
	str r1, [r0, #4]
	bx lr
_08019334:
	.4byte 0x0202CF10

	.global fe_cups_init
	.thumb_func
	.type fe_cups_init, %function
fe_cups_init: @ 08019338
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, _08019378
	ldr r6, _0801938C
	ldr r7, _08019390
	ldr r0, _08019394
	ldr r1, _08019398
	sub sp, #0xc
	bl AGBPrintf
	strh r5, [r6]
	ldrh r1, [r7]
	movs r2, #3
	rsbs r0, r2, #0
	ands r0, r1
	ldr r3, _0801939C
	ldr r4, _080193A0
	ldr r1, _0801937C
	strh r0, [r7]
	movs r2, #0x80
	ldr r0, _08019380
	str r3, [r4]
	ldr r7, _08019384
	strh r1, [r6]
	lsls r1, r2, #0x13
	strh r0, [r1]
	ldr r4, _08019388
	b _080193A4
	.byte 0x00, 0x00
_08019378:
	.4byte 0x00000000
_0801937C:
	.4byte 0x00000001
_08019380:
	.4byte 0x00001240
_08019384:
	.4byte 0x00000108
_08019388:
	.4byte 0x00000084
_0801938C:
	.4byte 0x04000208
_08019390:
	.4byte 0x04000200
_08019394:
	.4byte gUnk_08051774
_08019398:
	.4byte gUnk_08051780
_0801939C:
	.4byte vblank_handler
_080193A0:
	.4byte gIrqHandler
_080193A4:
	adds r1, #8
	strh r7, [r1]
	adds r1, #2
	strh r4, [r1]
	adds r1, #6
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	adds r1, #2
	strh r5, [r1]
	ldr r6, _080193E8
	adds r1, #2
	strh r5, [r1]
	ldr r0, _080193EC
	adds r1, #0x32
	strh r6, [r1]
	ldr r7, _080193F0
	adds r1, #2
	strh r0, [r1]
	ldr r4, _080193F4
	subs r1, #0xa
	strh r7, [r1]
	ldr r5, _080193F8
	adds r1, #4
	strh r4, [r1]
	ldr r6, _080193FC
	adds r1, #0xc
	strh r5, [r1]
	adds r1, #2
	strh r6, [r1]
	bl fe_load_bg_palettes
	ldr r6, _08019400
	b _08019404
_080193E8:
	.4byte 0x00000033
_080193EC:
	.4byte 0x00000012
_080193F0:
	.4byte 0x00007AE6
_080193F4:
	.4byte 0x00002C9A
_080193F8:
	.4byte 0x00002261
_080193FC:
	.4byte 0x0000030F
_08019400:
	.4byte 0x040000D4
_08019404:
	mov r1, sp
	ldr r2, _08019444
	ldr r0, _0801944C
	ldr r7, _08019450
	adds r1, #0xa
	strh r2, [r1]
	ldr r4, _08019448
	str r1, [r6]
	ldr r3, _08019454
	str r0, [r6, #4]
	ldr r5, _08019458
	str r7, [r6, #8]
	movs r7, #0xe0
	ldr r2, [r6, #8]
	strh r4, [r1]
	str r1, [r6]
	str r3, [r6, #4]
	str r5, [r6, #8]
	ldr r3, _0801945C
	movs r5, #0
	add r0, sp, #4
	lsls r4, r7, #0x13
	ldr r2, [r6, #8]
	ldr r7, _08019460
	str r5, [sp, #4]
	str r0, [r6]
	str r4, [r6, #4]
	ldr r0, _08019464
	str r3, [r6, #8]
	ldr r2, [r6, #8]
	b _08019468
	.byte 0x00, 0x00
_08019444:
	.4byte 0x0000F3FF
_08019448:
	.4byte 0x0000FFFF
_0801944C:
	.4byte 0x06000800
_08019450:
	.4byte 0x81000400
_08019454:
	.4byte 0x0600FFE0
_08019458:
	.4byte 0x81000010
_0801945C:
	.4byte 0x85000100
_08019460:
	.4byte 0x81004000
_08019464:
	.4byte 0x06010000
_08019468:
	strh r5, [r1]
	str r1, [r6]
	str r0, [r6, #4]
	str r7, [r6, #8]
	movs r4, #1
	ldr r3, [r6, #8]
	bl fe_spr_init
	ldr r1, _080194F4
	ldr r0, _080194F8
	rsbs r3, r4, #0
	str r5, [r1]
	str r5, [r1, #4]
	str r5, [r1, #8]
	str r3, [r1, #0xc]
	str r5, [r0]
	str r5, [r0, #4]
	str r5, [r0, #8]
	str r5, [r0, #0xc]
	str r5, [r0, #0x10]
	str r5, [r0, #0x14]
	movs r0, #1
	bl fe_title_letters_start
	bl sound_disable
	ldr r2, _080194FC
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	lsls r3, r0, #2
	mov sb, r3
	bl fe_spr_reset
	ldr r2, _08019500
	ldr r3, _08019504
	ldr r7, _080194E0
	movs r6, #0
	mov r8, r2
	mov sl, r3
_080194B6:
	ldr r0, _08019508
	ldrh r1, [r0, #2]
	adds r4, r1, r0
	movs r1, #0x1c
	movs r0, #4
	bl fe_spr_add
	mov r1, r8
	str r0, [r5, r1]
	lsls r2, r0, #1
	ldrh r3, [r2, r4]
	ldr r0, _080194E4
	adds r2, r4, r3
	strh r0, [r2]
	ldr r0, _080194E8
	strh r0, [r2, #4]
	ldr r0, _080194EC
	strh r0, [r2, #6]
	ldr r0, _080194F0
	b _0801950C
	.byte 0x00, 0x00
_080194E0:
	.4byte 0x0000400E
_080194E4:
	.4byte 0x00000004
_080194E8:
	.4byte 0x00008010
_080194EC:
	.4byte 0x00000000
_080194F0:
	.4byte 0x00008030
_080194F4:
	.4byte 0x0202D264
_080194F8:
	.4byte 0x0202D23C
_080194FC:
	.4byte gGameSetup
_08019500:
	.4byte 0x0202D254
_08019504:
	.4byte gUnk_0863FDE8
_08019508:
	.4byte 0x02024394
_0801950C:
	strh r0, [r2, #0xa]
	ldr r0, _08019544
	strh r0, [r2, #0xc]
	ldr r0, _08019548
	strh r0, [r2, #0x10]
	ldr r0, _0801954C
	strh r0, [r2, #0x12]
	ldr r0, _08019550
	strh r0, [r2, #0x14]
	ldr r0, _08019554
	strh r0, [r2, #0x16]
	ldr r0, _08019558
	strh r7, [r2, #2]
	strh r0, [r2, #0x18]
	strh r7, [r2, #8]
	strh r7, [r2, #0xe]
	ldr r0, [r5, r1]
	bl fe_spr_upload_frame
	mov r3, sb
	adds r0, r3, r6
	movs r4, #0x18
	muls r4, r0, r4
	ldr r1, _0801955C
	ldr r0, [r1, r4]
	movs r1, #0
	b _08019560
	.byte 0x00, 0x00
_08019544:
	.4byte 0x00000008
_08019548:
	.4byte 0x00008050
_0801954C:
	.4byte 0x00000010
_08019550:
	.4byte 0x0000000E
_08019554:
	.4byte 0x00004068
_08019558:
	.4byte 0x00000018
_0801955C:
	.4byte gCups
_08019560:
	bl fe_get_text
	mov r1, sl
	adds r4, r0, #0
	bl fe_text_width
	movs r3, #0x70
	subs r2, r3, r0
	lsrs r0, r2, #0x1f
	adds r1, r2, r0
	asrs r2, r1, #1
	mov r1, r8
	ldr r0, [r5, r1]
	movs r3, #0
	str r0, [sp]
	mov r1, sl
	adds r0, r4, #0
	adds r6, #1
	bl fe_spr_draw
	adds r5, #4
	cmp r6, #3
	ble _080194B6
	bl sound_enable
	movs r0, #4
	bl music_play_if_changed
	bl fade_to_normal
	ldr r3, _080195BC
	ldr r1, _080195C0
	ldr r0, _080195C4
	str r3, [r1]
	ldr r1, _080195C8
	bl AGBPrintf
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_080195BC:
	.4byte fe_cups_process
_080195C0:
	.4byte gStateFunc
_080195C4:
	.4byte gUnk_08051790
_080195C8:
	.4byte gUnk_08051780

	.global fe_cups_process
	.thumb_func
	.type fe_cups_process, %function
fe_cups_process: @ 080195CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	bl fade_update
	ldr r4, _080198F0
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r3, r1, #2
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	mov r8, r3
	cmp r0, #2
	beq _080195F4
	ldr r6, _080198F4
	ldr r5, [r6]
	ldr r0, _080198F8
	lsrs r2, r5, #2
	strh r2, [r0]
_080195F4:
	bl fe_frame_end
	bl fe_draw_title
	bl fe_load_screen_sprites
	movs r2, #0
	ldrsh r7, [r4, r2]
	cmp r7, #4
	bne _0801960A
	b _08019B9C
_0801960A:
	ldr r6, _080198FC
	ldr r4, [r6, #4]
	cmp r4, #0
	ble _08019646
	ldr r2, _080198F4
	ldr r1, [r2]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08019626
	ldr r4, [r6]
	cmp r4, #0
	bne _08019626
	b _08019B82
_08019626:
	ldr r0, [r6, #4]
	ldr r1, _08019900
	lsls r4, r0, #2
	subs r4, #4
	ldr r7, [r1, r4]
	movs r5, #0
	movs r0, #5
	movs r1, #0x29
	ldr r2, _08019904
	ldr r3, _08019908
	str r7, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
_08019646:
	ldr r0, [r6, #4]
	ldr r1, _08019900
	lsls r4, r0, #2
	ldr r7, [r1, r4]
	movs r5, #0
	ldr r2, _08019904
	movs r0, #5
	movs r1, #0x39
	ldr r3, _0801990C
	str r7, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r6, #4]
	cmp r2, #2
	bgt _080196A0
	ldr r2, _080198F4
	ldr r5, [r2]
	movs r7, #0x10
	ands r5, r7
	cmp r5, #0
	beq _0801967E
	ldr r4, [r6]
	cmp r4, #0
	bne _0801967E
	b _08019B64
_0801967E:
	ldr r6, _080198FC
	ldr r2, [r6, #4]
	ldr r7, _08019900
	lsls r5, r2, #2
	adds r5, #4
	ldr r0, [r7, r5]
	movs r4, #0
	str r0, [sp]
	movs r1, #0x49
	movs r0, #5
	ldr r2, _08019904
	ldr r3, _08019908
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
_080196A0:
	bl fe_theme_palette
	movs r5, #0
	adds r3, r0, #0
	movs r1, #0x47
	movs r0, #0x3e
	ldr r2, _08019910
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r4, _08019914
	movs r0, #0x20
	adds r3, r4, #0
	movs r1, #0x98
	ldr r2, _08019918
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r6, _080198FC
	ldr r0, [r6, #4]
	ldr r7, _080198F0
	add r0, r8
	adds r0, #0x6c
	ldrb r2, [r7, r0]
	ldr r1, _0801991C
	lsls r0, r2, #3
	ldr r2, [r1, r0]
	adds r0, #4
	ldr r3, [r1, r0]
	movs r0, #0x20
	movs r1, #0x7e
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	movs r0, #0x5a
	movs r1, #0x98
	ldr r2, _08019920
	adds r3, r4, #0
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r6, #4]
	mov r0, r8
	adds r4, r0, r2
	adds r4, #0x78
	ldrb r1, [r7, r4]
	cmp r1, #2
	bne _0801971A
	b _08019B4A
_0801971A:
	mov r1, r8
	adds r5, r1, r2
	adds r5, #0x78
	ldrb r3, [r7, r5]
	cmp r3, #0
	bne _08019728
	b _08019B34
_08019728:
	cmp r3, #0
	blt _08019786
	cmp r3, #2
	bgt _08019786
	ldr r2, _080198FC
	ldr r4, [r2, #4]
	movs r7, #0x18
	add r4, r8
	muls r4, r7, r4
	ldr r0, _08019924
	ldr r5, _08019928
	adds r4, #0x14
	ldr r7, [r0, r4]
	ldr r6, [r5]
	cmp r6, r7
	beq _08019756
	movs r1, #0
	str r7, [r5]
	str r1, [r5, #4]
	str r1, [r5, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #0x10]
	str r1, [r5, #0x14]
_08019756:
	ldr r6, [r5, #4]
	cmp r6, #0
	bne _0801975E
	b _08019AF8
_0801975E:
	cmp r6, #1
	bne _08019764
	b _08019AB2
_08019764:
	movs r6, #0x38
	muls r6, r7, r6
	ldr r4, _08019928
	ldr r5, _0801992C
	ldr r0, [r4, #0x14]
	ldr r2, [r5, r6]
	adds r6, #4
	ldr r3, [r5, r6]
	str r0, [sp]
	movs r5, #0
	movs r0, #0x5a
	movs r1, #0x7e
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
_08019786:
	ldr r6, _080198FC
	adds r1, r6, #0
	ldr r2, [r1]
	cmp r2, #1
	bne _08019792
	b _08019A76
_08019792:
	movs r5, #0x80
	lsls r3, r5, #1
	movs r0, #0
	movs r1, #0xf0
	movs r2, #0xa0
	bl fe_tracks_draw_times
	ldr r5, _080198FC
	ldr r4, [r5]
	cmp r4, #1
	bne _080197AA
	b _08019938
_080197AA:
	cmp r4, #1
	ble _080197B0
	b _08019890
_080197B0:
	cmp r4, #0
	beq _080197C0
_080197B4:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_080197C0:
	ldr r1, _08019930
	ldrh r2, [r1]
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _080197FE
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcb
	bl snd_play
	ldr r0, _080198F0
	ldr r3, [r5, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	add r3, r8
	strh r3, [r0, #0x28]
	cmp r1, #4
	beq _080197EE
	movs r1, #1
	str r1, [r5]
	b _080197B4
_080197EE:
	bl fade_to_black
	bl fe_title_letters_leave
	movs r2, #2
	str r4, [r5, #8]
	str r2, [r5]
	b _080197B4
_080197FE:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08019820
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcc
	bl snd_play
	bl fe_title_letters_leave
	bl fade_to_black
	movs r2, #3
	str r2, [r5]
	b _080197B4
_08019820:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08019842
	ldr r2, [r5, #4]
	cmp r2, #0
	ble _08019842
	movs r3, #0x80
	movs r1, #0x7f
	movs r0, #0xc0
	lsls r2, r3, #9
	bl snd_play
	ldr r1, [r5, #4]
	subs r1, #1
	str r1, [r5, #4]
	b _080197B4
_08019842:
	ldrh r3, [r1]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08019866
	ldr r2, [r5, #4]
	cmp r2, #2
	bgt _08019866
	movs r3, #0x80
	movs r1, #0x7f
	movs r0, #0xc0
	lsls r2, r3, #9
	bl snd_play
	ldr r1, [r5, #4]
	adds r1, #1
	str r1, [r5, #4]
	b _080197B4
_08019866:
	ldrh r3, [r1]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080197B4
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldr r2, _080198FC
	ldr r3, [r2, #4]
	cmp r3, #2
	bgt _0801988A
	adds r3, #1
	str r3, [r2, #4]
	b _080197B4
_0801988A:
	movs r1, #0
	str r1, [r2, #4]
	b _080197B4
_08019890:
	cmp r4, #2
	beq _080198B2
	cmp r4, #3
	beq _0801989A
	b _080197B4
_0801989A:
	ldr r2, _08019934
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	bne _080198AA
	b _080197B4
_080198AA:
	movs r0, #0
	bl mcp_process
	b _080197B4
_080198B2:
	ldr r2, _08019934
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	bne _080198C2
	b _080197B4
_080198C2:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	blt _080198D2
	bl snd_is_playing
	cmp r0, #0
	beq _080198D2
	b _080197B4
_080198D2:
	ldr r3, [r5, #8]
	cmp r3, #0
	beq _080198E6
	cmp r3, #1
	beq _080198DE
	b _080197B4
_080198DE:
	movs r0, #2
	bl mcp_process
	b _080197B4
_080198E6:
	movs r0, #1
	bl mcp_process
	b _080197B4
	.byte 0x00, 0x00
_080198F0:
	.4byte gGameSetup
_080198F4:
	.4byte 0x03005660
_080198F8:
	.4byte 0x04000014
_080198FC:
	.4byte 0x0202D264
_08019900:
	.4byte 0x0202D254
_08019904:
	.4byte 0x02024394
_08019908:
	.4byte gUnk_0863EE20
_0801990C:
	.4byte gUnk_0863FD80
_08019910:
	.4byte gUnk_082962A0
_08019914:
	.4byte gUnk_0863FAC0
_08019918:
	.4byte gUnk_08628A40
_0801991C:
	.4byte gUnk_0884EC6C
_08019920:
	.4byte gUnk_08296370
_08019924:
	.4byte gCups
_08019928:
	.4byte 0x0202D23C
_0801992C:
	.4byte gUnk_080511B4
_08019930:
	.4byte gKeysNew
_08019934:
	.4byte gModeFlags
_08019938:
	ldr r1, _08019C5C
	ldrh r2, [r1]
	movs r4, #9
	ands r4, r2
	cmp r4, #0
	beq _0801996A
	ldr r0, [r5, #0xc]
	cmp r0, #0
	blt _0801994E
	bl snd_stop
_0801994E:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcb
	bl snd_play
	str r0, [r5, #0xc]
	bl fe_title_letters_leave
	movs r2, #2
	str r2, [r5]
	bl fade_to_black
	b _080197B4
_0801996A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08019982
	movs r3, #0x80
	movs r0, #0xcc
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	str r4, [r5]
	b _080197B4
_08019982:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080199D2
	ldr r2, [r5, #8]
	cmp r2, #0
	ble _080199D2
	ldr r0, [r5, #0xc]
	cmp r0, #0
	blt _0801999A
	bl snd_stop
_0801999A:
	ldr r1, [r5, #4]
	movs r3, #0x18
	add r1, r8
	muls r1, r3, r1
	ldr r4, _08019C60
	adds r1, #0x14
	ldr r0, [r4, r1]
	movs r4, #0x38
	muls r4, r0, r4
	ldr r1, _08019C64
	movs r3, #0x80
	adds r4, #0x20
	ldr r0, [r1, r4]
	lsls r4, r3, #9
	movs r1, #0x7f
	adds r2, r4, #0
	bl snd_play
	movs r1, #0x7f
	str r0, [r5, #0xc]
	adds r2, r4, #0
	movs r0, #0xbf
	bl snd_play
	ldr r1, [r5, #8]
	subs r1, #1
	str r1, [r5, #8]
	b _080197B4
_080199D2:
	ldrh r3, [r1]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080199E2
	ldr r2, [r5, #8]
	cmp r2, #0
	ble _08019A0E
_080199E2:
	ldrh r3, [r1]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	bne _080199EE
	b _080197B4
_080199EE:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xbf
	movs r1, #0x7f
	bl snd_play
	ldr r2, _08019C68
	ldr r3, [r2, #8]
	cmp r3, #0
	ble _08019A08
	movs r1, #0
	str r1, [r2, #8]
	b _080197B4
_08019A08:
	adds r3, #1
	str r3, [r2, #8]
	b _080197B4
_08019A0E:
	ldr r1, _08019C6C
	movs r0, #0
	ldrsh r2, [r1, r0]
	cmp r2, #0
	beq _08019A26
_08019A18:
	movs r3, #0x80
	movs r1, #0xaa
	lsls r2, r3, #9
	movs r0, #0xf2
	bl snd_play
	b _080197B4
_08019A26:
	ldr r2, [r5, #4]
	mov r0, r8
	adds r3, r0, r2
	adds r3, #0x78
	ldrb r0, [r1, r3]
	cmp r0, #0
	beq _08019A18
	ldr r0, [r5, #0xc]
	cmp r0, #0
	blt _08019A40
	bl snd_stop
	ldr r2, [r5, #4]
_08019A40:
	add r2, r8
	movs r1, #0x18
	muls r1, r2, r1
	ldr r4, _08019C60
	adds r1, #0x14
	ldr r0, [r4, r1]
	movs r4, #0x38
	muls r4, r0, r4
	ldr r1, _08019C64
	movs r3, #0x80
	adds r4, #0x1c
	ldr r0, [r1, r4]
	lsls r4, r3, #9
	movs r1, #0x7f
	adds r2, r4, #0
	bl snd_play
	movs r1, #0x7f
	str r0, [r5, #0xc]
	adds r2, r4, #0
	movs r0, #0xbf
	bl snd_play
	ldr r1, [r5, #8]
	adds r1, #1
	str r1, [r5, #8]
	b _080197B4
_08019A76:
	ldr r5, _08019C70
	ldr r4, [r5]
	lsrs r0, r4, #3
	ands r0, r2
	cmp r0, #0
	beq _08019AAE
	ldr r4, _08019C74
_08019A84:
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _08019A98
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x5a
	b _08019AA2
_08019A98:
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x20
_08019AA2:
	movs r1, #0x7e
	ldr r2, _08019C78
	adds r3, r4, #0
	bl fe_spr_plot
	b _08019792
_08019AAE:
	ldr r4, _08019C7C
	b _08019A84
_08019AB2:
	movs r2, #0x38
	muls r2, r7, r2
	ldr r3, _08019C64
	ldr r6, [r5, #8]
	adds r2, #0x10
	ldr r0, [r3, r2]
	lsls r4, r6, #2
	adds r1, r4, r0
	ldr r0, [r5, #0xc]
	ldr r3, [r1]
	lsls r6, r0, #2
	ldr r4, [r6, r3]
	ldr r3, [r5, #0x10]
	subs r4, #1
	str r4, [r5, #0x14]
	cmp r3, #0
	bgt _08019AFE
	ldr r2, [r1]
	ldr r6, [r2, #4]
	adds r4, r0, #1
	str r6, [r5, #0x10]
	str r4, [r5, #0xc]
	ldr r0, [r1]
	lsls r1, r4, #2
	ldr r2, [r1, r0]
	cmp r2, #0
	beq _08019AEA
	b _08019764
_08019AEA:
	str r2, [r5, #4]
	bl lfsr_next
	lsrs r3, r0, #0xb
	adds r3, #0x28
	str r3, [r5, #0x10]
	b _08019764
_08019AF8:
	ldr r3, [r5, #0x10]
	cmp r3, #0
	ble _08019B04
_08019AFE:
	subs r3, #1
	str r3, [r5, #0x10]
	b _08019764
_08019B04:
	movs r1, #0x38
	adds r4, r7, #0
	muls r4, r1, r4
	bl lfsr_next
	ldr r2, _08019C64
	adds r4, #0x14
	ldr r1, [r2, r4]
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r4, [r5, #8]
	lsrs r0, r2, #0x10
	adds r2, r4, r0
	str r2, [r5, #8]
	cmp r2, r1
	blt _08019B28
	subs r4, r2, r1
	str r4, [r5, #8]
_08019B28:
	movs r0, #1
	str r6, [r5, #0x10]
	movs r6, #2
	str r0, [r5, #4]
	str r6, [r5, #0xc]
	b _08019764
_08019B34:
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x5a
	movs r1, #0x7e
	ldr r2, _08019C80
	ldr r3, _08019C84
	bl fe_spr_plot
	b _08019786
_08019B4A:
	movs r1, #4
	str r1, [sp]
	ldr r2, _08019C88
	movs r0, #0x5a
	movs r1, #0x84
	ldr r3, _08019C8C
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, [r6, #4]
	b _0801971A
_08019B64:
	bl fe_theme_palette
	movs r1, #0x80
	lsls r6, r1, #6
	adds r3, r0, #0
	movs r1, #0x52
	movs r0, #0x3e
	ldr r2, _08019C90
	str r4, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _0801967E
_08019B82:
	bl fe_theme_palette
	movs r1, #0x3c
	adds r3, r0, #0
	ldr r2, _08019C90
	movs r0, #0x3e
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _08019626
_08019B9C:
	ldr r6, _08019C68
	ldr r7, [r6, #4]
	cmp r7, #0
	ble _08019BB6
	ldr r2, _08019C70
	ldr r0, [r2]
	movs r4, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08019BB6
	ldr r4, [r6]
	cmp r4, #0
	beq _08019C42
_08019BB6:
	ldr r5, [r6, #4]
	cmp r5, #2
	bgt _08019BCE
	ldr r0, _08019C70
	ldr r1, [r0]
	movs r7, #0x10
	ands r1, r7
	cmp r1, #0
	beq _08019BCE
	ldr r4, [r6]
	cmp r4, #0
	beq _08019C24
_08019BCE:
	movs r5, #0
_08019BD0:
	ldr r4, [r6, #4]
	subs r2, r5, r4
	lsls r6, r2, #4
	adds r1, r6, #0
	adds r1, #0x59
	ldr r7, _08019C94
	cmp r5, r4
	beq _08019C20
	ldr r6, _08019C98
_08019BE2:
	ldr r4, _08019C9C
	lsls r3, r5, #2
	ldr r0, [r4, r3]
	adds r2, r7, #0
	movs r4, #0
	str r0, [sp]
	adds r3, r6, #0
	movs r0, #5
	adds r5, #1
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	cmp r5, #3
	ble _08019C1C
	bl fe_theme_palette
	movs r1, #0x67
	adds r3, r0, #0
	ldr r2, _08019CA0
	movs r0, #0x3e
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _08019792
_08019C1C:
	ldr r6, _08019C68
	b _08019BD0
_08019C20:
	ldr r6, _08019CA4
	b _08019BE2
_08019C24:
	bl fe_theme_palette
	movs r1, #0x80
	lsls r5, r1, #6
	adds r3, r0, #0
	movs r1, #0x72
	movs r0, #0x3e
	ldr r2, _08019C90
	str r4, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _08019BCE
_08019C42:
	bl fe_theme_palette
	movs r1, #0x5c
	adds r3, r0, #0
	ldr r2, _08019C90
	movs r0, #0x3e
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _08019BB6
_08019C5C:
	.4byte gKeysNew
_08019C60:
	.4byte gCups
_08019C64:
	.4byte gUnk_080511B4
_08019C68:
	.4byte 0x0202D264
_08019C6C:
	.4byte gGameSetup
_08019C70:
	.4byte 0x03005660
_08019C74:
	.4byte gUnk_0863F280
_08019C78:
	.4byte gUnk_0831F540
_08019C7C:
	.4byte gUnk_0863EE80
_08019C80:
	.4byte gUnk_08628490
_08019C84:
	.4byte gUnk_0863FAA0
_08019C88:
	.4byte gUnk_083D9200
_08019C8C:
	.4byte gUnk_0863F640
_08019C90:
	.4byte gUnk_08294DF0
_08019C94:
	.4byte 0x02024394
_08019C98:
	.4byte gUnk_0863EE20
_08019C9C:
	.4byte 0x0202D254
_08019CA0:
	.4byte gUnk_082962A0
_08019CA4:
	.4byte gUnk_0863FD80

	.global fe_scoreboard_draw_rows
	.thumb_func
	.type fe_scoreboard_draw_rows, %function
fe_scoreboard_draw_rows: @ 08019CA8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r1, _08019D60
	ldr r2, _08019D64
	movs r0, #0
	movs r6, #0
	sub sp, #0x10
	mov sl, r0
	mov fp, r1
	mov sb, r2
	mov r8, r6
_08019CC6:
	ldr r0, _08019D68
	movs r1, #1
	ldr r4, [r0]
	mov r0, sl
	ands r1, r0
	cmp r1, #0
	beq _08019CD6
	rsbs r4, r4, #0
_08019CD6:
	movs r1, #0xe
	mov r7, sl
	muls r7, r1, r7
	ldr r2, _08019D6C
	adds r0, r7, #0
	mov r1, fp
	mov r0, r8
	ldr r5, [r0, r1]
	ldr r1, [r2]
	adds r7, #0x24
	cmp r5, r1
	beq _08019D5A
	ldr r5, _08019D70
_08019CF0:
	ldr r3, _08019D74
	mov r2, r8
	ldr r1, [r3, r2]
	lsls r3, r1, #2
	ldr r1, _08019D78
	ldr r2, [r1, r3]
	adds r0, r4, #4
	str r2, [sp]
	adds r1, r7, #0
	mov r2, sb
	adds r3, r5, #0
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	adds r0, r4, #0
	mov r1, fp
	mov r4, r8
	ldr r3, [r4, r1]
	ldr r2, _08019D7C
	lsls r3, r3, #1
	adds r3, #4
	ldrsh r1, [r2, r3]
	lsls r4, r1, #2
	ldr r1, _08019D80
	ldr r2, [r1, r4]
	movs r4, #1
	str r2, [sp]
	adds r3, r5, #0
	adds r0, #0x24
	adds r1, r7, #0
	mov r2, sb
	add sl, r4
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	mov r4, sl
	bl fe_spr_plot
	movs r3, #4
	add r8, r3
	cmp r4, #7
	ble _08019CC6
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08019D5A:
	ldr r5, _08019D84
	b _08019CF0
	.byte 0x00, 0x00
_08019D60:
	.4byte 0x0202D2F0
_08019D64:
	.4byte 0x02024394
_08019D68:
	.4byte 0x0202D2B8
_08019D6C:
	.4byte gLocalPlayerIndex
_08019D70:
	.4byte gUnk_0863FD80
_08019D74:
	.4byte 0x0202D310
_08019D78:
	.4byte 0x0202D274
_08019D7C:
	.4byte gGameSetup
_08019D80:
	.4byte 0x0202D294
_08019D84:
	.4byte 0x0202D2CC

	.global fe_scoreboard_draw_1
	.thumb_func
	.type fe_scoreboard_draw_1, %function
fe_scoreboard_draw_1: @ 08019D88
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x10
	ldr r1, _08019E6C
	movs r6, #0
	add r0, sp, #4
	movs r2, #0x28
	mov fp, r0
	mov sb, r1
	mov sl, r2
	mov r8, r6
_08019DA6:
	ldr r0, _08019E70
	ldr r4, [r0]
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08019DB4
	rsbs r4, r4, #0
_08019DB4:
	movs r5, #0xe
	adds r7, r6, #0
	muls r7, r5, r7
	ldr r0, _08019E74
	ldr r2, [r0]
	adds r1, r7, r2
	adds r7, r1, #0
	ldr r3, _08019E78
	ldr r1, _08019E7C
	mov r0, r8
	ldr r2, [r1, r0]
	ldr r5, [r3]
	adds r7, #0x24
	cmp r2, r5
	beq _08019E66
	ldr r5, _08019E80
_08019DD4:
	cmp r6, #0
	beq _08019E4E
	movs r1, #0
	movs r0, #0x3a
	bl fe_get_text
	adds r3, r4, #0
	adds r3, #0x9c
	ldr r1, _08019E84
	adds r2, r5, #0
	str r7, [sp]
	bl fe_text_draw
	ldr r1, _08019E7C
	mov r0, r8
	ldr r3, [r1, r0]
	mov r2, sl
	muls r2, r3, r2
	ldr r3, [r1]
	mov r0, sl
	muls r0, r3, r0
	adds r3, r0, #0
	adds r2, #0xbc
	mov r0, sb
	adds r3, #0xbc
	ldr r1, [r0, r2]
	ldr r2, [r0, r3]
	mov r0, fp
	subs r1, r1, r2
	movs r2, #0
	bl fe_text_time
_08019E14:
	add r3, sp, #4
	adds r0, r3, #0
	ldr r1, _08019E84
	bl fe_text_width
	adds r2, r0, #0
	add r1, sp, #4
	subs r3, r4, r2
	adds r0, r1, #0
	adds r3, #0xec
	ldr r1, _08019E84
	movs r2, #0
	str r7, [sp]
	adds r6, #1
	bl fe_text_draw
	movs r1, #4
	add r8, r1
	cmp r6, #7
	ble _08019DA6
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08019E4E:
	ldr r0, [r1]
	mov r2, sl
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, #0xbc
	mov r2, sb
	ldr r1, [r2, r0]
	mov r0, fp
	movs r2, #1
	bl fe_text_time
	b _08019E14
_08019E66:
	ldr r5, _08019E88
	b _08019DD4
	.byte 0x00, 0x00
_08019E6C:
	.4byte gGameSetup
_08019E70:
	.4byte 0x0202D2B8
_08019E74:
	.4byte 0x0202D2BC
_08019E78:
	.4byte gLocalPlayerIndex
_08019E7C:
	.4byte 0x0202D2F0
_08019E80:
	.4byte gUnk_0863FD80
_08019E84:
	.4byte gUnk_0863FDE8
_08019E88:
	.4byte 0x0202D2CC

	.global fe_scoreboard_draw_2
	.thumb_func
	.type fe_scoreboard_draw_2, %function
fe_scoreboard_draw_2: @ 08019E8C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08019F84
	movs r0, #0
	add r2, sp, #4
	ldr r7, _08019F88
	mov sb, r0
	mov fp, r1
	mov r8, r2
	mov sl, r0
_08019EAA:
	movs r1, #1
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _08019F78
	ldr r0, _08019F8C
	ldr r3, [r0]
	mov r0, fp
	ldr r1, [r0]
	subs r4, r3, r1
_08019EBE:
	movs r1, #0xe
	mov r5, sb
	muls r5, r1, r5
	ldr r2, _08019F90
	adds r0, r5, #0
	ldr r1, _08019F94
	mov r0, sl
	ldr r6, [r1, r0]
	ldr r0, [r2]
	adds r5, #0x24
	cmp r6, r0
	beq _08019F74
	ldr r6, _08019F98
_08019ED8:
	mov r0, sl
	ldr r3, [r1, r0]
	ldr r2, _08019F9C
	lsls r0, r3, #2
	ldr r1, [r2, r0]
	mov r0, r8
	bl fe_text_number
	adds r1, r7, #0
	mov r0, r8
	bl fe_text_width
	adds r2, r0, #0
	subs r3, r4, r2
	adds r3, #0xaa
	adds r2, r6, #0
	mov r0, r8
	adds r1, r7, #0
	str r5, [sp]
	bl fe_text_draw
	movs r1, #0
	movs r0, #0x3a
	bl fe_get_text
	adds r3, r4, #0
	adds r3, #0xae
	adds r1, r7, #0
	adds r2, r6, #0
	str r5, [sp]
	bl fe_text_draw
	ldr r0, _08019FA0
	mov r2, sl
	ldr r1, [r0, r2]
	mov r0, r8
	bl fe_text_number
	adds r1, r7, #0
	mov r0, r8
	bl fe_text_width
	adds r1, r0, #0
	subs r3, r4, r1
	adds r3, #0xcc
	adds r2, r6, #0
	mov r0, r8
	adds r1, r7, #0
	str r5, [sp]
	bl fe_text_draw
	movs r1, #0
	movs r0, #0x39
	bl fe_get_text
	adds r3, r4, #0
	adds r3, #0xd0
	adds r1, r7, #0
	adds r2, r6, #0
	str r5, [sp]
	bl fe_text_draw
	movs r3, #1
	add sb, r3
	movs r2, #4
	mov r1, sb
	add sl, r2
	cmp r1, #7
	ble _08019EAA
	add sp, #0x14
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08019F74:
	ldr r6, _08019FA4
	b _08019ED8
_08019F78:
	ldr r2, _08019F8C
	mov r1, fp
	ldr r6, [r1]
	ldr r5, [r2]
	adds r4, r6, r5
	b _08019EBE
_08019F84:
	.4byte 0x0202D2B8
_08019F88:
	.4byte gUnk_0863FDE8
_08019F8C:
	.4byte 0x0202D2BC
_08019F90:
	.4byte gLocalPlayerIndex
_08019F94:
	.4byte 0x0202D2F0
_08019F98:
	.4byte gUnk_0863FD80
_08019F9C:
	.4byte 0x0202D330
_08019FA0:
	.4byte 0x0202D350
_08019FA4:
	.4byte 0x0202D2CC

	.global fe_scoreboard_draw_3
	.thumb_func
	.type fe_scoreboard_draw_3, %function
fe_scoreboard_draw_3: @ 08019FA8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x14
	add r0, sp, #4
	ldr r2, _0801A050
	ldr r3, _0801A054
	mov sb, r0
	movs r0, #0
	movs r7, #0
	mov fp, r2
	mov sl, r3
	mov r8, r0
_08019FC8:
	ldr r0, _0801A058
	ldr r4, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08019FD6
	rsbs r4, r4, #0
_08019FD6:
	movs r1, #0xe
	muls r1, r7, r1
	ldr r3, _0801A05C
	adds r6, r1, #0
	ldr r1, _0801A060
	mov r0, r8
	ldr r2, [r1, r0]
	ldr r5, [r3]
	adds r6, #0x24
	cmp r2, r5
	beq _0801A04A
	ldr r5, _0801A064
_08019FEE:
	mov r2, r8
	ldr r0, [r1, r2]
	lsls r2, r0, #2
	mov r0, fp
	ldr r1, [r0, r2]
	mov r0, sb
	bl fe_text_number
	mov r1, sl
	mov r0, sb
	bl fe_text_width
	adds r2, r0, #0
	subs r3, r4, r2
	adds r3, #0xcc
	adds r2, r5, #0
	mov r0, sb
	mov r1, sl
	str r6, [sp]
	bl fe_text_draw
	movs r1, #0
	movs r0, #0x39
	bl fe_get_text
	adds r3, r4, #0
	adds r3, #0xd0
	mov r1, sl
	adds r2, r5, #0
	str r6, [sp]
	adds r7, #1
	bl fe_text_draw
	movs r3, #4
	add r8, r3
	cmp r7, #7
	ble _08019FC8
	add sp, #0x14
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801A04A:
	ldr r5, _0801A068
	b _08019FEE
	.byte 0x00, 0x00
_0801A050:
	.4byte 0x0202D330
_0801A054:
	.4byte gUnk_0863FDE8
_0801A058:
	.4byte 0x0202D2B8
_0801A05C:
	.4byte gLocalPlayerIndex
_0801A060:
	.4byte 0x0202D2F0
_0801A064:
	.4byte gUnk_0863FD80
_0801A068:
	.4byte 0x0202D2CC

	.global fe_scoreboard_wave
	.thumb_func
	.type fe_scoreboard_wave, %function
fe_scoreboard_wave: @ 0801A06C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r0, _0801A114
	movs r2, #1
	mov fp, r2
	ldr r2, [r0]
	movs r6, #0xc0
	lsls r3, r2, #0xa
	mov sl, r3
	lsls r5, r6, #8
	add r5, sl
	lsls r7, r2, #0x1a
	lsls r4, r5, #0x10
	ldr r2, _0801A118
	sub sp, #8
	asrs r1, r4, #0x10
	asrs r0, r7, #0x10
	str r1, [sp]
	mov sb, r2
	bl _call_via_r9
	movs r2, #0x80
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	lsls r3, r2, #5
	mov r8, r3
	add r1, r8
	str r1, [sp, #4]
	movs r7, #2
_0801A0AE:
	ldr r6, _0801A11C
	ldrh r1, [r7, r6]
	ldr r5, [sp, #4]
	movs r6, #0x1f
	ands r6, r1
	adds r0, r6, #0
	muls r0, r5, r0
	movs r4, #0xc0
	lsls r2, r4, #7
	add r2, sl
	lsls r1, r2, #0x10
	asrs r5, r0, #0xd
	asrs r0, r1, #0x10
	bl _call_via_r9
	lsls r3, r0, #0x10
	asrs r4, r3, #0x10
	add r4, r8
	adds r2, r6, #0
	muls r2, r4, r2
	ldr r0, [sp]
	asrs r4, r2, #0xd
	bl _call_via_r9
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	add r3, r8
	adds r2, r6, #0
	muls r2, r3, r2
	asrs r1, r2, #0xd
	lsls r0, r1, #0xa
	lsls r4, r4, #5
	movs r1, #1
	adds r2, r5, r4
	ldr r3, _0801A120
	add fp, r1
	adds r5, r2, r0
	mov r2, fp
	strh r5, [r7, r3]
	adds r7, #2
	cmp r2, #0xf
	ble _0801A0AE
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801A114:
	.4byte 0x03005660
_0801A118:
	.4byte sin_fx
_0801A11C:
	.4byte gUnk_0863FD80
_0801A120:
	.4byte 0x0202D2CC

	.global fe_cups_scoreboard_init
	.thumb_func
	.type fe_cups_scoreboard_init, %function
fe_cups_scoreboard_init: @ 0801A124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r5, _0801A164
	ldr r4, _0801A174
	ldr r0, _0801A178
	ldr r1, _0801A17C
	sub sp, #0xc
	bl AGBPrintf
	strh r5, [r4]
	ldr r0, _0801A180
	movs r2, #3
	ldrh r7, [r0]
	rsbs r6, r2, #0
	ands r6, r7
	ldr r3, _0801A184
	ldr r1, _0801A188
	ldr r7, _0801A168
	strh r6, [r0]
	movs r2, #0x80
	ldr r6, _0801A16C
	str r3, [r1]
	ldr r0, _0801A170
	strh r7, [r4]
	lsls r4, r2, #0x13
	strh r6, [r4]
	adds r4, #8
	strh r0, [r4]
	b _0801A18C
	.byte 0x00, 0x00
_0801A164:
	.4byte 0x00000000
_0801A168:
	.4byte 0x00000001
_0801A16C:
	.4byte 0x00009140
_0801A170:
	.4byte 0x00000084
_0801A174:
	.4byte 0x04000208
_0801A178:
	.4byte gUnk_08051800
_0801A17C:
	.4byte gUnk_0805180C
_0801A180:
	.4byte 0x04000200
_0801A184:
	.4byte vblank_handler
_0801A188:
	.4byte gIrqHandler
_0801A18C:
	adds r4, #8
	strh r5, [r4]
	ldr r1, _0801A1CC
	adds r4, #2
	strh r5, [r4]
	ldr r7, _0801A1D0
	adds r4, #0x38
	strh r1, [r4]
	ldr r6, _0801A1D4
	adds r4, #6
	strh r7, [r4]
	adds r4, #4
	strh r6, [r4]
	bl fe_load_bg_palettes
	movs r0, #0xf8
	str r0, [sp, #8]
	ldr r7, _0801A1D8
	ldr r0, _0801A1DC
	ldr r6, _0801A1E0
	add r1, sp, #8
	str r1, [r0]
	str r7, [r0, #4]
	str r6, [r0, #8]
	ldr r2, _0801A1E4
	ldr r3, [r0, #8]
	ldr r4, _0801A1E8
	mov r3, sp
	adds r3, #6
	strh r5, [r3]
	b _0801A1EC
	.byte 0x00, 0x00
_0801A1CC:
	.4byte 0x00003F1F
_0801A1D0:
	.4byte 0x000000EF
_0801A1D4:
	.4byte 0x00000003
_0801A1D8:
	.4byte 0x02000008
_0801A1DC:
	.4byte 0x040000D4
_0801A1E0:
	.4byte 0x85000100
_0801A1E4:
	.4byte 0x81004000
_0801A1E8:
	.4byte 0x06010000
_0801A1EC:
	str r3, [r0]
	str r4, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _0801A26C
	movs r1, #0
	str r1, [r0]
	bl sound_disable
	bl fe_spr_reset
	ldr r2, _0801A270
	movs r5, #0
	mov r8, r2
	movs r7, #7
_0801A20A:
	ldr r4, _0801A274
	ldrh r0, [r4, #2]
	movs r1, #8
	adds r6, r0, r4
	movs r0, #1
	bl fe_spr_add
	mov r3, r8
	str r0, [r5, r3]
	lsls r3, r0, #1
	ldrh r2, [r3, r6]
	adds r0, r6, r2
	ldr r6, _0801A25C
	ldr r2, _0801A260
	strh r6, [r0]
	ldr r1, _0801A264
	ldr r6, _0801A268
	strh r2, [r0, #6]
	mov r2, r8
	strh r1, [r0, #4]
	strh r6, [r0, #2]
	ldr r0, [r5, r2]
	bl fe_spr_upload_frame
	ldr r1, _0801A278
	ldr r0, [r1, r5]
	movs r1, #0
	bl fe_get_text
	mov r2, r8
	ldr r4, [r5, r2]
	ldr r1, _0801A27C
	movs r2, #0
	movs r3, #0
	subs r7, #1
	str r4, [sp]
	adds r5, #4
	bl fe_spr_draw
	b _0801A280
	.byte 0x00, 0x00
_0801A25C:
	.4byte 0x00000001
_0801A260:
	.4byte 0x00000000
_0801A264:
	.4byte 0x00008010
_0801A268:
	.4byte 0x0000400E
_0801A26C:
	.4byte 0x0202D2EC
_0801A270:
	.4byte 0x0202D274
_0801A274:
	.4byte 0x02024394
_0801A278:
	.4byte gUnk_080517C0
_0801A27C:
	.4byte gUnk_0863FDE8
_0801A280:
	cmp r7, #0
	bge _0801A20A
	ldr r3, _0801A2F0
	movs r5, #0
	mov r8, r3
	movs r7, #8
_0801A28C:
	ldr r0, _0801A2F4
	ldrh r2, [r0, #2]
	movs r1, #0x18
	adds r4, r2, r0
	movs r0, #3
	bl fe_spr_add
	mov r2, r8
	str r0, [r5, r2]
	lsls r3, r0, #1
	ldrh r1, [r3, r4]
	adds r0, r4, r1
	ldr r1, _0801A2D4
	strh r1, [r0]
	ldr r1, _0801A2D8
	strh r1, [r0, #4]
	ldr r1, _0801A2DC
	strh r1, [r0, #6]
	ldr r1, _0801A2E0
	strh r1, [r0, #0xa]
	ldr r1, _0801A2E4
	strh r1, [r0, #0xc]
	ldr r1, _0801A2E8
	strh r1, [r0, #0x10]
	ldr r1, _0801A2EC
	strh r6, [r0, #2]
	strh r1, [r0, #0x12]
	strh r6, [r0, #8]
	strh r6, [r0, #0xe]
	ldr r0, [r5, r2]
	bl fe_spr_upload_frame
	ldr r2, _0801A2F8
	movs r1, #0
	ldr r0, [r2, r5]
	b _0801A2FC
_0801A2D4:
	.4byte 0x00000003
_0801A2D8:
	.4byte 0x00008010
_0801A2DC:
	.4byte 0x00000000
_0801A2E0:
	.4byte 0x00008030
_0801A2E4:
	.4byte 0x00000008
_0801A2E8:
	.4byte 0x00008050
_0801A2EC:
	.4byte 0x00000010
_0801A2F0:
	.4byte 0x0202D294
_0801A2F4:
	.4byte 0x02024394
_0801A2F8:
	.4byte gUnk_0805179C
_0801A2FC:
	bl fe_get_text
	mov r2, r8
	ldr r1, [r5, r2]
	movs r3, #0
	str r1, [sp]
	movs r2, #0
	ldr r1, _0801A3F8
	subs r7, #1
	bl fe_spr_draw
	adds r5, #4
	cmp r7, #0
	bge _0801A28C
	bl sound_enable
	ldr r3, _0801A3FC
	movs r7, #0
_0801A320:
	stm r3!, {r7}
	adds r7, #1
	cmp r7, #7
	ble _0801A320
	ldr r3, _0801A400
	ldr r6, _0801A3FC
	mov lr, r3
_0801A32E:
	movs r2, #0
	mov ip, r2
	movs r7, #0
_0801A334:
	lsls r0, r7, #2
	adds r4, r0, #4
	ldr r5, [r6, r0]
	ldr r1, [r6, r4]
	movs r3, #0xa0
	adds r3, r3, r1
	adds r2, r5, #0
	mov r8, r3
	adds r2, #0xa0
	mov r3, lr
	ldrb r2, [r3, r2]
	mov sl, r2
	mov r2, r8
	ldrb r2, [r3, r2]
	mov r8, r2
	cmp sl, r8
	bls _0801A35E
	str r1, [r6, r0]
	movs r3, #1
	str r5, [r6, r4]
	mov ip, r3
_0801A35E:
	adds r7, #1
	cmp r7, #6
	ble _0801A334
	mov r2, ip
	cmp r2, #0
	bne _0801A32E
	ldr r1, _0801A404
	str r2, [r1]
	ldr r2, _0801A400
	ldr r6, _0801A3FC
	adds r4, r1, #0
	movs r7, #1
	mov ip, r2
	movs r5, #0x28
	movs r0, #0
	movs r1, #4
_0801A37E:
	ldr r3, [r1, r6]
	adds r2, r3, #0
	muls r2, r5, r2
	ldr r3, [r0, r6]
	muls r3, r5, r3
	adds r3, #0xbc
	mov lr, r3
	adds r2, #0xbc
	mov r3, ip
	ldr r2, [r3, r2]
	mov r8, r2
	mov r2, lr
	ldr r2, [r3, r2]
	mov lr, r2
	cmp r8, lr
	beq _0801A3F2
	str r7, [r1, r4]
_0801A3A0:
	adds r7, #1
	adds r0, #4
	adds r1, #4
	cmp r7, #7
	ble _0801A37E
	ldr r6, _0801A3FC
	ldr r5, _0801A404
	movs r4, #0
	movs r7, #7
_0801A3B2:
	ldr r1, [r4, r6]
	ldr r2, [r4, r5]
	ldr r0, _0801A408
	subs r7, #1
	bl AGBPrintf
	adds r4, #4
	cmp r7, #0
	bge _0801A3B2
	bl fe_scoreboard_wave
	bl fe_spr_init
	movs r0, #3
	bl music_play_if_changed
	bl fade_to_normal
	ldr r3, _0801A40C
	ldr r0, _0801A410
	ldr r1, _0801A414
	str r3, [r0]
	ldr r0, _0801A418
	bl AGBPrintf
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801A3F2:
	ldr r2, [r0, r4]
	str r2, [r1, r4]
	b _0801A3A0
_0801A3F8:
	.4byte gUnk_0863FDE8
_0801A3FC:
	.4byte 0x0202D2F0
_0801A400:
	.4byte gGameSetup
_0801A404:
	.4byte 0x0202D310
_0801A408:
	.4byte gUnk_08051824
_0801A40C:
	.4byte fe_cups_scoreboard_process
_0801A410:
	.4byte gStateFunc
_0801A414:
	.4byte gUnk_0805180C
_0801A418:
	.4byte gUnk_0805182C

	.global fe_cups_scoreboard_process
	.thumb_func
	.type fe_cups_scoreboard_process, %function
fe_cups_scoreboard_process: @ 0801A41C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	bl fade_update
	ldr r1, _0801A754
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0801A43C
	ldr r0, _0801A758
	ldr r1, [r0]
	ldr r0, _0801A75C
	lsrs r2, r1, #2
	strh r2, [r0]
_0801A43C:
	ldr r0, _0801A760
	ldr r1, [r0]
	lsls r3, r1, #0x1a
	ldr r2, _0801A764
	asrs r0, r3, #0x10
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	movs r2, #0x26
	muls r2, r3, r2
	ldr r1, _0801A768
	asrs r0, r2, #0xc
	subs r0, #0x20
	str r0, [r1]
	bl fe_frame_end
	bl fe_scoreboard_wave
	ldr r2, _0801A76C
	ldr r3, [r2]
	cmp r3, #0xa
	bhi _0801A4EA
	ldr r2, _0801A770
	lsls r0, r3, #2
	ldr r1, [r0, r2]
	mov pc, r1
	.byte 0x00, 0x00
	.global _0801A474
_0801A474:
	.4byte _0801A4A0
	.4byte _0801A4C8
	.4byte _0801A4FE
	.4byte _0801A57A
	.4byte _0801A5B6
	.4byte _0801A5FC
	.4byte _0801A686
	.4byte _0801A79C
	.4byte _0801A7D4
	.4byte _0801A80A
	.4byte _0801A858
	.global _0801A4A0
_0801A4A0:
	ldr r1, _0801A774
	movs r3, #0xf0
	str r3, [r1]
	ldr r2, _0801A778
	ldr r1, _0801A760
	movs r0, #0
	str r0, [r2]
	str r0, [r1]
	ldr r1, _0801A76C
	movs r0, #1
	movs r3, #0x80
	str r0, [r1]
	lsls r2, r3, #9
	movs r0, #0xcd
	movs r1, #0x7f
	bl snd_play
	movs r0, #0x2d
	bl fe_title_letters_start
	.global _0801A4C8
_0801A4C8:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_1
	ldr r2, _0801A760
	ldr r3, [r2]
	cmp r3, #0xf
	bgt _0801A4E0
	adds r3, #1
	str r3, [r2]
_0801A4E0:
	ldr r2, _0801A774
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A4F6
	b _0801A5DE
_0801A4EA:
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801A4F6:
	ldr r1, _0801A76C
	movs r3, #2
	str r3, [r1]
	b _0801A4EA
	.global _0801A4FE
_0801A4FE:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_1
	ldr r2, _0801A77C
	ldrh r1, [r2]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0801A4EA
	movs r4, #0x80
	bl fe_title_letters_leave
	lsls r2, r4, #9
	movs r1, #0x7f
	movs r0, #0xce
	bl snd_play
	ldr r3, _0801A780
	ldr r4, _0801A784
	ldr r7, _0801A754
	ldr r6, _0801A788
	ldr r5, _0801A78C
	mov ip, r3
	mov lr, r4
	movs r0, #0x2c
	movs r2, #0
	movs r1, #7
_0801A53A:
	ldrsh r3, [r0, r7]
	mov r4, ip
	str r3, [r2, r4]
	mov r4, lr
	ldr r3, [r2, r4]
	lsls r3, r3, #2
	ldr r3, [r5, r3]
	subs r1, #1
	str r3, [r2, r6]
	adds r0, #2
	adds r2, #4
	cmp r1, #0
	bge _0801A53A
	ldr r1, _0801A790
	ldr r0, [r1]
	cmp r0, #1
	bgt _0801A572
	ldr r0, _0801A754
	adds r0, #0xa0
	ldrb r2, [r0]
	cmp r2, #3
	bls _0801A572
	bl fade_to_black
	ldr r1, _0801A76C
	movs r3, #0xa
	str r3, [r1]
	b _0801A4EA
_0801A572:
	ldr r0, _0801A76C
	movs r1, #3
	str r1, [r0]
	b _0801A4EA
	.global _0801A57A
_0801A57A:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_1
	ldr r2, _0801A760
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A592
	subs r3, #1
	str r3, [r2]
_0801A592:
	ldr r2, _0801A778
	ldr r3, [r2]
	cmp r3, #0x9f
	bgt _0801A5A8
	adds r3, #5
	str r3, [r2]
	cmp r3, #0xa0
	ble _0801A4EA
	movs r0, #0xa0
	str r0, [r2]
	b _0801A4EA
_0801A5A8:
	ldr r1, _0801A76C
	movs r3, #4
	str r3, [r1]
	movs r0, #0x2e
	bl fe_title_letters_start
	b _0801A4EA
	.global _0801A5B6
_0801A5B6:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_2
	ldr r2, _0801A760
	ldr r3, [r2]
	cmp r3, #0xf
	bgt _0801A5CE
	adds r3, #1
	str r3, [r2]
_0801A5CE:
	ldr r2, _0801A778
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A5EE
	cmp r3, #0x64
	ble _0801A5DE
	movs r3, #0x64
	str r3, [r2]
_0801A5DE:
	subs r3, #5
	str r3, [r2]
	cmp r3, #0
	blt _0801A5E8
	b _0801A4EA
_0801A5E8:
	movs r0, #0
	str r0, [r2]
	b _0801A4EA
_0801A5EE:
	ldr r0, _0801A76C
	movs r1, #5
	str r1, [r0]
	ldr r1, _0801A794
	movs r3, #0x1e
	str r3, [r1]
	b _0801A4EA
	.global _0801A5FC
_0801A5FC:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_2
	ldr r2, _0801A760
	ldr r3, [r2]
	cmp r3, #0xf
	bgt _0801A614
	adds r3, #1
	str r3, [r2]
_0801A614:
	ldr r2, _0801A794
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A646
	subs r3, #1
	str r3, [r2]
_0801A620:
	ldr r2, _0801A77C
	ldrh r1, [r2]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _0801A62E
	b _0801A4EA
_0801A62E:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcf
	bl snd_play
	ldr r0, _0801A76C
	movs r3, #6
	str r3, [r0]
	bl fe_title_letters_leave
	b _0801A4EA
_0801A646:
	movs r5, #0xa
	str r5, [r2]
	ldr r7, _0801A798
	ldr r5, _0801A788
	ldr r4, _0801A780
	movs r6, #0
	movs r1, #0
	movs r0, #7
_0801A656:
	ldr r3, [r1, r5]
	cmp r3, #0
	ble _0801A66C
	subs r3, #1
	str r3, [r1, r5]
	ldr r3, [r1, r7]
	lsls r6, r3, #2
	ldr r3, [r4, r6]
	adds r3, #1
	str r3, [r4, r6]
	movs r6, #1
_0801A66C:
	subs r0, #1
	adds r1, #4
	cmp r0, #0
	bge _0801A656
	cmp r6, #0
	beq _0801A620
	movs r3, #0x80
	movs r0, #0xc1
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	b _0801A620
	.global _0801A686
_0801A686:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_2
	ldr r2, _0801A760
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A69E
	subs r3, #1
	str r3, [r2]
_0801A69E:
	ldr r2, _0801A774
	ldr r3, [r2]
	cmp r3, #0xef
	bgt _0801A6A8
	b _0801A878
_0801A6A8:
	movs r0, #0x2f
	bl fe_title_letters_start
	ldr r7, _0801A76C
	movs r4, #7
	ldr r5, _0801A798
	str r4, [r7]
	ldr r4, _0801A780
	ldr r7, _0801A788
	movs r0, #0
	mov ip, r5
	movs r6, #7
_0801A6C0:
	ldr r2, [r5, r0]
	lsls r3, r2, #2
	ldr r1, [r0, r7]
	ldr r2, [r4, r3]
	subs r6, #1
	adds r2, r2, r1
	str r2, [r4, r3]
	adds r0, #4
	cmp r6, #0
	bge _0801A6C0
	movs r6, #0
	mov r3, ip
_0801A6D8:
	stm r3!, {r6}
	adds r6, #1
	cmp r6, #7
	ble _0801A6D8
	ldr r2, _0801A780
	ldr r7, _0801A798
	mov lr, r2
_0801A6E6:
	movs r3, #0
	mov ip, r3
	movs r6, #0
_0801A6EC:
	lsls r0, r6, #2
	adds r4, r0, #4
	ldr r1, [r7, r4]
	ldr r5, [r7, r0]
	lsls r3, r1, #2
	mov r8, r3
	lsls r2, r5, #2
	mov r3, lr
	ldr r2, [r3, r2]
	mov sl, r2
	mov r2, r8
	ldr r2, [r3, r2]
	mov r8, r2
	cmp sl, r8
	bge _0801A712
	str r1, [r7, r0]
	movs r3, #1
	str r5, [r7, r4]
	mov ip, r3
_0801A712:
	adds r6, #1
	cmp r6, #6
	ble _0801A6EC
	mov r4, ip
	cmp r4, #0
	bne _0801A6E6
	ldr r0, _0801A784
	ldr r7, _0801A780
	ldr r5, _0801A798
	str r4, [r0]
	movs r6, #1
	adds r4, r0, #0
	movs r1, #4
	movs r0, #0
_0801A72E:
	ldr r3, [r1, r5]
	lsls r2, r3, #2
	ldr r3, [r0, r5]
	lsls r3, r3, #2
	ldr r2, [r7, r2]
	ldr r3, [r7, r3]
	cmp r2, r3
	beq _0801A750
	ldr r2, [r4, r0]
	adds r2, #1
_0801A742:
	str r2, [r4, r1]
	adds r6, #1
	adds r0, #4
	adds r1, #4
	cmp r6, #7
	ble _0801A72E
	b _0801A4EA
_0801A750:
	ldr r2, [r4, r0]
	b _0801A742
_0801A754:
	.4byte gGameSetup
_0801A758:
	.4byte 0x03005660
_0801A75C:
	.4byte 0x04000010
_0801A760:
	.4byte 0x0202D2C0
_0801A764:
	.4byte sin_fx
_0801A768:
	.4byte 0x0202D2C4
_0801A76C:
	.4byte 0x0202D2EC
_0801A770:
	.4byte _0801A474
_0801A774:
	.4byte 0x0202D2B8
_0801A778:
	.4byte 0x0202D2BC
_0801A77C:
	.4byte gKeysNew
_0801A780:
	.4byte 0x0202D330
_0801A784:
	.4byte 0x0202D310
_0801A788:
	.4byte 0x0202D350
_0801A78C:
	.4byte gUnk_080517E0
_0801A790:
	.4byte gLinkPlayerCount
_0801A794:
	.4byte 0x0202D2C8
_0801A798:
	.4byte 0x0202D2F0
	.global _0801A79C
_0801A79C:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_3
	ldr r2, _0801A890
	ldr r3, [r2]
	cmp r3, #0xf
	bgt _0801A7B4
	adds r3, #1
	str r3, [r2]
_0801A7B4:
	ldr r2, _0801A894
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A7CC
	subs r3, #5
	str r3, [r2]
	cmp r3, #0
	blt _0801A7C6
	b _0801A4EA
_0801A7C6:
	movs r1, #0
	str r1, [r2]
	b _0801A4EA
_0801A7CC:
	ldr r0, _0801A898
	movs r3, #8
	str r3, [r0]
	b _0801A4EA
	.global _0801A7D4
_0801A7D4:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_3
	ldr r2, _0801A89C
	ldrh r0, [r2]
	movs r1, #0xb
	ands r1, r0
	cmp r1, #0
	bne _0801A7EE
	b _0801A4EA
_0801A7EE:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xd8
	bl snd_play
	bl fade_to_black
	ldr r1, _0801A898
	movs r3, #9
	str r3, [r1]
	bl fe_title_letters_leave
	b _0801A4EA
	.global _0801A80A
_0801A80A:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_3
	ldr r2, _0801A890
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A822
	subs r3, #1
	str r3, [r2]
_0801A822:
	ldr r2, _0801A894
	ldr r3, [r2]
	cmp r3, #0xef
	bgt _0801A83A
	adds r3, #5
	str r3, [r2]
	cmp r3, #0xf0
	bgt _0801A834
	b _0801A4EA
_0801A834:
	movs r0, #0xf0
	str r0, [r2]
	b _0801A4EA
_0801A83A:
	ldr r2, _0801A8A0
	ldr r0, _0801A8A4
	adds r1, r2, #0
	adds r1, #0x2c
	movs r2, #7
_0801A844:
	ldm r0!, {r3}
	subs r2, #1
	strh r3, [r1]
	adds r1, #2
	cmp r2, #0
	bge _0801A844
	movs r0, #0
	bl mcp_process
	b _0801A4EA
	.global _0801A858
_0801A858:
	bl fe_draw_title
	bl fe_scoreboard_draw_rows
	bl fe_scoreboard_draw_1
	ldr r2, _0801A890
	ldr r3, [r2]
	cmp r3, #0
	ble _0801A870
	subs r3, #1
	str r3, [r2]
_0801A870:
	ldr r2, _0801A894
	ldr r3, [r2]
	cmp r3, #0xef
	bgt _0801A888
_0801A878:
	adds r3, #5
	str r3, [r2]
	cmp r3, #0xf0
	bgt _0801A882
	b _0801A4EA
_0801A882:
	movs r1, #0xf0
	str r1, [r2]
	b _0801A4EA
_0801A888:
	movs r0, #1
	bl mcp_process
	b _0801A4EA
_0801A890:
	.4byte 0x0202D2C0
_0801A894:
	.4byte 0x0202D2B8
_0801A898:
	.4byte 0x0202D2EC
_0801A89C:
	.4byte gKeysNew
_0801A8A0:
	.4byte gGameSetup
_0801A8A4:
	.4byte 0x0202D330

	.global fe_cups_win_init
	.thumb_func
	.type fe_cups_win_init, %function
fe_cups_win_init: @ 0801A8A8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r5, _0801A8EC
	ldr r0, _0801A900
	ldr r1, _0801A904
	strh r5, [r0]
	ldr r0, _0801A908
	sub sp, #0x30
	ldr r4, _0801A8F0
	bl AGBPrintf
	bl audio_hw_stop
	movs r2, #0x80
	lsls r0, r2, #0x13
	ldr r1, _0801A8F4
	strh r4, [r0]
	ldr r7, _0801A8F8
	adds r0, #8
	strh r1, [r0]
	ldr r6, _0801A8FC
	adds r0, #2
	strh r7, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #4
	strh r5, [r0]
	adds r0, #2
	b _0801A90C
	.byte 0x00, 0x00
_0801A8EC:
	.4byte 0x00000000
_0801A8F0:
	.4byte 0x00001740
_0801A8F4:
	.4byte 0x0000000A
_0801A8F8:
	.4byte 0x00000109
_0801A8FC:
	.4byte 0x00000208
_0801A900:
	.4byte 0x04000208
_0801A904:
	.4byte gUnk_08051898
_0801A908:
	.4byte gUnk_080518AC
_0801A90C:
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #0x36
	strh r5, [r0]
	ldr r0, _0801AA5C
	bl pal_load
	ldr r0, _0801AA60
	ldr r4, _0801AA64
	str r4, [r0]
	subs r4, #4
	ldrh r1, [r4]
	movs r7, #0x80
	lsls r6, r7, #0x18
	ldr r3, _0801AA68
	lsls r5, r1, #4
	orrs r5, r6
	movs r4, #0xc0
	str r3, [r0, #4]
	ldr r2, _0801AA6C
	str r5, [r0, #8]
	lsls r1, r4, #0x13
	ldr r4, _0801AA70
	ldr r3, [r0, #8]
	ldr r7, _0801AA74
	str r2, [r0]
	ldr r6, _0801AA78
	str r1, [r0, #4]
	str r4, [r0, #8]
	ldr r5, _0801AA7C
	ldr r3, [r0, #8]
	ldr r2, _0801AA80
	str r7, [r0]
	str r6, [r0, #4]
	str r4, [r0, #8]
	movs r7, #0xe0
	ldr r3, [r0, #8]
	str r5, [r0]
	str r2, [r0, #4]
	ldr r5, _0801AA84
	str r4, [r0, #8]
	add r1, sp, #0xc
	movs r4, #0
	lsls r6, r7, #0x13
	ldr r3, [r0, #8]
	str r4, [sp, #0xc]
	str r1, [r0]
	str r6, [r0, #4]
	str r5, [r0, #8]
	ldr r2, _0801AA88
	ldr r3, [r0, #8]
	ldr r1, _0801AA8C
	mov r3, sp
	adds r3, #0xa
	strh r4, [r3]
	str r3, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	bl fe_spr_init
	ldr r0, _0801AA90
	str r4, [r0, #4]
	str r4, [r0]
	add r0, sp, #0x10
	mov lr, r0
	mov r3, lr
_0801A9A0:
	stm r3!, {r4}
	adds r4, #1
	cmp r4, #7
	ble _0801A9A0
	ldr r2, _0801AA94
	mov ip, r2
	mov sl, ip
	mov fp, lr
	mov sb, ip
_0801A9B2:
	movs r3, #0
	mov r8, r3
	movs r6, #4
	movs r5, #0
	movs r4, #6
_0801A9BC:
	mov r7, fp
	ldr r1, [r6, r7]
	ldr r0, [r5, r7]
	lsls r7, r1, #1
	adds r7, #0x2c
	str r7, [sp, #4]
	lsls r2, r0, #1
	adds r2, #0x2c
	mov r3, sl
	ldrsh r3, [r3, r2]
	ldr r7, [sp, #4]
	str r3, [sp]
	mov r2, sl
	ldrsh r2, [r2, r7]
	ldr r7, [sp]
	cmp r7, r2
	bge _0801A9EA
	mov r7, lr
	str r1, [r5, r7]
	str r0, [r6, r7]
	movs r0, #1
	mov r8, r0
	mov ip, sb
_0801A9EA:
	subs r4, #1
	adds r6, #4
	adds r5, #4
	cmp r4, #0
	bge _0801A9BC
	mov r2, r8
	cmp r2, #0
	bne _0801A9B2
	movs r4, #0
_0801A9FC:
	lsls r7, r4, #2
	mov r5, lr
	ldr r0, [r5, r7]
	lsls r2, r0, #1
	adds r6, r7, #0
	adds r2, #4
	mov r7, ip
	ldr r1, _0801AA90
	ldrsh r5, [r7, r2]
	adds r6, #8
	adds r4, #1
	str r5, [r1, r6]
	cmp r4, #2
	ble _0801A9FC
	adds r5, r1, #0
	movs r2, #0x38
	ldr r6, _0801AA98
	ldr r0, _0801AA54
	ldr r7, _0801AA58
	ldr r1, _0801AA9C
	movs r4, #0
	adds r5, #8
	mov ip, r2
_0801AA2A:
	ldm r5!, {r3}
	mov r2, ip
	muls r2, r3, r2
	adds r3, r2, #0
	adds r3, #8
	ldr r3, [r6, r3]
	adds r2, #0xc
	str r3, [r1]
	ldr r3, [r6, r2]
	adds r4, #1
	str r3, [r1, #4]
	strh r0, [r1, #0x1e]
	strh r0, [r1, #0x20]
	strh r7, [r1, #0x22]
	adds r1, #0x24
	cmp r4, #2
	ble _0801AA2A
	ldr r0, _0801AA9C
	ldr r3, _0801AAA0
	b _0801AAA4
	.byte 0x00, 0x00
_0801AA54:
	.4byte 0x00000069
_0801AA58:
	.4byte 0x00000000
_0801AA5C:
	.4byte gUnk_08054C50
_0801AA60:
	.4byte 0x040000D4
_0801AA64:
	.4byte gUnk_0809950E
_0801AA68:
	.4byte 0x06008000
_0801AA6C:
	.4byte gUnk_081B9C6C
_0801AA70:
	.4byte 0x80000400
_0801AA74:
	.4byte gUnk_081BA170
_0801AA78:
	.4byte 0x06000800
_0801AA7C:
	.4byte gUnk_081BA674
_0801AA80:
	.4byte 0x06001000
_0801AA84:
	.4byte 0x85000100
_0801AA88:
	.4byte 0x06010000
_0801AA8C:
	.4byte 0x81004000
_0801AA90:
	.4byte 0x0202D3DC
_0801AA94:
	.4byte gGameSetup
_0801AA98:
	.4byte gUnk_080511B4
_0801AA9C:
	.4byte 0x0202D370
_0801AAA0:
	.4byte gUnk_08656800
_0801AAA4:
	str r3, [r0, #0xc]
	ldr r3, _0801AB10
	str r3, [r0, #0x14]
	ldr r3, _0801AB14
	str r3, [r0, #0x2c]
	ldr r3, _0801AB18
	ldr r1, _0801AB1C
	str r3, [r0, #0x30]
	ldr r3, _0801AB20
	str r1, [r0, #8]
	str r3, [r0, #0x34]
	ldr r1, _0801AB24
	ldr r3, _0801AB28
	str r1, [r0, #0x10]
	str r3, [r0, #0x38]
	ldr r1, _0801AB2C
	ldr r3, _0801AB30
	str r1, [r0, #0x18]
	str r3, [r0, #0x3c]
	ldr r1, _0801AB04
	adds r3, r0, #0
	adds r3, #0x40
	strh r1, [r0, #0x1c]
	strh r1, [r3]
	ldr r1, _0801AB34
	ldr r3, _0801AB38
	str r1, [r0, #0x50]
	ldr r1, _0801AB3C
	str r3, [r0, #0x54]
	ldr r3, _0801AB40
	str r1, [r0, #0x58]
	ldr r1, _0801AB44
	str r3, [r0, #0x5c]
	ldr r3, _0801AB08
	str r1, [r0, #0x60]
	adds r0, #0x64
	strh r3, [r0]
	bl fade_to_normal
	ldr r1, _0801AB48
	ldr r0, _0801AB4C
	str r1, [r0]
	ldr r0, _0801AB50
	ldr r1, _0801AB54
	bl AGBPrintf
	ldr r3, _0801AB0C
	b _0801AB58
_0801AB04:
	.4byte 0x00000400
_0801AB08:
	.4byte 0x00000800
_0801AB0C:
	.4byte 0x00000001
_0801AB10:
	.4byte gUnk_08655DEC
_0801AB14:
	.4byte gUnk_086553D8
_0801AB18:
	.4byte gUnk_08655734
_0801AB1C:
	.4byte gUnk_086564A4
_0801AB20:
	.4byte gUnk_08655A90
_0801AB24:
	.4byte gUnk_08656B5C
_0801AB28:
	.4byte gUnk_08654D20
_0801AB2C:
	.4byte gUnk_08656148
_0801AB30:
	.4byte gUnk_0865507C
_0801AB34:
	.4byte gUnk_08657570
_0801AB38:
	.4byte gUnk_086578CC
_0801AB3C:
	.4byte gUnk_08657C28
_0801AB40:
	.4byte gUnk_08656EB8
_0801AB44:
	.4byte gUnk_08657214
_0801AB48:
	.4byte fe_cups_win_process
_0801AB4C:
	.4byte gStateFunc
_0801AB50:
	.4byte gUnk_080518B8
_0801AB54:
	.4byte gUnk_08051898
_0801AB58:
	ldr r1, _0801AB70
	add sp, #0x30
	strh r3, [r1]
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801AB70:
	.4byte 0x04000208

	.global fe_cups_win_draw_spin
	.thumb_func
	.type fe_cups_win_draw_spin, %function
fe_cups_win_draw_spin: @ 0801AB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	mov r8, r1
	movs r7, #0x24
	mov r6, r8
	muls r6, r7, r6
	mov sl, r0
	add r6, sl
	ldr r0, [r6, #8]
	lsls r7, r2, #1
	ldrh r1, [r7, r0]
	movs r5, #0x80
	lsls r4, r5, #7
	adds r3, r1, r4
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	ldr r5, _0801AC68
	sub sp, #0x10
	bl _call_via_r5
	ldr r2, _0801AC6C
	adds r1, r0, #0
	adds r0, r4, #0
	lsls r5, r1, #0x10
	bl _call_via_r2
	ldr r4, [r6, #0xc]
	ldrh r1, [r7, r4]
	ldr r2, _0801AC70
	lsls r4, r1, #2
	ldr r1, [r2, r4]
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	lsrs r4, r1, #0x10
	muls r4, r0, r4
	rsbs r1, r4, #0
	lsrs r4, r1, #0xc
	ldr r1, [r6, #0x10]
	ldrh r6, [r7, r1]
	lsls r1, r6, #2
	ldr r6, [r2, r1]
	lsrs r1, r6, #0x10
	muls r1, r0, r1
	movs r2, #0x80
	lsrs r0, r1, #0xc
	lsls r1, r2, #1
	asrs r5, r5, #0x14
	cmp r4, r1
	beq _0801AC5A
_0801ABDC:
	ldr r1, _0801AC74
	ldr r6, [r1]
	ldr r3, _0801AC78
	adds r2, r6, #1
	str r2, [r1]
	lsls r1, r6, #5
	strh r4, [r1, r3]
	adds r4, r3, #0
	adds r4, #8
	strh r5, [r1, r4]
	adds r3, #0x18
	adds r4, #8
	strh r5, [r1, r4]
	strh r0, [r1, r3]
_0801ABF8:
	movs r2, #0x24
	mov r0, r8
	muls r0, r2, r0
	adds r3, r0, #0
	add r3, sl
	ldr r1, [r3, #0x18]
	ldr r5, [r3, #0x14]
	ldrh r4, [r7, r1]
	ldrh r0, [r7, r5]
	ldrh r5, [r3, #0x1e]
	adds r1, r4, #0
	ldr r2, [r3]
	ldr r4, [r3, #4]
	movs r3, #1
	str r5, [sp]
	rsbs r5, r3, #0
	adds r1, #0xc
	cmp r6, r5
	beq _0801AC56
	movs r3, #0x80
	lsls r5, r3, #1
_0801AC22:
	str r5, [sp, #4]
	movs r5, #1
	rsbs r3, r5, #0
	cmp r6, r3
	beq _0801AC52
	lsls r5, r6, #9
_0801AC2E:
	str r5, [sp, #8]
	movs r3, #0x24
	mov r5, r8
	muls r5, r3, r5
	adds r3, r5, #0
	add r3, sl
	ldrh r3, [r3, #0x1c]
	str r3, [sp, #0xc]
	adds r3, r4, #0
	bl fe_spr_plot
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801AC52:
	movs r5, #0
	b _0801AC2E
_0801AC56:
	movs r5, #0
	b _0801AC22
_0801AC5A:
	cmp r0, r4
	bne _0801ABDC
	cmp r5, #0
	bne _0801ABDC
	movs r3, #1
	rsbs r6, r3, #0
	b _0801ABF8
_0801AC68:
	.4byte sin_fx
_0801AC6C:
	.4byte cos_fx
_0801AC70:
	.4byte gUnk_0803F49C
_0801AC74:
	.4byte 0x02024390
_0801AC78:
	.4byte 0x0200000E

	.global fe_cups_win_process
	.thumb_func
	.type fe_cups_win_process, %function
fe_cups_win_process: @ 0801AC7C
	push {r4, r5, lr}
	bl fade_update
	bl fe_frame_end
	ldr r5, _0801AD98
	movs r4, #0
_0801AC8A:
	adds r1, r4, #0
	ldr r2, [r5]
	ldr r0, _0801AD9C
	adds r4, #1
	bl fe_cups_win_draw_spin
	cmp r4, #1
	ble _0801AC8A
	ldr r5, _0801AD98
	movs r4, #0
_0801AC9E:
	adds r1, r4, #0
	ldr r2, [r5]
	ldr r0, _0801ADA0
	adds r4, #1
	bl fe_cups_win_draw_spin
	cmp r4, #2
	ble _0801AC9E
	ldr r4, _0801AD98
	ldr r1, [r4]
	cmp r1, #0x73
	beq _0801AD7C
_0801ACB6:
	cmp r1, #0xcd
	beq _0801AD62
_0801ACBA:
	ldr r0, [r4, #8]
	ldr r2, _0801ADA4
	lsls r3, r0, #1
	ldrsh r3, [r2, r3]
	cmp r1, r3
	beq _0801AD4A
_0801ACC6:
	movs r0, #0xba
	lsls r2, r0, #1
	cmp r1, r2
	beq _0801AD30
_0801ACCE:
	movs r2, #0xf9
	lsls r5, r2, #1
	cmp r1, r5
	bgt _0801ACDA
	adds r0, r1, #1
	str r0, [r4]
_0801ACDA:
	ldr r2, [r4, #4]
	cmp r2, #1
	beq _0801AD1C
	cmp r2, #1
	bgt _0801AD02
	cmp r2, #0
	beq _0801ACEE
_0801ACE8:
	pop {r4, r5}
	pop {r0}
	bx r0
_0801ACEE:
	ldr r2, _0801ADA8
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _0801ACE8
	movs r1, #1
	str r1, [r4, #4]
	b _0801ACE8
_0801AD02:
	cmp r2, #2
	bne _0801ACE8
	ldr r2, _0801ADA8
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _0801ACE8
	movs r0, #0
	bl mcp_process
	b _0801ACE8
_0801AD1C:
	ldr r1, _0801ADAC
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0801ACE8
	movs r2, #2
	str r2, [r4, #4]
	bl fade_to_black
	b _0801ACE8
_0801AD30:
	ldr r0, [r4, #8]
	movs r1, #0x30
	muls r1, r0, r1
	ldr r3, _0801ADB0
	adds r1, #8
	movs r5, #0x80
	ldr r0, [r3, r1]
	lsls r2, r5, #9
	movs r1, #0x7f
	bl snd_play
	ldr r1, [r4]
	b _0801ACCE
_0801AD4A:
	movs r1, #0x30
	muls r1, r0, r1
	ldr r3, _0801ADB0
	adds r1, #0x28
	movs r5, #0x80
	ldr r0, [r3, r1]
	lsls r2, r5, #9
	movs r1, #0x7f
	bl snd_play
	ldr r1, [r4]
	b _0801ACC6
_0801AD62:
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	muls r1, r0, r1
	ldr r3, _0801ADB0
	adds r1, #0xc
	movs r5, #0x80
	ldr r0, [r3, r1]
	lsls r2, r5, #9
	movs r1, #0x7f
	bl snd_play
	ldr r1, [r4]
	b _0801ACBA
_0801AD7C:
	ldr r0, [r4, #0x10]
	movs r1, #0x30
	muls r1, r0, r1
	ldr r3, _0801ADB0
	adds r1, #0xc
	ldr r0, [r3, r1]
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	ldr r1, [r4]
	b _0801ACB6
	.byte 0x00, 0x00
_0801AD98:
	.4byte 0x0202D3DC
_0801AD9C:
	.4byte gUnk_08051838
_0801ADA0:
	.4byte 0x0202D370
_0801ADA4:
	.4byte gUnk_08051884
_0801ADA8:
	.4byte gModeFlags
_0801ADAC:
	.4byte gKeysNew
_0801ADB0:
	.4byte gUnk_08051B90

	.global fe_spot_span_set
	.thumb_func
	.type fe_spot_span_set, %function
fe_spot_span_set: @ 0801ADB4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r2, [sp, #0xc]
	movs r2, #0
	str r0, [sp, #0x14]
	str r1, [sp, #0x10]
	cmp r2, r1
	bge _0801AE82
_0801ADCE:
	ldr r4, [sp, #0xc]
	lsls r1, r2, #3
	adds r3, r1, r4
	ldr r1, [r3, #4]
	mov lr, r1
	ldr r1, [sp, #0x10]
	adds r2, #1
	ldr r5, [r3]
	str r2, [sp]
	cmp r2, r1
	blt _0801ADE6
	b _0801AED2
_0801ADE6:
	ldr r4, [r3, #8]
	ldr r3, [r3, #0xc]
	mov ip, r3
_0801ADEC:
	subs r1, r4, r5
	cmp r1, #0
	blt _0801AECE
_0801ADF2:
	mov r3, ip
	mov r0, lr
	subs r2, r3, r0
	cmp r2, #0
	blt _0801AECA
_0801ADFC:
	cmp r1, r2
	blt _0801AEAE
	lsls r3, r2, #1
	subs r0, r2, r1
	subs r6, r3, r1
	adds r7, r1, #1
	mov fp, r3
	movs r1, #1
	lsls r3, r0, #1
	movs r2, #0
	mov sb, r3
	mov sl, r1
	mov r8, r2
	str r1, [sp, #8]
	str r1, [sp, #4]
_0801AE1A:
	cmp r5, r4
	ble _0801AE2A
	mov r1, sl
	rsbs r1, r1, #0
	mov sl, r1
	ldr r1, [sp, #8]
	rsbs r3, r1, #0
	str r3, [sp, #8]
_0801AE2A:
	cmp lr, ip
	ble _0801AE3A
	ldr r4, [sp, #4]
	mov r3, r8
	rsbs r2, r4, #0
	rsbs r3, r3, #0
	str r2, [sp, #4]
	mov r8, r3
_0801AE3A:
	mov r4, lr
	cmp r7, #0
	ble _0801AE7A
_0801AE40:
	cmp r4, #0x9f
	bhi _0801AE66
	adds r0, r5, #0
	cmp r5, #0
	blt _0801AEAA
_0801AE4A:
	cmp r0, #0xf0
	ble _0801AE50
	movs r0, #0xf0
_0801AE50:
	cmp ip, lr
	bge _0801AE9C
	ldr r1, [sp, #0x14]
	lsls r2, r4, #1
	adds r3, r2, r1
	ldrh r1, [r3]
	movs r2, #0xff
	lsls r2, r2, #8
	ands r2, r1
	orrs r2, r0
_0801AE64:
	strh r2, [r3]
_0801AE66:
	cmp r6, #0
	blt _0801AE94
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	add r6, sb
	adds r5, r5, r0
	adds r4, r4, r3
_0801AE74:
	subs r7, #1
	cmp r7, #0
	bne _0801AE40
_0801AE7A:
	ldr r2, [sp]
	ldr r3, [sp, #0x10]
	cmp r2, r3
	blt _0801ADCE
_0801AE82:
	add sp, #0x18
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801AE94:
	add r6, fp
	add r5, sl
	add r4, r8
	b _0801AE74
_0801AE9C:
	ldr r2, [sp, #0x14]
	lsls r1, r4, #1
	adds r3, r1, r2
	ldrb r2, [r3]
	lsls r1, r0, #8
	orrs r2, r1
	b _0801AE64
_0801AEAA:
	movs r0, #0
	b _0801AE4A
_0801AEAE:
	lsls r3, r1, #1
	subs r0, r1, r2
	subs r6, r3, r2
	mov fp, r3
	lsls r3, r0, #1
	movs r0, #1
	mov sb, r3
	str r0, [sp, #8]
	movs r3, #0
	str r0, [sp, #4]
	adds r7, r2, #1
	mov sl, r3
	mov r8, r0
	b _0801AE1A
_0801AECA:
	rsbs r2, r2, #0
	b _0801ADFC
_0801AECE:
	rsbs r1, r1, #0
	b _0801ADF2
_0801AED2:
	ldr r0, [sp, #0xc]
	ldr r2, [r0, #4]
	ldr r4, [r0]
	mov ip, r2
	b _0801ADEC

	.global fe_spot_span_merge
	.thumb_func
	.type fe_spot_span_merge, %function
fe_spot_span_merge: @ 0801AEDC
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r3, #0
	mov ip, r0
	adds r7, r2, #0
	cmp r1, #0
	ble _0801AFAE
	lsls r0, r1, #1
	movs r2, #3
	subs r6, r2, r0
	movs r5, #0
	adds r0, r1, #0
	cmp r5, r0
	bgt _0801AFAE
_0801AEF8:
	subs r2, r7, r0
	cmp r2, #0x9f
	bhi _0801AF20
	subs r3, r4, r5
	adds r1, r4, r5
	cmp r3, #0
	blt _0801AFD8
_0801AF06:
	cmp r3, #0xf0
	ble _0801AF0C
	movs r3, #0xf0
_0801AF0C:
	cmp r1, #0
	blt _0801AFD4
_0801AF10:
	cmp r1, #0xf0
	ble _0801AF16
	movs r1, #0xf0
_0801AF16:
	lsls r3, r3, #8
	orrs r1, r3
	lsls r2, r2, #1
	mov r3, ip
	strh r1, [r2, r3]
_0801AF20:
	adds r2, r7, r0
	cmp r2, #0x9f
	bhi _0801AF48
	subs r3, r4, r5
	adds r1, r4, r5
	cmp r3, #0
	blt _0801AFD0
_0801AF2E:
	cmp r3, #0xf0
	ble _0801AF34
	movs r3, #0xf0
_0801AF34:
	cmp r1, #0
	blt _0801AFCC
_0801AF38:
	cmp r1, #0xf0
	ble _0801AF3E
	movs r1, #0xf0
_0801AF3E:
	lsls r3, r3, #8
	orrs r1, r3
	lsls r2, r2, #1
	mov r3, ip
	strh r1, [r2, r3]
_0801AF48:
	subs r2, r7, r5
	cmp r2, #0x9f
	bhi _0801AF70
	subs r3, r4, r0
	adds r1, r4, r0
	cmp r3, #0
	blt _0801AFC8
_0801AF56:
	cmp r3, #0xf0
	ble _0801AF5C
	movs r3, #0xf0
_0801AF5C:
	cmp r1, #0
	blt _0801AFC4
_0801AF60:
	cmp r1, #0xf0
	ble _0801AF66
	movs r1, #0xf0
_0801AF66:
	lsls r3, r3, #8
	orrs r1, r3
	lsls r2, r2, #1
	mov r3, ip
	strh r1, [r2, r3]
_0801AF70:
	adds r2, r7, r5
	cmp r2, #0x9f
	bhi _0801AF98
	subs r3, r4, r0
	adds r1, r4, r0
	cmp r3, #0
	blt _0801AFC0
_0801AF7E:
	cmp r3, #0xf0
	ble _0801AF84
	movs r3, #0xf0
_0801AF84:
	cmp r1, #0
	blt _0801AFBC
_0801AF88:
	cmp r1, #0xf0
	ble _0801AF8E
	movs r1, #0xf0
_0801AF8E:
	lsls r3, r3, #8
	orrs r1, r3
	lsls r2, r2, #1
	mov r3, ip
	strh r1, [r2, r3]
_0801AF98:
	adds r5, #1
	cmp r6, #0
	blt _0801AFB4
	subs r1, r5, r0
	lsls r2, r1, #2
	adds r1, r6, r2
	adds r6, r1, #0
	adds r6, #0xa
	subs r0, #1
_0801AFAA:
	cmp r5, r0
	ble _0801AEF8
_0801AFAE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801AFB4:
	lsls r2, r5, #2
	adds r1, r6, r2
	adds r6, r1, #6
	b _0801AFAA
_0801AFBC:
	movs r1, #0
	b _0801AF88
_0801AFC0:
	movs r3, #0
	b _0801AF7E
_0801AFC4:
	movs r1, #0
	b _0801AF60
_0801AFC8:
	movs r3, #0
	b _0801AF56
_0801AFCC:
	movs r1, #0
	b _0801AF38
_0801AFD0:
	movs r3, #0
	b _0801AF2E
_0801AFD4:
	movs r1, #0
	b _0801AF10
_0801AFD8:
	movs r3, #0
	b _0801AF06

	.global fe_spot_draw
	.thumb_func
	.type fe_spot_draw, %function
fe_spot_draw: @ 0801AFDC
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x1c
	str r1, [sp]
	adds r6, r2, #0
	ldr r1, _0801B0CC
	ldr r2, _0801B0D0
	adds r7, r0, #0
	movs r3, #0x9f
_0801AFF6:
	subs r3, #1
	strh r1, [r2]
	adds r2, #2
	cmp r3, #0
	bge _0801AFF6
	ldr r1, _0801B0CC
	ldr r2, _0801B0D4
	movs r3, #0x9f
_0801B006:
	subs r3, #1
	strh r1, [r2]
	adds r2, #2
	cmp r3, #0
	bge _0801B006
	ldr r2, [sp]
	adds r1, r7, #0
	adds r3, r6, #0
	ldr r0, _0801B0D0
	bl fe_spot_span_merge
	movs r5, #0xc8
	ldr r0, [sp]
	rsbs r3, r5, #0
	movs r1, #0x78
	subs r5, r1, r7
	subs r4, r3, r0
	str r1, [sp, #4]
	adds r2, r4, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	str r3, [sp, #8]
	ldr r3, _0801B0D8
	adds r0, r1, r2
	mov sb, r3
	bl _call_via_r9
	adds r2, r6, #2
	mov sl, r0
	mov r1, sl
	adds r0, r2, #0
	muls r0, r2, r0
	bl __divsi3
	mov r2, sl
	adds r6, r0, #0
	subs r1, r2, r6
	adds r0, r6, #0
	muls r0, r1, r0
	bl _call_via_r9
	adds r3, r6, #0
	muls r3, r5, r3
	mov sb, r0
	mov r2, sb
	muls r2, r4, r2
	mov r8, r3
	mov fp, r2
	mov r0, r8
	mov r1, sl
	add r0, fp
	bl __divsi3
	adds r2, r7, r0
	mov r0, sb
	muls r0, r5, r0
	muls r4, r6, r4
	adds r5, r0, #0
	subs r0, r4, r5
	mov r1, sl
	str r2, [sp, #0xc]
	bl __divsi3
	ldr r1, [sp]
	adds r3, r1, r0
	str r3, [sp, #0x10]
	mov r2, fp
	mov r3, r8
	subs r3, r3, r2
	mov r8, r3
	mov r1, sl
	mov r0, r8
	bl __divsi3
	adds r4, r4, r5
	adds r1, r7, r0
	str r1, [sp, #0x14]
	adds r0, r4, #0
	mov r1, sl
	bl __divsi3
	ldr r2, [sp]
	adds r1, r2, r0
	str r1, [sp, #0x18]
	add r2, sp, #4
	ldr r0, _0801B0D4
	movs r1, #3
	bl fe_spot_span_set
	add sp, #0x1c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801B0CC:
	.4byte 0x0000F0F0
_0801B0D0:
	.4byte 0x0202D434
_0801B0D4:
	.4byte 0x0202D574
_0801B0D8:
	.4byte isqrt

	.global fe_spot_update
	.thumb_func
	.type fe_spot_update, %function
fe_spot_update: @ 0801B0DC
	push {r4, r5, r6, lr}
	ldr r0, _0801B15C
	ldr r4, _0801B160
	ldr r2, [r0, #0x14]
	ldr r1, [r4]
	ldr r5, _0801B164
	ldr r6, _0801B168
	subs r0, r1, r2
	ldr r1, [r5]
	ldr r2, [r6]
	bl fe_spot_draw
	ldr r3, _0801B16C
	ldr r0, [r3]
	cmp r0, #0
	ble _0801B154
	subs r0, #1
	lsls r1, r0, #0x1a
	str r0, [r3]
	ldr r2, _0801B170
	asrs r0, r1, #0x10
	bl _call_via_r2
	movs r1, #0x80
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	lsls r3, r1, #5
	adds r1, r2, r3
	ldr r2, _0801B174
	asrs r0, r1, #5
	ldr r1, [r2]
	adds r2, r0, #0
	muls r2, r1, r2
	movs r1, #0x80
	lsls r3, r1, #1
	subs r1, r3, r0
	ldr r3, _0801B178
	ldr r3, [r3]
	muls r3, r1, r3
	adds r2, r2, r3
	asrs r3, r2, #8
	str r3, [r4]
	ldr r2, _0801B17C
	ldr r3, [r2]
	ldr r2, _0801B180
	ldr r2, [r2]
	muls r3, r0, r3
	muls r2, r1, r2
	adds r3, r3, r2
	asrs r2, r3, #8
	str r2, [r5]
	ldr r2, _0801B184
	ldr r3, [r2]
	muls r3, r0, r3
	ldr r0, _0801B188
	ldr r2, [r0]
	muls r2, r1, r2
	adds r0, r3, r2
	asrs r1, r0, #8
	str r1, [r6]
_0801B154:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801B15C:
	.4byte 0x0202D3F0
_0801B160:
	.4byte 0x0202D40C
_0801B164:
	.4byte 0x0202D410
_0801B168:
	.4byte 0x0202D414
_0801B16C:
	.4byte 0x0202D430
_0801B170:
	.4byte cos_fx
_0801B174:
	.4byte 0x0202D424
_0801B178:
	.4byte 0x0202D418
_0801B17C:
	.4byte 0x0202D428
_0801B180:
	.4byte 0x0202D41C
_0801B184:
	.4byte 0x0202D42C
_0801B188:
	.4byte 0x0202D420

	.global fe_spot_init
	.thumb_func
	.type fe_spot_init, %function
fe_spot_init: @ 0801B18C
	push {r4, lr}
	ldr r1, _0801B1E4
	ldr r0, [r1]
	cmp r0, #0
	beq _0801B1DA
	ldr r4, [r1, #8]
	movs r3, #0xc
	muls r3, r4, r3
	ldr r2, _0801B1E8
_0801B19E:
	adds r0, r3, #0
	ldr r4, [r2, r3]
	adds r1, r3, #4
	adds r0, #8
	ldr r3, _0801B1EC
	ldr r1, [r2, r1]
	ldr r0, [r2, r0]
	movs r2, #0x20
	str r2, [r3]
	ldr r3, _0801B1F0
	ldr r2, [r3]
	ldr r3, _0801B1F4
	str r2, [r3]
	ldr r3, _0801B1F8
	ldr r2, [r3]
	ldr r3, _0801B1FC
	str r2, [r3]
	ldr r3, _0801B200
	ldr r2, [r3]
	ldr r3, _0801B204
	str r2, [r3]
	ldr r2, _0801B208
	str r4, [r2]
	ldr r2, _0801B20C
	str r1, [r2]
	ldr r1, _0801B210
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
_0801B1DA:
	ldr r0, [r1, #4]
	movs r3, #0xc
	muls r3, r0, r3
	ldr r2, _0801B214
	b _0801B19E
_0801B1E4:
	.4byte 0x0202D3F0
_0801B1E8:
	.4byte gUnk_080518E8
_0801B1EC:
	.4byte 0x0202D430
_0801B1F0:
	.4byte 0x0202D40C
_0801B1F4:
	.4byte 0x0202D418
_0801B1F8:
	.4byte 0x0202D410
_0801B1FC:
	.4byte 0x0202D41C
_0801B200:
	.4byte 0x0202D414
_0801B204:
	.4byte 0x0202D420
_0801B208:
	.4byte 0x0202D424
_0801B20C:
	.4byte 0x0202D428
_0801B210:
	.4byte 0x0202D42C
_0801B214:
	.4byte gUnk_080518C4

	.global fe_spotscreen_init
	.thumb_func
	.type fe_spotscreen_init, %function
fe_spotscreen_init: @ 0801B218
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r7, _0801B254
	ldr r6, _0801B264
	ldr r1, _0801B268
	mov sl, r0
	ldr r0, _0801B26C
	sub sp, #8
	bl AGBPrintf
	strh r7, [r6]
	ldr r0, _0801B270
	ldr r4, _0801B258
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	ldr r4, _0801B274
	ldr r3, _0801B25C
	ldrh r5, [r4]
	orrs r5, r3
	strh r5, [r4]
	ldr r1, _0801B278
	ldr r5, _0801B27C
	ldr r0, _0801B280
	ldr r4, _0801B260
	str r1, [r5]
	b _0801B284
	.byte 0x00, 0x00
_0801B254:
	.4byte 0x00000000
_0801B258:
	.4byte 0x00000002
_0801B25C:
	.4byte 0x00000010
_0801B260:
	.4byte 0x00000001
_0801B264:
	.4byte 0x04000208
_0801B268:
	.4byte gUnk_08051930
_0801B26C:
	.4byte gUnk_08051944
_0801B270:
	.4byte 0x04000200
_0801B274:
	.4byte 0x04000004
_0801B278:
	.4byte fe_spot_vblank
_0801B27C:
	.4byte gIrqHandler
_0801B280:
	.4byte fe_spot_hblank
_0801B284:
	movs r2, #0x80
	ldr r1, _0801B2BC
	str r0, [r5, #4]
	strh r4, [r6]
	ldr r0, _0801B2C0
	lsls r6, r2, #0x13
	strh r1, [r6]
	ldr r5, _0801B2C4
	adds r6, #8
	strh r0, [r6]
	ldr r4, _0801B2C8
	adds r6, #2
	strh r5, [r6]
	ldr r1, _0801B2CC
	adds r6, #2
	strh r4, [r6]
	adds r6, #2
	strh r1, [r6]
	adds r6, #2
	strh r7, [r6]
	adds r6, #2
	strh r7, [r6]
	adds r6, #2
	strh r7, [r6]
	adds r6, #2
	strh r7, [r6]
	adds r6, #2
	b _0801B2D0
_0801B2BC:
	.4byte 0x00007F40
_0801B2C0:
	.4byte 0x00004204
_0801B2C4:
	.4byte 0x00000400
_0801B2C8:
	.4byte 0x00000500
_0801B2CC:
	.4byte 0x00004009
_0801B2D0:
	strh r7, [r6]
	adds r6, #2
	strh r7, [r6]
	adds r6, #2
	strh r7, [r6]
	ldr r0, _0801B30C
	adds r6, #2
	strh r7, [r6]
	ldr r5, _0801B310
	adds r6, #0x2a
	strh r0, [r6]
	ldr r2, _0801B314
	adds r6, #2
	strh r5, [r6]
	ldr r4, _0801B318
	subs r6, #0xa
	strh r2, [r6]
	adds r6, #4
	strh r4, [r6]
	movs r0, #6
	subs r6, #2
	strh r2, [r6]
	ldr r1, _0801B31C
	adds r6, #4
	.2byte 0x4468 @ add r0, sp, r0
	strh r4, [r6]
	mov r8, r0
	adds r6, #0xa
	ldr r7, _0801B320
	b _0801B324
_0801B30C:
	.4byte 0x00003B19
_0801B310:
	.4byte 0x0000003D
_0801B314:
	.4byte 0x0000F000
_0801B318:
	.4byte 0x000000A0
_0801B31C:
	.4byte 0x00002866
_0801B320:
	.4byte 0x00001000
_0801B324:
	ldr r0, _0801B35C
	strh r1, [r6]
	mov r1, r8
	adds r6, #2
	strh r7, [r6]
	ldr r3, _0801B370
	strh r0, [r1]
	ldr r5, _0801B374
	ldr r0, _0801B378
	ldr r4, _0801B360
	str r1, [r0]
	str r5, [r0, #4]
	ldr r1, _0801B37C
	str r3, [r0, #8]
	mov r7, r8
	ldr r2, [r0, #8]
	strh r4, [r7]
	str r7, [r0]
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _0801B380
	ldr r6, _0801B364
	ldr r5, _0801B368
	ldr r1, _0801B36C
	mov ip, r0
	b _0801B384
	.byte 0x00, 0x00
_0801B35C:
	.4byte 0x0000F1FE
_0801B360:
	.4byte 0x0000F1FF
_0801B364:
	.4byte 0x00000F0F
_0801B368:
	.4byte 0x0000F0F0
_0801B36C:
	.4byte 0x0000FFFF
_0801B370:
	.4byte 0x81000400
_0801B374:
	.4byte 0x06002000
_0801B378:
	.4byte 0x040000D4
_0801B37C:
	.4byte 0x06002800
_0801B380:
	.4byte 0x06003FC0
_0801B384:
	movs r4, #0
	adds r0, #2
	movs r2, #0
_0801B38A:
	ldr r7, _0801B4C0
	mov r3, ip
	strh r6, [r2, r3]
	adds r3, r2, r7
	adds r7, #0x1a
	strh r6, [r0]
	strh r5, [r0, #2]
	strh r5, [r3]
	adds r3, r2, r7
	adds r7, #2
	strh r1, [r3]
	adds r3, r2, r7
	adds r7, #2
	strh r1, [r3]
	adds r3, r2, r7
	adds r7, #2
	strh r1, [r3]
	adds r4, #1
	adds r3, r2, r7
	strh r1, [r3]
	adds r0, #8
	adds r2, #8
	cmp r4, #3
	ble _0801B38A
	ldr r0, _0801B4C4
	bl pal_load
	ldr r1, _0801B4C8
	movs r5, #0x80
	ldr r7, [r1]
	lsls r6, r5, #3
	ands r7, r6
	cmp r7, #0
	bne _0801B3D0
	b _0801B5BE
_0801B3D0:
	ldr r0, _0801B4CC
_0801B3D2:
	ldr r4, [r1]
	movs r1, #0x80
	lsls r3, r1, #3
	ands r4, r3
	cmp r4, #0
	bne _0801B3E0
	b _0801B5BA
_0801B3E0:
	ldr r7, _0801B4D0
_0801B3E2:
	ldr r6, _0801B4D4
	ldrh r4, [r0]
	adds r2, r0, #2
	movs r1, #0x80
	str r2, [r6]
	ldr r5, _0801B4D8
	lsls r2, r4, #4
	lsls r4, r1, #0x18
	orrs r2, r4
	str r5, [r6, #4]
	str r2, [r6, #8]
	ldr r5, _0801B4DC
	ldr r3, [r6, #8]
	str r5, [r6]
	subs r5, #2
	ldrh r1, [r5]
	ldr r3, _0801B4E0
	lsls r5, r1, #4
	orrs r5, r4
	str r3, [r6, #4]
	str r5, [r6, #8]
	adds r0, r6, #0
	ldr r3, [r6, #8]
	ldr r6, _0801B4E4
	movs r2, #0x44
	adds r1, r2, r6
	ldr r5, _0801B4E8
	movs r4, #0
	mov ip, r1
_0801B41C:
	ldrh r2, [r7]
	adds r1, r4, #0
	muls r1, r2, r1
	lsls r3, r1, #1
	adds r2, r7, r3
	adds r1, r2, #4
	movs r3, #0xc0
	str r1, [r0]
	lsls r3, r3, #0x13
	lsls r1, r4, #6
	adds r3, r3, r1
	str r3, [r0, #4]
	str r5, [r0, #8]
	adds r2, #0x44
	ldr r3, [r0, #8]
	str r2, [r0]
	ldr r2, _0801B4EC
	adds r3, r1, r2
	str r3, [r0, #4]
	str r5, [r0, #8]
	ldr r3, [r0, #8]
	ldrh r3, [r6]
	adds r2, r4, #0
	muls r2, r3, r2
	adds r3, r6, #4
	lsls r2, r2, #1
	adds r3, r2, r3
	str r3, [r0]
	ldr r3, _0801B4F0
	adds r3, r3, r1
	str r3, [r0, #4]
	str r5, [r0, #8]
	add r2, ip
	ldr r3, [r0, #8]
	str r2, [r0]
	ldr r2, _0801B4F4
	adds r3, r1, r2
	str r3, [r0, #4]
	str r5, [r0, #8]
	adds r4, #1
	ldr r3, [r0, #8]
	cmp r4, #0x13
	ble _0801B41C
	movs r1, #0xf8
	str r1, [sp]
	ldr r0, _0801B4F8
	ldr r1, _0801B4D4
	ldr r7, _0801B4FC
	mov r3, sp
	str r3, [r1]
	ldr r2, _0801B4BC
	str r0, [r1, #4]
	str r7, [r1, #8]
	mov r7, r8
	ldr r3, [r1, #8]
	ldr r0, _0801B500
	strh r2, [r7]
	ldr r2, _0801B504
	str r7, [r1]
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, _0801B508
	ldr r3, [r1, #8]
	movs r1, #0x78
	str r1, [r0]
	ldr r2, _0801B50C
	ldr r0, _0801B510
	str r1, [r2]
	str r1, [r0]
	ldr r1, _0801B514
	movs r0, #0x50
	str r0, [r1]
	ldr r2, _0801B518
	ldr r1, _0801B51C
	str r0, [r2]
	str r0, [r1]
	ldr r0, _0801B520
	movs r1, #0
	b _0801B524
	.byte 0x00, 0x00
_0801B4BC:
	.4byte 0x00000000
_0801B4C0:
	.4byte 0x06003FC6
_0801B4C4:
	.4byte gUnk_08055050
_0801B4C8:
	.4byte gModeFlags
_0801B4CC:
	.4byte gUnk_0809E9AC
_0801B4D0:
	.4byte gUnk_081BAB74
_0801B4D4:
	.4byte 0x040000D4
_0801B4D8:
	.4byte 0x06008000
_0801B4DC:
	.4byte gUnk_080AE812
_0801B4E0:
	.4byte 0x06004000
_0801B4E4:
	.4byte gUnk_081BBE3C
_0801B4E8:
	.4byte 0x80000020
_0801B4EC:
	.4byte 0x06000800
_0801B4F0:
	.4byte 0x06001000
_0801B4F4:
	.4byte 0x06001800
_0801B4F8:
	.4byte 0x02000008
_0801B4FC:
	.4byte 0x85000100
_0801B500:
	.4byte 0x06010000
_0801B504:
	.4byte 0x81004000
_0801B508:
	.4byte 0x0202D424
_0801B50C:
	.4byte 0x0202D418
_0801B510:
	.4byte 0x0202D40C
_0801B514:
	.4byte 0x0202D428
_0801B518:
	.4byte 0x0202D41C
_0801B51C:
	.4byte 0x0202D410
_0801B520:
	.4byte 0x0202D42C
_0801B524:
	str r1, [r0]
	ldr r2, _0801B5C4
	ldr r0, _0801B5C8
	str r1, [r2]
	str r1, [r0]
	ldr r2, _0801B5CC
	ldr r0, _0801B5D0
	movs r3, #0x20
	str r1, [r2]
	str r1, [r0, #8]
	str r1, [r0, #4]
	str r1, [r0, #0x18]
	str r3, [r0, #0x10]
	ldr r0, _0801B5D4
	movs r2, #0x80
	ldr r1, [r0]
	lsls r0, r2, #3
	bics r0, r1
	cmp r0, #0
	beq _0801B5A2
	mov r0, sl
	cmp r0, #0
	beq _0801B58A
_0801B552:
	ldr r1, _0801B5D0
	movs r3, #2
	movs r0, #0x40
	str r3, [r1]
	str r0, [r1, #0xc]
_0801B55C:
	bl fe_spot_init
	bl fe_spr_init
	movs r0, #4
	bl music_play_if_changed
	bl fade_to_normal
	ldr r0, _0801B5D8
	ldr r1, _0801B5DC
	str r0, [r1]
	ldr r0, _0801B5E0
	ldr r1, _0801B5E4
	bl AGBPrintf
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801B58A:
	ldr r1, _0801B5E8
	adds r0, r1, #0
	adds r2, r1, #0
	adds r0, #0x22
	adds r2, #0x21
	ldrb r7, [r0]
	ldrb r0, [r2]
	orrs r7, r0
	movs r0, #0x10
	ands r7, r0
	cmp r7, #0
	beq _0801B5B0
_0801B5A2:
	mov r7, sl
	cmp r7, #0
	bne _0801B552
	ldr r2, _0801B5D0
	str r7, [r2]
	str r7, [r2, #0xc]
	b _0801B55C
_0801B5B0:
	mov r3, sl
	strh r3, [r1, #0x14]
	movs r3, #1
	mov sl, r3
	b _0801B5A2
_0801B5BA:
	ldr r7, _0801B5EC
	b _0801B3E2
_0801B5BE:
	ldr r0, _0801B5F0
	b _0801B3D2
	.byte 0x00, 0x00
_0801B5C4:
	.4byte 0x0202D420
_0801B5C8:
	.4byte 0x0202D414
_0801B5CC:
	.4byte 0x0202D430
_0801B5D0:
	.4byte 0x0202D3F0
_0801B5D4:
	.4byte gModeFlags
_0801B5D8:
	.4byte fe_spotscreen_process
_0801B5DC:
	.4byte gStateFunc
_0801B5E0:
	.4byte gUnk_08051950
_0801B5E4:
	.4byte gUnk_08051930
_0801B5E8:
	.4byte gGameSetup
_0801B5EC:
	.4byte gUnk_081BB4D8
_0801B5F0:
	.4byte gUnk_080A698E

	.global fe_spotscreen_process
	.thumb_func
	.type fe_spotscreen_process, %function
fe_spotscreen_process: @ 0801B5F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0801B90C
	movs r4, #0x80
	ldr r0, [r2]
	lsls r1, r4, #3
	ands r0, r1
	sub sp, #0x10
	cmp r0, #0
	bne _0801B60E
	bl _0801BDFE
_0801B60E:
	ldr r0, _0801B910
	mov r8, r0
_0801B612:
	bl fade_update
	bl fe_spot_update
	ldr r6, _0801B914
	ldr r1, [r6, #0xc]
	lsls r5, r1, #0x19
	asrs r0, r5, #0x10
	ldr r5, _0801B918
	bl _call_via_r5
	movs r3, #0x80
	lsls r4, r0, #0x10
	asrs r7, r4, #0x10
	lsls r4, r3, #5
	subs r1, r4, r7
	movs r2, #0xd0
	muls r2, r1, r2
	asrs r7, r2, #0xd
	movs r2, #0xf0
	muls r2, r1, r2
	ldr r1, [r6, #0x10]
	asrs r0, r2, #0xd
	lsls r3, r1, #0x1a
	str r0, [r6, #0x14]
	asrs r0, r3, #0x10
	bl _call_via_r5
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	ldr r0, [r6, #0x18]
	subs r3, r4, r1
	asrs r4, r3, #9
	cmp r0, #0x14
	bne _0801B65A
	b _0801BDF0
_0801B65A:
	ldr r1, _0801B91C
	ldr r0, [r6, #0x14]
	strh r7, [r1]
	movs r3, #0x10
	adds r1, #0xc
	strh r0, [r1]
	subs r1, r3, r4
	movs r3, #6
	muls r3, r1, r3
	lsls r2, r4, #4
	adds r0, r3, r2
	asrs r2, r0, #4
	lsls r0, r2, #8
	adds r2, r0, r1
	ldr r0, _0801B920
	strh r2, [r0]
	bl fe_frame_end
	ldr r2, _0801B924
	movs r1, #0x3c
	ldr r0, [r2]
	bl __umodsi3
	cmp r0, #0x1d
	bhi _0801B6A8
	ldr r3, [r6, #0x14]
	movs r2, #0
	movs r1, #0x80
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	lsls r2, r1, #3
	rsbs r0, r3, #0
	str r2, [sp, #0xc]
	movs r1, #0
	ldr r2, _0801B928
	ldr r3, _0801B92C
	bl fe_spr_plot
_0801B6A8:
	ldr r3, [r6]
	cmp r3, #5
	bhi _0801B774
	ldr r2, _0801B930
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	mov pc, r0
	.byte 0x00, 0x00
	.global _0801B6B8
_0801B6B8:
	.4byte _0801B6D0
	.4byte _0801BA9C
	.4byte _0801BAC2
	.4byte _0801BD6A
	.4byte _0801BD90
	.4byte _0801BDD4
	.global _0801B6D0
_0801B6D0:
	ldr r2, _0801B914
	ldr r3, [r2, #0x10]
	cmp r3, #0
	bgt _0801B6DA
	b _0801BA96
_0801B6DA:
	subs r3, #1
	str r3, [r2, #0x10]
	cmp r3, #0
	bne _0801B6E4
	b _0801BA8E
_0801B6E4:
	ldr r6, _0801B924
	ldr r4, [r6]
	movs r6, #0x10
	ands r4, r6
	cmp r4, #0
	beq _0801B706
	ldr r5, _0801B914
	ldr r4, [r5, #4]
	cmp r4, #1
	bne _0801B6FA
	b _0801BA34
_0801B6FA:
	cmp r4, #1
	ble _0801B700
	b _0801B9B8
_0801B700:
	cmp r4, #0
	bne _0801B706
	b _0801B948
_0801B706:
	ldr r3, _0801B914
	ldr r2, [r3, #4]
	ldr r4, _0801B934
	lsls r5, r2, #2
	ldr r0, [r4, r5]
	movs r1, #0
	bl fe_get_text
	ldr r5, _0801B938
	adds r1, r5, #0
	adds r4, r0, #0
	bl fe_text_width
	lsrs r1, r0, #0x1f
	adds r2, r0, r1
	asrs r1, r2, #1
	movs r2, #0x78
	subs r3, r2, r1
	movs r1, #0x7f
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl fe_text_draw
	bl fe_theme_palette
	movs r4, #0
	adds r3, r0, #0
	movs r1, #0x8d
	movs r0, #0x78
	ldr r2, _0801B93C
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r4, _0801B940
	ldrh r1, [r4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0801B788
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcb
	bl snd_play
	bl fe_title_letters_leave
	ldr r0, _0801B914
	movs r1, #1
	str r1, [r0]
_0801B774:
	ldr r1, _0801B914
	ldr r0, [r1, #0x18]
	adds r0, #1
	str r0, [r1, #0x18]
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801B788:
	movs r5, #2
	adds r2, r5, #0
	ands r2, r1
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0801B7B2
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcc
	bl snd_play
	bl fe_title_letters_leave
	ldr r1, _0801B914
	movs r0, #5
	str r0, [r1]
	bl fade_to_black
	b _0801B774
_0801B7B2:
	ldr r0, _0801B914
	ldr r3, [r0, #4]
	cmp r3, #1
	beq _0801B8B0
	cmp r3, #1
	bgt _0801B850
	cmp r3, #0
	beq _0801B7E4
_0801B7C2:
	ldr r0, _0801B914
	ldr r2, [r0, #4]
	cmp r2, #1
	beq _0801B7DE
	cmp r2, #1
	bgt _0801B7D4
	cmp r2, #0
	bne _0801B774
	b _0801B7D8
_0801B7D4:
	cmp r2, #2
	bne _0801B774
_0801B7D8:
	ldr r1, _0801B944
	strh r2, [r1, #0x14]
	b _0801B774
_0801B7DE:
	ldr r0, _0801B944
	strh r2, [r0, #0x14]
	b _0801B774
_0801B7E4:
	ldr r5, _0801B90C
	movs r2, #0x80
	ldr r0, [r5]
	lsls r3, r2, #3
	ands r0, r3
	cmp r0, #0
	beq _0801B840
_0801B7F2:
	movs r2, #0x14
	ands r2, r1
	cmp r2, #0
	beq _0801B810
	ldr r1, _0801B914
	movs r0, #1
	str r0, [r1, #4]
	bl fe_spot_init
	movs r3, #0x80
	movs r0, #0xc0
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
_0801B810:
	ldr r1, [r5]
	movs r0, #0x80
	lsls r3, r0, #3
	ands r1, r3
	cmp r1, #0
	beq _0801B830
_0801B81C:
	ldr r2, _0801B940
	ldrh r0, [r2]
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0801B7C2
	ldr r1, _0801B914
	movs r0, #2
	str r0, [r1, #4]
	b _0801B8EA
_0801B830:
	ldr r2, _0801B944
	adds r2, #0x22
	ldrb r0, [r2]
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0801B81C
	b _0801B7C2
_0801B840:
	ldr r0, _0801B944
	adds r0, #0x21
	ldrb r2, [r0]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0801B7F2
	b _0801B810
_0801B850:
	cmp r3, #2
	bne _0801B7C2
	movs r0, #0xa4
	ands r0, r1
	cmp r0, #0
	beq _0801B870
	ldr r1, _0801B914
	str r2, [r1, #4]
	bl fe_spot_init
	movs r3, #0x80
	movs r0, #0xc0
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
_0801B870:
	ldr r2, _0801B90C
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #3
	ands r0, r1
	cmp r0, #0
	beq _0801B8A0
_0801B87E:
	ldrh r3, [r4]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0801B7C2
	ldr r1, _0801B914
	movs r2, #1
	str r2, [r1, #4]
	bl fe_spot_init
	movs r3, #0x80
	movs r0, #0xc0
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	b _0801B7C2
_0801B8A0:
	ldr r2, _0801B944
	adds r2, #0x21
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0801B87E
	b _0801B7C2
_0801B8B0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801B8CC
	ldr r1, _0801B914
	str r2, [r1, #4]
	bl fe_spot_init
	movs r3, #0x80
	movs r0, #0xc0
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
_0801B8CC:
	ldr r2, _0801B90C
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #3
	ands r0, r1
	cmp r0, #0
	beq _0801B8FC
_0801B8DA:
	ldrh r3, [r4]
	movs r0, #0x44
	ands r0, r3
	cmp r0, #0
	bne _0801B8E6
	b _0801B7C2
_0801B8E6:
	ldr r1, _0801B914
	str r5, [r1, #4]
_0801B8EA:
	bl fe_spot_init
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xc0
	bl snd_play
	b _0801B7C2
_0801B8FC:
	ldr r2, _0801B944
	adds r2, #0x22
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0801B8DA
	b _0801B7C2
_0801B90C:
	.4byte gModeFlags
_0801B910:
	.4byte gUnk_08051924
_0801B914:
	.4byte 0x0202D3F0
_0801B918:
	.4byte cos_fx
_0801B91C:
	.4byte 0x04000010
_0801B920:
	.4byte 0x04000052
_0801B924:
	.4byte 0x03005660
_0801B928:
	.4byte gUnk_08629650
_0801B92C:
	.4byte gUnk_0863FB20
_0801B930:
	.4byte _0801B6B8
_0801B934:
	.4byte gUnk_0805190C
_0801B938:
	.4byte gUnk_0863FDE8
_0801B93C:
	.4byte gUnk_082961F0
_0801B940:
	.4byte gKeysNew
_0801B944:
	.4byte gGameSetup
_0801B948:
	ldr r5, _0801BCA4
	movs r1, #0x80
	ldr r0, [r5]
	lsls r3, r1, #3
	ands r0, r3
	cmp r0, #0
	beq _0801B9A8
_0801B956:
	bl fe_theme_palette
	movs r1, #0x81
	adds r3, r0, #0
	ldr r2, _0801BCA8
	movs r0, #0x78
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
_0801B96E:
	ldr r4, [r5]
	movs r3, #0x80
	lsls r5, r3, #3
	ands r4, r5
	cmp r4, #0
	beq _0801B998
_0801B97A:
	bl fe_theme_palette
	movs r4, #0
	adds r3, r0, #0
	movs r5, #1
	movs r0, #0xc3
	movs r1, #0x8d
	ldr r2, _0801BCA8
	str r5, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _0801B706
_0801B998:
	ldr r2, _0801BCAC
	adds r2, #0x21
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0801B97A
	b _0801B706
_0801B9A8:
	ldr r2, _0801BCAC
	adds r2, #0x22
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0801B956
	b _0801B96E
_0801B9B8:
	cmp r4, #2
	beq _0801B9BE
	b _0801B706
_0801B9BE:
	bl fe_theme_palette
	ldr r5, _0801BCA8
	adds r3, r0, #0
	movs r0, #0x80
	movs r4, #0
	lsls r7, r0, #6
	movs r1, #0x97
	adds r2, r5, #0
	movs r0, #0x78
	str r7, [sp, #8]
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	bl fe_theme_palette
	movs r1, #0x80
	adds r3, r0, #0
	lsls r0, r1, #5
	str r0, [sp, #8]
	movs r1, #0x8d
	movs r0, #0x2d
	adds r2, r5, #0
	movs r7, #1
	str r7, [sp]
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r2, _0801BCA4
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #3
	ands r0, r1
	cmp r0, #0
	beq _0801BA24
_0801BA0A:
	bl fe_theme_palette
	movs r1, #0x8d
	adds r3, r0, #0
	adds r2, r5, #0
	movs r0, #0xc3
	str r7, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _0801B706
_0801BA24:
	ldr r2, _0801BCAC
	adds r2, #0x21
	ldrb r0, [r2]
	adds r1, r6, #0
	ands r1, r0
	cmp r1, #0
	bne _0801BA0A
	b _0801B706
_0801BA34:
	ldr r2, _0801BCA4
	movs r4, #0x80
	ldr r0, [r2]
	lsls r1, r4, #3
	ands r0, r1
	cmp r0, #0
	beq _0801BA7E
_0801BA42:
	bl fe_theme_palette
	movs r4, #0
	adds r3, r0, #0
	movs r1, #0x81
	movs r0, #0x78
	ldr r2, _0801BCA8
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
_0801BA5C:
	bl fe_theme_palette
	movs r1, #0x80
	adds r3, r0, #0
	lsls r0, r1, #5
	movs r5, #0
	movs r4, #1
	str r0, [sp, #8]
	movs r1, #0x8d
	movs r0, #0x2d
	ldr r2, _0801BCA8
	str r4, [sp]
	str r5, [sp, #4]
	str r5, [sp, #0xc]
	bl fe_spr_plot
	b _0801B706
_0801BA7E:
	ldr r1, _0801BCAC
	adds r1, #0x22
	ldrb r0, [r1]
	adds r5, r6, #0
	ands r5, r0
	cmp r5, #0
	bne _0801BA42
	b _0801BA5C
_0801BA8E:
	movs r0, #0xae
	bl fe_title_letters_start
	b _0801B6E4
_0801BA96:
	bl fe_draw_title
	b _0801B6E4
	.global _0801BA9C
_0801BA9C:
	bl fe_draw_title
	ldr r4, _0801BCB0
	ldr r3, [r4, #0x10]
	cmp r3, #0x1f
	bgt _0801BAAC
	adds r3, #1
	str r3, [r4, #0x10]
_0801BAAC:
	ldr r3, [r4, #0xc]
	cmp r3, #0x3f
	bgt _0801BAB8
	adds r3, #1
	str r3, [r4, #0xc]
	b _0801B774
_0801BAB8:
	bl fe_spot_init
	movs r2, #2
	str r2, [r4]
	b _0801B774
	.global _0801BAC2
_0801BAC2:
	ldr r2, _0801BCB0
	ldr r3, [r2, #0x10]
	cmp r3, #0
	bgt _0801BACC
	b _0801BD64
_0801BACC:
	subs r3, #1
	str r3, [r2, #0x10]
	cmp r3, #0
	bne _0801BAD6
	b _0801BD5C
_0801BAD6:
	ldr r0, _0801BCB4
	ldr r5, [r0]
	movs r4, #0x10
	ands r5, r4
	cmp r5, #0
	beq _0801BAF8
	ldr r3, _0801BCB0
	ldr r6, [r3, #8]
	cmp r6, #1
	bne _0801BAEC
	b _0801BD22
_0801BAEC:
	cmp r6, #1
	ble _0801BAF2
	b _0801BCC4
_0801BAF2:
	cmp r6, #0
	bne _0801BAF8
	b _0801BC6C
_0801BAF8:
	ldr r3, _0801BCB0
	ldr r4, [r3, #8]
	mov r2, r8
	lsls r5, r4, #2
	ldr r0, [r5, r2]
	movs r1, #0
	bl fe_get_text
	ldr r5, _0801BCB8
	adds r1, r5, #0
	adds r4, r0, #0
	bl fe_text_width
	lsrs r1, r0, #0x1f
	adds r2, r0, r1
	asrs r1, r2, #1
	movs r0, #0x7f
	movs r2, #0x78
	subs r3, r2, r1
	str r0, [sp]
	adds r1, r5, #0
	adds r0, r4, #0
	movs r2, #0
	bl fe_text_draw
	bl fe_theme_palette
	movs r4, #0
	adds r3, r0, #0
	movs r1, #0x8d
	ldr r2, _0801BCBC
	movs r0, #0x78
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r4, _0801BCC0
	ldrh r2, [r4]
	movs r1, #9
	ands r1, r2
	cmp r1, #0
	beq _0801BB6C
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcb
	bl snd_play
	bl fe_title_letters_leave
	ldr r2, _0801BCB0
	movs r0, #4
	str r0, [r2]
	bl fade_to_black
	b _0801B774
_0801BB6C:
	movs r5, #2
	adds r1, r5, #0
	ands r1, r2
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0801BBC2
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcc
	bl snd_play
	bl fe_title_letters_leave
	ldr r2, _0801BCA4
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #3
	ands r0, r1
	cmp r0, #0
	beq _0801BBA0
_0801BB98:
	ldr r1, _0801BCB0
	movs r0, #3
	str r0, [r1]
	b _0801B774
_0801BBA0:
	ldr r3, _0801BCAC
	adds r1, r3, #0
	adds r1, #0x20
	adds r3, #0x21
	ldrb r0, [r1]
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0801BB98
	ldr r0, _0801BCB0
	movs r2, #5
	str r2, [r0]
	bl fade_to_black
	b _0801B774
_0801BBC2:
	ldr r0, _0801BCB0
	ldr r3, [r0, #8]
	cmp r3, #1
	beq _0801BC2E
	cmp r3, #1
	bgt _0801BBF8
	cmp r3, #0
	beq _0801BBD4
	b _0801B774
_0801BBD4:
	movs r1, #0x14
	ands r1, r2
	cmp r1, #0
	beq _0801BBF4
	ldr r0, _0801BCB0
	movs r2, #1
	str r2, [r0, #8]
	bl fe_spot_init
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldrh r2, [r4]
_0801BBF4:
	movs r1, #0x40
	b _0801BC4E
_0801BBF8:
	cmp r3, #2
	beq _0801BBFE
	b _0801B774
_0801BBFE:
	movs r0, #0xa4
	ands r0, r2
	cmp r0, #0
	beq _0801BC1C
	ldr r2, _0801BCB0
	str r1, [r2, #8]
	bl fe_spot_init
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldrh r2, [r4]
_0801BC1C:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	bne _0801BC26
	b _0801B774
_0801BC26:
	ldr r2, _0801BCB0
	movs r0, #1
	str r0, [r2, #8]
	b _0801BC5A
_0801BC2E:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801BC4C
	ldr r2, _0801BCB0
	str r1, [r2, #8]
	bl fe_spot_init
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldrh r2, [r4]
_0801BC4C:
	movs r1, #0x44
_0801BC4E:
	ands r1, r2
	cmp r1, #0
	bne _0801BC56
	b _0801B774
_0801BC56:
	ldr r0, _0801BCB0
	str r5, [r0, #8]
_0801BC5A:
	bl fe_spot_init
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xc0
	bl snd_play
	b _0801B774
_0801BC6C:
	bl fe_theme_palette
	ldr r5, _0801BCA8
	adds r3, r0, #0
	adds r2, r5, #0
	movs r1, #0x81
	movs r0, #0x78
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	bl fe_theme_palette
	movs r1, #1
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xc3
	movs r1, #0x8d
	adds r2, r5, #0
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	bl fe_spr_plot
	b _0801BAF8
	.byte 0x00, 0x00
_0801BCA4:
	.4byte gModeFlags
_0801BCA8:
	.4byte gUnk_08294DF0
_0801BCAC:
	.4byte gGameSetup
_0801BCB0:
	.4byte 0x0202D3F0
_0801BCB4:
	.4byte 0x03005660
_0801BCB8:
	.4byte gUnk_0863FDE8
_0801BCBC:
	.4byte gUnk_082961F0
_0801BCC0:
	.4byte gKeysNew
_0801BCC4:
	cmp r6, #2
	beq _0801BCCA
	b _0801BAF8
_0801BCCA:
	bl fe_theme_palette
	ldr r5, _0801BE08
	adds r3, r0, #0
	movs r0, #0x80
	movs r4, #0
	lsls r6, r0, #6
	movs r1, #0x97
	adds r2, r5, #0
	movs r0, #0x78
	str r6, [sp, #8]
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	bl fe_theme_palette
	movs r1, #0x80
	adds r3, r0, #0
	lsls r0, r1, #5
	str r0, [sp, #8]
	movs r1, #0x8d
	adds r2, r5, #0
	movs r6, #1
	movs r0, #0x2d
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	bl fe_theme_palette
	movs r1, #0x8d
	adds r3, r0, #0
	adds r2, r5, #0
	movs r0, #0xc3
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _0801BAF8
_0801BD22:
	bl fe_theme_palette
	ldr r5, _0801BE08
	movs r4, #0
	adds r3, r0, #0
	adds r2, r5, #0
	movs r1, #0x81
	movs r0, #0x78
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	bl fe_theme_palette
	movs r1, #0x80
	adds r3, r0, #0
	lsls r0, r1, #5
	str r0, [sp, #8]
	movs r1, #0x8d
	movs r0, #0x2d
	adds r2, r5, #0
	str r6, [sp]
	str r4, [sp, #4]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	b _0801BAF8
_0801BD5C:
	movs r0, #5
	bl fe_title_letters_start
	b _0801BAD6
_0801BD64:
	bl fe_draw_title
	b _0801BAD6
	.global _0801BD6A
_0801BD6A:
	bl fe_draw_title
	ldr r4, _0801BE0C
	ldr r3, [r4, #0x10]
	cmp r3, #0x1f
	bgt _0801BD7A
	adds r3, #1
	str r3, [r4, #0x10]
_0801BD7A:
	ldr r3, [r4, #0xc]
	cmp r3, #0
	ble _0801BD86
	subs r3, #1
	str r3, [r4, #0xc]
	b _0801B774
_0801BD86:
	movs r1, #0
	str r1, [r4]
	bl fe_spot_init
	b _0801B774
	.global _0801BD90
_0801BD90:
	bl fe_draw_title
	ldr r2, _0801BE10
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	bne _0801BDA4
	b _0801B774
_0801BDA4:
	ldr r0, _0801BE0C
	ldr r3, [r0, #8]
	cmp r3, #1
	beq _0801BDCC
	cmp r3, #1
	bgt _0801BDBE
	cmp r3, #0
	beq _0801BDB6
	b _0801B774
_0801BDB6:
	movs r0, #1
	bl mcp_process
	b _0801B774
_0801BDBE:
	cmp r3, #2
	beq _0801BDC4
	b _0801B774
_0801BDC4:
	movs r0, #3
	bl mcp_process
	b _0801B774
_0801BDCC:
	movs r0, #2
	bl mcp_process
	b _0801B774
	.global _0801BDD4
_0801BDD4:
	bl fe_draw_title
	ldr r2, _0801BE10
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	bne _0801BDE8
	b _0801B774
_0801BDE8:
	movs r0, #0
	bl mcp_process
	b _0801B774
_0801BDF0:
	movs r3, #0x80
	movs r0, #0xc3
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	b _0801B65A
_0801BDFE:
	ldr r2, _0801BE14
	mov r8, r2
	bl _0801B612
	.byte 0x00, 0x00
_0801BE08:
	.4byte gUnk_08294DF0
_0801BE0C:
	.4byte 0x0202D3F0
_0801BE10:
	.4byte gModeFlags
_0801BE14:
	.4byte gUnk_08051918

	.global fe_spot_vblank
	.thumb_func
	.type fe_spot_vblank, %function
fe_spot_vblank: @ 0801BE18
	push {lr}
	bl vblank_handler_noaudio
	ldr r2, _0801BE38
	ldr r1, _0801BE3C
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _0801BE40
	ldrh r1, [r0]
	ldr r0, _0801BE44
	strh r1, [r0]
	bl snd_update_if_enabled
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801BE38:
	.4byte 0x0202D434
_0801BE3C:
	.4byte 0x04000040
_0801BE40:
	.4byte 0x0202D574
_0801BE44:
	.4byte 0x04000042

	.global fe_spot_hblank
	.thumb_func
	.type fe_spot_hblank, %function
fe_spot_hblank: @ 0801BE48
	push {lr}
	ldr r0, _0801BE70
	ldrh r1, [r0]
	adds r1, #1
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bhi _0801BE6A
	ldr r0, _0801BE74
	lsls r1, r1, #1
	ldrh r2, [r0, r1]
	ldr r0, _0801BE78
	strh r2, [r0]
	ldr r2, _0801BE7C
	ldrh r0, [r2, r1]
	ldr r1, _0801BE80
	strh r0, [r1]
_0801BE6A:
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801BE70:
	.4byte 0x04000006
_0801BE74:
	.4byte 0x0202D434
_0801BE78:
	.4byte 0x04000040
_0801BE7C:
	.4byte 0x0202D574
_0801BE80:
	.4byte 0x04000042

	.global fe_spot_set
	.thumb_func
	.type fe_spot_set, %function
fe_spot_set: @ 0801BE84
	push {r4, lr}
	ldr r3, _0801BEB8
	movs r4, #0x20
	str r4, [r3]
	ldr r3, _0801BEBC
	ldr r4, [r3]
	ldr r3, _0801BEC0
	str r4, [r3]
	ldr r3, _0801BEC4
	ldr r4, [r3]
	ldr r3, _0801BEC8
	str r4, [r3]
	ldr r3, _0801BECC
	ldr r4, [r3]
	ldr r3, _0801BED0
	str r4, [r3]
	ldr r3, _0801BED4
	str r0, [r3]
	ldr r0, _0801BED8
	str r1, [r0]
	ldr r0, _0801BEDC
	str r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801BEB8:
	.4byte 0x0202D430
_0801BEBC:
	.4byte 0x0202D40C
_0801BEC0:
	.4byte 0x0202D418
_0801BEC4:
	.4byte 0x0202D410
_0801BEC8:
	.4byte 0x0202D41C
_0801BECC:
	.4byte 0x0202D414
_0801BED0:
	.4byte 0x0202D420
_0801BED4:
	.4byte 0x0202D424
_0801BED8:
	.4byte 0x0202D428
_0801BEDC:
	.4byte 0x0202D42C

	.global fe_options_init
	.thumb_func
	.type fe_options_init, %function
fe_options_init: @ 0801BEE0
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r6, r0, #0
	ldr r1, _0801BF34
	ldr r0, _0801BF38
	sub sp, #0xc
	ldr r7, _0801BF28
	bl AGBPrintf
	ldr r0, _0801BF3C
	ldr r4, _0801BF40
	strh r7, [r0]
	ldr r5, _0801BF2C
	ldrh r1, [r4]
	orrs r1, r5
	strh r1, [r4]
	movs r3, #3
	ldrh r1, [r4]
	rsbs r2, r3, #0
	ands r2, r1
	strh r2, [r4]
	ldr r4, _0801BF44
	ldr r3, _0801BF30
	ldrh r1, [r4]
	orrs r1, r3
	strh r1, [r4]
	movs r3, #0x11
	ldrh r2, [r4]
	rsbs r1, r3, #0
	ands r1, r2
	b _0801BF48
	.byte 0x00, 0x00
_0801BF28:
	.4byte 0x00000000
_0801BF2C:
	.4byte 0x00000001
_0801BF30:
	.4byte 0x00000008
_0801BF34:
	.4byte gUnk_080519A0
_0801BF38:
	.4byte gUnk_080519B0
_0801BF3C:
	.4byte 0x04000208
_0801BF40:
	.4byte 0x04000200
_0801BF44:
	.4byte 0x04000004
_0801BF48:
	strh r1, [r4]
	ldr r3, _0801BF94
	ldr r4, _0801BF98
	movs r2, #0x80
	str r3, [r4]
	strh r5, [r0]
	ldr r0, _0801BF8C
	lsls r4, r2, #0x13
	ldr r1, _0801BF90
	strh r0, [r4]
	adds r4, #8
	strh r1, [r4]
	adds r4, #8
	strh r7, [r4]
	adds r4, #2
	strh r7, [r4]
	adds r4, #2
	strh r7, [r4]
	adds r4, #2
	strh r7, [r4]
	adds r4, #0x3a
	strh r7, [r4]
	bl fe_load_bg_palettes
	ldr r7, _0801BF9C
	ldr r1, _0801BFA0
	movs r2, #0xe0
	lsls r0, r2, #0x13
	movs r4, #0
	add r5, sp, #8
	str r4, [sp, #8]
	str r5, [r1]
	str r0, [r1, #4]
	b _0801BFA4
_0801BF8C:
	.4byte 0x00001140
_0801BF90:
	.4byte 0x00000084
_0801BF94:
	.4byte vblank_handler
_0801BF98:
	.4byte gIrqHandler
_0801BF9C:
	.4byte 0x85000100
_0801BFA0:
	.4byte 0x040000D4
_0801BFA4:
	str r7, [r1, #8]
	ldr r2, _0801C02C
	ldr r3, [r1, #8]
	ldr r5, _0801C030
	mov r3, sp
	adds r3, #6
	strh r4, [r3]
	str r3, [r1]
	str r5, [r1, #4]
	str r2, [r1, #8]
	ldr r3, [r1, #8]
	bl fe_spr_init
	ldr r5, _0801C034
	str r4, [r5]
	str r4, [r5, #4]
	str r4, [r5, #0xc]
	str r6, [r5, #8]
	bl sound_disable
	bl fe_spr_reset
	ldr r0, [r5, #8]
	movs r3, #0xc
	muls r3, r0, r3
	ldr r1, _0801C038
	adds r3, #8
	ldr r0, [r1, r3]
	movs r7, #0
	cmp r7, r0
	blt _0801BFE4
	b _0801C0F6
_0801BFE4:
	ldr r2, _0801C03C
	ldr r1, _0801C040
	movs r3, #0xc
	ldr r6, _0801C01C
	mov fp, r5
	mov r8, r2
	mov sb, r3
	movs r5, #0
	mov sl, r1
_0801BFF6:
	ldr r0, _0801C044
	ldrh r2, [r0, #2]
	movs r1, #0x24
	adds r4, r2, r0
	movs r0, #5
	bl fe_spr_add
	mov r2, r8
	str r0, [r5, r2]
	lsls r3, r0, #1
	ldrh r1, [r3, r4]
	adds r0, r4, r1
	ldr r1, _0801C020
	strh r1, [r0]
	ldr r1, _0801C024
	strh r1, [r0, #4]
	ldr r1, _0801C028
	b _0801C048
	.byte 0x00, 0x00
_0801C01C:
	.4byte 0x0000400E
_0801C020:
	.4byte 0x00000005
_0801C024:
	.4byte 0x000080C8
_0801C028:
	.4byte 0x00000000
_0801C02C:
	.4byte 0x81004000
_0801C030:
	.4byte 0x06010000
_0801C034:
	.4byte 0x0202D6F4
_0801C038:
	.4byte gUnk_08051988
_0801C03C:
	.4byte 0x0202D6B4
_0801C040:
	.4byte gUnk_0863FDE8
_0801C044:
	.4byte 0x02024394
_0801C048:
	strh r1, [r0, #6]
	ldr r1, _0801C078
	strh r1, [r0, #0xa]
	ldr r1, _0801C07C
	strh r1, [r0, #0xc]
	ldr r1, _0801C080
	strh r1, [r0, #0x10]
	ldr r1, _0801C084
	strh r1, [r0, #0x12]
	ldr r1, _0801C088
	strh r1, [r0, #0x16]
	ldr r1, _0801C08C
	strh r1, [r0, #0x18]
	ldr r1, _0801C090
	strh r1, [r0, #0x1a]
	ldr r1, _0801C094
	strh r1, [r0, #0x1c]
	ldr r1, _0801C098
	strh r6, [r0, #2]
	strh r1, [r0, #0x1e]
	strh r6, [r0, #8]
	strh r6, [r0, #0xe]
	strh r6, [r0, #0x14]
	b _0801C09C
_0801C078:
	.4byte 0x000080E8
_0801C07C:
	.4byte 0x00000008
_0801C080:
	.4byte 0x00008008
_0801C084:
	.4byte 0x00000010
_0801C088:
	.4byte 0x00008028
_0801C08C:
	.4byte 0x00000018
_0801C090:
	.4byte 0x0000000E
_0801C094:
	.4byte 0x00004040
_0801C098:
	.4byte 0x00000020
_0801C09C:
	ldr r0, [r5, r2]
	bl fe_spr_upload_frame
	mov r1, fp
	ldr r4, [r1, #8]
	mov r1, sb
	muls r1, r4, r1
	ldr r2, _0801C134
	adds r0, r1, #0
	adds r0, #4
	ldr r4, [r2, r0]
	movs r1, #0
	ldr r0, [r5, r4]
	bl fe_get_text
	mov r1, sl
	adds r4, r0, #0
	bl fe_text_width
	adds r3, r0, #0
	rsbs r0, r3, #0
	lsrs r3, r0, #0x1f
	adds r1, r0, r3
	asrs r2, r1, #1
	mov r1, r8
	ldr r0, [r5, r1]
	movs r3, #0
	str r0, [sp]
	mov r1, sl
	adds r0, r4, #0
	bl fe_spr_draw
	mov r2, fp
	ldr r0, [r2, #8]
	mov r2, sb
	muls r2, r0, r2
	ldr r1, _0801C134
	adds r3, r2, #0
	adds r3, #8
	ldr r0, [r1, r3]
	adds r7, #1
	adds r5, #4
	cmp r7, r0
	bge _0801C0F6
	b _0801BFF6
_0801C0F6:
	bl sound_enable
	movs r0, #4
	bl music_play_if_changed
	bl fade_to_normal
	ldr r2, _0801C138
	ldr r1, [r2, #8]
	movs r0, #0xc
	muls r1, r0, r1
	ldr r2, _0801C134
	ldr r0, [r2, r1]
	bl fe_title_letters_start
	ldr r3, _0801C13C
	ldr r1, _0801C140
	ldr r0, _0801C144
	str r3, [r1]
	ldr r1, _0801C148
	bl AGBPrintf
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801C134:
	.4byte gUnk_08051988
_0801C138:
	.4byte 0x0202D6F4
_0801C13C:
	.4byte fe_options_process
_0801C140:
	.4byte gStateFunc
_0801C144:
	.4byte gUnk_080519BC
_0801C148:
	.4byte gUnk_080519A0

	.global fe_options_process
	.thumb_func
	.type fe_options_process, %function
fe_options_process: @ 0801C14C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	bl fade_update
	ldr r1, _0801C450
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0801C168
	ldr r5, _0801C454
	ldr r4, [r5]
	ldr r0, _0801C458
	lsrs r2, r4, #2
	strh r2, [r0]
_0801C168:
	bl fe_frame_end
	bl fe_draw_title
	add r6, sp, #0x10
	adds r0, r6, #0
	movs r1, #0x16
	bl fe_text_number
	movs r5, #0
	adds r0, r6, #0
	ldr r1, _0801C45C
	movs r2, #0
	movs r3, #0
	str r5, [sp]
	bl fe_text_draw
	ldr r6, _0801C460
	ldr r1, [r6]
	cmp r1, #0
	ble _0801C1B6
	ldr r2, _0801C454
	ldr r0, [r2]
	movs r4, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0801C1B6
	bl fe_theme_palette
	movs r1, #0x5c
	adds r3, r0, #0
	ldr r2, _0801C464
	movs r0, #0x78
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	bl fe_spr_plot
_0801C1B6:
	ldr r1, [r6, #8]
	movs r4, #0xc
	muls r4, r1, r4
	ldr r3, _0801C468
	adds r4, #8
	ldr r1, [r3, r4]
	ldr r0, [r6]
	subs r1, #1
	cmp r0, r1
	bge _0801C1F4
	ldr r2, _0801C454
	ldr r0, [r2]
	movs r4, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0801C1F4
	bl fe_theme_palette
	movs r4, #0x80
	lsls r1, r4, #6
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	movs r1, #0x72
	movs r0, #0x78
	ldr r2, _0801C464
	bl fe_spr_plot
_0801C1F4:
	movs r4, #0
_0801C1F6:
	ldr r0, [r6]
	adds r2, r0, r4
	subs r0, r2, #3
	cmp r0, #0
	blt _0801C23A
	ldr r2, [r6, #8]
	movs r3, #0xc
	muls r3, r2, r3
	ldr r1, _0801C468
	adds r3, #8
	ldr r6, [r1, r3]
	cmp r0, r6
	bge _0801C23A
	lsls r5, r4, #4
	adds r1, r5, #0
	adds r1, #0x28
	ldr r6, _0801C46C
	cmp r4, #3
	bne _0801C21E
	b _0801C44C
_0801C21E:
	ldr r5, _0801C470
_0801C220:
	ldr r2, _0801C474
	lsls r3, r0, #2
	ldr r0, [r2, r3]
	movs r2, #0
	str r0, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x78
	adds r2, r6, #0
	adds r3, r5, #0
	bl fe_spr_plot
_0801C23A:
	adds r4, #1
	cmp r4, #6
	bgt _0801C242
	b _0801C448
_0801C242:
	bl fe_theme_palette
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x78
	movs r1, #0x67
	ldr r2, _0801C478
	bl fe_spr_plot
	ldr r4, _0801C460
	ldr r3, [r4, #0xc]
	adds r6, r4, #0
	cmp r3, #1
	bne _0801C268
	b _0801C382
_0801C268:
	cmp r3, #1
	ble _0801C26E
	b _0801C364
_0801C26E:
	cmp r3, #0
	beq _0801C27A
_0801C272:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801C27A:
	ldr r1, _0801C47C
	ldrh r2, [r1]
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0801C298
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xcb
	bl snd_play
	movs r2, #1
	str r2, [r4, #0xc]
	b _0801C2B0
_0801C298:
	movs r5, #2
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _0801C2BA
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcc
	bl snd_play
	str r5, [r4, #0xc]
_0801C2B0:
	bl fe_title_letters_leave
	bl fade_to_black
	b _0801C272
_0801C2BA:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0801C2F4
	ldr r2, [r4]
	cmp r2, #0
	ble _0801C2F4
	movs r3, #0x80
	movs r0, #0xc0
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	ldr r6, [r4]
	subs r6, #1
	str r6, [r4]
	adds r6, r4, #0
_0801C2DC:
	ldr r2, [r6]
	ldr r3, [r6, #4]
	cmp r2, r3
	bge _0801C2E8
	str r2, [r6, #4]
	adds r3, r2, #0
_0801C2E8:
	adds r3, #6
	cmp r2, r3
	ble _0801C272
	subs r1, r2, #6
	str r1, [r6, #4]
	b _0801C272
_0801C2F4:
	ldrh r3, [r1]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0801C328
	ldr r0, [r4, #8]
	movs r3, #0xc
	muls r3, r0, r3
	ldr r2, _0801C468
	adds r3, #8
	ldr r0, [r2, r3]
	ldr r2, [r4]
	subs r0, #1
	cmp r2, r0
	bge _0801C328
	movs r6, #0x80
	movs r1, #0x7f
	lsls r2, r6, #9
	movs r0, #0xc0
	bl snd_play
	ldr r1, [r4]
	adds r6, r4, #0
	adds r1, #1
	str r1, [r4]
	b _0801C2DC
_0801C328:
	ldrh r3, [r1]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _0801C2DC
	movs r3, #0x80
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r0, #0xc0
	bl snd_play
	ldr r1, _0801C460
	ldr r6, [r1, #8]
	movs r0, #0xc
	muls r0, r6, r0
	ldr r3, _0801C468
	adds r0, #8
	ldr r6, [r3, r0]
	ldr r2, [r1]
	subs r6, #1
	cmp r2, r6
	bge _0801C35C
	adds r0, r2, #1
	adds r6, r1, #0
	str r0, [r1]
	b _0801C2DC
_0801C35C:
	movs r2, #0
	str r2, [r1]
	adds r6, r1, #0
	b _0801C2DC
_0801C364:
	cmp r3, #2
	beq _0801C36A
	b _0801C272
_0801C36A:
	ldr r2, _0801C480
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	bne _0801C37A
	b _0801C272
_0801C37A:
	movs r0, #0
	bl mcp_process
	b _0801C272
_0801C382:
	ldr r2, _0801C480
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	bne _0801C392
	b _0801C272
_0801C392:
	ldr r3, [r4, #8]
	cmp r3, #0
	beq _0801C3A4
	cmp r3, #1
	bne _0801C440
	ldr r3, [r4]
	ldr r0, _0801C450
	strh r3, [r0, #0x18]
	b _0801C440
_0801C3A4:
	ldr r2, [r4]
	cmp r2, #5
	bhi _0801C440
	ldr r3, _0801C484
	lsls r1, r2, #2
	ldr r0, [r1, r3]
	mov pc, r0
	.byte 0x00, 0x00
	.global _0801C3B4
_0801C3B4:
	.4byte _0801C3CC
	.4byte _0801C3D4
	.4byte _0801C3DC
	.4byte _0801C420
	.4byte _0801C428
	.4byte _0801C430
	.global _0801C3CC
_0801C3CC:
	movs r0, #1
	bl mcp_process
	b _0801C272
	.global _0801C3D4
_0801C3D4:
	movs r0, #2
	bl mcp_process
	b _0801C272
	.global _0801C3DC
_0801C3DC:
	ldr r3, _0801C450
	adds r2, r3, #0
	movs r1, #0
	movs r4, #3
	movs r0, #1
	adds r2, #0x6c
_0801C3E8:
	adds r3, r1, #0
	ands r3, r4
	adds r3, #1
	strb r3, [r2]
	ldrb r3, [r2, #0xc]
	cmp r3, #0
	beq _0801C41C
_0801C3F6:
	adds r1, #1
	adds r2, #1
	cmp r1, #0xb
	ble _0801C3E8
	ldr r2, _0801C450
	adds r1, r2, #0
	adds r1, #0x22
	ldrb r3, [r1]
	movs r0, #0x10
	orrs r3, r0
	strb r3, [r1]
	adds r2, #0x21
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	movs r0, #3
	bl mcp_process
	b _0801C272
_0801C41C:
	strb r0, [r2, #0xc]
	b _0801C3F6
	.global _0801C420
_0801C420:
	movs r0, #4
	bl mcp_process
	b _0801C272
	.global _0801C428
_0801C428:
	movs r0, #5
	bl mcp_process
	b _0801C272
	.global _0801C430
_0801C430:
	bl save_defaults
	bl save_write
	movs r0, #6
	bl mcp_process
	b _0801C272
_0801C440:
	movs r0, #0
	bl mcp_process
	b _0801C272
_0801C448:
	ldr r6, _0801C460
	b _0801C1F6
_0801C44C:
	ldr r5, _0801C488
	b _0801C220
_0801C450:
	.4byte gGameSetup
_0801C454:
	.4byte 0x03005660
_0801C458:
	.4byte 0x04000010
_0801C45C:
	.4byte gUnk_0863FDE8
_0801C460:
	.4byte 0x0202D6F4
_0801C464:
	.4byte gUnk_08294DF0
_0801C468:
	.4byte gUnk_08051988
_0801C46C:
	.4byte 0x02024394
_0801C470:
	.4byte gUnk_0863EE20
_0801C474:
	.4byte 0x0202D6B4
_0801C478:
	.4byte gUnk_082961F0
_0801C47C:
	.4byte gKeysNew
_0801C480:
	.4byte gModeFlags
_0801C484:
	.4byte _0801C3B4
_0801C488:
	.4byte gUnk_0863FD80

	.global fe_retry_draw
	.thumb_func
	.type fe_retry_draw, %function
fe_retry_draw: @ 0801C48C
	push {r4, r5, r6, lr}
	movs r1, #0
	movs r0, #0x30
	sub sp, #0x18
	bl fe_get_text
	ldr r6, _0801C5CC
	adds r1, r6, #0
	adds r5, r0, #0
	bl fe_text_width
	adds r1, r0, #0
	lsrs r3, r1, #0x1f
	adds r4, r1, r3
	asrs r1, r4, #1
	movs r0, #0x10
	movs r4, #0x78
	subs r3, r4, r1
	str r0, [sp]
	movs r2, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl fe_text_draw
	movs r1, #0
	movs r0, #0xf
	bl fe_get_text
	adds r1, r6, #0
	adds r5, r0, #0
	bl fe_text_width
	lsrs r2, r0, #0x1f
	adds r1, r0, r2
	asrs r2, r1, #1
	ldr r1, _0801C5D0
	ldr r0, [r1, #4]
	subs r4, r4, r2
	cmp r0, #0
	bne _0801C4DE
	b _0801C5C8
_0801C4DE:
	ldr r2, _0801C5D4
_0801C4E0:
	movs r0, #0x30
	str r0, [sp]
	adds r3, r4, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl fe_text_draw
	movs r1, #0
	movs r0, #0x12
	bl fe_get_text
	ldr r6, _0801C5CC
	adds r1, r6, #0
	adds r5, r0, #0
	bl fe_text_width
	lsrs r1, r0, #0x1f
	adds r4, r0, r1
	ldr r0, _0801C5D0
	movs r2, #0x78
	asrs r1, r4, #1
	subs r4, r2, r1
	ldr r2, [r0, #4]
	cmp r2, #1
	beq _0801C5C4
	ldr r2, _0801C5D4
_0801C514:
	movs r0, #0x43
	str r0, [sp]
	adds r1, r6, #0
	adds r3, r4, #0
	adds r0, r5, #0
	bl fe_text_draw
	bl fe_theme_palette
	ldr r1, _0801C5D8
	ldr r2, _0801C5D0
	adds r3, r0, #0
	ldr r0, [r1]
	ldr r1, [r2, #4]
	movs r2, #0x12
	muls r1, r2, r1
	movs r2, #0
	adds r0, #0x78
	adds r1, #0x3e
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, _0801C5DC
	bl fe_spr_plot
	ldr r2, _0801C5E0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0801C586
	movs r1, #0x3c
	ldrsh r3, [r2, r1]
	cmp r3, #3
	bgt _0801C58E
	movs r5, #0
	cmp r5, r3
	bge _0801C586
	movs r4, #0
	movs r6, #0x3e
_0801C564:
	adds r0, r6, #0
	movs r1, #0x78
	ldr r2, _0801C5E4
	ldr r3, _0801C5E8
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r0, _0801C5E0
	movs r2, #0x3c
	ldrsh r1, [r0, r2]
	adds r5, #1
	adds r6, #0x40
	cmp r5, r1
	blt _0801C564
_0801C586:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
_0801C58E:
	movs r4, #0
	ldr r2, _0801C5E4
	ldr r3, _0801C5E8
	movs r0, #0x3e
	movs r1, #0x78
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	bl fe_spr_plot
	ldr r0, _0801C5E0
	add r4, sp, #0x10
	movs r2, #0x3c
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	bl fe_text_number
	movs r2, #0x6e
	str r2, [sp]
	adds r0, r4, #0
	ldr r1, _0801C5CC
	movs r2, #0
	movs r3, #0x64
	bl fe_text_draw
	b _0801C586
_0801C5C4:
	movs r2, #0
	b _0801C514
_0801C5C8:
	movs r2, #0
	b _0801C4E0
_0801C5CC:
	.4byte gUnk_0863FDE8
_0801C5D0:
	.4byte 0x0202D704
_0801C5D4:
	.4byte gUnk_0863EE20
_0801C5D8:
	.4byte 0x0202D70C
_0801C5DC:
	.4byte gUnk_082962A0
_0801C5E0:
	.4byte gGameSetup
_0801C5E4:
	.4byte gUnk_083D98E0
_0801C5E8:
	.4byte gUnk_0863F660

	.global fe_retry_init
	.thumb_func
	.type fe_retry_init, %function
fe_retry_init: @ 0801C5EC
	push {r4, r5, lr}
	ldr r5, _0801C638
	ldr r0, _0801C63C
	adds r1, r5, #0
	sub sp, #8
	ldr r4, _0801C628
	bl AGBPrintf
	ldr r0, _0801C640
	ldr r1, _0801C644
	strh r4, [r0]
	movs r3, #3
	ldrh r2, [r1]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r1]
	ldr r3, _0801C648
	ldr r1, _0801C64C
	str r3, [r1]
	ldr r1, _0801C62C
	movs r2, #0x80
	strh r1, [r0]
	ldr r1, _0801C630
	lsls r0, r2, #0x13
	strh r1, [r0]
	ldr r1, _0801C634
	adds r0, #8
	strh r1, [r0]
	adds r0, #8
	b _0801C650
_0801C628:
	.4byte 0x00000000
_0801C62C:
	.4byte 0x00000001
_0801C630:
	.4byte 0x00009140
_0801C634:
	.4byte 0x00000084
_0801C638:
	.4byte gUnk_080519C8
_0801C63C:
	.4byte gUnk_080519D8
_0801C640:
	.4byte 0x04000208
_0801C644:
	.4byte 0x04000200
_0801C648:
	.4byte vblank_handler
_0801C64C:
	.4byte gIrqHandler
_0801C650:
	strh r4, [r0]
	ldr r1, _0801C68C
	adds r0, #2
	strh r4, [r0]
	adds r0, #0x38
	strh r1, [r0]
	ldr r1, _0801C690
	adds r0, #6
	strh r1, [r0]
	ldr r1, _0801C694
	adds r0, #4
	strh r1, [r0]
	bl fe_load_bg_palettes
	movs r1, #0xf8
	str r1, [sp, #4]
	ldr r1, _0801C698
	add r0, sp, #4
	str r0, [r1]
	ldr r2, _0801C69C
	ldr r0, _0801C6A0
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r2, _0801C6A4
	ldr r3, [r1, #8]
	ldr r0, _0801C6A8
	mov r3, sp
	adds r3, #2
	strh r4, [r3]
	b _0801C6AC
_0801C68C:
	.4byte 0x00003F1F
_0801C690:
	.4byte 0x000000EF
_0801C694:
	.4byte 0x00000003
_0801C698:
	.4byte 0x040000D4
_0801C69C:
	.4byte 0x02000008
_0801C6A0:
	.4byte 0x85000100
_0801C6A4:
	.4byte 0x06010000
_0801C6A8:
	.4byte 0x81004000
_0801C6AC:
	str r3, [r1]
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r3, [r1, #8]
	bl fe_spr_init
	ldr r0, _0801C6E0
	movs r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	movs r0, #3
	bl music_play_if_changed
	bl fade_to_normal
	ldr r1, _0801C6E4
	ldr r0, _0801C6E8
	str r1, [r0]
	ldr r0, _0801C6EC
	adds r1, r5, #0
	bl AGBPrintf
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
_0801C6E0:
	.4byte 0x0202D704
_0801C6E4:
	.4byte fe_retry_process
_0801C6E8:
	.4byte gStateFunc
_0801C6EC:
	.4byte gUnk_080519E4

	.global fe_retry_process
	.thumb_func
	.type fe_retry_process, %function
fe_retry_process: @ 0801C6F0
	push {r4, r5, lr}
	bl fade_update
	ldr r1, _0801C7DC
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0801C70A
	ldr r5, _0801C7E0
	ldr r4, [r5]
	ldr r0, _0801C7E4
	lsrs r2, r4, #2
	strh r2, [r0]
_0801C70A:
	bl fe_frame_end
	ldr r5, _0801C7E8
	ldr r4, [r5]
	cmp r4, #1
	beq _0801C77A
	cmp r4, #1
	bgt _0801C742
	cmp r4, #0
	beq _0801C724
_0801C71E:
	pop {r4, r5}
	pop {r0}
	bx r0
_0801C724:
	bl fe_retry_draw
	ldr r2, _0801C7EC
	ldr r3, [r2]
	cmp r3, #0
	ble _0801C73C
	subs r3, #5
	str r3, [r2]
	cmp r3, #0
	bge _0801C71E
	str r4, [r2]
	b _0801C71E
_0801C73C:
	movs r1, #1
	str r1, [r5]
	b _0801C71E
_0801C742:
	cmp r4, #2
	bne _0801C71E
	bl fe_retry_draw
	ldr r2, _0801C7EC
	ldr r3, [r2]
	cmp r3, #0xef
	bgt _0801C760
	adds r3, #5
	str r3, [r2]
	cmp r3, #0xf0
	ble _0801C71E
	movs r1, #0xf0
	str r1, [r2]
	b _0801C71E
_0801C760:
	ldr r3, [r5, #4]
	cmp r3, #0
	beq _0801C772
	cmp r3, #1
	bne _0801C71E
	movs r0, #0
	bl mcp_process
	b _0801C71E
_0801C772:
	movs r0, #1
	bl mcp_process
	b _0801C71E
_0801C77A:
	bl fe_retry_draw
	ldr r2, _0801C7F0
	ldrh r1, [r2]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0801C794
	bl fade_to_black
	movs r2, #2
	str r2, [r5]
	b _0801C71E
_0801C794:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801C7B6
	ldr r1, [r5, #4]
	cmp r1, #0
	ble _0801C7B6
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldr r2, [r5, #4]
	subs r2, #1
	str r2, [r5, #4]
	b _0801C71E
_0801C7B6:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801C71E
	ldr r4, _0801C7E8
	ldr r2, [r4, #4]
	cmp r2, #0
	bgt _0801C71E
	movs r3, #0x80
	movs r0, #0xc0
	movs r1, #0x7f
	lsls r2, r3, #9
	bl snd_play
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	b _0801C71E
_0801C7DC:
	.4byte gGameSetup
_0801C7E0:
	.4byte 0x03005660
_0801C7E4:
	.4byte 0x04000010
_0801C7E8:
	.4byte 0x0202D704
_0801C7EC:
	.4byte 0x0202D70C
_0801C7F0:
	.4byte gKeysNew

	.global fe_name_draw_letters
	.thumb_func
	.type fe_name_draw_letters, %function
fe_name_draw_letters: @ 0801C7F4
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	movs r1, #0
	movs r0, #0x7f
	sub sp, #0x24
	bl fe_get_text
	ldr r5, _0801C920
	str r0, [sp, #0x20]
	ldr r3, [r5]
	str r3, [sp, #0x1c]
	ldr r3, [r5, #8]
	mov fp, r3
	ldr r3, _0801C924
	ldr r0, _0801C928
	ldr r1, [r3]
	movs r2, #0
	asrs r4, r1, #0xb
	ands r1, r0
	subs r4, #5
	rsbs r0, r1, #0
	mov sl, r3
	mov sb, r2
	str r4, [sp, #0x18]
	str r0, [sp, #0x14]
_0801C82E:
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x14]
	mov r3, sb
	movs r6, #0x1f
	add r1, sb
	lsls r0, r3, #0xb
	ands r1, r6
	ldr r2, _0801C92C
	str r1, [sp, #0x10]
	adds r7, r4, r0
	adds r1, r7, r2
	ldr r5, [sp, #0x20]
	ldr r6, [sp, #0x10]
	lsls r0, r1, #0x10
	ldrb r7, [r5, r6]
	asrs r5, r0, #0x10
	ldr r2, _0801C930
	adds r0, r5, #0
	bl _call_via_r2
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	mov r8, r0
	ldr r6, _0801C934
	adds r0, r5, #0
	bl _call_via_r6
	lsls r5, r0, #0x10
	asrs r4, r5, #0x10
	mov r2, fp
	lsls r5, r7, #1
	adds r1, r5, r2
	ldrb r0, [r1, #1]
	lsrs r2, r0, #1
	rsbs r1, r2, #0
	subs r1, #9
	movs r0, #0xbe
	mov r6, r8
	muls r6, r0, r6
	adds r3, r1, #0
	muls r3, r4, r3
	adds r7, r6, r3
	asrs r6, r7, #0xc
	mov r3, r8
	muls r3, r1, r3
	adds r7, r4, #0
	muls r7, r0, r7
	movs r1, #0x97
	subs r0, r7, r3
	asrs r2, r0, #0xc
	adds r0, r6, #0
	lsls r6, r1, #1
	subs r1, r6, r2
	mov r2, sl
	ldr r6, [r2, #4]
	ldr r7, [sp, #0x10]
	adds r0, #0x78
	cmp r7, r6
	beq _0801C91C
	ldr r6, _0801C938
_0801C8A6:
	mov r2, fp
	ldrb r7, [r5, r2]
	str r7, [sp]
	movs r7, #0xc0
	lsls r2, r7, #2
	ldr r3, _0801C93C
	str r2, [sp, #4]
	ldr r7, [r3]
	lsls r2, r7, #9
	mov sl, r3
	str r2, [sp, #8]
	adds r3, r6, #0
	movs r7, #0
	ldr r2, [sp, #0x1c]
	str r7, [sp, #0xc]
	bl fe_spr_plot
	mov r2, r8
	movs r6, #0xb5
	rsbs r1, r2, #0
	muls r1, r6, r1
	adds r0, r4, #0
	muls r0, r6, r0
	ldr r2, _0801C940
	mov r3, sl
	ldr r4, [r3]
	asrs r7, r1, #0xc
	adds r1, r2, #0
	asrs r6, r0, #0xc
	adds r1, #8
	lsls r0, r4, #5
	rsbs r3, r7, #0
	strh r6, [r0, r2]
	strh r3, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, #0x18
	strh r7, [r0, r1]
	adds r4, #1
	strh r6, [r0, r2]
	mov r2, sl
	str r4, [r2]
	movs r2, #1
	add sb, r2
	mov r2, sb
	cmp r2, #9
	ble _0801C916
	add sp, #0x24
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801C916:
	ldr r3, _0801C924
	mov sl, r3
	b _0801C82E
_0801C91C:
	ldr r6, _0801C944
	b _0801C8A6
_0801C920:
	.4byte gUnk_0863FDD8
_0801C924:
	.4byte 0x0202D724
_0801C928:
	.4byte 0x000007FF
_0801C92C:
	.4byte 0xFFFFD800
_0801C930:
	.4byte sin_fx
_0801C934:
	.4byte cos_fx
_0801C938:
	.4byte gUnk_0863EFE0
_0801C93C:
	.4byte 0x02024390
_0801C940:
	.4byte 0x0200000E
_0801C944:
	.4byte gUnk_0863FDA0

	.global fe_name_draw_letters_2
	.thumb_func
	.type fe_name_draw_letters_2, %function
fe_name_draw_letters_2: @ 0801C948
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	movs r0, #0x7f
	movs r1, #0
	sub sp, #0x10
	bl fe_get_text
	adds r6, r0, #0
	ldr r0, _0801C9E4
	ldr r2, [r0]
	ldr r3, [r0, #8]
	mov fp, r2
	mov sl, r3
	ldr r2, [r0, #4]
	ldr r3, _0801C9E8
	mov sb, r2
	movs r4, #0
	mov r8, r3
	movs r5, #0x10
	movs r7, #0
_0801C978:
	mov r2, r8
	ldrb r0, [r2, #0x13]
	cmp r4, r0
	beq _0801C9D6
_0801C980:
	mov r2, r8
	ldrb r3, [r5, r2]
	cmp r3, #0
	beq _0801C9CE
	adds r1, r6, r3
	subs r1, #1
	ldrb r2, [r1]
_0801C98E:
	lsls r2, r2, #1
	add r2, sl
	ldrb r1, [r2, #1]
	adds r1, #6
	rsbs r0, r1, #0
	asrs r3, r0, #1
	lsls r1, r4, #5
	adds r0, r1, r3
	ldrb r1, [r2]
	adds r0, #0x60
	str r1, [sp]
	mov r2, fp
	movs r1, #0x38
	mov r3, sb
	str r7, [sp, #4]
	str r7, [sp, #8]
	str r7, [sp, #0xc]
	bl fe_spr_plot
_0801C9B4:
	adds r4, #1
	adds r5, #1
	cmp r4, #2
	ble _0801C978
	add sp, #0x10
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801C9CE:
	adds r0, r6, #0
	adds r0, #0x26
	ldrb r2, [r0]
	b _0801C98E
_0801C9D6:
	ldr r2, _0801C9EC
	ldr r1, [r2]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0801C980
	b _0801C9B4
_0801C9E4:
	.4byte gUnk_0863FDD8
_0801C9E8:
	.4byte 0x0202D710
_0801C9EC:
	.4byte 0x03005660

	.global fe_name_init
	.thumb_func
	.type fe_name_init, %function
fe_name_init: @ 0801C9F0
	push {r4, r5, lr}
	ldr r5, _0801CA24
	ldr r4, _0801CA30
	ldr r0, _0801CA34
	ldr r1, _0801CA38
	sub sp, #8
	bl AGBPrintf
	strh r5, [r4]
	ldr r2, _0801CA3C
	ldr r0, _0801CA28
	ldrh r1, [r2]
	orrs r1, r0
	strh r1, [r2]
	movs r3, #3
	ldrh r1, [r2]
	rsbs r3, r3, #0
	ands r3, r1
	strh r3, [r2]
	ldr r1, _0801CA40
	ldr r2, _0801CA2C
	ldrh r3, [r1]
	orrs r3, r2
	strh r3, [r1]
	movs r3, #0x11
	b _0801CA44
_0801CA24:
	.4byte 0x00000000
_0801CA28:
	.4byte 0x00000001
_0801CA2C:
	.4byte 0x00000008
_0801CA30:
	.4byte 0x04000208
_0801CA34:
	.4byte gUnk_080519F0
_0801CA38:
	.4byte gUnk_080519FC
_0801CA3C:
	.4byte 0x04000200
_0801CA40:
	.4byte 0x04000004
_0801CA44:
	ldrh r2, [r1]
	rsbs r3, r3, #0
	ands r3, r2
	strh r3, [r1]
	ldr r3, _0801CA98
	ldr r1, _0801CA9C
	movs r2, #0x80
	str r3, [r1]
	ldr r1, _0801CA90
	strh r0, [r4]
	lsls r4, r2, #0x13
	ldr r0, _0801CA94
	strh r1, [r4]
	adds r4, #8
	strh r0, [r4]
	adds r4, #8
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #0x3a
	strh r5, [r4]
	bl fe_load_bg_palettes
	ldr r0, _0801CAA0
	movs r4, #0
	add r2, sp, #4
	movs r1, #0xe0
	str r4, [sp, #4]
	str r2, [r0]
	lsls r2, r1, #0x13
	ldr r1, _0801CAA4
	str r2, [r0, #4]
	b _0801CAA8
	.byte 0x00, 0x00
_0801CA90:
	.4byte 0x00001140
_0801CA94:
	.4byte 0x00000084
_0801CA98:
	.4byte vblank_handler
_0801CA9C:
	.4byte gIrqHandler
_0801CAA0:
	.4byte 0x040000D4
_0801CAA4:
	.4byte 0x85000100
_0801CAA8:
	str r1, [r0, #8]
	ldr r2, _0801CB30
	ldr r3, [r0, #8]
	ldr r1, _0801CB34
	mov r3, sp
	adds r3, #2
	strh r4, [r3]
	str r3, [r0]
	str r2, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	bl fe_spr_init
	ldr r2, _0801CB38
	ldr r0, _0801CB3C
	ldr r1, _0801CB40
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #0xc]
	str r4, [r2]
	str r4, [r2, #4]
	str r4, [r2, #8]
	movs r3, #0x80
	ldrh r2, [r1, #0x24]
	lsls r1, r3, #8
	ands r1, r2
	cmp r1, #0
	beq _0801CB26
	movs r1, #3
	strb r1, [r0, #0x13]
	movs r1, #0x1f
	adds r3, r1, #0
	ands r3, r2
	adds r3, #1
	lsls r2, r2, #0x10
	strb r3, [r0, #0x10]
	lsrs r3, r2, #0x15
	ands r3, r1
	adds r3, #1
	strb r3, [r0, #0x11]
	lsrs r3, r2, #0x1a
	ands r3, r1
	adds r3, #1
	strb r3, [r0, #0x12]
_0801CB00:
	movs r0, #3
	bl music_play_if_changed
	bl fade_to_normal
	movs r0, #0x8c
	bl fe_title_letters_start
	ldr r3, _0801CB44
	ldr r0, _0801CB48
	ldr r1, _0801CB4C
	str r3, [r0]
	ldr r0, _0801CB50
	bl AGBPrintf
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
_0801CB26:
	strb r5, [r0, #0x13]
	strb r5, [r0, #0x12]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x10]
	b _0801CB00
_0801CB30:
	.4byte 0x06010000
_0801CB34:
	.4byte 0x81004000
_0801CB38:
	.4byte 0x0202D724
_0801CB3C:
	.4byte 0x0202D710
_0801CB40:
	.4byte gGameSetup
_0801CB44:
	.4byte fe_name_process
_0801CB48:
	.4byte gStateFunc
_0801CB4C:
	.4byte gUnk_080519FC
_0801CB50:
	.4byte gUnk_08051A0C

	.global fe_name_process
	.thumb_func
	.type fe_name_process, %function
fe_name_process: @ 0801CB54
	push {r4, r5, lr}
	sub sp, #4
	bl fade_update
	ldr r1, _0801CCA0
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0801CB70
	ldr r5, _0801CCA4
	ldr r4, [r5]
	ldr r0, _0801CCA8
	lsrs r2, r4, #2
	strh r2, [r0]
_0801CB70:
	bl fe_frame_end
	bl fe_draw_title
	movs r1, #0
	movs r0, #0x8e
	bl fe_get_text
	ldr r5, _0801CCAC
	adds r1, r5, #0
	adds r4, r0, #0
	bl fe_text_width
	lsrs r1, r0, #0x1f
	adds r2, r0, r1
	asrs r1, r2, #1
	movs r0, #0x20
	movs r2, #0x78
	subs r3, r2, r1
	str r0, [sp]
	adds r1, r5, #0
	adds r0, r4, #0
	movs r2, #0
	bl fe_text_draw
	bl fe_name_draw_letters
	bl fe_name_draw_letters_2
	ldr r4, _0801CCB0
	ldr r1, [r4, #4]
	lsls r0, r1, #0xb
	ldr r1, [r4]
	movs r3, #0x80
	subs r2, r0, r1
	lsls r0, r3, #8
	cmp r2, r0
	ble _0801CBC0
	ldr r0, _0801CCB4
	adds r2, r2, r0
_0801CBC0:
	ldr r0, _0801CCB8
	cmp r2, r0
	bge _0801CBCC
	movs r3, #0x80
	lsls r0, r3, #9
	adds r2, r2, r0
_0801CBCC:
	cmp r2, #0
	bgt _0801CBD2
	b _0801CD8A
_0801CBD2:
	adds r3, r2, #0
	adds r3, #0xf
	asrs r0, r3, #4
	adds r2, r1, r0
_0801CBDA:
	str r2, [r4]
_0801CBDC:
	ldrh r1, [r4]
	ldr r2, _0801CCBC
	str r1, [r4]
	ldr r3, [r2, #0xc]
	cmp r3, #0
	beq _0801CC0A
	cmp r3, #1
	beq _0801CBF4
_0801CBEC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_0801CBF4:
	ldr r2, _0801CCC0
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _0801CBEC
	movs r0, #0
	bl mcp_process
	b _0801CBEC
_0801CC0A:
	ldrb r5, [r2, #0x13]
	cmp r5, #3
	beq _0801CC2C
	ldr r1, _0801CCC4
	ldrh r2, [r1]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _0801CC1E
	b _0801CD32
_0801CC1E:
	ldr r3, [r4, #8]
	cmp r3, #0
	beq _0801CD16
	subs r3, #1
	str r3, [r4, #8]
	cmp r3, #0
	beq _0801CCFA
_0801CC2C:
	ldr r4, _0801CCC8
	movs r5, #1
	ldrh r2, [r4]
	adds r4, r5, #0
	ands r4, r2
	cmp r4, #0
	beq _0801CCCC
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xcb
	movs r1, #0x7f
	bl snd_play
	ldr r4, _0801CCBC
	ldrb r3, [r4, #0x13]
	cmp r3, #2
	bhi _0801CC72
	ldr r0, _0801CCB0
	adds r2, r3, #0
	ldr r3, [r0, #4]
	movs r1, #0x1f
	ands r3, r1
	adds r2, #0x10
	adds r3, #1
	strb r3, [r4, r2]
	ldrb r2, [r4, #0x13]
	adds r2, #1
	strb r2, [r4, #0x13]
	lsls r3, r2, #0x18
	movs r2, #0xc0
	lsls r2, r2, #0x12
	cmp r3, r2
	bne _0801CBEC
	str r1, [r0, #4]
	b _0801CBEC
_0801CC72:
	ldrb r2, [r4, #0x11]
	subs r2, #1
	lsls r0, r2, #5
	ldrb r1, [r4, #0x10]
	ldrb r2, [r4, #0x12]
	subs r1, #1
	subs r2, #1
	orrs r1, r0
	lsls r0, r2, #0xa
	ldr r2, _0801CC9C
	orrs r1, r0
	ldr r0, _0801CCA0
	orrs r1, r2
	strh r1, [r0, #0x24]
	bl fe_title_letters_leave
	bl fade_to_black
	str r5, [r4, #0xc]
	b _0801CBEC
	.byte 0x00, 0x00
_0801CC9C:
	.4byte 0xFFFF8000
_0801CCA0:
	.4byte gGameSetup
_0801CCA4:
	.4byte 0x03005660
_0801CCA8:
	.4byte 0x04000010
_0801CCAC:
	.4byte gUnk_0863FDE8
_0801CCB0:
	.4byte 0x0202D724
_0801CCB4:
	.4byte 0xFFFF0000
_0801CCB8:
	.4byte 0xFFFF8000
_0801CCBC:
	.4byte 0x0202D710
_0801CCC0:
	.4byte gModeFlags
_0801CCC4:
	.4byte gKeysHeld
_0801CCC8:
	.4byte gKeysNew
_0801CCCC:
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	bne _0801CCD6
	b _0801CBEC
_0801CCD6:
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xcc
	bl snd_play
	ldr r1, _0801CD9C
	ldrb r0, [r1, #0x13]
	adds r3, r0, #0
	cmp r3, #0
	bne _0801CCEE
	b _0801CBEC
_0801CCEE:
	adds r3, #0xff
	strb r3, [r1, #0x13]
	ldrb r2, [r1, #0x13]
	adds r2, #0x10
	strb r4, [r1, r2]
	b _0801CBEC
_0801CCFA:
	movs r5, #0x80
	movs r1, #0x7f
	movs r0, #0xc0
	lsls r2, r5, #9
	bl snd_play
	ldr r1, [r4, #4]
	movs r3, #0x1f
	adds r1, #1
	ands r1, r3
	movs r0, #0xa
	str r1, [r4, #4]
	str r0, [r4, #8]
	b _0801CC2C
_0801CD16:
	movs r5, #0x80
	lsls r2, r5, #9
	movs r0, #0xc0
	movs r1, #0x7f
	bl snd_play
	ldr r5, [r4, #4]
	movs r3, #0x1f
	adds r5, #1
	ands r5, r3
	movs r2, #0x1e
	str r5, [r4, #4]
	str r2, [r4, #8]
	b _0801CC2C
_0801CD32:
	movs r0, #0x10
	ands r0, r2
	lsls r2, r0, #0x10
	lsrs r3, r2, #0x10
	cmp r3, #0
	beq _0801CD86
	ldr r3, [r4, #8]
	cmp r3, #0
	beq _0801CD6A
	subs r3, #1
	str r3, [r4, #8]
	cmp r3, #0
	beq _0801CD4E
	b _0801CC2C
_0801CD4E:
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xc0
	bl snd_play
	ldr r0, [r4, #4]
	movs r1, #0x1f
	subs r0, #1
	ands r0, r1
	movs r2, #0xa
	str r0, [r4, #4]
	str r2, [r4, #8]
	b _0801CC2C
_0801CD6A:
	movs r5, #0x80
	movs r1, #0x7f
	lsls r2, r5, #9
	movs r0, #0xc0
	bl snd_play
	ldr r5, [r4, #4]
	movs r3, #0x1f
	subs r5, #1
	ands r5, r3
	movs r1, #0x1e
	str r5, [r4, #4]
	str r1, [r4, #8]
	b _0801CC2C
_0801CD86:
	str r3, [r4, #8]
	b _0801CC2C
_0801CD8A:
	cmp r2, #0
	blt _0801CD90
	b _0801CBDC
_0801CD90:
	movs r0, #0xf
	subs r3, r0, r2
	asrs r0, r3, #4
	subs r2, r1, r0
	b _0801CBDA
	.byte 0x00, 0x00
_0801CD9C:
	.4byte 0x0202D710

	.global fe_movie_decode
	.thumb_func
	.type fe_movie_decode, %function
fe_movie_decode: @ 0801CDA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0801CE30
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	sub sp, #4
	cmp r1, r0
	bge _0801CE3C
	ldr r3, [r5, #0x14]
	ldrh r1, [r3]
	movs r2, #0xc0
	lsls r0, r1, #0x10
	adds r3, #2
	lsls r4, r2, #0x13
	asrs r1, r0, #0x10
	str r3, [r5, #0x14]
	cmp r0, #0
	beq _0801CE22
	ldr r3, _0801CE34
	movs r6, #0x80
	mov r8, r3
	movs r3, #0x80
	lsls r2, r6, #8
	mov r7, sp
	lsls r6, r3, #7
	ldr r0, _0801CE38
	mov lr, r2
	adds r7, #2
	mov ip, r6
_0801CDDC:
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	adds r3, r2, #0
	mov r6, lr
	ands r3, r6
	cmp r3, #0
	beq _0801CE48
	movs r3, #0xff
	ands r3, r2
	lsls r2, r3, #8
	orrs r3, r2
	lsls r2, r3, #0x10
	asrs r3, r2, #0x10
	ldr r2, _0801CE2C
	lsrs r1, r1, #0x18
	strh r3, [r7]
	ands r1, r2
	movs r3, #0x81
	adds r1, #1
	lsls r2, r3, #0x18
	orrs r2, r1
	str r7, [r0]
	str r4, [r0, #4]
	str r2, [r0, #8]
	lsls r2, r1, #1
	ldr r3, [r0, #8]
	adds r4, r4, r2
_0801CE12:
	ldr r3, [r5, #0x14]
	ldrh r1, [r3]
	adds r3, #2
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	str r3, [r5, #0x14]
	cmp r2, #0
	bne _0801CDDC
_0801CE22:
	ldr r0, _0801CE30
	ldr r2, [r0, #8]
	adds r2, #1
	str r2, [r0, #8]
	b _0801CE3C
_0801CE2C:
	.4byte 0x0000007F
_0801CE30:
	.4byte 0x0202D730
_0801CE34:
	.4byte 0x00003FFF
_0801CE38:
	.4byte 0x040000D4
_0801CE3C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801CE48:
	adds r3, r2, #0
	mov r1, ip
	ands r3, r1
	cmp r3, #0
	beq _0801CE72
	mov r3, r8
	ands r2, r3
	movs r3, #0x80
	ldr r1, [r5, #0x14]
	adds r2, #1
	lsls r3, r3, #0x18
	orrs r3, r2
	str r1, [r0]
	str r4, [r0, #4]
	str r3, [r0, #8]
	ldr r3, [r0, #8]
	lsls r3, r2, #1
	adds r1, r1, r3
	adds r4, r4, r3
	str r1, [r5, #0x14]
	b _0801CE12
_0801CE72:
	adds r3, r2, #0
	mov r6, r8
	ands r3, r6
	adds r3, #1
	lsls r1, r3, #1
	adds r4, r4, r1
	b _0801CE12

	.global fe_movie_process
	.thumb_func
	.type fe_movie_process, %function
fe_movie_process: @ 0801CE80
	push {r4, lr}
	bl fade_update
	ldr r4, _0801CEC0
	ldr r2, _0801CEB8
	ldr r0, _0801CEC4
	strh r2, [r4]
	ldr r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	str r1, [r0]
	ldr r1, [r0]
	lsls r3, r2, #2
	eors r1, r3
	str r1, [r0]
	ldr r0, _0801CEBC
	strh r0, [r4]
	ldr r0, _0801CEC8
	bl _call_via_r0
	ldr r4, _0801CECC
	ldr r3, [r4]
	cmp r3, #6
	bhi _0801CF1C
	ldr r2, _0801CED0
	lsls r1, r3, #2
	ldr r0, [r1, r2]
	b _0801CED4
_0801CEB8:
	.4byte 0x00000000
_0801CEBC:
	.4byte 0x00000001
_0801CEC0:
	.4byte 0x04000208
_0801CEC4:
	.4byte gModeFlags
_0801CEC8:
	.4byte pal_flush
_0801CECC:
	.4byte 0x0202D730
_0801CED0:
	.4byte _0801CED8
_0801CED4:
	mov pc, r0
	.byte 0x00, 0x00
	.global _0801CED8
_0801CED8:
	.4byte _0801CEF4
	.4byte _0801CF22
	.4byte _0801CF3A
	.4byte _0801CF5E
	.4byte _0801CFA2
	.4byte _0801CFC6
	.4byte _0801CFDC
	.global _0801CEF4
_0801CEF4:
	ldr r1, _0801CFF4
	str r1, [r4, #0x10]
	subs r0, r1, #2
	ldrh r3, [r0]
	movs r0, #0x80
	str r3, [r4, #0xc]
	lsls r3, r0, #2
	adds r0, r1, r3
	str r0, [r4, #0x14]
	movs r1, #0
	movs r0, #1
	movs r2, #0x78
	str r0, [r4]
	str r1, [r4, #8]
	str r2, [r4, #4]
	bl fe_movie_decode
	ldr r0, [r4, #0x10]
	bl pal_load
_0801CF1C:
	pop {r4}
	pop {r0}
	bx r0
	.global _0801CF22
_0801CF22:
	ldr r3, [r4, #4]
	cmp r3, #0
	bgt _0801CFCC
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xfe
	movs r1, #0x80
	bl snd_play
	movs r2, #2
	str r2, [r4]
	b _0801CF1C
	.global _0801CF3A
_0801CF3A:
	ldr r2, _0801CFF8
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0801CF1C
	bl fe_movie_decode
	ldr r4, _0801CFFC
	ldr r3, [r4, #8]
	ldr r1, [r4, #0xc]
	cmp r3, r1
	bne _0801CF1C
	bl fade_to_black
	movs r0, #3
	str r0, [r4]
	b _0801CF1C
	.global _0801CF5E
_0801CF5E:
	ldr r2, _0801D000
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _0801CF1C
	ldr r1, _0801D004
	movs r2, #4
	str r2, [r4]
	str r1, [r4, #0x10]
	subs r0, r1, #2
	ldrh r3, [r0]
	movs r0, #0x80
	str r3, [r4, #0xc]
	lsls r3, r0, #2
	adds r0, r1, r3
	movs r1, #0
	str r1, [r4, #8]
	str r0, [r4, #0x14]
	bl fe_movie_decode
	ldr r0, [r4, #0x10]
	bl pal_load
	bl fade_to_normal
	movs r3, #0x80
	movs r1, #0x80
	lsls r2, r3, #9
	movs r0, #0xfd
	bl snd_play
	b _0801CF1C
	.global _0801CFA2
_0801CFA2:
	ldr r2, _0801CFF8
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0801CF1C
	bl fe_movie_decode
	ldr r1, _0801CFFC
	ldr r3, [r1, #8]
	ldr r0, [r1, #0xc]
	cmp r3, r0
	bne _0801CF1C
	movs r0, #5
	movs r2, #0x1e
	str r0, [r1]
	str r2, [r1, #4]
	b _0801CF1C
	.global _0801CFC6
_0801CFC6:
	ldr r3, [r4, #4]
	cmp r3, #0
	ble _0801CFD2
_0801CFCC:
	subs r3, #1
	str r3, [r4, #4]
	b _0801CF1C
_0801CFD2:
	bl fade_to_black
	movs r1, #6
	str r1, [r4]
	b _0801CF1C
	.global _0801CFDC
_0801CFDC:
	ldr r2, _0801D000
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _0801CF1C
	movs r0, #0
	bl mcp_process
	b _0801CF1C
	.byte 0x00, 0x00
_0801CFF4:
	.4byte gUnk_086F0CB2
_0801CFF8:
	.4byte 0x03005660
_0801CFFC:
	.4byte 0x0202D730
_0801D000:
	.4byte gModeFlags
_0801D004:
	.4byte gUnk_0865A122

	.global fe_movie_init
	.thumb_func
	.type fe_movie_init, %function
fe_movie_init: @ 0801D008
	push {r4, r5, lr}
	ldr r4, _0801D044
	ldr r5, _0801D050
	ldr r0, _0801D054
	strh r4, [r5]
	ldr r1, _0801D058
	bl AGBPrintf
	ldr r1, _0801D048
	movs r2, #0x80
	lsls r0, r2, #0x13
	strh r1, [r0]
	adds r0, #0xc
	strh r4, [r0]
	adds r0, #0x44
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x28
	str r2, [r0]
	ldr r1, _0801D04C
	adds r0, #4
	str r2, [r0]
	subs r0, #0xc
	strh r1, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	b _0801D05C
_0801D044:
	.4byte 0x00000000
_0801D048:
	.4byte 0x00000404
_0801D04C:
	.4byte 0x00000100
_0801D050:
	.4byte 0x04000208
_0801D054:
	.4byte gUnk_08051A18
_0801D058:
	.4byte gUnk_08051A24
_0801D05C:
	strh r1, [r0]
	ldr r0, _0801D088
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0x10]
	str r2, [r0, #0xc]
	bl fe_movie_decode
	bl fade_to_normal
	ldr r0, _0801D08C
	ldr r1, _0801D090
	str r1, [r0]
	ldr r0, _0801D084
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_0801D084:
	.4byte 0x00000001
_0801D088:
	.4byte 0x0202D730
_0801D08C:
	.4byte gStateFunc
_0801D090:
	.4byte fe_movie_process

	.global fe_spotscreen2_init
	.thumb_func
	.type fe_spotscreen2_init, %function
fe_spotscreen2_init: @ 0801D094
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r8
	push {r6, r7}
	ldr r7, _0801D0D0
	ldr r6, _0801D0E4
	ldr r0, _0801D0E8
	ldr r1, _0801D0EC
	sub sp, #8
	ldr r4, _0801D0F0
	bl AGBPrintf
	strh r7, [r6]
	movs r2, #3
	ldrh r1, [r4]
	rsbs r5, r2, #0
	ldr r3, _0801D0F4
	ands r5, r1
	ldr r0, _0801D0F8
	ldr r1, _0801D0D4
	strh r5, [r4]
	movs r2, #0x80
	ldr r5, _0801D0D8
	str r3, [r0]
	ldr r4, _0801D0DC
	strh r1, [r6]
	lsls r1, r2, #0x13
	strh r5, [r1]
	ldr r0, _0801D0E0
	b _0801D0FC
_0801D0D0:
	.4byte 0x00000000
_0801D0D4:
	.4byte 0x00000001
_0801D0D8:
	.4byte 0x00003340
_0801D0DC:
	.4byte 0x00004209
_0801D0E0:
	.4byte 0x00000084
_0801D0E4:
	.4byte 0x04000208
_0801D0E8:
	.4byte gUnk_08051A34
_0801D0EC:
	.4byte gUnk_08051A40
_0801D0F0:
	.4byte 0x04000200
_0801D0F4:
	.4byte vblank_handler
_0801D0F8:
	.4byte gIrqHandler
_0801D0FC:
	adds r1, #8
	strh r4, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #6
	strh r7, [r1]
	adds r1, #2
	strh r7, [r1]
	adds r1, #2
	strh r7, [r1]
	ldr r6, _0801D148
	adds r1, #2
	strh r7, [r1]
	ldr r5, _0801D14C
	adds r1, #0x32
	strh r6, [r1]
	ldr r4, _0801D150
	adds r1, #2
	strh r5, [r1]
	ldr r0, _0801D154
	subs r1, #0xa
	strh r4, [r1]
	adds r1, #4
	strh r0, [r1]
	adds r1, #0xc
	strh r7, [r1]
	bl fe_load_bg_palettes
	ldr r0, _0801D158
	bl pal_load
	ldr r1, _0801D15C
	ldr r6, _0801D160
	str r6, [r1]
	subs r6, #4
	ldrh r2, [r6]
	b _0801D164
	.byte 0x00, 0x00
_0801D148:
	.4byte 0x00000031
_0801D14C:
	.4byte 0x00000012
_0801D150:
	.4byte 0x00007AE6
_0801D154:
	.4byte 0x00002C9A
_0801D158:
	.4byte gUnk_08055050
_0801D15C:
	.4byte 0x040000D4
_0801D160:
	.4byte gUnk_080A6992
_0801D164:
	movs r5, #0x80
	lsls r4, r5, #0x18
	ldr r3, _0801D21C
	lsls r0, r2, #4
	orrs r0, r4
	str r3, [r1, #4]
	str r0, [r1, #8]
	ldr r3, [r1, #8]
	ldr r3, _0801D220
	movs r0, #0x44
	adds r2, r0, r3
	ldrh r6, [r3]
	mov r8, r2
	ldr r2, _0801D224
	adds r3, #4
	ldr r5, _0801D228
	ldr r7, _0801D22C
	movs r4, #0
	mov sl, r6
	mov lr, r3
	mov ip, r2
	movs r0, #0
_0801D190:
	mov r6, lr
	adds r2, r0, r6
	str r2, [r1]
	mov r6, ip
	lsls r2, r4, #6
	adds r3, r2, r6
	str r3, [r1, #4]
	str r5, [r1, #8]
	mov r6, r8
	ldr r3, [r1, #8]
	adds r3, r0, r6
	str r3, [r1]
	adds r3, r2, r7
	str r3, [r1, #4]
	str r5, [r1, #8]
	mov r2, sl
	ldr r3, [r1, #8]
	adds r4, #1
	lsls r3, r2, #1
	adds r0, r0, r3
	cmp r4, #0x13
	ble _0801D190
	ldr r1, _0801D230
	add r2, sp, #4
	movs r0, #0
	movs r3, #0xe0
	str r0, [sp, #4]
	str r2, [r1]
	lsls r2, r3, #0x13
	str r2, [r1, #4]
	ldr r2, _0801D234
	str r2, [r1, #8]
	ldr r2, _0801D238
	ldr r3, [r1, #8]
	mov r3, sp
	adds r3, #2
	strh r0, [r3]
	str r3, [r1]
	str r2, [r1, #4]
	ldr r2, _0801D23C
	str r2, [r1, #8]
	ldr r2, _0801D240
	ldr r3, [r1, #8]
	str r0, [r2]
	bl fe_spr_init
	movs r0, #0xae
	bl fe_title_letters_start
	bl sound_enable
	movs r0, #4
	bl music_play_if_changed
	bl fade_to_normal
	ldr r1, _0801D244
	ldr r0, _0801D248
	str r1, [r0]
	ldr r0, _0801D24C
	ldr r1, _0801D250
	bl AGBPrintf
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sl, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0801D21C:
	.4byte 0x06008000
_0801D220:
	.4byte gUnk_081BB4D8
_0801D224:
	.4byte 0x06001000
_0801D228:
	.4byte 0x80000020
_0801D22C:
	.4byte 0x06001800
_0801D230:
	.4byte 0x040000D4
_0801D234:
	.4byte 0x85000100
_0801D238:
	.4byte 0x06010000
_0801D23C:
	.4byte 0x81004000
_0801D240:
	.4byte 0x0202D748
_0801D244:
	.4byte fe_spotscreen2_process
_0801D248:
	.4byte gStateFunc
_0801D24C:
	.4byte gUnk_08051A54
_0801D250:
	.4byte gUnk_08051A40

	.global fe_spotscreen2_process
	.thumb_func
	.type fe_spotscreen2_process, %function
fe_spotscreen2_process: @ 0801D254
	push {lr}
	sub sp, #0x10
	bl fade_update
	ldr r1, _0801D2D0
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _0801D270
	ldr r0, _0801D2D4
	ldr r1, [r0]
	ldr r0, _0801D2D8
	lsrs r2, r1, #2
	strh r2, [r0]
_0801D270:
	bl fe_frame_end
	bl fe_draw_title
	movs r1, #0
	movs r0, #1
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _0801D2DC
	ldr r3, _0801D2E0
	movs r0, #0xf0
	movs r1, #0xa0
	bl fe_spr_plot
	ldr r2, _0801D2E4
	ldr r3, [r2]
	cmp r3, #2
	beq _0801D2B8
	cmp r3, #3
	beq _0801D2A2
_0801D29C:
	add sp, #0x10
	pop {r0}
	bx r0
_0801D2A2:
	ldr r2, _0801D2E8
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _0801D29C
	movs r0, #0
	bl mcp_process
	b _0801D29C
_0801D2B8:
	ldr r2, _0801D2E8
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _0801D29C
	movs r0, #1
	bl mcp_process
	b _0801D29C
	.byte 0x00, 0x00
_0801D2D0:
	.4byte gGameSetup
_0801D2D4:
	.4byte 0x03005660
_0801D2D8:
	.4byte 0x04000014
_0801D2DC:
	.4byte gUnk_085C96D0
_0801D2E0:
	.4byte gUnk_0863FA20
_0801D2E4:
	.4byte 0x0202D748
_0801D2E8:
	.4byte gModeFlags
