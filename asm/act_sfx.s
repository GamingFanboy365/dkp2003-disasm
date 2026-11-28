@ asm/act_sfx.s: ROM 0x013C10-0x013ED8 (rom, VMA 0x08013C10)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_sfx
	.thumb_func
	.type init_sfx, %function
init_sfx: @ 08013C10
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08013C3A
_08013C1A:
	ldr r0, _08013C30
	movs r2, #1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0xa0
	rsbs r1, r2, #0
	str r1, [r0, #8]
	str r1, [r0]
	str r1, [r0, #4]
	add sp, #4
	b _08013C34
_08013C30:
	.4byte 0x00000001
_08013C34:
	pop {r4}
	pop {r0}
	bx r0
_08013C3A:
	ldr r0, _08013C54
	ldr r1, _08013C58
	str r0, [sp]
	ldr r2, _08013C5C
	ldr r0, _08013C60
	movs r3, #0x1a
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08013C1A
	.byte 0x00, 0x00
_08013C54:
	.4byte gUnk_08051014
_08013C58:
	.4byte gUnk_08051020
_08013C5C:
	.4byte gUnk_08051030
_08013C60:
	.4byte gUnk_0805103C

	.global free_sfx
	.thumb_func
	.type free_sfx, %function
free_sfx: @ 08013C64
	bx lr
	.byte 0xC0, 0x46

	.global sub_08013C68
	.thumb_func
	.type sub_08013C68, %function
sub_08013C68: @ 08013C68
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r0, _08013D40
	mov sb, r0
	mov r2, sb
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r7, #0
	sub sp, #0x40
	cmp r7, r0
	bge _08013D08
	movs r0, #4
	rsbs r4, r0, #0
	add r3, sp, #0x20
	mov sl, r3
	.2byte 0x446C @ add r4, sp, r4
	movs r0, #0
	mov r8, sp
	mov lr, r4
	mov ip, r0
	mov fp, sl
_08013C9C:
	ldr r6, _08013D44
	mov r2, ip
	ldr r1, [r6, r2]
	adds r1, #0xa0
	ldr r4, [r1, #4]
	movs r0, #0x28
	muls r0, r4, r0
	ldr r3, _08013D40
	adds r0, #0xb0
	ldr r2, [r3, r0]
	mov r0, ip
	mov r3, r8
	str r2, [r0, r3]
	ldr r6, [r1, #4]
	mov r4, fp
	str r6, [r4, r0]
	adds r6, r7, #0
	cmp r7, #0
	ble _08013CF6
	mov r0, lr
	ldr r1, [r0]
	cmp r2, r1
	ble _08013CF6
	lsls r1, r7, #2
	add r3, sp, #0
	mov r5, sl
	subs r0, r1, #4
	adds r4, r3, #0
_08013CD4:
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	str r3, [r4, r1]
	str r2, [r4, r0]
	ldr r2, [r1, r5]
	ldr r3, [r0, r5]
	subs r6, #1
	str r3, [r1, r5]
	str r2, [r0, r5]
	subs r1, #4
	subs r0, #4
	cmp r6, #0
	ble _08013CF6
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	cmp r2, r3
	bgt _08013CD4
_08013CF6:
	ldr r1, _08013D48
	movs r4, #0
	ldrsh r2, [r1, r4]
	movs r0, #4
	adds r7, #1
	add lr, r0
	add ip, r0
	cmp r7, r2
	blt _08013C9C
_08013D08:
	mov r2, sb
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r7, #0
	cmp r7, r0
	bge _08013D2C
	adds r0, r2, #0
	add r1, sp, #0x20
	adds r2, #0x18
_08013D1C:
	ldm r1!, {r4}
	strb r4, [r2]
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r7, #1
	adds r2, #1
	cmp r7, r3
	blt _08013D1C
_08013D2C:
	add sp, #0x40
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08013D40:
	.4byte gGameSetup
_08013D44:
	.4byte gRacerObjects
_08013D48:
	.4byte 0x0202D7D4

	.global sub_08013D4C
	.thumb_func
	.type sub_08013D4C, %function
sub_08013D4C: @ 08013D4C
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x44
	str r0, [sp]
	ldr r0, _08013EC8
	mov sb, r0
	mov r2, sb
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r7, #0
	cmp r7, r0
	bge _08013DE6
	add r3, sp, #0x24
	mov sl, r3
	add r4, sp, #4
	movs r0, #0
	mov r8, r4
	mov lr, sp
	mov ip, r0
	mov fp, sl
_08013D7E:
	ldr r4, _08013ECC
	mov r1, ip
	ldr r0, [r1, r4]
	movs r2, #0x92
	lsls r6, r2, #1
	adds r3, r0, r6
	adds r5, r0, #0
	ldr r0, [r3]
	mov r2, r8
	str r0, [r1, r2]
	adds r5, #0xa0
	ldr r2, [r5, #4]
	mov r4, fp
	str r2, [r4, r1]
	adds r6, r7, #0
	cmp r7, #0
	ble _08013DD4
	mov r1, lr
	ldr r5, [r1]
	cmp r0, r5
	ble _08013DD4
	lsls r1, r7, #2
	add r3, sp, #4
	mov r5, sl
	subs r0, r1, #4
	adds r4, r3, #0
_08013DB2:
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	str r3, [r4, r1]
	str r2, [r4, r0]
	ldr r2, [r1, r5]
	ldr r3, [r0, r5]
	subs r6, #1
	str r3, [r1, r5]
	str r2, [r0, r5]
	subs r1, #4
	subs r0, #4
	cmp r6, #0
	ble _08013DD4
	ldr r2, [r4, r1]
	ldr r3, [r4, r0]
	cmp r2, r3
	bgt _08013DB2
_08013DD4:
	ldr r2, _08013ED0
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #4
	adds r7, #1
	add lr, r0
	add ip, r0
	cmp r7, r1
	blt _08013D7E
_08013DE6:
	mov r2, sb
	adds r2, #0x88
	movs r1, #0
	ldrsh r4, [r2, r1]
	movs r7, #0
	cmp r7, r4
	bge _08013E0E
	adds r0, r2, #0
	add r1, sp, #0x24
	adds r2, #0x20
_08013DFA:
	ldm r1!, {r4}
	strb r4, [r2]
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r7, #1
	adds r2, #1
	cmp r7, r5
	blt _08013DFA
	ldr r0, _08013EC8
	mov sb, r0
_08013E0E:
	mov r2, sb
	adds r2, #0x88
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r7, #0
	cmp r7, r0
	bge _08013E3E
	ldr r5, _08013ECC
	adds r1, r2, #0
	mov r4, sb
	add r2, sp, #0x24
_08013E24:
	ldm r2!, {r0}
	lsls r3, r0, #2
	ldr r0, [r5, r3]
	adds r3, r0, #0
	adds r3, #0xa0
	ldr r0, [r3, #4]
	adds r0, #0x98
	strb r7, [r4, r0]
	movs r0, #0
	ldrsh r3, [r1, r0]
	adds r7, #1
	cmp r7, r3
	blt _08013E24
_08013E3E:
	ldr r4, _08013ED4
	ldr r1, [r4]
	movs r5, #0
	movs r7, #0
	cmp r5, r1
	bge _08013E6A
	ldr r6, _08013EC8
_08013E4C:
	ldr r3, _08013ECC
	lsls r1, r7, #2
	ldr r0, [r3, r1]
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r3, [r1]
	movs r2, #0x80
	lsls r2, r2, #0xb
	ands r3, r2
	cmp r3, #0
	beq _08013E8A
_08013E62:
	ldr r0, [r4]
	adds r7, #1
	cmp r7, r0
	blt _08013E4C
_08013E6A:
	cmp r5, #1
	beq _08013E80
_08013E6E:
	add sp, #0x44
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08013E80:
	ldr r1, _08013EC8
	movs r3, #8
	adds r1, #0x8c
	str r3, [r1]
	b _08013E6E
_08013E8A:
	movs r4, #0x92
	lsls r3, r4, #1
	adds r4, r0, r3
	ldr r2, [r4]
	cmp r2, #0
	ble _08013EAC
	ldr r0, [r1, #4]
	movs r4, #0x28
	muls r0, r4, r0
	ldr r2, [sp]
	adds r2, #0xa0
	ldr r1, [r2, #4]
	ldr r4, _08013ED4
	adds r0, #0xb0
	adds r5, #1
	str r1, [r6, r0]
	b _08013E62
_08013EAC:
	movs r4, #0x8f
	lsls r2, r4, #1
	adds r4, r0, r2
	ldrb r3, [r4]
	movs r1, #0xf
	ands r1, r3
	movs r3, #0x10
	orrs r1, r3
	strb r1, [r4]
	bl sub_0800A7E0
	ldr r4, _08013ED4
	b _08013E62
	.byte 0x00, 0x00
_08013EC8:
	.4byte gGameSetup
_08013ECC:
	.4byte gRacerObjects
_08013ED0:
	.4byte 0x0202D7D4
_08013ED4:
	.4byte gLinkPlayerCount
