@ asm/act_hud_flyby.s: ROM 0x01250C-0x012904 (rom, VMA 0x0801250C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_hud_flyby
	.thumb_func
	.type init_hud_flyby, %function
init_hud_flyby: @ 0801250C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	cmp r0, #0
	bne _08012522
	b _08012688
_08012522:
	ldr r1, _08012560
	movs r4, #0xf0
	mov r2, sl
	lsls r0, r4, #8
	movs r6, #0xf4
	strh r1, [r2]
	str r0, [r2, #0x24]
	lsls r1, r6, #7
	movs r0, #0x80
	str r1, [r2, #0x28]
	movs r4, #0
	adds r2, #0xa0
	lsls r6, r0, #1
	str r4, [r2]
	str r6, [r2, #8]
	strh r4, [r2, #4]
	ldr r4, _08012564
	ldr r1, [r4]
	movs r3, #4
	orrs r1, r3
	ldr r0, _08012568
	str r1, [r4]
	adds r0, #0x84
	ldrh r4, [r0]
	movs r2, #0x2c
	muls r4, r2, r4
	ldr r6, _0801256C
	movs r1, #0
	ldr r0, [r6, r4]
	b _08012570
	.byte 0x00, 0x00
_08012560:
	.4byte 0x00001005
_08012564:
	.4byte 0x0300566C
_08012568:
	.4byte 0x0202D74C
_0801256C:
	.4byte 0x08051D40
_08012570:
	bl sub_080189E4
	adds r4, r0, #0
	bl sub_08018AEC
	bl spr_get_info
	mov r2, sl
	adds r2, #0x5a
	strh r0, [r2]
	ldr r0, _08012640
	ldr r3, [r0]
	ldrh r2, [r2]
	str r3, [sp, #0x14]
	ldr r1, [r0, #4]
	str r1, [sp, #0x18]
	ldr r3, [r0, #8]
	str r3, [sp, #0x10]
	ldr r1, [r0, #0xc]
	lsrs r0, r1, #0x10
	str r0, [sp, #4]
	ldr r0, _08012644
	ands r0, r1
	movs r1, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r6, r4, #0
	mov r8, r2
	movs r2, #0x80
	lsls r3, r2, #3
	ldrb r0, [r6]
	mov sb, r3
	movs r3, #0
	mov fp, r3
	cmp r0, #0x4e
	beq _08012658
	ldr r7, _08012648
_080125BA:
	ldrb r3, [r6]
	adds r6, #1
	cmp r3, #0x4f
	beq _08012680
	cmp r3, #0x50
	beq _08012670
	ldr r0, [sp, #0x10]
	lsls r1, r3, #1
	adds r5, r1, r0
	ldrb r2, [r5]
	cmp r2, #0xff
	beq _08012624
	movs r2, #0x18
	ldr r0, _0801264C
	mov r4, r8
	muls r4, r2, r4
	mov r2, sb
	asrs r1, r2, #8
	mov r2, fp
	muls r2, r0, r2
	lsls r3, r2, #0x10
	strh r1, [r7, r4]
	asrs r0, r3, #0x10
	ldr r1, _08012650
	bl _call_via_r1
	lsls r2, r0, #0x10
	asrs r1, r2, #0x1b
	ldr r2, [sp, #0xc]
	adds r3, r2, r1
	adds r1, r4, r7
	strh r3, [r1, #2]
	adds r3, r4, #0
	adds r3, #8
	ldr r2, _08012638
	adds r0, r3, r7
	ldr r3, _0801263C
	strh r2, [r0, #2]
	adds r2, r4, r7
	strh r3, [r2, #6]
	ldr r2, [sp, #0x14]
	adds r3, r4, #0
	adds r3, #0x14
	str r2, [r7, r3]
	ldr r2, [sp, #0x18]
	adds r4, #0x10
	str r2, [r7, r4]
	ldrb r2, [r5]
	strh r2, [r0]
	ldr r0, _08012654
	mov r3, r8
	ldrb r2, [r0, r3]
	mov r8, r2
_08012624:
	ldrb r1, [r5, #1]
	lsls r0, r1, #8
	add sb, r0
_0801262A:
	ldrb r2, [r6]
	movs r3, #1
	add fp, r3
	cmp r2, #0x4e
	bne _080125BA
	b _08012658
	.byte 0x00, 0x00
_08012638:
	.4byte 0x00000100
_0801263C:
	.4byte 0x00000000
_08012640:
	.4byte 0x0863FDD8
_08012644:
	.4byte 0x0000FFFF
_08012648:
	.4byte 0x02018F34
_0801264C:
	.4byte 0x00004444
_08012650:
	.4byte sub_03000138
_08012654:
	.4byte 0x0201A734
_08012658:
	mov r0, sl
	bl sub_080021E8
	add sp, #0x1c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08012670:
	movs r0, #0x80
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	lsls r2, r0, #3
	mov sb, r2
	adds r0, r1, r3
	str r0, [sp, #0xc]
	b _0801262A
_08012680:
	ldr r3, [sp, #4]
	lsls r1, r3, #8
	add sb, r1
	b _0801262A
_08012688:
	ldr r0, _080126A0
	ldr r1, _080126A4
	str r0, [sp]
	ldr r2, _080126A8
	ldr r0, _080126AC
	movs r3, #0x89
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08012522
_080126A0:
	.4byte 0x08050B24
_080126A4:
	.4byte 0x08050B30
_080126A8:
	.4byte 0x08050B44
_080126AC:
	.4byte 0x08050B54

	.global act_hud_flyby
	.thumb_func
	.type act_hud_flyby, %function
act_hud_flyby: @ 080126B0
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x20]
	cmp r0, #0
	bne _080126C6
	b _080128D0
_080126C6:
	ldr r7, [sp, #0x20]
	adds r7, #0xa0
	ldrh r3, [r7, #4]
	lsls r2, r3, #0x1a
	ldr r6, _080127E4
	asrs r0, r2, #0x10
	bl _call_via_r6
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	movs r2, #0xf0
	muls r2, r3, r2
	ldr r6, [sp, #0x20]
	asrs r0, r2, #4
	ldr r2, [r6, #0x24]
	movs r3, #0x80
	str r0, [r6, #0x24]
	subs r1, r2, r0
	lsls r0, r3, #1
	ldr r3, [r7, #0xc]
	asrs r6, r1, #5
	adds r2, r6, r0
	lsls r0, r3, #3
	subs r6, r0, r3
	ldr r0, [r7, #8]
	subs r2, r2, r0
	adds r1, r6, r2
	asrs r2, r1, #3
	adds r6, r0, r2
	ldr r1, _080127E8
	str r2, [r7, #0xc]
	str r6, [r7, #8]
	adds r1, #0x84
	ldrh r6, [r1]
	movs r0, #0x2c
	muls r6, r0, r6
	ldr r2, _080127EC
	movs r1, #0
	ldr r0, [r2, r6]
	bl sub_080189E4
	ldr r1, [sp, #0x20]
	ldr r3, _080127F0
	adds r1, #0x5a
	ldrh r2, [r1]
	ldr r1, [r3]
	mov sl, r2
	ldr r2, [r7, #8]
	str r1, [sp, #0x18]
	mov fp, r2
	ldr r2, [r3, #4]
	str r2, [sp, #0x1c]
	adds r6, r0, #0
	ldr r0, [r3, #8]
	str r0, [sp, #0x14]
	ldr r1, [r3, #0xc]
	ldr r0, _080127F4
	lsrs r2, r1, #0x10
	movs r3, #0x80
	str r2, [sp, #8]
	lsls r2, r3, #3
	ands r0, r1
	mov sb, r2
	movs r1, #0
	movs r2, #4
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #4]
	ldrb r0, [r6]
	cmp r0, #0x4e
	beq _08012814
	ldr r1, _080127F8
	mov r8, r1
_08012758:
	ldrb r3, [r6]
	adds r6, #1
	cmp r3, #0x4f
	bne _08012762
	b _080128C6
_08012762:
	cmp r3, #0x50
	bne _08012768
	b _080128B6
_08012768:
	ldr r0, [sp, #0x14]
	lsls r2, r3, #1
	adds r5, r2, r0
	ldrb r1, [r5]
	cmp r1, #0xff
	beq _080127CE
	movs r1, #0x18
	mov r4, sl
	muls r4, r1, r4
	mov r0, sb
	asrs r2, r0, #8
	mov r1, r8
	strh r2, [r1, r4]
	ldr r3, [sp, #4]
	ldr r0, _080127FC
	adds r1, r3, #0
	muls r1, r0, r1
	lsls r3, r1, #0x10
	asrs r0, r3, #0x10
	ldr r2, _08012800
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r2, r1, #0x1b
	ldr r1, [sp, #0x10]
	adds r3, r1, r2
	mov r2, r8
	adds r1, r4, r2
	strh r3, [r1, #2]
	adds r1, r4, #0
	ldr r0, _080127DC
	adds r1, #8
	add r1, r8
	ldr r3, _080127E0
	strh r0, [r1, #2]
	adds r0, r4, r2
	strh r3, [r0, #6]
	ldr r2, [sp, #0x18]
	adds r3, r4, #0
	mov r0, r8
	adds r3, #0x14
	str r2, [r0, r3]
	ldr r2, [sp, #0x1c]
	adds r4, #0x10
	str r2, [r0, r4]
	ldrb r0, [r5]
	ldr r3, _08012804
	strh r0, [r1]
	mov r1, sl
	ldrb r0, [r3, r1]
	mov sl, r0
_080127CE:
	ldrb r2, [r5, #1]
	mov r1, fp
	muls r1, r2, r1
	adds r0, r1, #0
	add sb, r0
	b _08012808
	.byte 0x00, 0x00
_080127DC:
	.4byte 0x00000100
_080127E0:
	.4byte 0x00000000
_080127E4:
	.4byte sub_03000134
_080127E8:
	.4byte 0x0202D74C
_080127EC:
	.4byte 0x08051D40
_080127F0:
	.4byte 0x0863FDD8
_080127F4:
	.4byte 0x0000FFFF
_080127F8:
	.4byte 0x02018F34
_080127FC:
	.4byte 0x00004444
_08012800:
	.4byte sub_03000138
_08012804:
	.4byte 0x0201A734
_08012808:
	ldr r1, [sp, #4]
	adds r1, #1
	str r1, [sp, #4]
	ldrb r0, [r6]
	cmp r0, #0x4e
	bne _08012758
_08012814:
	ldr r3, [r7]
	cmp r3, #1
	beq _0801287C
	cmp r3, #1
	bgt _08012848
	cmp r3, #0
	beq _08012834
_08012822:
	add sp, #0x24
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08012834:
	ldr r2, _080128E8
	ldr r0, [r2]
	movs r2, #0x80
	lsls r1, r2, #4
	ands r0, r1
	cmp r0, #0
	beq _08012822
	movs r0, #1
	str r0, [r7]
	b _08012822
_08012848:
	cmp r3, #2
	beq _0801286C
	cmp r3, #3
	bne _08012822
	ldrh r2, [r7, #4]
	adds r0, r2, #0
	cmp r0, #0x1f
	bls _0801288A
	ldr r0, _080128E8
	movs r1, #5
	ldr r3, [r0]
	rsbs r2, r1, #0
	ands r3, r2
	str r3, [r0]
	ldr r0, [sp, #0x20]
	bl sub_08001FE8
	b _08012822
_0801286C:
	ldr r2, _080128EC
	adds r2, #0x8c
	ldr r0, [r2]
	cmp r0, #1
	bls _08012822
	movs r1, #3
	str r1, [r7]
	b _08012822
_0801287C:
	ldrh r2, [r7, #4]
	adds r1, r2, #0
	cmp r1, #4
	beq _080128A6
_08012884:
	adds r0, r2, #0
	cmp r0, #0xf
	bhi _08012890
_0801288A:
	adds r1, r2, #1
	strh r1, [r7, #4]
	b _08012822
_08012890:
	movs r3, #0x80
	movs r1, #0x7f
	lsls r2, r3, #9
	movs r0, #0xf8
	bl sub_0802F11E
	ldr r1, _080128F0
	movs r2, #2
	str r0, [r1]
	str r2, [r7]
	b _08012822
_080128A6:
	movs r3, #0x80
	lsls r2, r3, #9
	movs r0, #0xfa
	movs r1, #0x50
	bl sub_0802F11E
	ldrh r2, [r7, #4]
	b _08012884
_080128B6:
	movs r0, #0x80
	lsls r2, r0, #3
	mov sb, r2
	ldr r3, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r1, r2, r3
	str r1, [sp, #0x10]
	b _08012808
_080128C6:
	ldr r3, [sp, #8]
	mov r2, fp
	muls r2, r3, r2
	add sb, r2
	b _08012808
_080128D0:
	ldr r0, _080128F4
	ldr r1, _080128F8
	str r0, [sp]
	ldr r2, _080128FC
	ldr r0, _08012900
	movs r3, #0xa5
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080126C6
_080128E8:
	.4byte 0x0300566C
_080128EC:
	.4byte 0x0202D74C
_080128F0:
	.4byte 0x02023F90
_080128F4:
	.4byte 0x08050B24
_080128F8:
	.4byte 0x08050B30
_080128FC:
	.4byte 0x08050B90
_08012900:
	.4byte 0x08050B54
