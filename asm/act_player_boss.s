@ asm/act_player_boss.s: ROM 0x0246C0-0x025EBC (rom, VMA 0x080246C0)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_player_boss
	.thumb_func
	.type init_player_boss, %function
init_player_boss: @ 080246C0
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	sub sp, #0x3c
	cmp r7, #0
	bne _080246D6
	b _08024CB4
_080246D6:
	adds r1, r7, #0
	adds r1, #0xa0
	str r1, [sp, #0x20]
	ldr r0, _08024718
	ldr r3, [r1, #4]
	ldr r2, _0802471C
	str r3, [sp, #0x2c]
	strh r0, [r7]
	adds r0, r7, #0
	mov sb, r2
	bl sub_080036BC
	ldr r5, _08024720
	mov fp, r0
	movs r0, #0
	ldrsh r6, [r5, r0]
	movs r2, #0x2c
	adds r4, r6, #0
	muls r4, r2, r4
	ldr r0, _08024724
	ldr r1, [r0]
	adds r3, r1, r4
	ldrh r1, [r3, #6]
	ldr r2, _08024728
	str r1, [sp, #0x1c]
	ldr r6, [r2]
	lsls r4, r1, #2
	ldrh r5, [r3, #8]
	mov sl, r3
	adds r3, r4, r6
	mov lr, r2
	b _0802472C
	.byte 0x00, 0x00
_08024718:
	.4byte 0x00000001
_0802471C:
	.4byte 0x0202E810
_08024720:
	.4byte 0x0202EA10
_08024724:
	.4byte 0x0202EA08
_08024728:
	.4byte 0x0202EA0C
_0802472C:
	ldrh r2, [r3]
	str r2, [sp, #0x18]
	cmp r5, #1
	ble _080247AE
	movs r4, #0
	cmp r5, #0
	beq _0802474A
	adds r1, r3, #2
	adds r2, r5, #0
_0802473E:
	ldrh r6, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r6
	cmp r2, #0
	bne _0802473E
_0802474A:
	movs r2, #0x80
	lsls r6, r2, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _08024756
	b _08024CB0
_08024756:
	adds r0, r6, #0
	ldr r2, _08024A5C
	bl _call_via_r2
	mov r8, r0
	adds r0, r6, #0
	eors r0, r4
	cmp r0, #0
	bge _0802476A
	b _08024CA8
_0802476A:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	blt _0802477A
	b _08024CA0
_0802477A:
	ldr r3, _08024A60
	ldr r0, [sp, #0x1c]
	ldr r6, [r3]
	mov lr, r3
	lsls r3, r0, #2
	adds r1, r3, r6
	adds r3, r0, r5
	lsls r0, r3, #2
	str r0, [sp, #4]
_0802478C:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _080247A4
	ldrh r2, [r1]
	ldr r3, [sp, #4]
	str r2, [sp, #0x18]
	adds r1, r3, r6
	adds r2, r5, #0
_080247A4:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _0802478C
	ldr r0, _08024A64
_080247AE:
	ldr r3, [sp, #0x18]
	movs r2, #0x2c
	adds r4, r3, #0
	muls r4, r2, r4
	ldr r6, [r0]
	adds r1, r6, r4
	str r1, [sp, #0x34]
	ldrh r5, [r1, #6]
	str r5, [sp, #0x14]
	mov r3, lr
	ldr r4, [r3]
	ldr r3, [sp, #0x14]
	lsls r6, r3, #2
	adds r3, r6, r4
	ldrh r5, [r1, #8]
	ldrh r4, [r3]
	str r4, [sp, #0x10]
	cmp r5, #1
	ble _08024850
	movs r4, #0
	cmp r5, #0
	beq _080247EA
	adds r1, r3, #2
	adds r2, r5, #0
_080247DE:
	ldrh r0, [r1]
	subs r2, #1
	adds r1, #4
	adds r4, r4, r0
	cmp r2, #0
	bne _080247DE
_080247EA:
	movs r1, #0x80
	lsls r6, r1, #9
	adds r1, r4, #0
	cmp r4, #0
	bge _080247F6
	b _08024C9C
_080247F6:
	ldr r2, _08024A5C
	adds r0, r6, #0
	bl _call_via_r2
	adds r2, r6, #0
	eors r2, r4
	mov r8, r0
	cmp r2, #0
	bge _0802480A
	b _08024C94
_0802480A:
	bl multi_lfsr_next
	movs r2, #0
	mov ip, r0
	movs r4, #0
	cmp r2, r5
	blt _0802481A
	b _08024C8C
_0802481A:
	ldr r0, _08024A60
	ldr r3, [sp, #0x14]
	ldr r6, [r0]
	mov lr, r0
	lsls r0, r3, #2
	adds r1, r0, r6
	ldr r0, [sp, #0x14]
	adds r3, r0, r5
	lsls r0, r3, #2
	str r0, [sp, #4]
_0802482E:
	ldrh r3, [r1, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r4, r4, r3
	cmp ip, r4
	bge _08024846
	ldrh r2, [r1]
	ldr r0, [sp, #4]
	str r2, [sp, #0x10]
	adds r1, r0, r6
	adds r2, r5, #0
_08024846:
	adds r2, #1
	adds r1, #4
	cmp r2, r5
	blt _0802482E
	ldr r0, _08024A64
_08024850:
	ldr r3, [sp, #0x10]
	movs r2, #0x2c
	adds r5, r3, #0
	muls r5, r2, r5
	ldr r4, [r0]
	adds r1, r4, r5
	str r1, [sp, #0x30]
	ldrh r6, [r1, #6]
	str r6, [sp, #0xc]
	mov r3, lr
	ldr r4, [r3]
	ldr r3, [sp, #0xc]
	lsls r5, r3, #2
	adds r2, r5, r4
	ldrh r6, [r1, #8]
	ldrh r5, [r2]
	str r5, [sp, #8]
	cmp r6, #1
	ble _080248EC
	movs r5, #0
	cmp r6, #0
	beq _0802488C
	adds r2, #2
	adds r1, r6, #0
_08024880:
	ldrh r0, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r0
	cmp r1, #0
	bne _08024880
_0802488C:
	movs r1, #0x80
	lsls r4, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _08024898
	b _08024C88
_08024898:
	ldr r2, _08024A5C
	adds r0, r4, #0
	bl _call_via_r2
	adds r2, r4, #0
	eors r2, r5
	mov r8, r0
	cmp r2, #0
	bge _080248AC
	b _08024C82
_080248AC:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r6
	bge _080248EA
	ldr r4, _08024A60
	ldr r0, [sp, #0xc]
	ldr r2, [r4]
	lsls r3, r0, #2
	adds r4, r3, r2
	adds r3, r0, r6
	lsls r3, r3, #2
	mov lr, r3
_080248CA:
	ldrh r3, [r4, #2]
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
	adds r5, r5, r3
	cmp ip, r5
	bge _080248E2
	ldrh r3, [r4]
	mov r1, lr
	str r3, [sp, #8]
	adds r4, r1, r2
	adds r1, r6, #0
_080248E2:
	adds r1, #1
	adds r4, #4
	cmp r1, r6
	blt _080248CA
_080248EA:
	ldr r0, _08024A64
_080248EC:
	ldr r5, [sp, #8]
	movs r2, #0x2c
	muls r2, r5, r2
	ldr r1, [r0]
	adds r4, r1, r2
	mov r1, sl
	movs r0, #0
	ldrsh r3, [r1, r0]
	mov r0, sb
	lsls r1, r3, #8
	str r1, [r0, #0x28]
	ldr r0, [sp, #0x34]
	movs r1, #0
	ldrsh r3, [r0, r1]
	mov r1, sb
	lsls r0, r3, #8
	str r0, [r1, #0x2c]
	ldr r1, [sp, #0x30]
	movs r0, #0
	ldrsh r3, [r1, r0]
	mov r0, sb
	lsls r1, r3, #8
	str r1, [r0, #0x30]
	movs r1, #0
	ldrsh r3, [r4, r1]
	lsls r1, r3, #8
	str r1, [r0, #0x34]
	mov r1, sl
	movs r0, #2
	ldrsh r3, [r1, r0]
	mov r0, sb
	lsls r1, r3, #8
	str r1, [r0, #0x38]
	ldr r0, [sp, #0x34]
	movs r1, #2
	ldrsh r3, [r0, r1]
	mov r1, sb
	lsls r0, r3, #8
	str r0, [r1, #0x3c]
	ldr r1, [sp, #0x30]
	movs r0, #2
	ldrsh r3, [r1, r0]
	mov r0, sb
	lsls r1, r3, #8
	str r1, [r0, #0x40]
	movs r1, #2
	ldrsh r3, [r4, r1]
	lsls r1, r3, #8
	str r1, [r0, #0x44]
	mov r1, sl
	movs r0, #4
	ldrsh r3, [r1, r0]
	mov r0, sb
	lsls r1, r3, #8
	str r1, [r0, #0x48]
	ldr r0, [sp, #0x34]
	movs r1, #4
	ldrsh r3, [r0, r1]
	mov r1, sb
	lsls r0, r3, #8
	str r0, [r1, #0x4c]
	ldr r1, [sp, #0x30]
	movs r0, #4
	ldrsh r3, [r1, r0]
	mov r0, sb
	lsls r1, r3, #8
	str r1, [r0, #0x50]
	movs r1, #4
	ldrsh r3, [r4, r1]
	lsls r4, r3, #8
	str r4, [r0, #0x54]
	movs r4, #0
	str r4, [r0, #0x58]
	mov r3, sb
	str r5, [r0, #0x24]
	movs r5, #1
	rsbs r1, r5, #0
	adds r3, #0xf0
	str r1, [r3]
	ldr r2, [r7, #0x24]
	adds r5, r7, #0
	adds r5, #0x84
	str r2, [r5]
	ldr r2, [r7, #0x28]
	adds r5, #4
	str r2, [r5]
	ldr r2, [r7, #0x2c]
	adds r5, #4
	str r2, [r5]
	ldr r2, [r7, #0x28]
	ldr r5, [r7, #0x24]
	str r2, [r7, #0x34]
	ldr r2, [r7, #0x2c]
	str r5, [r7, #0x30]
	str r2, [r7, #0x38]
	str r5, [r0, #0x5c]
	ldr r5, [r7, #0x28]
	str r5, [r0, #0x60]
	ldr r2, [r7, #0x2c]
	str r2, [r0, #0x64]
	ldr r5, [r7, #0x24]
	str r5, [r0, #0x68]
	ldr r2, [r7, #0x28]
	str r2, [r0, #0x6c]
	ldr r5, [r7, #0x2c]
	movs r3, #0x94
	str r5, [r0, #0x70]
	ldr r0, [sp, #0x20]
	lsls r5, r3, #1
	adds r2, r7, r5
	str r1, [r0, #8]
	str r1, [r2]
	movs r1, #0x8e
	lsls r2, r1, #1
	mov r1, fp
	ldr r3, [r1, #0x14]
	add r2, sb
	str r3, [r2]
	movs r3, #0x8c
	lsls r2, r3, #1
	ldr r3, [r1, #0x18]
	add r2, sb
	str r3, [r2]
	adds r2, r5, #0
	add r2, sb
	str r4, [r2]
	movs r3, #0xc2
	ldr r0, [r1, #0x1c]
	lsls r5, r3, #1
	add r5, sb
	movs r3, #0xc4
	str r0, [r5]
	ldr r0, [r1, #0x20]
	lsls r5, r3, #1
	add r5, sb
	str r0, [r5]
	ldr r2, [sp, #0x20]
	adds r0, r7, #0
	ldrh r1, [r2, #0xe]
	adds r0, #0x56
	strh r1, [r0]
	ldr r0, [sp, #0x20]
	strh r1, [r0, #0x38]
	ldr r5, [r7, #0x24]
	str r5, [r0, #0x3c]
	ldr r2, [r7, #0x28]
	str r2, [r0, #0x40]
	ldr r1, [r7, #0x2c]
	movs r5, #0x81
	lsls r3, r5, #1
	ldr r2, _08024A58
	str r1, [r0, #0x44]
	adds r5, r7, r3
	movs r1, #0x92
	strh r2, [r5]
	lsls r2, r1, #1
	movs r5, #0x80
	adds r1, r7, r2
	lsls r2, r5, #9
	str r2, [r1]
	movs r1, #0xe
	ldrsh r5, [r0, r1]
	mov r2, sb
	str r5, [r2, #8]
	movs r0, #0xb6
	lsls r5, r0, #1
	mov r0, fp
	ldr r1, [r0, #0x2c]
	add r5, sb
	str r1, [r5]
	movs r3, #0xb8
	ldr r1, [r0, #0x30]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xba
	ldr r1, [r0, #0x34]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	b _08024A68
	.byte 0x00, 0x00
_08024A58:
	.4byte 0x00000006
_08024A5C:
	.4byte udiv
_08024A60:
	.4byte 0x0202EA0C
_08024A64:
	.4byte 0x0202EA08
_08024A68:
	movs r3, #0xbc
	ldr r1, [r0, #0x4c]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xbe
	ldr r1, [r0, #0x50]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xc0
	ldr r1, [r0, #0x54]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	ldr r1, [r0, #0x44]
	subs r5, #0xc0
	str r1, [r5]
	ldr r1, [r0, #0x48]
	adds r5, #4
	str r1, [r5]
	movs r3, #0xa6
	ldr r1, [r0, #0x4c]
	lsls r5, r3, #1
	add r5, sb
	movs r3, #0xa8
	str r1, [r5]
	ldr r1, [r0, #0x58]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xaa
	ldr r1, [r0, #0x50]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xac
	ldr r1, [r0, #0x5c]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xae
	ldr r1, [r0, #0x54]
	lsls r5, r3, #1
	add r5, sb
	str r1, [r5]
	movs r3, #0xb0
	ldr r1, [r0, #0x60]
	lsls r5, r3, #1
	mov r0, sp
	adds r0, #0x3a
	add r5, sb
	str r1, [r5]
	strh r4, [r0]
	ldr r3, [sp, #0x2c]
	movs r1, #0xc
	adds r5, r3, #0
	muls r5, r1, r5
	ldr r2, _08024CCC
	adds r1, r5, r2
	ldr r2, _08024CD0
	bl CpuSet
	ldr r1, _08024CD4
	str r4, [sp, #0x24]
	str r4, [sp, #0x28]
	movs r0, #0
	ldrsh r5, [r1, r0]
	movs r0, #0xd0
	lsls r1, r0, #1
	add r1, sb
	mov fp, r1
_08024AF8:
	movs r1, #0x2c
	adds r2, r5, #0
	muls r2, r1, r2
	ldr r0, _08024CD8
	ldr r5, [r0]
	adds r1, r5, r2
	ldrh r2, [r1, #6]
	ldrh r5, [r1, #8]
	ldr r1, _08024CDC
	ldr r3, [r1]
	lsls r1, r2, #2
	ldrh r3, [r1, r3]
	mov sl, r2
	mov r8, r3
	cmp r5, #1
	ble _08024B8E
	movs r6, #0
	cmp r5, #0
	beq _08024B34
	ldr r0, _08024CDC
	ldr r4, [r0]
	adds r7, r1, r4
	adds r2, r7, #2
	adds r4, r5, #0
_08024B28:
	ldrh r1, [r2]
	subs r4, #1
	adds r2, #4
	adds r6, r6, r1
	cmp r4, #0
	bne _08024B28
_08024B34:
	movs r3, #0x80
	lsls r4, r3, #9
	adds r1, r6, #0
	cmp r6, #0
	bge _08024B40
	b _08024C7E
_08024B40:
	ldr r7, _08024CE0
	adds r0, r4, #0
	bl _call_via_r7
	adds r2, r4, #0
	eors r2, r6
	adds r7, r0, #0
	cmp r2, #0
	bge _08024B54
	b _08024C7A
_08024B54:
	bl multi_lfsr_next
	movs r4, #0
	mov ip, r0
	movs r6, #0
	cmp r4, r5
	bge _08024B8C
	ldr r2, _08024CDC
	mov r0, sl
	mov lr, r2
	ldr r2, [r2]
	lsls r3, r0, #2
	adds r1, r3, r2
	adds r3, r0, r5
	lsls r0, r3, #2
_08024B72:
	ldrh r3, [r1, #2]
	muls r3, r7, r3
	adds r6, r6, r3
	cmp ip, r6
	bge _08024B84
	ldrh r1, [r1]
	adds r4, r5, #0
	mov r8, r1
	adds r1, r0, r2
_08024B84:
	adds r4, #1
	adds r1, #4
	cmp r4, r5
	blt _08024B72
_08024B8C:
	ldr r0, _08024CD8
_08024B8E:
	movs r1, #0x2c
	mov r2, r8
	muls r2, r1, r2
	ldr r1, [r0]
	adds r3, r1, r2
	mov sl, r3
	adds r3, #0x28
	ldrb r0, [r3]
	mov r5, r8
	cmp r0, #0
	beq _08024C34
	ldr r4, [sp, #0x28]
	cmp r4, #0
	beq _08024C70
	ldr r3, [sp, #0x28]
	cmp r3, #0xa
	beq _08024C64
	ldr r2, [sp, #0x28]
	cmp r2, #0x14
	beq _08024C58
_08024BB6:
	movs r0, #0x34
	bl obj_new
	adds r4, r0, #0
	adds r1, r4, #0
	movs r2, #0x7d
	adds r1, #0xa0
	str r2, [r1]
	movs r1, #3
	bl obj_initialise
	mov r1, sl
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	movs r3, #0
	lsls r0, r2, #8
	str r3, [r4, #0x28]
	str r0, [r4, #0x24]
	movs r0, #0x16
	ldrsh r2, [r1, r0]
	mov r1, fp
	lsls r0, r2, #8
	str r0, [r4, #0x2c]
	str r4, [r1]
	movs r0, #0x34
	bl obj_new
	adds r4, r0, #0
	adds r1, r4, #0
	movs r2, #0x7c
	adds r1, #0xa0
	str r2, [r1]
	movs r1, #3
	bl obj_initialise
	mov r0, sl
	movs r2, #0x14
	ldrsh r3, [r0, r2]
	movs r1, #0x18
	ldrsh r2, [r0, r1]
	adds r1, r3, r2
	lsls r2, r1, #8
	movs r3, #0
	str r2, [r4, #0x24]
	str r3, [r4, #0x28]
	movs r1, #0x16
	ldrsh r3, [r0, r1]
	movs r1, #0x1a
	ldrsh r2, [r0, r1]
	adds r1, r3, r2
	lsls r0, r1, #8
	mov r2, fp
	str r0, [r4, #0x2c]
	str r4, [r2, #4]
	ldr r3, [sp, #0x28]
	movs r2, #8
	adds r3, #2
	add fp, r2
	str r3, [sp, #0x28]
	cmp r3, #0x15
	ble _08024C34
	movs r3, #1
	str r3, [sp, #0x24]
_08024C34:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _08024C3C
	b _08024AF8
_08024C3C:
	movs r3, #0xce
	lsls r1, r3, #1
	add r1, sb
	movs r0, #0
	str r0, [r1]
	add sp, #0x3c
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08024C58:
	movs r1, #0xcc
	lsls r0, r1, #1
	add r0, sb
	mov r2, r8
	str r2, [r0]
	b _08024BB6
_08024C64:
	movs r4, #0xca
	lsls r1, r4, #1
	add r1, sb
	mov r0, r8
	str r0, [r1]
	b _08024BB6
_08024C70:
	movs r0, #0xc8
	lsls r2, r0, #1
	add r2, sb
	str r5, [r2]
	b _08024BB6
_08024C7A:
	rsbs r7, r7, #0
	b _08024B54
_08024C7E:
	rsbs r1, r6, #0
	b _08024B40
_08024C82:
	rsbs r0, r0, #0
	mov r8, r0
	b _080248AC
_08024C88:
	rsbs r1, r5, #0
	b _08024898
_08024C8C:
	ldr r3, _08024CDC
	ldr r0, _08024CD8
	mov lr, r3
	b _08024850
_08024C94:
	mov r3, r8
	rsbs r3, r3, #0
	mov r8, r3
	b _0802480A
_08024C9C:
	rsbs r1, r4, #0
	b _080247F6
_08024CA0:
	ldr r3, _08024CDC
	ldr r0, _08024CD8
	mov lr, r3
	b _080247AE
_08024CA8:
	mov r2, r8
	rsbs r2, r2, #0
	mov r8, r2
	b _0802476A
_08024CB0:
	rsbs r1, r4, #0
	b _08024756
_08024CB4:
	ldr r0, _08024CE4
	ldr r1, _08024CE8
	str r0, [sp]
	ldr r2, _08024CEC
	ldr r0, _08024CF0
	ldr r3, _08024CF4
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _080246D6
_08024CCC:
	.4byte 0x02004224
_08024CD0:
	.4byte 0x01000006
_08024CD4:
	.4byte 0x0202EA10
_08024CD8:
	.4byte 0x0202EA08
_08024CDC:
	.4byte 0x0202EA0C
_08024CE0:
	.4byte udiv
_08024CE4:
	.4byte gUnk_080529BC
_08024CE8:
	.4byte gUnk_080529C8
_08024CEC:
	.4byte gUnk_080529E0
_08024CF0:
	.4byte gUnk_080529F4
_08024CF4:
	.4byte 0x000008E2

	.global act_player_boss
	.thumb_func
	.type act_player_boss, %function
act_player_boss: @ 08024CF8
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	sub sp, #0x38
	mov sb, r0
	cmp r0, #0
	bne _08024D10
	.2byte 0xF000, 0xFECE @ bl #0x8025aac
_08024D10:
	mov r0, sb
	adds r0, #0xa0
	str r0, [sp, #0x20]
	ldr r4, [r0, #4]
	movs r6, #0xc
	adds r2, r4, #0
	muls r2, r6, r2
	ldr r1, _08024FA8
	mov fp, r1
	ldr r1, _08024FAC
	ldr r7, _08024FB0
	adds r5, r2, r1
	str r5, [sp, #0x28]
	lsls r6, r4, #1
	ldrh r4, [r7, r6]
	adds r7, r5, #0
	strh r4, [r7]
	ldr r5, _08024FB4
	ldr r1, [sp, #0x28]
	ldrh r4, [r5, r6]
	ldr r7, [r0, #8]
	strh r4, [r1, #2]
	cmp r7, #0
	bne _08024D44
	.2byte 0xF000, 0xFE63 @ bl #0x8025a0a
_08024D44:
	cmp r7, #0
	bgt _08024D4C
	.2byte 0xF000, 0xFE28 @ bl #0x802599c
_08024D4C:
	cmp r7, #4
	ble _08024D54
	.2byte 0xF000, 0xFE17 @ bl #0x8025982
_08024D54:
	ldr r7, [sp, #0x28]
	movs r0, #0
	str r0, [r7, #4]
	str r0, [r7, #8]
	mov r8, r0
	add r0, sp, #0x2c
	str r0, [sp]
	add r2, sp, #0x34
	add r3, sp, #0x30
	mov r0, sb
	mov r1, fp
	bl sub_08023118
	mov r2, fp
	ldr r3, [r2, #0x64]
	ldr r1, [sp, #0x34]
	ldr r6, [sp, #0x2c]
	ldr r7, [r2, #0x5c]
	ldr r5, _08024FB8
	subs r0, r1, r7
	subs r1, r6, r3
	mov sl, r3
	bl _call_via_r5
	adds r2, r0, #0
	lsls r3, r2, #0x10
	mov r5, fp
	lsrs r1, r3, #0x10
	ldrh r0, [r5, #8]
	ldr r4, _08024FBC
	bl _call_via_r4
	ldr r6, [r5, #8]
	lsls r2, r0, #0x10
	asrs r3, r2, #0x13
	subs r4, r6, r3
	str r4, [r5, #8]
	ldr r1, [sp, #0x20]
	ldr r3, [r1, #8]
	cmp r3, #4
	bne _08024DAA
	bl sub_0802585E
_08024DAA:
	cmp r3, #2
	bne _08024DB2
	bl sub_080257C6
_08024DB2:
	mov r1, fp
	ldr r0, [r1, #0x10]
	movs r2, #0xb9
	lsls r6, r2, #3
	lsls r5, r0, #1
	adds r0, r5, #0
	muls r0, r6, r0
	lsls r1, r4, #0x10
	asrs r4, r1, #0x10
	asrs r6, r0, #0x10
	ldr r5, _08024FC0
	adds r0, r4, #0
	bl _call_via_r5
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r5, r0, #0x10
	ldr r2, _08024FC4
	adds r0, r4, #0
	bl _call_via_r2
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r4, r6, #0
	muls r4, r3, r4
	adds r1, r6, #0
	muls r1, r5, r1
	asrs r2, r4, #0xc
	asrs r4, r1, #0xc
	adds r0, r7, r2
	add r4, sl
	mov r2, fp
	str r0, [r2, #0x5c]
	str r4, [r2, #0x64]
	ldr r6, [sp, #0x20]
	ldr r3, [r6, #8]
	cmp r3, #1
	bne _08024E02
	bl sub_08025794
_08024E02:
	cmp r3, #3
	bne _08024E0A
	bl sub_08025762
_08024E0A:
	ldr r3, [sp, #0x28]
	mov r5, r8
	str r5, [r3, #4]

	.global sub_08024E10
	.thumb_func
	.type sub_08024E10, %function
sub_08024E10: @ 08024E10
	ldr r0, [sp, #0x20]
	ldr r3, [r0, #8]
	cmp r3, #1
	bne _08024E1C
	bl sub_0802572E
_08024E1C:
	cmp r3, #3
	bne _08024E24
	bl sub_0802572E
_08024E24:
	ldr r1, [sp, #0x28]
	movs r4, #0
	str r4, [r1, #8]

	.global sub_08024E2A
	.thumb_func
	.type sub_08024E2A, %function
sub_08024E2A: @ 08024E2A
	mov r0, fp
	adds r0, #0xc8
	ldr r1, [r0]
	cmp r1, #0
	bne sub_08024E38
	bl sub_080256DE

	.global sub_08024E38
	.thumb_func
	.type sub_08024E38, %function
sub_08024E38: @ 08024E38
	mov r7, fp
	adds r7, #0xfc

	.global sub_08024E3C
	.thumb_func
	.type sub_08024E3C, %function
sub_08024E3C: @ 08024E3C
	ldr r2, [sp, #0x28]
	mov r0, sb
	mov r1, fp
	bl sub_08023484
	mov r0, sb
	ldr r2, [sp, #0x28]
	mov r1, fp
	bl sub_08023964
	mov r0, sb
	ldr r2, [sp, #0x28]
	mov r1, fp
	bl sub_0802389C
	mov r0, sb
	mov r1, fp
	ldr r2, [sp, #0x28]
	bl sub_08023D74
	mov r3, fp
	adds r3, #0xdc
	ldr r6, [r3]
	cmp r6, #0
	bne _08024E72
	bl sub_080256C8
_08024E72:
	mov r0, sb
	mov r1, fp
	bl sub_08023B48

	.global sub_08024E7A
	.thumb_func
	.type sub_08024E7A, %function
sub_08024E7A: @ 08024E7A
	mov r1, fp
	ldr r6, [r1, #0x6c]
	adds r2, r6, r0
	str r2, [r1, #0x6c]
	ldr r2, [sp, #0x28]
	mov r0, sb
	bl sub_080240A0
	mov r0, sb
	ldr r2, [sp, #0x28]
	mov r1, fp
	bl sub_080241D0
	mov r0, sb
	mov r1, fp
	bl sub_08024384
	movs r5, #0xf4
	movs r6, #0xf6
	add r6, sb
	mov r2, sb
	mov r3, sb
	mov r4, sb
	add r5, sb
	adds r2, #0x54
	adds r3, #0x56
	adds r4, #0x58
	mov r8, r6
	mov sl, r5
	adds r6, #2
	str r2, [sp, #0x10]
	str r3, [sp, #0xc]
	str r4, [sp, #8]
	ldr r5, [sp, #0x20]
	movs r4, #0x80
	ldr r0, [r5]
	lsls r3, r4, #9
	ands r0, r3
	cmp r0, #0
	bne sub_08024ECE
	bl sub_080256AE

	.global sub_08024ECE
	.thumb_func
	.type sub_08024ECE, %function
sub_08024ECE: @ 08024ECE
	mov r1, sb
	ldr r0, [r1, #0x24]
	ldr r4, [r1, #0x28]
	ldr r5, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r4, [r1, #0x34]
	str r5, [r1, #0x38]
	mov r2, fp
	ldr r1, [r2, #0x68]
	mov r3, sb
	str r1, [r3, #0x24]
	movs r3, #0x86
	lsls r2, r3, #1
	add r2, fp
	mov lr, r2
	mov r3, fp
	ldr r2, [r3, #0x6c]
	mov r3, lr
	ldr r3, [r3]
	mov lr, r3
	add r2, lr
	mov r3, sb
	str r2, [r3, #0x28]
	mov lr, r2
	mov r2, fp
	ldr r2, [r2, #0x70]
	str r2, [r3, #0x2c]
	mov ip, r2
	subs r2, r1, r0
	str r2, [r3, #0x3c]
	mov r3, lr
	subs r0, r3, r4
	mov r4, sb
	str r0, [r4, #0x40]
	mov r0, ip
	subs r2, r0, r5
	str r2, [r4, #0x44]
	mov r0, sb
	ldr r1, _08024FC8
	bl _call_via_r1
	mov r1, fp
	ldr r0, [r1, #0x10]
	movs r2, #0xb9
	lsls r5, r2, #3
	muls r5, r0, r5
	asrs r2, r5, #0x10
	str r2, [r4, #0x50]
	ldr r0, [r7]
	ldr r5, [r1, #4]
	movs r4, #0x9e
	mov r3, fp
	adds r2, r5, r0
	adds r3, #0xe4
	lsls r0, r4, #1
	ldr r7, [r3]
	add r0, fp
	ldr r1, [r0]
	ldr r4, [sp, #0x10]
	adds r5, r7, r2
	adds r7, r1, r5
	strh r7, [r4]
	movs r5, #0xa2
	mov r3, fp
	lsls r1, r5, #1
	ldr r0, [r3, #8]
	ldr r2, [r3, #0xc]
	add r1, fp
	ldr r4, [r1]
	ldr r5, [sp, #0xc]
	adds r7, r0, r2
	adds r0, r4, r7
	strh r0, [r5]
	mov r5, fp
	adds r3, #0xd8
	movs r7, #0x9a
	ldr r2, [r3]
	ldr r1, [r5]
	lsls r4, r7, #1
	add r4, fp
	adds r0, r1, r2
	ldr r1, [r4]
	ldr r2, [sp, #8]
	ldr r4, _08024FA4
	adds r7, r1, r0
	mov r1, r8
	mov r0, sl
	strh r4, [r0]
	strh r7, [r2]
	strh r4, [r1]
	ldr r0, [r5, #8]
	strh r0, [r6]
	ldr r7, [sp, #0x20]
	ldr r1, [r5, #0x5c]
	str r1, [r7, #0x3c]
	ldr r6, [r5, #0x60]
	str r6, [r7, #0x40]
	ldr r2, [r5, #0x64]
	movs r3, #0xf4
	str r2, [r7, #0x44]
	add r3, fp
	ldr r2, [r3]
	mov r8, r3
	cmp r2, #0
	bne _08024FA2
	b _080256A8
_08024FA2:
	b _08024FCC
_08024FA4:
	.4byte 0x00000000
_08024FA8:
	.4byte 0x0202E810
_08024FAC:
	.4byte 0x02004224
_08024FB0:
	.4byte 0x0202DE48
_08024FB4:
	.4byte 0x0202DE50
_08024FB8:
	.4byte atan2_fx
_08024FBC:
	.4byte _03000814
_08024FC0:
	.4byte cos_fx
_08024FC4:
	.4byte sin_fx
_08024FC8:
	.4byte sub_03003750
_08024FCC:
	mov r6, fp
	adds r6, #0xf8
	ldr r4, [r6]
	adds r3, r4, r2
	adds r1, r6, #0
	str r3, [r6]
	cmp r2, #0
	bge _08024FDE
	b _08025698
_08024FDE:
	mov r5, r8
	ldr r0, [r5]
	cmp r0, #0
	ble _08024FF8
	movs r3, #0x80
	ldr r2, [r1]
	lsls r7, r3, #8
	cmp r2, r7
	blt _08024FF8
	movs r4, #0
	str r4, [r5]
	adds r5, r7, #0
	str r5, [r1]
_08024FF8:
	mov r2, fp
	ldr r7, [r2, #0xc]
	movs r4, #0x96
	lsls r5, r4, #1
	add r5, fp
	lsls r3, r7, #0xe
	ldrh r0, [r5]
	lsrs r1, r3, #0x10
	ldr r7, _080251F0
	bl _call_via_r7
	ldr r4, [r5]
	lsls r1, r0, #0x10
	asrs r2, r1, #0x13
	subs r7, r4, r2
	str r7, [r5]
	mov r5, fp
	ldr r0, [r5, #8]
	ldr r3, [r6]
	adds r6, r0, r3
	adds r1, r7, r6
	ldr r6, [sp, #0x20]
	strh r1, [r6, #0x38]
	ldr r4, [r5, #0x10]
	ldr r2, [r6, #0x20]
	lsls r7, r4, #0xc
	asrs r0, r7, #0x10
	adds r7, r2, r0
	str r7, [r6, #0x20]
	ldr r1, [r5, #0x10]
	lsls r4, r1, #0xb
	ldr r1, [r6, #0x24]
	asrs r3, r4, #0x10
	adds r4, r1, r3
	str r4, [r6, #0x24]
	ldr r3, [r5, #0x10]
	lsls r5, r7, #0x10
	lsls r2, r3, #9
	asrs r0, r5, #0x10
	ldr r5, _080251F4
	asrs r4, r2, #0x10
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r4, r2
	asrs r7, r2, #0xc
	mov r2, sb
	adds r2, #0x94
	strh r7, [r2]
	movs r7, #0x24
	ldrsh r0, [r6, r7]
	bl _call_via_r5
	lsls r1, r0, #0x10
	asrs r3, r1, #0x10
	adds r2, r3, #0
	muls r2, r4, r2
	asrs r5, r2, #0xc
	mov r2, sb
	adds r2, #0x96
	strh r5, [r2]
	movs r0, #0x80
	ldr r1, [r6]
	lsls r7, r0, #5
	ands r1, r7
	cmp r1, #0
	beq _0802509A
	mov r2, sb
	adds r2, #0xfe
	ldrh r0, [r2]
	subs r0, #2
	lsls r5, r0, #0x10
	strh r0, [r2]
	cmp r5, #0
	bgt _08025094
	b _08025670
_08025094:
	mov r0, sb
	bl sub_08003EBC
_0802509A:
	ldr r0, [sp, #0x20]
	movs r5, #0x80
	ldr r6, [r0]
	lsls r4, r5, #0xe
	ands r6, r4
	cmp r6, #0
	beq _080250BC
	movs r3, #0x84
	lsls r2, r3, #1
	add r2, sb
	ldrh r7, [r2]
	subs r7, #2
	lsls r1, r7, #0x10
	strh r7, [r2]
	cmp r1, #0
	bgt _080250BC
	b _08025658
_080250BC:
	ldr r2, [sp, #0x20]
	movs r6, #0x80
	ldr r0, [r2]
	lsls r3, r6, #0xd
	ands r0, r3
	cmp r0, #0
	beq _080250D0
	mov r0, sb
	bl sub_080041BC
_080250D0:
	mov r7, fp
	mov r0, sb
	mov r1, fp
	adds r7, #0xf0
	movs r4, #1
	bl sub_08024508
	rsbs r3, r4, #0
	ldr r2, [r7]
	mov ip, r3
	cmp r2, ip
	bne _080250EA
	b _0802564C
_080250EA:
	movs r0, #0x2c
	muls r2, r0, r2
	ldr r4, _080251F8
	ldr r1, [r4]
	adds r0, r1, r2
	mov r1, sb
	movs r5, #0x1c
	ldrsh r6, [r0, r5]
	mov lr, r4
	ldr r4, [r1, #0x30]
	adds r5, r6, #0
	muls r5, r4, r5
	ldr r1, [r1, #0x38]
	asrs r2, r5, #8
	movs r3, #0x1e
	ldrsh r5, [r0, r3]
	adds r3, r5, #0
	muls r3, r1, r3
	ldr r0, [r0, #0x20]
	asrs r3, r3, #8
	adds r2, r2, r3
	adds r3, r2, r0
	cmp r3, #0
	bge _0802511C
	b _08025556
_0802511C:
	movs r6, #0xca
	lsls r5, r6, #1
	add r5, fp
	ldr r2, [r5]
	movs r7, #0x2c
	muls r2, r7, r2
	mov r5, lr
	ldr r6, [r5]
	adds r0, r6, r2
	movs r2, #0x1c
	ldrsh r5, [r0, r2]
	adds r3, r5, #0
	muls r3, r4, r3
	asrs r2, r3, #8
	movs r3, #0x1e
	ldrsh r4, [r0, r3]
	adds r3, r4, #0
	muls r3, r1, r3
	asrs r1, r3, #8
	adds r2, r2, r1
	ldr r1, [r0, #0x20]
	adds r0, r2, r1
	cmp r0, #0
	blt _08025206
_0802514C:
	ldr r7, [sp, #0x20]
	ldr r3, [r7, #8]
	cmp r3, #2
	beq _08025196
	cmp r3, #2
	bgt _080251FC
	cmp r3, #1
	beq _0802516E
_0802515C:
	add sp, #0x38
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_0802516E:
	movs r2, #0x85
	lsls r0, r2, #1
	add r0, sb
	ldrh r5, [r0]
	cmp r5, #0
	beq _080251D0
	ldr r1, [sp, #0x28]
	ldrh r0, [r1, #2]
	movs r1, #2
	adds r5, r1, #0
	ands r5, r0
	cmp r5, #0
	beq _08025190
	ldr r4, [sp, #0x20]
	ldr r2, [r4]
	orrs r2, r1
	str r2, [r4]
_08025190:
	mov r0, sb
	bl weaponbossManager
_08025196:
	movs r3, #0x81
	lsls r2, r3, #1
	add r2, sb
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #5
	bgt _0802515C
	movs r6, #0x82
	lsls r0, r6, #1
	add r0, sb
	movs r6, #0
	ldrsh r3, [r0, r6]
	ldrh r1, [r0]
	cmp r3, #0
	beq _080251CA
	subs r3, r1, #2
	lsls r1, r3, #0x10
	strh r3, [r0]
	cmp r1, #0
	bgt _0802515C
	ldr r1, _080251E8
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0802515C
_080251CA:
	ldr r1, _080251EC
	strh r1, [r0]
	b _0802515C
_080251D0:
	ldr r1, [sp, #0x28]
	ldrh r3, [r1]
	movs r1, #2
	adds r5, r1, #0
	ands r5, r3
	cmp r5, #0
	beq _08025190
	ldr r0, [sp, #0x20]
	ldr r2, [r0]
	orrs r2, r1
	str r2, [r0]
	b _08025190
_080251E8:
	.4byte 0x00000000
_080251EC:
	.4byte 0x0000001E
_080251F0:
	.4byte _03000814
_080251F4:
	.4byte sin_fx
_080251F8:
	.4byte 0x0202EA08
_080251FC:
	cmp r3, #3
	beq _0802516E
	cmp r3, #4
	beq _08025196
	b _0802515C
_08025206:
	mov r0, sb
	ldr r3, [r0, #0x24]
	adds r2, r5, #0
	muls r2, r3, r2
	ldr r3, [r0, #0x2c]
	muls r3, r4, r3
	asrs r2, r2, #8
	asrs r0, r3, #8
	adds r2, r2, r0
	adds r0, r2, r1
	cmp r0, #0
	bge _08025220
	b _0802514C
_08025220:
	movs r5, #0xcc
	lsls r0, r5, #1
	add r0, fp
	ldr r4, [r0]
	muls r4, r7, r4
	adds r0, r6, r4
	movs r6, #0xce
	lsls r2, r6, #1
	add r2, fp
	ldr r1, [r2]
	movs r5, #0xd0
	lsls r4, r5, #1
	lsls r7, r1, #2
	adds r6, r7, r4
	mov r2, fp
	ldr r7, [r2, r6]
	movs r4, #0x14
	ldrsh r2, [r0, r4]
	lsls r5, r2, #8
	str r5, [r7, #0x24]
	movs r5, #0
	str r5, [r7, #0x28]
	movs r6, #0x16
	ldrsh r1, [r0, r6]
	lsls r4, r1, #8
	str r4, [r7, #0x2c]
	adds r4, r7, #0
	movs r7, #0xc6
	lsls r2, r7, #1
	add r2, fp
	ldr r6, [r2]
	adds r4, #0xa0
	str r6, [r4, #8]
	adds r6, r0, #0
	adds r6, #0x2a
	ldrb r3, [r6]
	ldr r7, [r2]
	cmp r3, r7
	bne _08025270
	b _08025550
_08025270:
	str r5, [r4, #0xc]
_08025272:
	movs r1, #0xce
	lsls r4, r1, #1
	add r4, fp
	ldr r7, [r4]
	movs r5, #0xd2
	lsls r2, r5, #1
	lsls r1, r7, #2
	adds r4, r1, r2
	mov r2, fp
	ldr r1, [r2, r4]
	movs r5, #0x18
	ldrsh r3, [r0, r5]
	movs r4, #0x14
	ldrsh r7, [r0, r4]
	adds r5, r7, r3
	lsls r4, r5, #8
	str r4, [r1, #0x24]
	movs r4, #0
	str r4, [r1, #0x28]
	movs r7, #0x16
	ldrsh r3, [r0, r7]
	movs r5, #0x1a
	ldrsh r7, [r0, r5]
	adds r5, r3, r7
	lsls r0, r5, #8
	movs r7, #0xc6
	str r0, [r1, #0x2c]
	lsls r2, r7, #1
	add r2, fp
	adds r0, r1, #0
	ldr r5, [r2]
	adds r0, #0xa0
	str r5, [r0, #8]
	ldrb r3, [r6]
	ldr r6, [r2]
	cmp r3, r6
	bne _080252BE
	b _0802554A
_080252BE:
	str r4, [r0, #0xc]
_080252C0:
	movs r2, #0xc8
	lsls r3, r2, #1
	movs r0, #0
	ldr r7, _080255F8
	add r3, fp
	str r0, [sp, #0x24]
	str r3, [sp, #0x1c]
	mov lr, r7
_080252D0:
	ldr r3, [sp, #0x1c]
	ldr r6, [r3]
	movs r4, #0x2c
	muls r6, r4, r6
	mov r4, lr
	ldr r5, [r4]
	adds r1, r5, r6
	ldr r6, _080255FC
	ldrh r5, [r1, #6]
	ldr r7, [r6]
	ldrh r4, [r1, #8]
	lsls r1, r5, #2
	ldrh r3, [r1, r7]
	mov r8, r5
	mov sl, r3
	cmp r4, #1
	ble _08025364
	movs r5, #0
	cmp r4, #0
	beq _0802530E
	adds r7, r6, #0
	ldr r2, [r7]
	adds r0, r1, r2
	adds r2, r0, #2
	adds r1, r4, #0
_08025302:
	ldrh r6, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r6
	cmp r1, #0
	bne _08025302
_0802530E:
	movs r1, #0x80
	lsls r7, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _0802531A
	b _08025546
_0802531A:
	ldr r2, _08025600
	adds r0, r7, #0
	bl _call_via_r2
	adds r6, r0, #0
	adds r0, r7, #0
	eors r0, r5
	cmp r0, #0
	bge _0802532E
	b _08025542
_0802532E:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r4
	bge _08025364
	ldr r7, _080255FC
	ldr r0, [r7]
	mov r7, r8
	lsls r3, r7, #2
	adds r2, r3, r0
	adds r3, r7, r4
	lsls r7, r3, #2
_0802534A:
	ldrh r3, [r2, #2]
	muls r3, r6, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _0802535C
	ldrh r2, [r2]
	adds r1, r4, #0
	mov sl, r2
	adds r2, r7, r0
_0802535C:
	adds r1, #1
	adds r2, #4
	cmp r1, r4
	blt _0802534A
_08025364:
	ldr r2, _080255F8
	mov lr, r2
	movs r2, #0x2c
	mov r1, sl
	muls r1, r2, r1
	ldr r3, [sp, #0x1c]
	mov r0, sl
	str r0, [r3]
	mov r4, lr
	ldr r0, [r4]
	adds r6, r0, r1
	adds r4, r6, #0
	adds r4, #0x28
	ldrb r5, [r4]
	cmp r5, #0
	beq _08025388
	movs r7, #1
	str r7, [sp, #0x24]
_08025388:
	ldr r5, [sp, #0x24]
	cmp r5, #0
	beq _080252D0
	movs r6, #0xca
	lsls r4, r6, #1
	movs r1, #0
	add r4, fp
	str r1, [sp, #0x24]
	str r4, [sp, #0x18]
_0802539A:
	ldr r3, [sp, #0x18]
	ldr r6, [r3]
	movs r2, #0x2c
	muls r6, r2, r6
	mov r4, lr
	ldr r5, [r4]
	adds r7, r5, r6
	ldr r6, _080255FC
	ldrh r5, [r7, #6]
	ldr r0, [r6]
	lsls r1, r5, #2
	ldrh r3, [r1, r0]
	ldrh r4, [r7, #8]
	mov r8, r5
	mov sl, r3
	cmp r4, #1
	ble _0802542E
	movs r5, #0
	cmp r4, #0
	beq _080253D8
	adds r2, r6, #0
	ldr r7, [r2]
	adds r0, r1, r7
	adds r2, r0, #2
	adds r1, r4, #0
_080253CC:
	ldrh r6, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r6
	cmp r1, #0
	bne _080253CC
_080253D8:
	movs r1, #0x80
	lsls r7, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	bge _080253E4
	b _0802553E
_080253E4:
	ldr r2, _08025600
	adds r0, r7, #0
	bl _call_via_r2
	adds r6, r0, #0
	adds r0, r7, #0
	eors r0, r5
	cmp r0, #0
	bge _080253F8
	b _0802553A
_080253F8:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r4
	bge _0802542E
	ldr r7, _080255FC
	ldr r0, [r7]
	mov r7, r8
	lsls r3, r7, #2
	adds r2, r3, r0
	adds r3, r7, r4
	lsls r7, r3, #2
_08025414:
	ldrh r3, [r2, #2]
	muls r3, r6, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _08025426
	ldrh r2, [r2]
	adds r1, r4, #0
	mov sl, r2
	adds r2, r7, r0
_08025426:
	adds r1, #1
	adds r2, #4
	cmp r1, r4
	blt _08025414
_0802542E:
	ldr r2, _080255F8
	mov lr, r2
	movs r2, #0x2c
	mov r1, sl
	muls r1, r2, r1
	ldr r3, [sp, #0x18]
	mov r0, sl
	str r0, [r3]
	mov r4, lr
	ldr r0, [r4]
	adds r6, r0, r1
	adds r5, r6, #0
	adds r5, #0x28
	ldrb r4, [r5]
	cmp r4, #0
	beq _08025452
	movs r7, #1
	str r7, [sp, #0x24]
_08025452:
	ldr r4, [sp, #0x24]
	cmp r4, #0
	beq _0802539A
	movs r6, #0xcc
	lsls r5, r6, #1
	movs r1, #0
	add r5, fp
	str r1, [sp, #0x24]
	str r5, [sp, #0x14]
_08025464:
	ldr r3, [sp, #0x14]
	ldr r6, [r3]
	movs r2, #0x2c
	muls r6, r2, r6
	mov r4, lr
	ldr r5, [r4]
	adds r7, r5, r6
	ldr r6, _080255FC
	ldrh r5, [r7, #6]
	ldr r0, [r6]
	lsls r1, r5, #2
	ldrh r3, [r1, r0]
	ldrh r4, [r7, #8]
	mov r8, r5
	mov sl, r3
	cmp r4, #1
	ble _080254F4
	movs r5, #0
	cmp r4, #0
	beq _080254A2
	adds r2, r6, #0
	ldr r7, [r2]
	adds r0, r1, r7
	adds r2, r0, #2
	adds r1, r4, #0
_08025496:
	ldrh r6, [r2]
	subs r1, #1
	adds r2, #4
	adds r5, r5, r6
	cmp r1, #0
	bne _08025496
_080254A2:
	movs r1, #0x80
	lsls r7, r1, #9
	adds r1, r5, #0
	cmp r5, #0
	blt _08025536
_080254AC:
	ldr r2, _08025600
	adds r0, r7, #0
	bl _call_via_r2
	adds r6, r0, #0
	adds r0, r7, #0
	eors r0, r5
	cmp r0, #0
	blt _08025532
_080254BE:
	bl multi_lfsr_next
	movs r1, #0
	mov ip, r0
	movs r5, #0
	cmp r1, r4
	bge _080254F4
	ldr r7, _080255FC
	ldr r0, [r7]
	mov r7, r8
	lsls r3, r7, #2
	adds r2, r3, r0
	adds r3, r7, r4
	lsls r7, r3, #2
_080254DA:
	ldrh r3, [r2, #2]
	muls r3, r6, r3
	adds r5, r5, r3
	cmp ip, r5
	bge _080254EC
	ldrh r2, [r2]
	adds r1, r4, #0
	mov sl, r2
	adds r2, r7, r0
_080254EC:
	adds r1, #1
	adds r2, #4
	cmp r1, r4
	blt _080254DA
_080254F4:
	ldr r3, [sp, #0x14]
	mov r0, sl
	movs r7, #0x2c
	str r0, [r3]
	mov r0, sl
	muls r0, r7, r0
	ldr r2, _080255F8
	mov lr, r2
	mov r4, lr
	ldr r2, [r4]
	adds r1, r2, r0
	adds r6, r1, #0
	adds r6, #0x28
	ldrb r4, [r6]
	cmp r4, #0
	beq _08025518
	movs r5, #1
	str r5, [sp, #0x24]
_08025518:
	ldr r6, [sp, #0x24]
	cmp r6, #0
	beq _08025464
	movs r1, #0xce
	lsls r4, r1, #1
	add r4, fp
	ldr r0, [r4]
	movs r1, #0x16
	adds r0, #2
	bl __modsi3
	str r0, [r4]
	b _0802514C
_08025532:
	rsbs r6, r6, #0
	b _080254BE
_08025536:
	rsbs r1, r5, #0
	b _080254AC
_0802553A:
	rsbs r6, r6, #0
	b _080253F8
_0802553E:
	rsbs r1, r5, #0
	b _080253E4
_08025542:
	rsbs r6, r6, #0
	b _0802532E
_08025546:
	rsbs r1, r5, #0
	b _0802531A
_0802554A:
	movs r6, #1
	str r6, [r0, #0xc]
	b _080252C0
_08025550:
	movs r7, #1
	str r7, [r4, #0xc]
	b _08025272
_08025556:
	mov r2, sb
	ldr r3, [r2, #0x24]
	adds r2, r6, #0
	muls r2, r3, r2
	mov r6, sb
	ldr r3, [r6, #0x2c]
	muls r3, r5, r3
	asrs r2, r2, #8
	asrs r6, r3, #8
	adds r5, r2, r6
	adds r6, r5, r0
	cmp r6, #0
	bge _08025572
	b _0802511C
_08025572:
	movs r1, #0xc6
	mov r0, ip
	str r0, [r7]
	lsls r7, r1, #1
	add r7, fp
	ldr r4, [r7]
	movs r2, #1
	eors r4, r2
	str r4, [r7]
	ldr r2, [sp, #0x20]
	ldr r1, [r2, #8]
	cmp r1, #3
	beq _08025604
	cmp r1, #1
	beq _080255C0
_08025590:
	movs r1, #0xd0
	lsls r0, r1, #1
	movs r6, #1
	movs r5, #0
	add r0, fp
	movs r4, #0x15
_0802559C:
	ldm r0!, {r3}
	adds r2, r3, #0
	adds r2, #0xa0
	ldr r7, [r2, #0xc]
	cmp r7, #0
	beq _080255BC
	str r5, [r2, #0xc]
_080255AA:
	subs r4, #1
	cmp r4, #0
	bge _0802559C
	mov r1, sb
	ldr r0, _080255F8
	ldr r4, [r1, #0x30]
	ldr r1, [r1, #0x38]
	mov lr, r0
	b _0802511C
_080255BC:
	str r6, [r2, #0xc]
	b _080255AA
_080255C0:
	ldr r2, [sp, #0x20]
	movs r4, #2
	movs r0, #0x88
	movs r6, #0x8a
	str r4, [r2, #8]
	lsls r7, r0, #1
	lsls r5, r6, #1
	movs r4, #0x80
	movs r0, #0
	add r7, fp
	lsls r2, r4, #3
	movs r3, #0x80
	add r5, fp
	mov r6, r8
	str r0, [r7]
	str r1, [r5]
	mov r7, ip
	str r2, [r6]
	movs r1, #0x7f
	str r0, [sp, #4]
	lsls r2, r3, #9
	movs r0, #0xc5
	movs r3, #2
	str r7, [sp]
	bl gamesfx_play
	b _08025590
	.byte 0x00, 0x00
_080255F8:
	.4byte 0x0202EA08
_080255FC:
	.4byte 0x0202EA0C
_08025600:
	.4byte udiv
_08025604:
	movs r6, #0x80
	movs r7, #4
	lsls r4, r6, #1
	movs r5, #0xb9
	movs r3, #0x82
	str r7, [r2, #8]
	add r4, fp
	lsls r1, r5, #3
	movs r7, #7
	lsls r5, r3, #1
	str r1, [r4]
	add r5, fp
	rsbs r6, r7, #0
	movs r1, #0x84
	movs r4, #0x86
	str r6, [r5]
	lsls r2, r1, #1
	lsls r7, r4, #1
	ldr r6, _08025688
	movs r5, #0
	add r2, fp
	add r7, fp
	mov r4, r8
	movs r3, #0x80
	str r5, [r2]
	movs r1, #0x7f
	str r5, [r7]
	lsls r2, r3, #9
	str r6, [r4]
	movs r3, #2
	str r0, [sp]
	movs r0, #0xc5
	str r5, [sp, #4]
	bl gamesfx_play
	b _08025590
_0802564C:
	mov r3, sb
	ldr r2, _0802568C
	ldr r4, [r3, #0x30]
	ldr r1, [r3, #0x38]
	mov lr, r2
	b _0802511C
_08025658:
	ldr r7, _08025684
	strh r7, [r2]
	ldr r1, _08025690
	ldr r5, [r0]
	movs r4, #0xa4
	ands r5, r1
	str r5, [r0]
	lsls r0, r4, #1
	add r0, fp
	movs r6, #0
	str r6, [r0]
	b _080250BC
_08025670:
	ldr r7, _08025684
	strh r7, [r2]
	ldr r3, _08025694
	ldr r1, [r6]
	ands r1, r3
	str r1, [r6]
	mov r0, sb
	bl sub_08004128
	b _0802509A
_08025684:
	.4byte 0x00000000
_08025688:
	.4byte 0xFFFFFC00
_0802568C:
	.4byte 0x0202EA08
_08025690:
	.4byte 0xFFDFFFFF
_08025694:
	.4byte 0xFFFFEFFF
_08025698:
	cmp r3, #0
	ble _0802569E
	b _08024FDE
_0802569E:
	movs r7, #0
	mov r4, r8
	str r7, [r4]
	str r7, [r6]
	b _08024FF8
_080256A8:
	mov r6, fp
	adds r6, #0xf8
	b _08024FF8

	.global sub_080256AE
	.thumb_func
	.type sub_080256AE, %function
sub_080256AE: @ 080256AE
	mov r5, sb
	ldr r4, [r5, #0x24]
	mov r2, sb
	adds r2, #0x84
	str r4, [r2]
	ldr r0, [r5, #0x28]
	adds r2, #4
	str r0, [r2]
	ldr r1, [r5, #0x2c]
	adds r2, #4
	str r1, [r2]
	bl sub_08024ECE

	.global sub_080256C8
	.thumb_func
	.type sub_080256C8, %function
sub_080256C8: @ 080256C8
	mov r1, fp
	mov r0, sb
	ldr r2, [sp, #0x28]
	bl sub_08023548
	lsls r1, r0, #1
	adds r5, r1, r0
	lsls r4, r5, #0xe
	asrs r0, r4, #0x10
	bl sub_08024E7A

	.global sub_080256DE
	.thumb_func
	.type sub_080256DE, %function
sub_080256DE: @ 080256DE
	ldr r5, [sp, #0x28]
	movs r2, #0x80
	ldrh r7, [r5]
	lsls r6, r2, #2
	ands r6, r7
	cmp r6, #0
	bne _080256F0
	bl sub_08024E38
_080256F0:
	ldr r4, [r5, #4]
	cmp r4, #0
	bne _080256FA
	bl sub_08024E38
_080256FA:
	mov r3, fp
	adds r3, #0xd0
	movs r2, #1
	str r1, [r3]
	str r2, [r0]
	ldr r1, [r5, #4]
	rsbs r0, r1, #0
	lsls r5, r0, #7
	mov r2, fp
	asrs r4, r5, #8
	adds r2, #0xcc
	str r4, [r2]
	ldr r1, [sp, #0x20]
	ldr r6, [r1]
	movs r7, #0x20
	movs r3, #0x94
	orrs r6, r7
	lsls r5, r3, #1
	mov r7, fp
	add r5, fp
	movs r0, #3
	adds r7, #0xfc
	str r6, [r1]
	str r0, [r5]
	bl sub_08024E3C

	.global sub_0802572E
	.thumb_func
	.type sub_0802572E, %function
sub_0802572E: @ 0802572E
	ldr r0, [sp, #0x28]
	ldrh r2, [r0]
	movs r7, #0x40
	ands r7, r2
	cmp r7, #0
	beq _08025742
	ldr r4, _08025AC8
	str r4, [r0, #8]
	bl sub_08024E2A
_08025742:
	movs r5, #0x80
	ands r5, r2
	lsls r1, r5, #0x10
	lsrs r3, r1, #0x10
	cmp r3, #0
	beq _0802575A
	movs r0, #0x80
	ldr r6, [sp, #0x28]
	lsls r2, r0, #1
	str r2, [r6, #8]
	bl sub_08024E2A
_0802575A:
	ldr r7, [sp, #0x28]
	str r3, [r7, #8]
	bl sub_08024E2A

	.global sub_08025762
	.thumb_func
	.type sub_08025762, %function
sub_08025762: @ 08025762
	ldr r1, [sp, #0x28]
	ldrh r2, [r1]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08025778
	movs r4, #0x80
	lsls r7, r4, #1
	str r7, [r1, #4]
	bl sub_08024E10
_08025778:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	beq _0802578A
	ldr r6, _08025AC8
	ldr r5, [sp, #0x28]
	str r6, [r5, #4]
	bl sub_08024E10
_0802578A:
	ldr r2, [sp, #0x28]
	mov r3, r8
	str r3, [r2, #4]
	bl sub_08024E10

	.global sub_08025794
	.thumb_func
	.type sub_08025794, %function
sub_08025794: @ 08025794
	ldr r5, [sp, #0x28]
	ldrh r2, [r5]
	movs r7, #0x20
	ands r7, r2
	cmp r7, #0
	beq _080257A8
	ldr r4, _08025AC8
	str r4, [r5, #4]
	bl sub_08024E10
_080257A8:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	beq _080257BC
	movs r2, #0x80
	ldr r5, [sp, #0x28]
	lsls r6, r2, #1
	str r6, [r5, #4]
	bl sub_08024E10
_080257BC:
	ldr r3, [sp, #0x28]
	mov r7, r8
	str r7, [r3, #4]
	bl sub_08024E10

	.global sub_080257C6
	.thumb_func
	.type sub_080257C6, %function
sub_080257C6: @ 080257C6
	movs r0, #0x8a
	lsls r1, r0, #1
	add r1, fp
	ldr r3, [r1]
	cmp r3, #0
	ble _0802583C
	movs r3, #0x88
	lsls r2, r3, #1
	add r2, fp
	ldr r6, [r2]
	adds r6, #2
	str r6, [r2]
	cmp r6, #0x3f
	ble _080257EC
	movs r4, #1
	rsbs r7, r4, #0
	str r7, [r1]
	movs r1, #0x40
	str r1, [r2]
_080257EC:
	mov r6, fp
	ldr r7, [r6, #0x10]
	movs r2, #0xb9
	lsls r5, r2, #3
	lsls r0, r7, #1
	adds r1, r0, #0
	muls r1, r5, r1
	movs r7, #8
	ldrsh r6, [r6, r7]
	ldr r4, _08025ACC
	adds r0, r6, #0
	asrs r5, r1, #0x10
	bl _call_via_r4
	adds r7, r0, #0
	lsls r0, r7, #0x10
	asrs r7, r0, #0x10
	ldr r1, _08025AD0
	adds r0, r6, #0
	bl _call_via_r1
	lsls r6, r0, #0x10
	asrs r2, r6, #0x10
	adds r1, r5, #0
	muls r1, r2, r1
	mov r0, fp
	ldr r6, [r0, #0x5c]
	asrs r3, r1, #0xc
	adds r1, r6, r3
	adds r6, r5, #0
	muls r6, r7, r6
	ldr r4, [r0, #0x64]
	asrs r3, r6, #0xc
	mov r7, fp
	str r1, [r0, #0x5c]
	adds r7, #0xfc
	adds r1, r4, r3
	str r1, [r0, #0x64]
	bl sub_08024E3C
_0802583C:
	cmp r3, #0
	bge _080257EC
	movs r0, #0x88
	lsls r2, r0, #1
	add r2, fp
	ldr r5, [r2]
	subs r5, #2
	str r5, [r2]
	cmp r5, #0
	bgt _080257EC
	ldr r6, [sp, #0x20]
	mov r5, r8
	movs r7, #3
	str r7, [r6, #8]
	str r5, [r1]
	str r5, [r2]
	b _080257EC

	.global sub_0802585E
	.thumb_func
	.type sub_0802585E, %function
sub_0802585E: @ 0802585E
	movs r4, #0x82
	lsls r0, r4, #1
	add r0, fp
	ldr r2, [r0]
	cmp r2, #0
	blt _0802595C
	cmp r2, #0
	ble _08025950
	movs r5, #0x84
	lsls r7, r5, #1
	add r7, fp
	ldr r4, [r7]
	subs r4, #2
	str r4, [r7]
	cmp r4, #0
	ble _08025936
	movs r3, #0x80
	lsls r1, r3, #1
_08025882:
	add r1, fp
_08025884:
	ldr r0, [r0]
	ldr r4, [r1]
	lsls r3, r0, #1
	adds r6, r4, r3
	str r6, [r1]
	lsls r2, r4, #1
	mov r4, fp
	adds r5, r2, r3
	movs r3, #8
	ldrsh r6, [r4, r3]
	mov r8, r0
	ldr r4, _08025ACC
	adds r0, r6, #0
	bl _call_via_r4
	adds r3, r0, #0
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	ldr r0, _08025AD0
	mov sl, r0
	adds r0, r6, #0
	bl _call_via_r10
	lsls r6, r0, #0x10
	asrs r2, r6, #0x10
	adds r1, r5, #0
	muls r1, r2, r1
	asrs r3, r1, #0xc
	mov r1, fp
	ldr r6, [r1, #0x5c]
	adds r0, r6, r3
	adds r6, r5, #0
	muls r6, r4, r6
	ldr r4, [r1, #0x64]
	asrs r5, r6, #0xc
	str r0, [r1, #0x5c]
	mov r2, r8
	adds r0, r4, r5
	str r0, [r1, #0x64]
	cmp r2, #0
	blt _08025904
	ldr r5, [r7]
	lsls r4, r5, #0x19
	asrs r0, r4, #0x10
	bl _call_via_r10
	movs r1, #0x96
	lsls r7, r0, #0x10
	asrs r4, r7, #0x10
	lsls r2, r1, #1
	muls r2, r4, r2
	movs r3, #0x86
	lsls r7, r3, #1
	add r7, fp
	ldr r6, [r7]
	asrs r1, r2, #0xc
	subs r5, r6, r1
	str r5, [r7]
	mov r7, fp
	adds r7, #0xfc
	lsls r6, r4, #1
	str r6, [r7]
	bl sub_08024E3C
_08025904:
	ldr r5, [r7]
	lsls r4, r5, #0x19
	asrs r0, r4, #0x10
	bl _call_via_r10
	movs r1, #0x96
	lsls r7, r0, #0x10
	asrs r4, r7, #0x10
	lsls r2, r1, #1
	muls r2, r4, r2
	movs r3, #0x86
	lsls r7, r3, #1
	add r7, fp
	ldr r6, [r7]
	asrs r1, r2, #0xc
	adds r5, r6, r1
	lsls r6, r4, #0xd
	str r5, [r7]
	rsbs r1, r6, #0
	mov r7, fp
	adds r7, #0xfc
	asrs r5, r1, #0xc
	str r5, [r7]
	bl sub_08024E3C
_08025936:
	ldr r4, [sp, #0x20]
	movs r1, #1
	movs r3, #0x80
	str r1, [r4, #8]
	movs r6, #0xb9
	lsls r1, r3, #1
	lsls r2, r6, #3
	add r1, fp
	str r2, [r1]
	mov r2, r8
	str r2, [r0]
	str r2, [r7]
	b _08025884
_08025950:
	movs r6, #0x84
	movs r2, #0x80
	lsls r7, r6, #1
	lsls r1, r2, #1
	add r7, fp
	b _08025882
_0802595C:
	movs r3, #0x84
	lsls r7, r3, #1
	add r7, fp
	ldr r5, [r7]
	adds r5, #2
	str r5, [r7]
	cmp r5, #0x3f
	ble _0802597C
	rsbs r1, r2, #0
	movs r2, #0x80
	str r1, [r0]
	lsls r1, r2, #1
	movs r6, #0x40
	add r1, fp
	str r6, [r7]
	b _08025884
_0802597C:
	movs r5, #0x80
	lsls r1, r5, #1
	b _08025882
	.incbin "baserom.gba", 0x25982, 0x146
_08025AC8:
	.4byte 0xFFFFFF00
_08025ACC:
	.4byte cos_fx
_08025AD0:
	.4byte sin_fx
	.byte 0x6C, 0x56, 0x00, 0x03
	.4byte gUnk_080529BC
	.4byte gUnk_080529C8
	.4byte gUnk_08052A30
	.4byte gUnk_080529F4
	.byte 0xD5, 0x09, 0x00, 0x00

	.global react_player_boss
	.thumb_func
	.type react_player_boss, %function
react_player_boss: @ 08025AEC
	push {r4, r5, lr}
	adds r5, r0, #0
	sub sp, #0x14
	adds r4, r1, #0
	cmp r5, #0
	bne _08025AFA
	b _08025C4C
_08025AFA:
	cmp r4, #0
	bne _08025B00
	b _08025C10
_08025B00:
	ldrb r3, [r4, #2]
	cmp r3, #0x2b
	beq _08025BA0
	cmp r3, #0x2b
	bgt _08025B4E
	cmp r3, #0xf
	beq _08025B16
_08025B0E:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
_08025B16:
	adds r0, r5, #0
	bl weaponbossAllocate
	cmp r0, #0
	beq _08025B0E
	adds r2, r5, #0
	adds r2, #0xa0
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08025B0E
	movs r0, #0x21
	bl obj_new
	ldr r2, [r4, #0x24]
	str r2, [r0, #0x24]
	ldr r1, [r4, #0x28]
	str r1, [r0, #0x28]
	adds r1, r0, #0
	ldr r2, [r4, #0x2c]
	adds r1, #0xa0
	str r2, [r0, #0x2c]
	str r5, [r1, #0x10]
	movs r1, #0
	bl obj_initialise
	b _08025B0E
_08025B4E:
	cmp r3, #0x38
	bne _08025B0E
	adds r4, r5, #0
	adds r4, #0xa0
	ldr r0, [r4]
	movs r2, #0x80
	lsls r1, r2, #5
	ands r0, r1
	cmp r0, #0
	bne _08025B0E
	ldr r3, _08025C2C
	ldr r2, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0xec
	str r2, [r1]
	movs r1, #0x94
	lsls r2, r1, #1
	adds r1, r3, r2
	movs r2, #5
	str r0, [r3, #0x14]
	str r2, [r1]
	subs r1, #0x4c
	movs r2, #1
	str r2, [r1]
	adds r1, r3, #0
	adds r1, #0xe0
	str r0, [r1]
	movs r1, #5
	rsbs r0, r1, #0
	adds r3, #0xe8
	str r0, [r3]
	ldr r1, [r4]
	movs r3, #0x80
	orrs r1, r3
	movs r0, #0x92
	str r1, [r4]
	lsls r1, r0, #1
	adds r0, r5, r1
	ldr r3, [r0]
	ldr r1, _08025C30
	b _08025C0A
_08025BA0:
	movs r4, #0x7f
	movs r3, #0x80
	str r4, [sp]
	lsls r4, r3, #9
	str r4, [sp, #4]
	movs r4, #2
	str r4, [sp, #8]
	movs r4, #4
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
	movs r1, #0x80
	lsls r3, r1, #5
	ands r0, r3
	cmp r0, #0
	bne _08025B0E
	adds r0, r5, #0
	bl sub_08004168
	ldr r2, [r4]
	movs r0, #0x86
	lsls r1, r0, #6
	ands r1, r2
	cmp r1, #0
	bne _08025B0E
	movs r3, #0x80
	lsls r0, r3, #0xe
	orrs r2, r0
	movs r0, #0x84
	str r2, [r4]
	lsls r2, r0, #1
	adds r0, r5, r2
	ldr r2, _08025C28
	ldr r3, _08025C2C
	strh r2, [r0]
	movs r0, #0xa4
	lsls r2, r0, #1
	adds r0, r3, r2
	str r1, [r0]
	movs r0, #0x92
	lsls r1, r0, #1
	adds r0, r5, r1
	ldr r3, [r0]
	ldr r1, _08025C34
_08025C0A:
	adds r2, r3, r1
	str r2, [r0]
	b _08025B0E
_08025C10:
	ldr r0, _08025C38
	ldr r1, _08025C3C
	str r0, [sp]
	ldr r2, _08025C40
	ldr r0, _08025C44
	ldr r3, _08025C48
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08025B00
_08025C28:
	.4byte 0x00000014
_08025C2C:
	.4byte 0x0202E810
_08025C30:
	.4byte 0xFFFFD99A
_08025C34:
	.4byte 0xFFFFF334
_08025C38:
	.4byte gUnk_08052A40
_08025C3C:
	.4byte gUnk_080529C8
_08025C40:
	.4byte gUnk_08052A4C
_08025C44:
	.4byte gUnk_080529F4
_08025C48:
	.4byte 0x00000BB6
_08025C4C:
	ldr r0, _08025C64
	ldr r1, _08025C68
	str r0, [sp]
	ldr r2, _08025C6C
	ldr r0, _08025C70
	ldr r3, _08025C74
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08025AFA
_08025C64:
	.4byte gUnk_080529BC
_08025C68:
	.4byte gUnk_080529C8
_08025C6C:
	.4byte gUnk_08052A4C
_08025C70:
	.4byte gUnk_080529F4
_08025C74:
	.4byte 0x00000BB5

	.global sub_08025C78
	.thumb_func
	.type sub_08025C78, %function
sub_08025C78: @ 08025C78
	ldr r2, _08025C84
	ldr r3, [r2, #0x5c]
	str r3, [r0]
	ldr r0, [r2, #0x64]
	str r0, [r1]
	bx lr
_08025C84:
	.4byte 0x0202E810

	.global sub_08025C88
	.thumb_func
	.type sub_08025C88, %function
sub_08025C88: @ 08025C88
	push {r4, lr}
	ldr r2, _08025CAC
	adds r4, r0, #0
	adds r0, #0xfe
	strh r2, [r0]
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r3, [r1]
	movs r2, #0x80
	lsls r2, r2, #5
	orrs r3, r2
	str r3, [r1]
	ldr r3, _08025CB0
	ldr r2, [r3]
	ldr r3, [r1, #4]
	cmp r2, r3
	beq _08025CC0
	b _08025CB4
_08025CAC:
	.4byte 0x0000012C
_08025CB0:
	.4byte gLocalPlayerIndex
_08025CB4:
	adds r0, r4, #0
	bl sub_080040F8
	pop {r4}
	pop {r0}
	bx r0
_08025CC0:
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x10
	bl music_play_jingle
	b _08025CB4

	.global sub_08025CCC
	.thumb_func
	.type sub_08025CCC, %function
sub_08025CCC: @ 08025CCC
	push {r4, r5, lr}
	sub sp, #0x14
	movs r5, #0x7f
	movs r3, #0x80
	str r5, [sp]
	lsls r5, r3, #9
	str r5, [sp, #4]
	movs r5, #2
	str r5, [sp, #8]
	movs r5, #4
	adds r4, r0, #0
	str r5, [sp, #0xc]
	movs r5, #0
	str r5, [sp, #0x10]
	adds r5, r4, #0
	ldr r1, [r4, #0x28]
	movs r3, #0xf1
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x2c]
	adds r5, #0xa0
	bl gamesfx_play_at
	ldr r0, [r5]
	movs r3, #0x80
	lsls r1, r3, #5
	ands r0, r1
	cmp r0, #0
	beq _08025D0C
_08025D04:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
_08025D0C:
	adds r0, r4, #0
	bl sub_08004168
	ldr r2, [r5]
	movs r0, #0x86
	lsls r1, r0, #6
	ands r1, r2
	cmp r1, #0
	bne _08025D04
	movs r3, #0x80
	lsls r0, r3, #0xe
	orrs r2, r0
	movs r0, #0x84
	str r2, [r5]
	lsls r2, r0, #1
	adds r0, r4, r2
	ldr r2, _08025D4C
	ldr r3, _08025D50
	strh r2, [r0]
	movs r0, #0xa4
	lsls r2, r0, #1
	adds r0, r3, r2
	str r1, [r0]
	movs r0, #0x92
	lsls r1, r0, #1
	adds r0, r4, r1
	ldr r3, [r0]
	ldr r1, _08025D54
	adds r2, r3, r1
	str r2, [r0]
	b _08025D04
	.byte 0x00, 0x00
_08025D4C:
	.4byte 0x00000014
_08025D50:
	.4byte 0x0202E810
_08025D54:
	.4byte 0xFFFFF334

	.global sub_08025D58
	.thumb_func
	.type sub_08025D58, %function
sub_08025D58: @ 08025D58
	push {lr}
	ldr r0, _08025D88
	movs r3, #0xc2
	lsls r2, r3, #1
	adds r3, r0, r2
	ldr r1, [r3]
	ldr r2, [r0, #0x10]
	adds r3, r1, #0
	muls r3, r2, r3
	asrs r3, r3, #0x10
	cmp r3, r1
	ble _08025D72
	adds r3, r1, #0
_08025D72:
	movs r2, #0x92
	lsls r1, r2, #1
	adds r2, r0, r1
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r1}
	bx r1
	.byte 0x00, 0x00
_08025D88:
	.4byte 0x0202E810

	.global sub_08025D8C
	.thumb_func
	.type sub_08025D8C, %function
sub_08025D8C: @ 08025D8C
	push {lr}
	ldr r2, _08025DB8
	adds r0, r2, #0
	adds r0, #0xec
	ldr r1, [r0]
	cmp r1, #0
	ble _08025DB4
	movs r0, #0xa0
	muls r0, r1, r0
	asrs r3, r0, #8
_08025DA0:
	movs r1, #0x92
	lsls r0, r1, #1
	adds r2, r2, r0
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r1}
	bx r1
_08025DB4:
	movs r3, #0xa0
	b _08025DA0
_08025DB8:
	.4byte 0x0202E810

	.global sub_08025DBC
	.thumb_func
	.type sub_08025DBC, %function
sub_08025DBC: @ 08025DBC
	push {lr}
	ldr r2, _08025DEC
	adds r0, r2, #0
	adds r0, #0xec
	ldr r1, [r0]
	cmp r1, #0
	ble _08025DE6
	lsls r0, r1, #1
	adds r3, r0, r1
	lsls r0, r3, #0x10
	asrs r3, r0, #8
_08025DD2:
	movs r1, #0x90
	lsls r0, r1, #1
	adds r2, r2, r0
	ldr r1, [r2]
	subs r0, r1, r3
	asrs r3, r0, #3
	subs r0, r1, r3
	str r0, [r2]
	pop {r1}
	bx r1
_08025DE6:
	movs r1, #0xc0
	lsls r3, r1, #0xa
	b _08025DD2
_08025DEC:
	.4byte 0x0202E810

	.global sub_08025DF0
	.thumb_func
	.type sub_08025DF0, %function
sub_08025DF0: @ 08025DF0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08025EB4
	ldr r7, [r0]
	adds r4, r7, #0
	adds r4, #0xa0
	ldr r2, [r4, #8]
	ldr r6, [r0, #4]
	subs r0, r2, #2
	cmp r0, #1
	bhi _08025E88
	ldr r1, _08025EB8
	ldr r0, [r4, #4]
	adds r5, r1, #0
	adds r5, #0xa8
	strb r0, [r5]
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	adds r5, #1
	strb r3, [r5]
	ldr r5, [r4, #4]
	movs r3, #0
	adds r5, #0x98
	strb r3, [r1, r5]
	ldr r5, [r0, #4]
	movs r3, #1
_08025E24:
	adds r5, #0x98
	strb r3, [r1, r5]
_08025E28:
	ldr r5, _08025EB8
	adds r2, r5, #0
	adds r2, #0x8c
	ldr r1, [r2]
	cmp r1, #7
	beq _08025E3A
_08025E34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08025E3A:
	movs r3, #0x92
	lsls r2, r3, #1
	adds r0, r7, r2
	ldr r1, [r0]
	cmp r1, #0
	ble _08025E80
	adds r2, r6, r2
	ldr r0, [r2]
	cmp r0, #0
	bgt _08025E34
_08025E4E:
	ldr r3, [r2]
	adds r0, r6, #0
	adds r0, #0xa0
	cmp r1, r3
	blt _08025E70
	ldr r3, [r4, #4]
	adds r1, r5, #0
	adds r1, #0xa0
	strb r3, [r1]
	ldr r3, [r0, #4]
	adds r1, #1
	strb r3, [r1]
_08025E66:
	ldr r0, _08025EB8
	movs r1, #9
	adds r0, #0x8c
	str r1, [r0]
	b _08025E34
_08025E70:
	ldr r3, [r0, #4]
	adds r0, r5, #0
	adds r0, #0xa0
	strb r3, [r0]
	ldr r1, [r4, #4]
	adds r0, #1
	strb r1, [r0]
	b _08025E66
_08025E80:
	movs r2, #0x92
	lsls r0, r2, #1
	adds r2, r6, r0
	b _08025E4E
_08025E88:
	cmp r2, #1
	beq _08025E90
	cmp r2, #4
	bne _08025E28
_08025E90:
	ldr r1, _08025EB8
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r3, [r0, #4]
	adds r5, r1, #0
	adds r5, #0xa8
	strb r3, [r5]
	ldr r3, [r4, #4]
	adds r5, #1
	strb r3, [r5]
	ldr r5, [r4, #4]
	movs r3, #1
	adds r5, #0x98
	strb r3, [r1, r5]
	ldr r5, [r0, #4]
	movs r3, #0
	b _08025E24
	.byte 0x00, 0x00
_08025EB4:
	.4byte gRacerObjects
_08025EB8:
	.4byte gGameSetup
