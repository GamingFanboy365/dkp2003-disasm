@ asm/act_starthoop.s: ROM 0x010A5C-0x010CCC (rom, VMA 0x08010A5C)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_starthoop
	.thumb_func
	.type init_starthoop, %function
init_starthoop: @ 08010A5C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0xc
	cmp r7, #0
	bne _08010A72
	b _08010CA4
_08010A72:
	ldr r0, _08010AB0
	adds r1, r7, #0
	strh r0, [r7]
	adds r1, #0x9c
	ldr r6, [r1]
	ldr r2, [r6, #0xc]
	ldrh r5, [r2, #2]
	adds r4, r7, #0
	lsls r0, r5, #0x10
	asrs r6, r0, #0x10
	adds r4, #0x56
	ldr r1, _08010AB4
	strh r5, [r4]
	adds r0, r6, #0
	bl _call_via_r1
	mov r8, r0
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	mov sl, r0
	ldr r2, _08010AB8
	adds r0, r6, #0
	bl _call_via_r2
	mov sb, r0
	mov r2, sb
	lsls r5, r2, #0x10
	asrs r2, r5, #0x10
	b _08010ABC
	.byte 0x00, 0x00
_08010AB0:
	.4byte 0x00000001
_08010AB4:
	.4byte sub_03000138
_08010AB8:
	.4byte sub_03000134
_08010ABC:
	movs r0, #7
	mov r8, r2
	bl spr_get_info
	adds r1, r7, #0
	adds r1, #0x5a
	strh r0, [r1]
	ldrh r5, [r1]
	movs r4, #0x18
	adds r2, r5, #0
	muls r2, r4, r2
	movs r3, #0xb4
	ldr r4, _08010B34
	lsls r6, r3, #2
	adds r3, r4, r6
	ldr r1, _08010B38
	ldr r3, [r3]
	adds r0, r2, #0
	adds r0, #0x14
	str r3, [r1, r0]
	adds r6, #4
	adds r3, r4, r6
	ldr r6, [r3]
	subs r0, #4
	str r6, [r1, r0]
	ldr r3, _08010B28
	ldr r6, _08010B2C
	adds r0, r2, r1
	strh r6, [r1, r2]
	strh r3, [r0, #2]
	adds r3, r2, #4
	strh r6, [r1, r3]
	adds r6, r0, #0
	ldr r0, _08010B3C
	ldr r2, _08010B30
	ldrb r5, [r0, r5]
	mov ip, r0
	movs r0, #0x18
	strh r2, [r6, #0xa]
	adds r2, r5, #0
	muls r2, r0, r2
	movs r3, #0xb8
	lsls r6, r3, #2
	adds r3, r4, r6
	ldr r3, [r3]
	adds r0, r2, #0
	adds r0, #0x14
	str r3, [r1, r0]
	mov fp, r3
	movs r3, #0xb9
	lsls r0, r3, #2
	adds r3, r4, r0
	ldr r4, [r3]
	b _08010B40
_08010B28:
	.4byte 0x00000020
_08010B2C:
	.4byte 0x00000000
_08010B30:
	.4byte 0x00000050
_08010B34:
	.4byte 0x08713650
_08010B38:
	.4byte 0x02018F34
_08010B3C:
	.4byte 0x0201A734
_08010B40:
	adds r6, r2, #0
	movs r0, #0xe
	adds r6, #0x10
	str r4, [r1, r6]
	mov r6, r8
	muls r6, r0, r6
	mov sb, r4
	asrs r4, r6, #0xc
	ldr r6, _08010B8C
	adds r3, r2, r1
	strh r4, [r1, r2]
	strh r6, [r3, #2]
	adds r3, r2, #4
	mov lr, r3
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r3, r0, #0xc
	str r3, [sp, #4]
	mov r0, sp
	ldrh r3, [r0, #4]
	mov r0, lr
	strh r3, [r1, r0]
	ldr r0, _08010B90
	mov lr, r0
	adds r2, r2, r1
	mov r3, lr
	strh r3, [r2, #0xa]
	mov r2, ip
	ldrb r5, [r2, r5]
	movs r2, #0x18
	adds r3, r5, #0
	muls r3, r2, r3
	adds r2, r3, #0
	mov r0, fp
	adds r2, #0x14
	b _08010B94
	.byte 0x00, 0x00
_08010B8C:
	.4byte 0x0000001E
_08010B90:
	.4byte 0x00000038
_08010B94:
	str r0, [r1, r2]
	mov r0, sb
	subs r2, #4
	str r0, [r1, r2]
	rsbs r2, r4, #0
	adds r4, r3, r1
	strh r2, [r1, r3]
	strh r6, [r4, #2]
	ldr r0, [sp, #4]
	rsbs r2, r0, #0
	mov r0, ip
	ldrb r5, [r0, r5]
	adds r6, r3, #4
	strh r2, [r1, r6]
	adds r4, r3, r1
	mov r2, lr
	movs r6, #0x18
	strh r2, [r4, #0xa]
	adds r2, r5, #0
	muls r2, r6, r2
	adds r0, r2, #0
	mov r4, fp
	adds r0, #0x14
	str r4, [r1, r0]
	mov r6, sb
	subs r0, #4
	str r6, [r1, r0]
	movs r6, #0x16
	mov r3, r8
	muls r3, r6, r3
	adds r0, r2, r1
	asrs r4, r3, #0xc
	strh r4, [r1, r2]
	strh r6, [r0, #2]
	mov r0, sl
	muls r0, r6, r0
	asrs r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, sp
	ldrh r0, [r0, #4]
	adds r3, r2, #4
	strh r0, [r1, r3]
	adds r0, r2, r1
	mov r3, lr
	strh r3, [r0, #0xa]
	mov r0, ip
	ldrb r5, [r0, r5]
	movs r0, #0x18
	adds r3, r5, #0
	muls r3, r0, r3
	adds r0, r3, #0
	mov r2, fp
	adds r0, #0x14
	str r2, [r1, r0]
	mov r2, sb
	subs r0, #4
	str r2, [r1, r0]
	rsbs r2, r4, #0
	adds r4, r3, r1
	strh r2, [r1, r3]
	strh r6, [r4, #2]
	ldr r0, [sp, #4]
	adds r6, r3, #4
	rsbs r2, r0, #0
	strh r2, [r1, r6]
	mov r0, lr
	adds r2, r3, r1
	strh r0, [r2, #0xa]
	mov r0, ip
	ldrb r5, [r0, r5]
	movs r4, #0x18
	adds r2, r5, #0
	muls r2, r4, r2
	adds r0, r2, #0
	mov r4, fp
	adds r0, #0x14
	str r4, [r1, r0]
	mov r6, sb
	subs r0, #4
	str r6, [r1, r0]
	movs r0, #0x1e
	mov r3, r8
	muls r3, r0, r3
	ldr r6, _08010C78
	asrs r4, r3, #0xc
	adds r3, r2, r1
	strh r4, [r1, r2]
	strh r6, [r3, #2]
	adds r3, r2, #4
	mov r8, r3
	mov r3, sl
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xc
	mov r3, r8
	strh r0, [r1, r3]
	adds r2, r2, r1
	mov r3, lr
	strh r3, [r2, #0xa]
	mov r2, ip
	ldrb r5, [r2, r5]
	movs r2, #0x18
	adds r3, r5, #0
	muls r3, r2, r3
	adds r2, r3, #0
	mov r5, fp
	adds r2, #0x14
	str r5, [r1, r2]
	subs r2, #4
	mov r5, sb
	str r5, [r1, r2]
	rsbs r4, r4, #0
	adds r2, r3, r1
	b _08010C7C
_08010C78:
	.4byte 0x0000000B
_08010C7C:
	strh r4, [r1, r3]
	strh r6, [r2, #2]
	adds r6, r3, #4
	rsbs r2, r0, #0
	strh r2, [r1, r6]
	adds r0, r3, r1
	mov r6, lr
	strh r6, [r0, #0xa]
	adds r0, r7, #0
	bl sub_080021E8
	add sp, #0xc
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08010CA4:
	ldr r0, _08010CBC
	ldr r1, _08010CC0
	str r0, [sp]
	ldr r2, _08010CC4
	ldr r0, _08010CC8
	movs r3, #0x18
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010A72
_08010CBC:
	.4byte 0x080507AC
_08010CC0:
	.4byte 0x080507B8
_08010CC4:
	.4byte 0x080507CC
_08010CC8:
	.4byte 0x080507DC
