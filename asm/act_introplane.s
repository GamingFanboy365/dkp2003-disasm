@ asm/act_introplane.s: ROM 0x013154-0x013300 (rom, VMA 0x08013154)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_introplane
	.thumb_func
	.type init_introplane, %function
init_introplane: @ 08013154
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801317E
_0801315E:
	ldr r1, _08013174
	movs r0, #0xf0
	strh r1, [r4]
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	add sp, #4
	b _08013178
	.byte 0x00, 0x00
_08013174:
	.4byte 0x00001001
_08013178:
	pop {r4}
	pop {r0}
	bx r0
_0801317E:
	ldr r0, _08013198
	ldr r1, _0801319C
	str r0, [sp]
	ldr r2, _080131A0
	ldr r0, _080131A4
	movs r3, #0x18
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801315E
	.byte 0x00, 0x00
_08013198:
	.4byte gUnk_08050E20
_0801319C:
	.4byte gUnk_08050E2C
_080131A0:
	.4byte gUnk_08050E44
_080131A4:
	.4byte gUnk_08050E54
	.byte 0x70, 0x47, 0x00, 0x00

	.global init_introdiddy
	.thumb_func
	.type init_introdiddy, %function
init_introdiddy: @ 080131AC
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080131D6
_080131B6:
	ldr r1, _080131CC
	movs r0, #0xf0
	strh r1, [r4]
	movs r1, #0xa0
	lsls r2, r0, #7
	lsls r0, r1, #5
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	add sp, #4
	b _080131D0
	.byte 0x00, 0x00
_080131CC:
	.4byte 0x00001001
_080131D0:
	pop {r4}
	pop {r0}
	bx r0
_080131D6:
	ldr r0, _080131F0
	ldr r1, _080131F4
	str r0, [sp]
	ldr r2, _080131F8
	ldr r0, _080131FC
	movs r3, #0x2a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080131B6
	.byte 0x00, 0x00
_080131F0:
	.4byte gUnk_08050E20
_080131F4:
	.4byte gUnk_08050E2C
_080131F8:
	.4byte gUnk_08050E90
_080131FC:
	.4byte gUnk_08050E54
	.byte 0x70, 0x47, 0x00, 0x00

	.global init_introkong
	.thumb_func
	.type init_introkong, %function
init_introkong: @ 08013204
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0801322E
_0801320E:
	ldr r1, _08013224
	movs r0, #0xf0
	strh r1, [r4]
	movs r1, #0xf0
	lsls r2, r0, #7
	lsls r0, r1, #6
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	add sp, #4
	b _08013228
	.byte 0x00, 0x00
_08013224:
	.4byte 0x00001001
_08013228:
	pop {r4}
	pop {r0}
	bx r0
_0801322E:
	ldr r0, _08013248
	ldr r1, _0801324C
	str r0, [sp]
	ldr r2, _08013250
	ldr r0, _08013254
	movs r3, #0x3c
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0801320E
	.byte 0x00, 0x00
_08013248:
	.4byte gUnk_08050E20
_0801324C:
	.4byte gUnk_08050E2C
_08013250:
	.4byte gUnk_08050EA0
_08013254:
	.4byte gUnk_08050E54

	.global sub_08013258
	.thumb_func
	.type sub_08013258, %function
sub_08013258: @ 08013258
	push {r4, r5, lr}
	ldr r5, _0801329C
	movs r3, #0x80
	ldr r4, [r5]
	adds r2, r0, #0
	lsls r0, r3, #1
	cmp r4, r0
	ble _08013270
	ldr r3, _080132A0
	adds r0, r4, r3
	str r0, [r5]
	adds r4, r0, #0
_08013270:
	adds r1, r2, #0
	adds r1, #0x5a
	ldrh r2, [r1]
	movs r1, #0x18
	muls r2, r1, r2
	ldr r0, _080132A4
	adds r1, r4, #0
	adds r3, r2, r0
	adds r1, #0x80
	strh r1, [r3, #0xa]
	ldr r3, _08013298
	adds r2, #0xc
	subs r1, r3, r4
	strh r1, [r0, r2]
	adds r1, r4, #4
	str r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08013298:
	.4byte 0x00000180
_0801329C:
	.4byte 0x02023F94
_080132A0:
	.4byte 0xFFFFFF00
_080132A4:
	.4byte 0x02018F34

	.global init_intropilot
	.thumb_func
	.type init_intropilot, %function
init_intropilot: @ 080132A8
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _080132D2
_080132B2:
	ldr r1, _080132C8
	movs r0, #0xf0
	strh r1, [r4]
	movs r1, #0xb4
	lsls r2, r0, #7
	lsls r0, r1, #7
	str r2, [r4, #0x24]
	str r0, [r4, #0x28]
	add sp, #4
	b _080132CC
	.byte 0x00, 0x00
_080132C8:
	.4byte 0x00001001
_080132CC:
	pop {r4}
	pop {r0}
	bx r0
_080132D2:
	ldr r0, _080132EC
	ldr r1, _080132F0
	str r0, [sp]
	ldr r2, _080132F4
	ldr r0, _080132F8
	movs r3, #0x57
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080132B2
	.byte 0x00, 0x00
_080132EC:
	.4byte gUnk_08050E20
_080132F0:
	.4byte gUnk_08050E2C
_080132F4:
	.4byte gUnk_08050EB0
_080132F8:
	.4byte gUnk_08050E54
	.byte 0x70, 0x47, 0xC0, 0x46
