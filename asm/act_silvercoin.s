@ asm/act_silvercoin.s: ROM 0x010CCC-0x011180 (rom, VMA 0x08010CCC)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_silvercoin
	.thumb_func
	.type init_silvercoin, %function
init_silvercoin: @ 08010CCC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	sub sp, #4
	cmp r5, #0
	beq _08010D74
_08010CD6:
	ldr r1, _08010CF0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	beq _08010CF4
	adds r0, r5, #0
	bl sub_08001FE8
_08010CE6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00
_08010CF0:
	.4byte gGameSetup
_08010CF4:
	ldr r4, _08010D24
	adds r0, r5, #0
	strh r4, [r5]
	movs r1, #0x31
	movs r2, #0x13
	bl obj_setup_sprite
	adds r0, r5, #0
	adds r0, #0x5a
	ldrh r4, [r0]
	movs r2, #0x18
	muls r2, r4, r2
	ldr r1, _08010D30
	ldr r7, _08010D28
	adds r6, r2, r1
	strh r7, [r6, #0xa]
	movs r3, #0x18
	movs r2, #0x80
	ldr r7, _08010D2C
	ldr r6, _08010D34
	mov lr, r3
	mov ip, r2
	b _08010D38
	.byte 0x00, 0x00
_08010D24:
	.4byte 0x00000001
_08010D28:
	.4byte 0x00000040
_08010D2C:
	.4byte 0x00000020
_08010D30:
	.4byte 0x02018F34
_08010D34:
	.4byte 0x0201A734
_08010D38:
	mov r0, lr
	muls r0, r4, r0
	adds r3, r0, r1
	ldrh r2, [r3, #6]
	mov r3, ip
	ands r3, r2
	cmp r3, #0
	beq _08010D4C
	adds r2, r0, r1
	strh r7, [r2, #0xa]
_08010D4C:
	ldrb r4, [r6, r4]
	cmp r4, #0xff
	bne _08010D38
	adds r1, r5, #0
	movs r2, #0
	adds r1, #0xa0
	movs r0, #0x80
	str r2, [r1]
	movs r3, #0xa0
	lsls r1, r0, #3
	str r1, [sp]
	adds r0, r5, #0
	lsls r1, r3, #3
	movs r3, #0
	bl sub_08001C28
	adds r0, r5, #0
	bl obj_add_static_hit
	b _08010CE6
_08010D74:
	ldr r0, _08010D8C
	ldr r1, _08010D90
	str r0, [sp]
	ldr r2, _08010D94
	ldr r0, _08010D98
	movs r3, #0x1b
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010CD6
_08010D8C:
	.4byte gUnk_08050818
_08010D90:
	.4byte gUnk_08050824
_08010D94:
	.4byte gUnk_0805083C
_08010D98:
	.4byte gUnk_0805084C

	.global act_silvercoin
	.thumb_func
	.type act_silvercoin, %function
act_silvercoin: @ 08010D9C
	push {r4, r5, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	bne _08010DA8
	b _08010EA0
_08010DA8:
	adds r5, r4, #0
	adds r5, #0xa0
	ldr r3, [r5]
	cmp r3, #1
	beq _08010E04
	cmp r3, #1
	bgt _08010DE6
	movs r1, #1
	rsbs r0, r1, #0
	cmp r3, r0
	beq _08010DC6
_08010DBE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
_08010DC6:
	ldr r3, [r5, #4]
	cmp r3, #0
	ble _08010DDA
	subs r3, #2
	str r3, [r5, #4]
	cmp r3, #0
	bgt _08010DBE
	movs r2, #0
	str r2, [r5, #4]
	b _08010DBE
_08010DDA:
	movs r0, #0
	str r0, [r5]
	adds r0, r4, #0
	bl obj_add_static_hit
	b _08010DBE
_08010DE6:
	cmp r3, #2
	bne _08010DBE
	ldr r1, _08010E98
	movs r0, #0xfa
	lsls r3, r0, #1
	adds r0, r1, r3
	ldr r1, [r0]
	movs r0, #0x20
	bics r0, r1
	cmp r0, #0
	beq _08010DBE
	adds r0, r4, #0
	bl sub_08001FE8
	b _08010DBE
_08010E04:
	ldr r3, [r5, #4]
	cmp r3, #0
	ble _08010E7E
	subs r3, #2
	str r3, [r5, #4]
	cmp r3, #0
	ble _08010E78
_08010E12:
	ldr r1, [r5, #0xc]
	ldr r3, [r5, #8]
	adds r0, r1, r3
	str r0, [r5, #0xc]
	ldr r1, [r4, #0x24]
	ldr r3, [r4, #0x3c]
	adds r0, r1, r3
	ldr r1, [r4, #0x28]
	ldr r3, [r4, #0x40]
	str r0, [r4, #0x24]
	adds r0, r1, r3
	ldr r1, [r4, #0x2c]
	ldr r3, [r4, #0x44]
	str r0, [r4, #0x28]
	adds r0, r1, r3
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0xc]
	ldr r3, [r5, #8]
	adds r0, r1, r3
	str r0, [r5, #0xc]
	ldr r1, [r4, #0x24]
	ldr r3, [r4, #0x3c]
	adds r0, r1, r3
	ldr r1, [r4, #0x28]
	ldr r3, [r4, #0x40]
	str r0, [r4, #0x24]
	adds r0, r1, r3
	ldr r1, [r4, #0x2c]
	ldr r3, [r4, #0x44]
	str r0, [r4, #0x28]
	adds r0, r1, r3
	str r0, [r4, #0x2c]
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r3, #0x18
	muls r3, r1, r3
	ldr r0, _08010E9C
	ldrh r2, [r5, #0xe]
	adds r1, r3, #0
	adds r3, #0xc
	strh r2, [r0, r3]
	adds r1, #8
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r3, _08010E94
	adds r0, #2
	ands r0, r3
	strh r2, [r1, #2]
	strh r0, [r1]
	b _08010DBE
_08010E78:
	movs r1, #0
	str r1, [r5, #4]
	b _08010E12
_08010E7E:
	movs r1, #2
	str r1, [r5]
	movs r0, #0xfa
	ldr r1, _08010E98
	lsls r2, r0, #1
	adds r0, r1, r2
	ldr r3, [r0]
	movs r1, #0x20
	orrs r3, r1
	str r3, [r0]
	b _08010DBE
_08010E94:
	.4byte 0x00000007
_08010E98:
	.4byte gGameSetup
_08010E9C:
	.4byte 0x02018F34
_08010EA0:
	ldr r0, _08010EB8
	ldr r1, _08010EBC
	str r0, [sp]
	ldr r2, _08010EC0
	ldr r0, _08010EC4
	movs r3, #0x39
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010DA8
_08010EB8:
	.4byte gUnk_08050818
_08010EBC:
	.4byte gUnk_08050824
_08010EC0:
	.4byte gUnk_08050888
_08010EC4:
	.4byte gUnk_0805084C

	.global react_silvercoin
	.thumb_func
	.type react_silvercoin, %function
react_silvercoin: @ 08010EC8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	sub sp, #8
	adds r5, r1, #0
	cmp r4, #0
	bne _08010ED6
	b _08010FB8
_08010ED6:
	cmp r5, #0
	beq _08010FA0
_08010EDA:
	ldrb r7, [r5, #2]
	cmp r7, #1
	beq _08010EFC
	adds r0, r4, #0
	bl obj_remove_static_hit
	movs r3, #1
	adds r1, r4, #0
	adds r1, #0xa0
	rsbs r0, r3, #0
	movs r3, #8
	str r0, [r1]
	str r3, [r1, #4]
_08010EF4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08010EFC:
	adds r0, r4, #0
	bl obj_remove_static_hit
	adds r0, r4, #0
	bl obj_remove_draw
	adds r0, r4, #0
	bl obj_project_to_screen
	adds r0, r4, #0
	bl sub_080021E8
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r6, [r1]
	movs r0, #0x18
	adds r2, r6, #0
	muls r2, r0, r2
	ldr r3, _08010FD0
	adds r2, #8
	adds r0, r2, r3
	ldrh r3, [r0, #2]
	adds r1, r4, #0
	adds r1, #0xa0
	lsls r3, r3, #0x10
	str r3, [r1, #0xc]
	movs r3, #0x20
	str r3, [r1, #4]
	ldrh r2, [r0, #2]
	movs r3, #0xc0
	subs r0, r3, r2
	lsls r2, r0, #0xb
	str r2, [r1, #8]
	movs r3, #0x80
	ldr r2, [r4, #0x24]
	lsls r0, r3, #5
	subs r3, r0, r2
	cmp r3, #0
	blt _08010F9C
_08010F4A:
	asrs r2, r3, #5
	movs r0, #0xfa
	ldr r3, _08010FD4
	str r2, [r4, #0x3c]
	lsls r2, r0, #1
	adds r0, r3, r2
	ldr r2, [r0]
	movs r3, #0xf
	ands r2, r3
	lsls r3, r2, #3
	subs r3, r3, r2
	adds r3, #0x3c
	ldr r2, [r4, #0x28]
	lsls r3, r3, #8
	subs r3, r3, r2
	cmp r3, #0
	blt _08010F98
_08010F6C:
	asrs r2, r3, #5
	str r2, [r4, #0x40]
	str r7, [r1]
	str r5, [r1, #0x10]
	ldr r2, [r0]
	adds r2, #1
	str r2, [r0]
	adds r0, r6, #0
	bl sub_08003020
	movs r0, #0xa
	movs r1, #0
	movs r3, #0x80
	str r0, [sp]
	str r1, [sp, #4]
	lsls r2, r3, #9
	movs r1, #0x7f
	movs r3, #1
	movs r0, #0xba
	bl gamesfx_play
	b _08010EF4
_08010F98:
	adds r3, #0x1f
	b _08010F6C
_08010F9C:
	adds r3, #0x1f
	b _08010F4A
_08010FA0:
	ldr r0, _08010FD8
	ldr r1, _08010FDC
	str r0, [sp]
	ldr r2, _08010FE0
	ldr r0, _08010FE4
	movs r3, #0x6f
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010EDA
_08010FB8:
	ldr r0, _08010FE8
	ldr r1, _08010FDC
	str r0, [sp]
	ldr r2, _08010FE0
	ldr r0, _08010FE4
	movs r3, #0x6e
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010ED6
_08010FD0:
	.4byte 0x02018F34
_08010FD4:
	.4byte gGameSetup
_08010FD8:
	.4byte gUnk_08050898
_08010FDC:
	.4byte gUnk_08050824
_08010FE0:
	.4byte gUnk_080508A4
_08010FE4:
	.4byte gUnk_0805084C
_08010FE8:
	.4byte gUnk_08050818

	.global act_hud_silvercoin
	.thumb_func
	.type act_hud_silvercoin, %function
act_hud_silvercoin: @ 08010FEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	sub sp, #4
	cmp r7, #0
	beq _080110A8
_08010FFA:
	movs r0, #0xfa
	ldr r4, _080110DC
	lsls r1, r0, #1
	adds r0, r4, r1
	ldr r2, [r0]
	movs r1, #0x20
	ands r1, r2
	cmp r1, #0
	beq _08011028
	movs r3, #0x21
	rsbs r1, r3, #0
	ands r1, r2
	str r1, [r0]
	adds r2, r7, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r2, #0x18
	muls r0, r2, r0
	movs r2, #0xf
	ands r1, r2
	ldr r2, _080110E0
	adds r0, #8
	strh r1, [r2, r0]
_08011028:
	adds r2, r7, #0
	adds r2, #0xa0
	ldr r3, [r2]
	cmp r3, #1
	beq _08011086
	cmp r3, #1
	bgt _08011056
	cmp r3, #0
	beq _08011046
_0801103A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
_08011046:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r1, [r0]
	cmp r1, #6
	bne _0801103A
	movs r1, #1
	str r1, [r2]
	b _0801103A
_08011056:
	cmp r3, #2
	beq _08011076
	cmp r3, #3
	bne _0801103A
	ldr r3, [r7, #0x24]
	ldr r2, _080110E4
	cmp r3, r2
	ble _0801106E
	ldr r0, _080110E8
	adds r1, r3, r0
	str r1, [r7, #0x24]
	b _0801103A
_0801106E:
	adds r0, r7, #0
	bl sub_08001FE8
	b _0801103A
_08011076:
	adds r1, r4, #0
	adds r1, #0x8c
	ldr r0, [r1]
	cmp r0, #8
	bne _0801103A
	movs r0, #3
	str r0, [r2]
	b _0801103A
_08011086:
	movs r0, #0x80
	ldr r3, [r7, #0x24]
	lsls r1, r0, #5
	cmp r3, r1
	bge _080110A2
	movs r0, #0xe0
	lsls r2, r0, #3
	adds r0, r3, r2
	adds r2, r1, #0
	str r0, [r7, #0x24]
	cmp r0, r2
	ble _0801103A
	str r2, [r7, #0x24]
	b _0801103A
_080110A2:
	movs r1, #2
	str r1, [r2]
	b _0801103A
_080110A8:
	ldr r1, _080110EC
	ldr r5, _080110F0
	ldr r6, _080110F4
	mov r8, r1
	ldr r4, _080110F8
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #0xa7
	str r4, [sp]
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #0xaa
	str r4, [sp]
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08010FFA
_080110DC:
	.4byte gGameSetup
_080110E0:
	.4byte 0x02018F34
_080110E4:
	.4byte 0xFFFFF000
_080110E8:
	.4byte 0xFFFFF900
_080110EC:
	.4byte gUnk_080508B8
_080110F0:
	.4byte gUnk_0805084C
_080110F4:
	.4byte gUnk_08050824
_080110F8:
	.4byte gUnk_08050818

	.global init_hud_silvercoin
	.thumb_func
	.type init_hud_silvercoin, %function
init_hud_silvercoin: @ 080110FC
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _08011158
_08011106:
	ldr r0, _08011140
	ldr r2, _08011148
	movs r1, #0xa0
	strh r0, [r4]
	lsls r0, r1, #7
	adds r1, r4, #0
	str r2, [r4, #0x24]
	adds r1, #0xa0
	movs r2, #0
	str r0, [r4, #0x28]
	str r2, [r1]
	adds r0, r4, #0
	movs r1, #0x32
	movs r2, #3
	bl obj_setup_sprite
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r3, #0x18
	muls r3, r1, r3
	ldr r0, _0801114C
	ldr r1, _08011144
	adds r2, r3, #0
	adds r2, #0xc
	strh r1, [r0, r2]
	adds r2, r3, r0
	strh r1, [r2, #0xa]
	b _08011150
_08011140:
	.4byte 0x00001001
_08011144:
	.4byte 0x00000100
_08011148:
	.4byte 0xFFFFF000
_0801114C:
	.4byte 0x02018F34
_08011150:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_08011158:
	ldr r0, _08011170
	ldr r1, _08011174
	str r0, [sp]
	ldr r2, _08011178
	ldr r0, _0801117C
	movs r3, #0x98
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _08011106
_08011170:
	.4byte gUnk_08050818
_08011174:
	.4byte gUnk_08050824
_08011178:
	.4byte gUnk_080508CC
_0801117C:
	.4byte gUnk_0805084C
