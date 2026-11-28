@ asm/camera_pan.s: ROM 0x004818-0x004E94 (rom, VMA 0x08004818)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global campan_start_seg
	.thumb_func
	.type campan_start_seg, %function
campan_start_seg: @ 08004818
	push {r4, r5, r6, r7, lr}
	mov r7, fp
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6, r7}
	ldr r4, _08004AB8
	ldr r5, _08004ABC
	ldr r1, [r4]
	ldr r0, [r5]
	sub sp, #8
	cmp r1, r0
	blo _08004848
	ldr r0, _08004AC0
	ldr r1, _08004AC4
	str r0, [sp]
	ldr r2, _08004AC8
	ldr r0, _08004ACC
	movs r3, #0xfd
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
_08004848:
	ldr r6, _08004AD0
	movs r3, #0
	str r3, [r6]
	ldr r2, [r4]
	subs r1, r2, #1
	cmp r1, #0
	bge _08004858
	b _08004AA4
_08004858:
	ldr r5, _08004AB8
	ldr r4, _08004ABC
	ldr r6, [r5]
	ldr r2, [r4]
	adds r0, r6, #1
	cmp r0, r2
	blo _08004872
	ldr r3, _08004AD4
	ldr r7, [r3]
	cmp r7, #0
	bne _08004870
	b _08004AA0
_08004870:
	subs r0, r0, r2
_08004872:
	ldr r2, [r5]
	adds r7, r2, #2
	ldr r2, [r4]
	cmp r7, r2
	blo _08004888
	ldr r4, _08004AD4
	ldr r5, [r4]
	cmp r5, #0
	bne _08004886
	b _08004A9C
_08004886:
	subs r7, r7, r2
_08004888:
	movs r4, #0x1c
	adds r3, r6, #0
	muls r3, r4, r3
	ldr r2, _08004AD8
	str r3, [sp, #4]
	ldr r5, [r2, r3]
	ldr r3, _08004ADC
	lsls r6, r5, #1
	str r6, [r3]
	adds r3, r1, #0
	muls r3, r4, r3
	mov r8, r2
	adds r2, r0, #0
	muls r2, r4, r2
	mov r1, r8
	ldr r1, [r1, r3]
	mov sl, r3
	mov r3, r8
	ldr r0, [r3, r2]
	mov sb, r2
	mov fp, r1
	ldr r2, _08004ADC
	rsbs r1, r1, #0
	adds r3, r1, r0
	str r3, [r2, #0x18]
	mov r3, fp
	lsls r2, r3, #1
	lsls r3, r5, #2
	adds r3, r3, r5
	subs r2, r2, r3
	lsls r3, r0, #2
	adds r2, r2, r3
	adds r3, r7, #0
	muls r3, r4, r3
	mov r7, r8
	ldr r4, [r7, r3]
	mov fp, r3
	ldr r3, _08004ADC
	subs r2, r2, r4
	str r2, [r3, #0x30]
	adds r3, r6, r5
	lsls r5, r0, #1
	adds r2, r1, r3
	adds r6, r5, r0
	subs r5, r2, r6
	ldr r6, _08004ADC
	adds r0, r5, r4
	str r0, [r6, #0x48]
	ldr r1, [sp, #4]
	adds r1, #4
	ldr r4, [r7, r1]
	mov r3, sl
	lsls r5, r4, #1
	str r5, [r6, #4]
	adds r3, #4
	ldr r2, [r7, r3]
	mov r3, sb
	adds r3, #4
	ldr r0, [r7, r3]
	rsbs r1, r2, #0
	adds r3, r1, r0
	str r3, [r6, #0x1c]
	lsls r6, r4, #2
	adds r3, r6, r4
	lsls r2, r2, #1
	subs r6, r2, r3
	lsls r3, r0, #2
	adds r2, r6, r3
	mov r3, fp
	adds r3, #4
	ldr r6, [r7, r3]
	ldr r7, _08004ADC
	subs r3, r2, r6
	str r3, [r7, #0x34]
	lsls r2, r0, #1
	adds r3, r5, r4
	adds r4, r1, r3
	adds r5, r2, r0
	subs r2, r4, r5
	adds r0, r2, r6
	str r0, [r7, #0x4c]
	ldr r6, [sp, #4]
	mov r1, r8
	adds r6, #8
	ldr r4, [r1, r6]
	lsls r5, r4, #1
	str r5, [r7, #8]
	mov r3, sl
	adds r3, #8
	ldr r2, [r1, r3]
	mov r3, sb
	adds r3, #8
	mov r6, r8
	ldr r0, [r6, r3]
	rsbs r1, r2, #0
	adds r3, r1, r0
	str r3, [r7, #0x20]
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r2, r2, #1
	subs r2, r2, r3
	lsls r3, r0, #2
	adds r2, r2, r3
	mov r3, fp
	adds r3, #8
	ldr r6, [r6, r3]
	subs r3, r2, r6
	str r3, [r7, #0x38]
	adds r3, r5, r4
	lsls r4, r0, #1
	adds r2, r1, r3
	adds r5, r4, r0
	subs r4, r2, r5
	adds r0, r4, r6
	str r0, [r7, #0x50]
	ldr r7, [sp, #4]
	mov r4, r8
	adds r4, #0x10
	mov r2, sl
	adds r6, r7, r4
	adds r1, r2, r4
	adds r0, r6, #0
	bl sub_08004C64
	mov r3, sb
	adds r5, r3, r4
	adds r0, r6, #0
	adds r1, r5, #0
	add r4, fp
	bl sub_08004C64
	adds r1, r4, #0
	mov r4, r8
	adds r4, #0xc
	adds r0, r5, #0
	adds r5, r7, r4
	mov r7, sl
	bl sub_08004C64
	adds r1, r7, r4
	adds r0, r5, #0
	bl sub_08004C64
	mov r1, sb
	adds r7, r1, r4
	adds r0, r5, #0
	adds r1, r7, #0
	add r4, fp
	bl sub_08004C64
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_08004C64
	ldr r7, [sp, #4]
	mov r2, r8
	adds r7, #0xc
	ldr r4, [r2, r7]
	ldr r1, _08004ADC
	lsls r5, r4, #1
	str r5, [r1, #0xc]
	mov r3, sl
	adds r3, #0xc
	ldr r2, [r2, r3]
	mov r3, sb
	adds r3, #0xc
	mov r6, r8
	ldr r0, [r6, r3]
	ldr r7, _08004ADC
	rsbs r1, r2, #0
	adds r3, r1, r0
	str r3, [r7, #0x24]
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r2, r2, #1
	subs r2, r2, r3
	lsls r3, r0, #2
	adds r2, r2, r3
	mov r3, fp
	adds r3, #0xc
	ldr r6, [r6, r3]
	subs r3, r2, r6
	str r3, [r7, #0x3c]
	lsls r2, r0, #1
	adds r3, r5, r4
	adds r4, r1, r3
	adds r5, r2, r0
	subs r2, r4, r5
	adds r4, r2, r6
	str r4, [r7, #0x54]
	ldr r5, [sp, #4]
	mov r1, r8
	adds r5, #0x10
	ldr r4, [r1, r5]
	movs r3, #0x10
	lsls r5, r4, #1
	str r5, [r7, #0x10]
	movs r0, #0x10
	add sl, r3
	mov r3, sl
	add sb, r0
	ldr r2, [r1, r3]
	mov r7, r8
	mov r3, sb
	ldr r0, [r7, r3]
	rsbs r1, r2, #0
	ldr r7, _08004ADC
	adds r6, r1, r0
	str r6, [r7, #0x28]
	lsls r7, r4, #2
	lsls r6, r2, #1
	adds r3, r7, r4
	subs r7, r6, r3
	lsls r6, r0, #2
	adds r2, r7, r6
	movs r6, #0x10
	add fp, r6
	mov r3, r8
	mov r7, fp
	ldr r6, [r3, r7]
	ldr r7, _08004ADC
	subs r3, r2, r6
	str r3, [r7, #0x40]
	adds r5, r5, r4
	lsls r7, r0, #1
	adds r3, r7, r0
	adds r2, r1, r5
	subs r7, r2, r3
	ldr r0, _08004ADC
	adds r3, r7, r6
	str r3, [r0, #0x58]
	ldr r6, [sp, #4]
	mov r7, r8
	adds r6, #0x18
	ldr r0, [r7, r6]
	cmp r0, #0
	beq _08004A82
_08004A62:
	cmp r0, #1
	beq _08004A70
	ldr r1, _08004AE0
	bl _call_via_r1
	ldr r2, _08004AE4
	str r0, [r2]
_08004A70:
	add sp, #8
	pop {r3, r4, r5, r6}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	mov fp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08004A82:
	ldr r1, _08004AE8
	ldr r0, _08004ACC
	str r1, [sp]
	ldr r2, _08004AC8
	ldr r1, _08004AC4
	ldr r3, _08004AEC
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	ldr r0, [r7, r6]
	b _08004A62
_08004A9C:
	adds r7, r0, #0
	b _08004888
_08004AA0:
	adds r0, r6, #0
	b _08004872
_08004AA4:
	ldr r7, _08004AD4
	ldr r4, [r7]
	cmp r4, #0
	beq _08004AB2
	ldr r2, [r5]
	adds r1, r1, r2
	b _08004858
_08004AB2:
	adds r1, r2, #0
	b _08004858
	.byte 0x00, 0x00
_08004AB8:
	.4byte 0x02021DDC
_08004ABC:
	.4byte 0x02021D70
_08004AC0:
	.4byte gUnk_0804FEFC
_08004AC4:
	.4byte gUnk_0804FF1C
_08004AC8:
	.4byte gUnk_0804FF30
_08004ACC:
	.4byte gUnk_0804FF44
_08004AD0:
	.4byte 0x02021DE0
_08004AD4:
	.4byte 0x02021D78
_08004AD8:
	.4byte 0x020219F0
_08004ADC:
	.4byte 0x02021D7C
_08004AE0:
	.4byte 0x03000570
_08004AE4:
	.4byte 0x02021DE4
_08004AE8:
	.4byte gUnk_0804FF80
_08004AEC:
	.4byte 0x0000013F

	.global sub_08004AF0
	.thumb_func
	.type sub_08004AF0, %function
sub_08004AF0: @ 08004AF0
	push {r4, lr}
	ldr r2, _08004B1C
	movs r4, #0
	str r4, [r2]
	bl sub_08004B28
	ldr r2, _08004B20
	ldr r1, _08004B24
	str r4, [r2]
	ldrh r0, [r1, #2]
	movs r1, #0x80
	subs r0, #3
	lsls r3, r0, #0x10
	lsls r0, r1, #9
	cmp r3, r0
	bhi _08004B14
	movs r0, #1
	str r0, [r2]
_08004B14:
	pop {r4}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08004B1C:
	.4byte 0x02021D70
_08004B20:
	.4byte 0x02021D78
_08004B24:
	.4byte 0x0202D74C

	.global sub_08004B28
	.thumb_func
	.type sub_08004B28, %function
sub_08004B28: @ 08004B28
	ldr r0, _08004B30
	movs r1, #0
	str r1, [r0]
	bx lr
_08004B30:
	.4byte 0x02021D74

	.global sub_08004B34
	.thumb_func
	.type sub_08004B34, %function
sub_08004B34: @ 08004B34
	push {lr}
	ldr r1, _08004B74
	ldm r0!, {r2}
	str r2, [r1]
	movs r1, #0
	cmp r1, r2
	bhs _08004B6C
	mov ip, r2
	ldr r2, _08004B78
_08004B46:
	ldr r3, [r0]
	str r3, [r2]
	ldr r3, [r0, #4]
	str r3, [r2, #4]
	ldr r3, [r0, #8]
	str r3, [r2, #8]
	ldr r3, [r0, #0xc]
	str r3, [r2, #0xc]
	ldr r3, [r0, #0x10]
	str r3, [r2, #0x10]
	ldr r3, [r0, #0x14]
	str r3, [r2, #0x14]
	ldr r3, [r0, #0x18]
	adds r1, #1
	str r3, [r2, #0x18]
	adds r0, #0x1c
	adds r2, #0x1c
	cmp r1, ip
	blo _08004B46
_08004B6C:
	bl sub_08004B7C
	pop {r0}
	bx r0
_08004B74:
	.4byte 0x02021D70
_08004B78:
	.4byte 0x020219F0

	.global sub_08004B7C
	.thumb_func
	.type sub_08004B7C, %function
sub_08004B7C: @ 08004B7C
	push {lr}
	ldr r1, _08004BA0
	ldr r0, [r1]
	cmp r0, #3
	bhi _08004B92
	ldr r0, _08004BA4
	bl AGBPrintf
	movs r0, #0
_08004B8E:
	pop {r1}
	bx r1
_08004B92:
	ldr r0, _08004BA8
	movs r3, #0
	str r3, [r0]
	bl campan_start_seg
	movs r0, #1
	b _08004B8E
_08004BA0:
	.4byte 0x02021D70
_08004BA4:
	.4byte gUnk_0804FEDC
_08004BA8:
	.4byte 0x02021DDC

	.global sub_08004BAC
	.thumb_func
	.type sub_08004BAC, %function
sub_08004BAC: @ 08004BAC
	push {r4, r5, r6, lr}
	ldr r2, _08004C00
	ldr r6, _08004C04
	adds r5, r1, #0
	ldr r1, [r2]
	ldr r4, [r6]
	subs r1, #3
	cmp r4, r1
	beq _08004BFA
	movs r3, #0x1c
	adds r2, r4, #0
	muls r2, r3, r2
	ldr r1, _08004C08
	ldr r3, [r1, r2]
	str r3, [r0]
	adds r3, r2, #4
	ldr r3, [r1, r3]
	str r3, [r0, #4]
	adds r3, r2, #0
	adds r3, #8
	ldr r3, [r1, r3]
	str r3, [r0, #8]
	adds r3, r2, #0
	adds r3, #0xc
	ldr r0, [r1, r3]
	adds r3, r2, #0
	str r0, [r5]
	adds r3, #0x10
	ldr r0, [r1, r3]
	str r0, [r5, #4]
	adds r2, #0x14
	ldr r0, [r1, r2]
	str r0, [r5, #8]
	adds r0, r4, #1
	str r0, [r6]
	movs r0, #1
_08004BF4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
_08004BFA:
	movs r0, #0
	b _08004BF4
	.byte 0x00, 0x00
_08004C00:
	.4byte 0x02021D70
_08004C04:
	.4byte 0x02021D74
_08004C08:
	.4byte 0x020219F0

	.global sub_08004C0C
	.thumb_func
	.type sub_08004C0C, %function
sub_08004C0C: @ 08004C0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08004C5C
	ldr r5, [r0]
	adds r0, r5, #3
	adds r7, r5, #0
	cmp r5, r0
	bge _08004C4C
	ldr r6, _08004C60
	movs r0, #0xc
	movs r1, #0x1c
	adds r3, r0, r6
	adds r0, r5, #0
	muls r0, r1, r0
	lsls r4, r5, #3
	subs r2, r4, r5
	lsls r1, r2, #2
	mov r8, r3
	subs r4, r0, r1
_08004C34:
	cmp r5, #0x20
	beq _08004C58
	mov r3, r8
	adds r0, r4, r6
	adds r1, r4, r3
	bl sub_080044D0
	adds r5, #1
	adds r2, r7, #3
	adds r4, #0x1c
	cmp r5, r2
	blt _08004C34
_08004C4C:
	movs r0, #1
_08004C4E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
_08004C58:
	movs r0, #0
	b _08004C4E
_08004C5C:
	.4byte 0x02021D70
_08004C60:
	.4byte 0x020219F0

	.global sub_08004C64
	.thumb_func
	.type sub_08004C64, %function
sub_08004C64: @ 08004C64
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r3, #0x80
	ldr r0, [r5]
	adds r4, r1, #0
	lsls r2, r3, #8
	adds r3, r0, r2
	ldr r2, [r4]
	adds r1, r2, #0
	cmp r2, r3
	ble _08004C8E
	ldr r6, _08004CB4
_08004C7C:
	adds r2, r1, r6
	str r2, [r4]
	movs r3, #0x80
	ldr r0, [r5]
	lsls r1, r3, #8
	adds r3, r0, r1
	adds r1, r2, #0
	cmp r2, r3
	bgt _08004C7C
_08004C8E:
	ldr r1, _08004CB8
	adds r3, r0, r1
	adds r1, r2, #0
	cmp r1, r3
	bge _08004CAC
	movs r2, #0x80
	lsls r0, r2, #9
_08004C9C:
	adds r2, r1, r0
	str r2, [r4]
	ldr r1, _08004CB8
	ldr r3, [r5]
	adds r3, r3, r1
	adds r1, r2, #0
	cmp r2, r3
	blt _08004C9C
_08004CAC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08004CB4:
	.4byte 0xFFFF0000
_08004CB8:
	.4byte 0xFFFF8000

	.global fe_credits_screen_init
	.thumb_func
	.type fe_credits_screen_init, %function
fe_credits_screen_init: @ 08004CBC
	push {lr}
	ldr r3, _08004CF4
	ldr r1, _08004D00
	ldr r0, _08004D04
	strh r3, [r1]
	ldr r1, _08004D08
	bl AGBPrintf
	ldr r0, _08004D0C
	movs r3, #0x96
	lsls r2, r3, #1
	movs r1, #0
	str r2, [r0, #4]
	movs r3, #0x80
	ldr r2, _08004CF8
	str r1, [r0]
	str r1, [r0, #8]
	lsls r0, r3, #0x13
	strh r2, [r0]
	ldr r2, _08004CFC
	adds r0, #8
	strh r2, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x3e
	b _08004D10
_08004CF4:
	.4byte 0x00000000
_08004CF8:
	.4byte 0x00001140
_08004CFC:
	.4byte 0x00008084
_08004D00:
	.4byte 0x04000208
_08004D04:
	.4byte gUnk_0804FF94
_08004D08:
	.4byte gUnk_0804FFA4
_08004D0C:
	.4byte 0x02021DE8
_08004D10:
	strh r1, [r0]
	ldr r0, _08004D3C
	movs r2, #0x14
	ldrsh r3, [r0, r2]
	cmp r3, #1
	beq _08004DB4
	cmp r3, #1
	bgt _08004D7E
	cmp r3, #0
	beq _08004D4C
_08004D24:
	bl sub_08003634
	ldr r0, _08004D40
	ldr r3, _08004D44
	ldr r1, _08004D38
	str r3, [r0]
	ldr r0, _08004D48
	strh r1, [r0]
	pop {r0}
	bx r0
_08004D38:
	.4byte 0x00000001
_08004D3C:
	.4byte 0x0202D74C
_08004D40:
	.4byte gStateFunc
_08004D44:
	.4byte sub_08004E18
_08004D48:
	.4byte 0x04000208
_08004D4C:
	ldr r0, _08004DE8
	ldr r1, _08004DEC
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #5
	movs r2, #0x80
	ldr r3, _08004DF0
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, _08004DF4
	movs r2, #0xc0
	ldr r3, [r0, #8]
	str r1, [r0]
	lsls r1, r2, #0x13
	ldr r2, _08004DF8
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08004DFC
	bl sub_080035C8
	b _08004D24
_08004D7E:
	cmp r3, #2
	bne _08004D24
	ldr r0, _08004DE8
	ldr r1, _08004E00
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #5
	movs r2, #0x80
	ldr r3, _08004DF0
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, _08004E04
	movs r2, #0xc0
	ldr r3, [r0, #8]
	str r1, [r0]
	lsls r1, r2, #0x13
	ldr r2, _08004DF8
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08004E08
	bl sub_080035C8
	b _08004D24
_08004DB4:
	ldr r0, _08004DE8
	ldr r1, _08004E0C
	str r1, [r0]
	subs r1, #2
	ldrh r2, [r1]
	lsls r1, r2, #5
	movs r2, #0x80
	ldr r3, _08004DF0
	lsls r2, r2, #0x18
	orrs r1, r2
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r1, _08004E10
	movs r2, #0xc0
	ldr r3, [r0, #8]
	str r1, [r0]
	lsls r1, r2, #0x13
	ldr r2, _08004DF8
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	ldr r0, _08004E14
	bl sub_080035C8
	b _08004D24
	.byte 0x00, 0x00
_08004DE8:
	.4byte 0x040000D4
_08004DEC:
	.4byte gUnk_0808CB88
_08004DF0:
	.4byte 0x06004000
_08004DF4:
	.4byte gUnk_081B9264
_08004DF8:
	.4byte 0x80000400
_08004DFC:
	.4byte gUnk_08054850
_08004E00:
	.4byte gUnk_08085C06
_08004E04:
	.4byte gUnk_081B8D60
_08004E08:
	.4byte gUnk_08054650
_08004E0C:
	.4byte gUnk_0809330A
_08004E10:
	.4byte gUnk_081B9768
_08004E14:
	.4byte gUnk_08054A50

	.global sub_08004E18
	.thumb_func
	.type sub_08004E18, %function
sub_08004E18: @ 08004E18
	push {lr}
	bl sub_08003478
	bl sub_08017E1C
	ldr r0, _08004E88
	ldr r3, [r0]
	cmp r3, #1
	beq _08004E64
	cmp r3, #1
	bgt _08004E4A
	cmp r3, #0
	beq _08004E36
_08004E32:
	pop {r0}
	bx r0
_08004E36:
	ldr r2, _08004E8C
	ldr r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	cmp r1, #0
	beq _08004E32
	movs r1, #1
	str r1, [r0]
	b _08004E32
_08004E4A:
	cmp r3, #2
	bne _08004E32
	ldr r2, _08004E8C
	ldr r1, [r2]
	movs r2, #0x80
	lsls r0, r2, #4
	ands r1, r0
	cmp r1, #0
	beq _08004E32
	movs r0, #0
	bl sub_0801E5A4
	b _08004E32
_08004E64:
	ldr r1, [r0, #4]
	cmp r1, #0
	ble _08004E76
	ldr r3, _08004E90
	ldrh r2, [r3]
	movs r3, #9
	ands r3, r2
	cmp r3, #0
	beq _08004E82
_08004E76:
	bl sub_080035F8
	ldr r0, _08004E88
	movs r3, #2
	str r3, [r0]
	b _08004E32
_08004E82:
	subs r2, r1, #1
	str r2, [r0, #4]
	b _08004E32
_08004E88:
	.4byte 0x02021DE8
_08004E8C:
	.4byte 0x0300566C
_08004E90:
	.4byte 0x0300565E
