@ asm/ovl_a.s: ROM 0x03C5C4-0x03DC1C (ovl_a, VMA 0x03003FC8)

	.include "asm/macros.inc"

	.section .ovl_a, "ax", %progbits
	.balign 4

	.arm

	.global sub_ovl_a_03003FC8
	.type sub_ovl_a_03003FC8, %function
sub_ovl_a_03003FC8: @ 03003FC8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr ip, _ovl_a_0300451C
	ldr r3, [ip, #0x34]
	sub sp, sp, #0x24
	cmp r0, r3
	str r0, [sp, #0x20]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x18]
	beq _ovl_a_030040E4
	ldr r4, [ip, #0xc]
	ldrh r2, [r4]
	rsb r3, r3, r0
	lsl r1, r2, #1
	cmn r3, r1
	addlt r3, r3, r2, lsl #2
	cmp r3, r1
	subgt r3, r3, r2, lsl #2
	cmn r3, #0x21
	mvnle r3, #0x1f
	cmp r3, #0x20
	movge r3, #0x20
	cmp r3, #0
	blt _ovl_a_0300446C
	ldr r0, [sp, #0x20]
	rsb sl, r3, r0
	add lr, sl, #0x1f
	add sl, r0, #0x1f
	cmp lr, sl
	bge _ovl_a_030040D8
	ldr sb, _ovl_a_0300451C
	ldr r4, [sb, #0xc]
	str r4, [sp, #0x14]
_ovl_a_03004048:
	ldr r7, [sp, #0x14]
	ldrh r5, [r7]
	asr r0, lr, #2
	cmp r0, r5
	blt _ovl_a_03004070
	ldr r8, [sb, #0xc]
	ldrh r3, [r8]
_ovl_a_03004064:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_a_03004064
_ovl_a_03004070:
	mov r6, #0x6000000
	and r1, lr, #0x1f
	ldr r5, [sb, #0xc]
	ldr r8, _ovl_a_03004520
	add r7, r6, #0x180
	lsl r4, r1, #1
	mov ip, #0
	and r6, lr, #3
_ovl_a_03004090:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, r0
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #2
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r4, r7]
	add r4, r4, #0x40
	ble _ovl_a_03004090
	add lr, lr, #1
	cmp lr, sl
	blt _ovl_a_03004048
_ovl_a_030040D8:
	ldr ip, _ovl_a_0300451C
	ldr r0, [sp, #0x20]
	str r0, [ip, #0x34]
_ovl_a_030040E4:
	ldr r0, _ovl_a_0300451C
	ldr r1, [sp, #0x18]
	ldr r3, [r0, #0x3c]
	cmp r1, r3
	beq _ovl_a_030041F4
	ldr ip, [r0, #0x10]
	ldr lr, [sp, #0x18]
	ldrh r2, [ip]
	rsb r3, r3, lr
	lsl r1, r2, #1
	cmn r3, r1
	addlt r3, r3, r2, lsl #2
	cmp r3, r1
	subgt r3, r3, r2, lsl #2
	cmn r3, #0x21
	mvnle r3, #0x1f
	cmp r3, #0x20
	movge r3, #0x20
	cmp r3, #0
	blt _ovl_a_030043BC
	ldr r1, [sp, #0x18]
	rsb sl, r3, r1
	add lr, sl, #0x1f
	add sl, r1, #0x1f
	cmp lr, sl
	bge _ovl_a_030041E8
	ldr sb, _ovl_a_0300451C
	ldr r8, [sb, #0x10]
	str r8, [sp, #0x10]
_ovl_a_03004158:
	ldr r0, [sp, #0x10]
	ldrh r4, [r0]
	asr r0, lr, #2
	cmp r0, r4
	blt _ovl_a_03004180
	ldr r5, [sb, #0x10]
	ldrh r3, [r5]
_ovl_a_03004174:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_a_03004174
_ovl_a_03004180:
	and r7, lr, #0x1f
	mov r6, #0x6000000
	ldr r5, [sb, #0x10]
	ldr r8, _ovl_a_03004520
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x400
	and r6, lr, #3
_ovl_a_030041A0:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, r0
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #2
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r4, r7]
	add r4, r4, #0x40
	ble _ovl_a_030041A0
	add lr, lr, #1
	cmp lr, sl
	blt _ovl_a_03004158
_ovl_a_030041E8:
	ldr ip, _ovl_a_0300451C
	ldr r1, [sp, #0x18]
	str r1, [ip, #0x3c]
_ovl_a_030041F4:
	ldr r0, _ovl_a_0300451C
	ldr r1, [sp, #0x1c]
	ldr r3, [r0, #0x38]
	cmp r1, r3
	beq _ovl_a_03004300
	ldr ip, [r0, #0x14]
	ldrh r2, [ip]
	rsb r3, r3, r1
	lsl r1, r2, #1
	cmn r3, r1
	addlt r3, r3, r2, lsl #2
	cmp r3, r1
	subgt r3, r3, r2, lsl #2
	cmn r3, #0x11
	mvnle r3, #0xf
	cmp r3, #0x10
	movge r3, #0x10
	cmp r3, #0
	blt _ovl_a_0300430C
	ldr r0, [sp, #0x1c]
	rsb sl, r3, r0
	add lr, sl, #0x10
	add sl, r0, #0x10
	cmp lr, sl
	bge _ovl_a_030042F4
	ldr sb, _ovl_a_0300451C
	ldr ip, [sb, #0x14]
	str ip, [sp, #8]
_ovl_a_03004264:
	ldr r4, [sp, #8]
	ldrh r8, [r4]
	asr r0, lr, #1
	cmp r0, r8
	blt _ovl_a_0300428C
	ldr r5, [sb, #0x14]
	ldrh r3, [r5]
_ovl_a_03004280:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_a_03004280
_ovl_a_0300428C:
	and r7, lr, #0xf
	mov r6, #0x6000000
	ldr r5, [sb, #0x14]
	ldr r8, _ovl_a_03004524
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x40
	and r6, lr, #1
_ovl_a_030042AC:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, r0
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #1
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r4, r7]
	add r4, r4, #0x20
	ble _ovl_a_030042AC
	add lr, lr, #1
	cmp lr, sl
	blt _ovl_a_03004264
_ovl_a_030042F4:
	ldr r0, _ovl_a_0300451C
	ldr ip, [sp, #0x1c]
	str ip, [r0, #0x38]
_ovl_a_03004300:
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
_ovl_a_0300430C:
	ldr r1, [sp, #0x1c]
	rsb sl, r3, r1
	cmp r1, sl
	mov lr, r1
	bge _ovl_a_030042F4
	str ip, [sp, #0xc]
	mov sb, r0
_ovl_a_03004328:
	ldr r4, [sp, #0xc]
	ldrh r8, [r4]
	asr r0, lr, #1
	cmp r0, r8
	blt _ovl_a_03004350
	ldr r5, [sb, #0x14]
	ldrh r3, [r5]
_ovl_a_03004344:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_a_03004344
_ovl_a_03004350:
	and r7, lr, #0xf
	mov r6, #0x6000000
	ldr r5, [sb, #0x14]
	ldr r8, _ovl_a_03004524
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x40
	and r6, lr, #1
_ovl_a_03004370:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, r0
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #1
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r4, r7]
	add r4, r4, #0x20
	ble _ovl_a_03004370
	add lr, lr, #1
	cmp lr, sl
	blt _ovl_a_03004328
	b _ovl_a_030042F4
_ovl_a_030043BC:
	ldr lr, [sp, #0x18]
	rsb r3, r3, lr
	cmp lr, r3
	bge _ovl_a_030041E8
	str r3, [sp, #4]
	mov sl, r0
	mov sb, ip
_ovl_a_030043D8:
	ldrh r4, [sb]
	asr r0, lr, #2
	cmp r0, r4
	blt _ovl_a_030043FC
	ldr r5, [sl, #0x10]
	ldrh r3, [r5]
_ovl_a_030043F0:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_a_030043F0
_ovl_a_030043FC:
	and r7, lr, #0x1f
	mov r6, #0x6000000
	ldr r5, [sl, #0x10]
	ldr r8, _ovl_a_03004520
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x400
	and r6, lr, #3
_ovl_a_0300441C:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, r0
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #2
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r4, r7]
	add r4, r4, #0x40
	ble _ovl_a_0300441C
	ldr ip, [sp, #4]
	add lr, lr, #1
	cmp lr, ip
	blt _ovl_a_030043D8
	b _ovl_a_030041E8
_ovl_a_0300446C:
	ldr lr, [sp, #0x20]
	rsb r3, r3, lr
	cmp lr, r3
	bge _ovl_a_030040D8
	str r3, [sp]
	mov sl, ip
	mov sb, r4
_ovl_a_03004488:
	ldrh r1, [sb]
	asr r0, lr, #2
	cmp r0, r1
	blt _ovl_a_030044AC
	ldr r1, [sl, #0xc]
	ldrh r3, [r1]
_ovl_a_030044A0:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_a_030044A0
_ovl_a_030044AC:
	and r6, lr, #0x1f
	mov r2, #0x6000000
	ldr r5, [sl, #0xc]
	ldr r8, _ovl_a_03004520
	lsl r4, r6, #1
	mov ip, #0
	add r7, r2, #0x180
	and r6, lr, #3
_ovl_a_030044CC:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, r0
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #2
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r4, r7]
	add r4, r4, #0x40
	ble _ovl_a_030044CC
	ldr ip, [sp]
	add lr, lr, #1
	cmp lr, ip
	blt _ovl_a_03004488
	b _ovl_a_030040D8
_ovl_a_0300451C:
	.4byte 0x020042A4
_ovl_a_03004520:
	.4byte gUnk_081108A0
_ovl_a_03004524:
	.4byte gUnk_081136E0

	.global sub_ovl_a_03004528
	.type sub_ovl_a_03004528, %function
sub_ovl_a_03004528: @ 03004528
	push {r4, r5, r6, r7, r8, lr}
	rsb r4, r0, #0
	cmp r4, #0xa0
	movge r4, #0xa0
	mov r6, r1
	cmp r0, #0
	mov r1, #0x50
	rsbgt r1, r0, r1
	subs r5, r0, r2
	addmi r1, r1, r5
	add r8, r4, r1
	movmi r5, #0
	add r2, r8, r5
	cmp r2, #0xa0
	mov lr, #0
	rsbgt r1, r4, #0xa0
	movgt r5, #0
	cmp r0, lr
	movge r8, r0
	movlt r8, lr
	cmp lr, r4
	ldr ip, _ovl_a_03004660
	bge _ovl_a_030045C0
	ldr r0, _ovl_a_03004664
	mov r7, lr
	ldrh r2, [r0, #0x20]
	mov lr, r4
	mov r0, #0x100
	lsl r3, r6, #8
	mov r4, #0x1000
_ovl_a_030045A0:
	subs lr, lr, #1
	strh r2, [ip, #4]
	strh r0, [ip, #0x10]
	strh r7, [ip, #0x12]
	str r3, [ip, #0x14]
	str r4, [ip, #0x18]
	add ip, ip, #0x20
	bne _ovl_a_030045A0
_ovl_a_030045C0:
	mov lr, #0
	cmp lr, r1
	bge _ovl_a_03004610
	ldr r7, _ovl_a_03004664
	lsl r2, r8, #8
	ldrh r4, [r7, #0x20]
	add r0, r2, #0x1000
	mov r7, lr
	mov r2, #0x100
	mov lr, r1
	lsl r3, r6, #8
_ovl_a_030045EC:
	subs lr, lr, #1
	str r0, [ip, #0x18]
	strh r4, [ip, #4]
	strh r2, [ip, #0x10]
	strh r7, [ip, #0x12]
	str r3, [ip, #0x14]
	add r0, r0, #0x100
	add ip, ip, #0x20
	bne _ovl_a_030045EC
_ovl_a_03004610:
	mov lr, #0
	cmp lr, r5
	bge _ovl_a_03004658
	ldr r1, _ovl_a_03004664
	mov r4, lr
	ldrh r3, [r1, #0x20]
	mov lr, r5
	lsl r1, r6, #8
	mov r0, #0x100
	mov r2, #0x5f00
_ovl_a_03004638:
	subs lr, lr, #1
	strh r3, [ip, #4]
	strh r0, [ip, #0x10]
	strh r4, [ip, #0x12]
	str r1, [ip, #0x14]
	str r2, [ip, #0x18]
	add ip, ip, #0x20
	bne _ovl_a_03004638
_ovl_a_03004658:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
_ovl_a_03004660:
	.4byte 0x02000820
_ovl_a_03004664:
	.4byte 0x020042A4

	.global sub_ovl_a_03004668
	.type sub_ovl_a_03004668, %function
sub_ovl_a_03004668: @ 03004668
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	sub fp, ip, #4
	sub sp, sp, #0x8c
	ldr r5, _03005574
	mov lr, pc
	bx r5
	ldr r2, _03005578
	ldr r7, [r2]
	ldr r3, _0300557C
	ldr r1, [r7, #0x24]
	ldr r4, [r3]
	ldrsh r5, [r7, #0x56]
	str r1, [fp, #-0x74]
	ldr r1, [r7, #0x28]
	str r1, [fp, #-0x78]
	ldr r0, [r7, #0x2c]
	str r0, [fp, #-0x7c]
	tst r4, #0x2000
	ldrsh r4, [r7, #0x54]
	addne r7, r1, #0x7000
	mov r0, r4
	strne r7, [fp, #-0x78]
	bl sin_fx
	mov r7, r0
	lsl ip, r7, #0x10
	mov r0, r4
	asr r7, ip, #0x10
	bl cos_fx
	mov sb, r0
	mov r0, r5
	bl sin_fx
	mov r2, r0
	lsl r1, r2, #0x10
	asr lr, r1, #0x10
	mov r0, r5
	str lr, [fp, #-0x6c]
	bl cos_fx
	lsl r8, sb, #0x10
	lsl ip, r0, #0x10
	asr sb, r8, #0x10
	cmn r4, #0x4000
	asr r8, ip, #0x10
	str r8, [fp, #-0x70]
	bgt _03005540
	mov r0, #0x80000000
	mvn r4, #0x4f
	asr r7, r0, #0x13
	mov sb, #0
	str r4, [fp, #-0x68]
_ovl_a_03004730:
	rsb r1, r5, #0
	lsl r4, r1, #0xa
	ldr r2, _03005580
	bic r0, r4, #0xfc000000
	lsr r5, r0, #0x10
	ldr lr, [r2, #0x28]
	lsl r8, r5, #0x10
	ldr ip, [r2, #0x30]
	lsr r4, r8, #0x10
	ldr r5, [r2, #0x24]
	ldr r0, [r2, #0x2c]
	add r1, r4, r4, lsl #1
	add r4, r4, lr
	ldr lr, [fp, #-0x68]
	add r3, ip, r8, lsr #17
	ldr r8, [fp, #-0x68]
	add r1, r0, r1, lsr #2
	cmp r5, #0
	add r0, lr, r7, asr #7
	moveq lr, r0
	add r2, r8, r7, asr #6
	movne ip, r4
	moveq ip, r1
	cmp r5, #2
	movne r8, r3
	moveq r8, r1
	str lr, [fp, #-0x54]
	movne lr, r2
	moveq lr, r0
	cmp r5, #0
	ldreq r3, [fp, #-0x68]
	str ip, [fp, #-0x48]
	str lr, [fp, #-0x58]
	str r8, [fp, #-0x4c]
	streq r4, [fp, #-0x50]
	streq r3, [fp, #-0x5c]
	beq _ovl_a_030047D8
	cmp r5, #1
	streq r1, [fp, #-0x50]
	streq r0, [fp, #-0x5c]
	strne r3, [fp, #-0x50]
	strne r2, [fp, #-0x5c]
_ovl_a_030047D8:
	ldr r2, [fp, #-0x68]
	cmn r2, #0x50
	mvnlt ip, #0x4f
	strlt ip, [fp, #-0x68]
	blt _ovl_a_030047FC
	ldr lr, [fp, #-0x68]
	cmp lr, #0x50
	movge lr, #0x50
	str lr, [fp, #-0x68]
_ovl_a_030047FC:
	ldr r5, _03005584
	mov r3, #0xa00
	ldr r2, _03005580
	mov ip, r5
	mov r8, #0
	mov r0, #0x2740
	add r1, r3, #0xa
_ovl_a_03004818:
	ldrh r3, [r2, #0x18]
	strh r3, [r5]
	ldr lr, [fp, #-0x48]
	strh lr, [r5, #8]
	ldrh lr, [r2, #0x1c]
	rsb r3, r8, #0
	strh lr, [r5, #2]
	strh r3, [r5, #0xa]
	ldr lr, [fp, #-0x4c]
	add r8, r8, #1
	cmp r8, #0x9f
	strh lr, [r5, #0xc]
	strh r3, [r5, #0xe]
	strh r0, [r5, #0x1c]
	strh r1, [r5, #0x1e]
	add r5, r5, #0x20
	ble _ovl_a_03004818
	ldr r0, [fp, #-0x68]
	cmp r0, #0x4f
	bgt _ovl_a_03004AE0
	rsb r5, r0, #0xff000000
	add sl, r5, #0xff0000
	add r6, sl, #0xff00
	add r4, r6, #0xd0
	cmp r4, #0xa0
	movge r4, #0xa0
	cmp r4, #0
	movlt r4, #0
	cmn r0, #0x30
	mov r6, #0x80
	rsbgt r6, r0, #0x50
	add r3, r4, r6
	cmp r3, #0xa0
	rsbgt r6, r4, #0xa0
	addgt r3, r4, r6
	cmp r4, #0
	rsb sl, r3, #0xa0
	mov r5, ip
	ble _ovl_a_030048F0
	ldr r0, _03005580
	ldr r2, _03005588
	ldr ip, [r0, #4]
	ldr r1, [r2]
	ldrh r0, [ip]
	bl color_fade
	cmp r4, #0
	lsl r1, r0, #0x10
	asr r0, r1, #0x10
	ble _ovl_a_030048F0
	mov r8, r4
_ovl_a_030048E0:
	subs r8, r8, #1
	strh r0, [r5, #6]
	add r5, r5, #0x20
	bne _ovl_a_030048E0
_ovl_a_030048F0:
	cmp r6, #0
	ble _ovl_a_03004940
	ldr lr, [fp, #-0x68]
	adds r3, lr, #0x30
	movmi r3, #0
	cmp r6, #0
	ble _ovl_a_03004940
	lsl r4, r3, #1
	mov r8, r6
_ovl_a_03004914:
	ldr r3, _03005580
	ldr r2, _03005588
	ldr r1, [r3, #4]
	ldrh r0, [r4, r1]
	ldr r1, [r2]
	bl color_fade
	subs r8, r8, #1
	strh r0, [r5, #6]
	add r4, r4, #2
	add r5, r5, #0x20
	bne _ovl_a_03004914
_ovl_a_03004940:
	cmp sl, #0
	ble _ovl_a_03004984
	ldr r0, _03005580
	ldr lr, _03005588
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r1, [lr]
	bl color_fade
	cmp sl, #0
	lsl ip, r0, #0x10
	asr r0, ip, #0x10
	ble _ovl_a_03004984
	mov r8, sl
_ovl_a_03004974:
	subs r8, r8, #1
	strh r0, [r5, #6]
	add r5, r5, #0x20
	bne _ovl_a_03004974
_ovl_a_03004984:
	ldr r0, [fp, #-0x5c]
	ldr r1, [fp, #-0x50]
	ldr r2, [fp, #-0x68]
	bl sub_ovl_a_03004528
	ldr r2, [fp, #-0x54]
	cmp r2, #0x50
	movge r2, #0x50
	rsb r1, r2, #0
	ldr r3, [fp, #-0x68]
	cmp r1, #0xa0
	movge r1, #0xa0
	mov lr, #0x50
	cmp r2, #0
	rsbgt lr, r2, lr
	subs ip, r2, r3
	addmi lr, lr, ip
	add r3, r1, lr
	movmi ip, #0
	add r3, r3, ip
	cmp r3, #0xa0
	ldr r0, _0300558C
	rsbgt lr, r1, #0xa0
	movgt ip, #0
	cmp r1, #0
	addgt r0, r0, r1, lsl #5
	cmp lr, #0
	add r2, r2, #0x30
	ble _ovl_a_03004A08
	mov r3, lr
_ovl_a_030049F8:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	bne _ovl_a_030049F8
_ovl_a_03004A08:
	cmp ip, #0
	ble _ovl_a_03004A2C
	sub r2, r2, #1
	mov r3, ip
_ovl_a_03004A18:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	sub r2, r2, #1
	bne _ovl_a_03004A18
_ovl_a_03004A2C:
	ldr r2, [fp, #-0x58]
	cmp r2, #0x50
	movge r2, #0x50
	rsb r1, r2, #0
	ldr r3, [fp, #-0x68]
	cmp r1, #0xa0
	movge r1, #0xa0
	mov lr, #0x50
	cmp r2, #0
	rsbgt lr, r2, lr
	subs ip, r2, r3
	addmi lr, lr, ip
	add r3, r1, lr
	movmi ip, #0
	add r3, r3, ip
	cmp r3, #0xa0
	ldr r0, _03005590
	rsbgt lr, r1, #0xa0
	movgt ip, #0
	cmp r1, #0
	addgt r0, r0, r1, lsl #5
	cmp lr, #0
	add r2, r2, #0x80
	ble _ovl_a_03004AA0
	mov r3, lr
_ovl_a_03004A90:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	bne _ovl_a_03004A90
_ovl_a_03004AA0:
	cmp ip, #0
	ble _ovl_a_03004AC4
	sub r2, r2, #1
	mov r3, ip
_ovl_a_03004AB0:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	sub r2, r2, #1
	bne _ovl_a_03004AB0
_ovl_a_03004AC4:
	ldr r2, [fp, #-0x50]
	ldr r3, [fp, #-0x48]
	ldr ip, [fp, #-0x4c]
	lsr r1, r2, #4
	lsr r0, r3, #3
	lsr r2, ip, #3
	bl sub_ovl_a_03003FC8
_ovl_a_03004AE0:
	ldr r1, [fp, #-0x68]
	cmn r1, #0x50
	ble _03005410
	ldr r3, [fp, #-0x78]
	ldr r2, [fp, #-0x78]
	mul r3, sb, r3
	mul r2, r7, r2
	lsl r6, sb, #1
	add r5, r6, sb
	lsl r8, r7, #1
	rsb sl, sb, r5, lsl #3
	add ip, r8, r7
	rsb r1, r7, ip, lsl #3
	add lr, sl, sl, lsl #2
	add r0, r1, r1, lsl #2
	lsl ip, lr, #3
	sub r5, r3, r0, lsl #11
	add sl, ip, r2, asr #8
	eor r1, sl, sl, asr #31
	sub r1, r1, sl, asr #31
	eor r0, r5, r5, asr #31
	sub r0, r0, r5, asr #31
	str r3, [fp, #-0x98]
	str r2, [fp, #-0x9c]
	bl udiv
	teq r5, sl
	rsbmi r0, r0, #0
	ldr r1, [fp, #-0x68]
	mvn r4, r0
	cmp r4, r1
	str r4, [fp, #-0x60]
	strgt r1, [fp, #-0x60]
	bgt _ovl_a_03004B74
	ldr r0, [fp, #-0x60]
	cmn r0, #0x51
	mvnle r0, #0x4f
	str r0, [fp, #-0x60]
_ovl_a_03004B74:
	add r5, r6, sb
	add ip, r8, r7
	ldr r1, [fp, #-0x98]
	ldr r3, [fp, #-0x9c]
	add sl, sb, r5, lsl #2
	add lr, r7, ip, lsl #2
	lsl r2, sl, #5
	sub r6, r1, lr, lsl #13
	add r8, r2, r3, asr #8
	eor r0, r6, r6, asr #31
	sub r0, r0, r6, asr #31
	eor r1, r8, r8, asr #31
	sub r1, r1, r8, asr #31
	bl udiv
	teq r6, r8
	rsbmi r0, r0, #0
	ldr lr, [fp, #-0x60]
	mvn r4, r0
	cmp r4, lr
	str r4, [fp, #-0x64]
	strgt lr, [fp, #-0x64]
	bgt _ovl_a_03004BDC
	ldr r8, [fp, #-0x64]
	cmn r8, #0x51
	mvnle r8, #0x4f
	str r8, [fp, #-0x64]
_ovl_a_03004BDC:
	ldr lr, [fp, #-0x70]
	ldr r4, [fp, #-0x78]
	mul r4, lr, r4
	ldr r3, [fp, #-0x6c]
	ldr sl, [fp, #-0x78]
	mul sl, r3, sl
	rsb ip, r4, #0
	asr r8, ip, #8
	str r8, [fp, #-0x34]
	mov ip, r8
	mul r8, sb, r8
	asr r1, sl, #8
	mov r4, r1
	mul r4, r7, r4
	mul ip, r7, ip
	str r8, [fp, #-0xa4]
	mov r8, r1
	mul r8, sb, r8
	rsb r6, sb, #0
	asr sb, r6, #4
	lsl r0, r7, #4
	mov r5, sb
	add r2, sb, r5, lsl #2
	str r1, [fp, #-0x38]
	str sb, [fp, #-0x44]
	str r0, [fp, #-0xa0]
	ldr r7, _03005594
	sub lr, r0, r2, lsl #4
	asr sl, r4, #0xc
	rsb r5, ip, #0
	ldr r1, [r7, lr]
	asr r3, r5, #0xc
	str sl, [fp, #-0x2c]
	str r3, [fp, #-0x30]
	ldr r4, [fp, #-0x2c]
	ldr r0, [fp, #-0xa4]
	ldr ip, [fp, #-0x30]
	lsl sl, r1, #2
	asr r7, r0, #4
	ldr r6, [fp, #-0x34]
	smull r2, sb, r6, sl
	add r2, r4, r4, lsl #2
	rsb lr, sb, sb, lsl #4
	rsb r6, r7, #0
	lsl sb, r2, #4
	add r5, ip, ip, lsl #2
	lsl r7, lr, #3
	ldr r1, [fp, #-0x38]
	smull ip, r4, r1, sl
	sub r3, r6, r5, lsl #4
	rsb lr, sb, r8, asr #4
	smull r1, r5, r3, sl
	smull r1, ip, lr, sl
	ldr r1, [fp, #-0x9c]
	ldr r6, [fp, #-0x74]
	ldr sb, [fp, #-0x7c]
	asr r2, r1, #0xc
	rsb r0, r4, r4, lsl #4
	cmp r7, #0
	str r2, [fp, #-0x40]
	lsl r4, r0, #3
	add r2, ip, r6
	add r1, r5, sb
	ble _0300551C
	add sl, r2, r7
	add r6, sl, #0x1fc0
	rsb r5, r7, r2
	add r0, r6, #0x3f
	asr sb, r5, #0xd
	asr r7, r0, #0xd
	str sb, [fp, #-0x80]
	str r7, [fp, #-0x88]
_ovl_a_03004CFC:
	cmp r4, #0
	ble _030054F8
	add r2, r1, r4
	add sl, r2, #0x1fc0
	rsb r6, r4, r1
	add r4, sl, #0x3f
	asr r7, r6, #0xd
	asr r1, r4, #0xd
	str r7, [fp, #-0x84]
	str r1, [fp, #-0x8c]
_ovl_a_03004D24:
	ldr sb, [fp, #-0x44]
	ldr r1, [fp, #-0x60]
	mul r1, sb, r1
	ldr r6, [fp, #-0xa0]
	add sb, r6, r1
	asr r7, sb, #2
	str r1, [fp, #-0xa8]
	ldr r0, _03005594
	str r7, [fp, #-0xb4]
	lsl ip, r7, #2
	ldr lr, [r0, ip]
	and sl, sb, #3
	rsb r2, sl, #4
	str sl, [fp, #-0xb0]
	ldr r4, [fp, #-0x2c]
	mul sl, r2, lr
	ldr lr, [fp, #-0x60]
	ldr r5, [fp, #-0x30]
	mul lr, r4, lr
	ldr r4, [fp, #-0x60]
	ldr r3, [fp, #-0x40]
	mul r4, r5, r4
	ldr r5, [fp, #-0x60]
	mul r5, r3, r5
	add r6, ip, #4
	ldr r7, [r0, r6]
	ldr r6, [fp, #-0xb0]
	ldr r0, [fp, #-0x34]
	mla r6, r7, r6, sl
	smull r1, r7, r0, r6
	ldr r2, [fp, #-0xa4]
	rsb sl, r7, r7, lsl #4
	ldr r3, [fp, #-0x38]
	smull r0, ip, r3, r6
	lsl r7, sl, #3
	add sl, lr, r8, asr #4
	sub lr, r4, r2, asr #4
	smull r3, r8, lr, r6
	smull r0, r3, sl, r6
	ldr r0, [fp, #-0x98]
	rsb r1, ip, ip, lsl #4
	add r4, r5, r0, asr #4
	str r4, [fp, #-0x3c]
	ldr ip, [fp, #-0x7c]
	lsl r4, r1, #3
	ldr r1, [fp, #-0x74]
	cmp r7, #0
	add r2, r3, r1
	add r1, r8, ip
	ble _030054BC
	add ip, r2, r7
	add r0, ip, #0x1fc0
	rsb r8, r7, r2
	add r5, r0, #0x3f
	asr ip, r8, #0xd
	ldr r0, [fp, #-0x80]
	ldr r8, [fp, #-0x88]
	asr r3, r5, #0xd
	cmp ip, r0
	movlt r0, ip
	cmp r3, r8
	str r0, [fp, #-0x80]
	strgt r3, [fp, #-0x88]
_ovl_a_03004E20:
	cmp r4, #0
	ble _03005480
	add r0, r1, r4
	add r2, r0, #0x1fc0
	rsb r5, r4, r1
	ldr ip, [fp, #-0x84]
	add r8, r2, #0x3f
	ldr r4, [fp, #-0x8c]
	asr r1, r5, #0xd
	asr r3, r8, #0xd
	cmp r1, ip
	movlt ip, r1
	cmp r3, r4
	str ip, [fp, #-0x84]
	strgt r3, [fp, #-0x8c]
_03004E5C:
	ldr r8, [fp, #-0x68]
	ldr r3, [fp, #-0x60]
	ldr r4, _03005598
	cmp r8, r3
	sub r5, r4, r8, lsl #5
	ble _03004E9C
	mov r1, #0x2040
	add r3, r1, #7
	mov r2, #0x1000
_03004E80:
	ldr r0, [fp, #-0x60]
	sub r8, r8, #1
	cmp r8, r0
	strh r3, [r5, #0x1c]
	strh r2, [r5, #0x1e]
	add r5, r5, #0x20
	bgt _03004E80
_03004E9C:
	ldr r8, [fp, #-0x60]
	ldr ip, [fp, #-0x64]
	cmp r8, ip
	ble _03004F40
_03004EAC:
	ldr r0, [fp, #-0xb4]
	ldr ip, _03005594
	ldr r3, [fp, #-0xb0]
	lsl r1, r0, #2
	ldr r6, [ip, r1]
	rsb r2, r3, #4
	mul r0, r2, r6
	add r6, r1, #4
	ldr r3, [ip, r6]
	ldr r6, [fp, #-0xb0]
	mla r6, r3, r6, r0
	ldr r3, [fp, #-0x3c]
	smull r1, ip, r3, r6
	asr r0, ip, #4
	sub r2, r0, #0x1a0
	asrs r1, r2, #5
	rsb ip, r1, #0x10
	orr r3, ip, r1, lsl #8
	mov r0, #0x2040
	movmi r1, #0x10
	strhpl r3, [r5, #0x1e]
	strhmi r1, [r5, #0x1e]
	add r2, r0, #7
	strh r2, [r5, #0x1c]
	sub r0, fp, #0x40
	ldm r0, {r0, ip}
	ldr r1, [fp, #-0x44]
	rsb r2, r0, ip
	ldr ip, [fp, #-0x64]
	sub r8, r8, #1
	rsb sb, r1, sb
	asr r3, sb, #2
	cmp r8, ip
	add r5, r5, #0x20
	str r2, [fp, #-0x3c]
	str r3, [fp, #-0xb4]
	bgt _03005474
_03004F40:
	ldr r8, [fp, #-0x60]
	ldr r5, [fp, #-0xa8]
	ldr r3, [fp, #-0xa0]
	cmn r8, #0x50
	add sb, r3, r5
	sub r5, r4, r8, lsl #5
	ble _03005008
	mvn r4, #0xf70
	sub r7, r4, #2
	str r7, [fp, #-0xac]
_03004F68:
	ldr r0, [fp, #-0xac]
	ldr r7, _03005594
	strh r0, [r5, #4]
	bic ip, sb, #3
	ldr r2, [r7, ip]
	and r4, sb, #3
	rsb r1, r4, #4
	mul r7, r1, r2
	ldr r3, _03005594
	add r6, ip, #4
	ldr r0, [r3, r6]
	mla r6, r4, r0, r7
	ldr r4, [fp, #-0x34]
	smull r2, r7, r4, r6
	ldr r1, [fp, #-0x38]
	smull r2, ip, lr, r6
	smull r3, r4, r1, r6
	rsb r2, r7, r7, lsl #4
	smull r1, r0, sl, r6
	sub r3, r0, r2, lsl #3
	ldr r2, [fp, #-0x74]
	rsb r1, r4, r4, lsl #4
	sub r0, ip, r1, lsl #3
	add ip, r3, r2
	ldr r2, [fp, #-0x7c]
	add r1, r0, r2
	str ip, [r5, #0x14]
	str r1, [r5, #0x18]
	strh r7, [r5, #0x10]
	strh r4, [r5, #0x12]
	sub r8, r8, #1
	ldr ip, [fp, #-0x44]
	ldr r0, [fp, #-0x2c]
	ldr r2, [fp, #-0x30]
	cmn r8, #0x50
	rsb sb, ip, sb
	add r5, r5, #0x20
	rsb sl, r0, sl
	rsb lr, r2, lr
	bgt _03004F68
_03005008:
	ldr lr, _03005580
	ldr r1, [fp, #-0x84]
	ldr sb, [lr, #0x44]
	cmp r1, sb
	ldrge sb, [fp, #-0x84]
	strge sb, [fp, #-0x90]
	bge _03005100
	str sb, [fp, #-0x90]
	mov r5, r1
_0300502C:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _03005050
	ldr ip, _03005580
	ldr r4, [ip, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_03005050:
	ldr r1, [fp, #-0x80]
	ldr r2, [fp, #-0x88]
	cmp r1, r2
	mov r4, r1
	bge _030050F4
	and r0, r5, #0x1f
	ldr r8, _03005580
	ldr r7, _0300559C
	lsl sl, r0, #7
_03005074:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _03005094
	ldr lr, [r8, #8]
	ldrh r3, [lr]
	cmp r4, r3
	subge r2, r3, #1
_03005094:
	ldr lr, [r8, #8]
	ldrh r0, [lr]
	mla r2, r6, r0, r2
	and r3, r4, #0x1f
	add ip, sl, r3
	add r3, lr, r2, lsl #1
	lsl r1, ip, #2
	ldrh ip, [r3, #4]
	lsl r0, ip, #4
	add r2, r0, r7
	ldr ip, [r0, r7]
	add lr, r1, #0x6000000
	ldr r3, [r2, #4]
	ldr r0, [r2, #8]
	add r1, lr, #0x8000
	ldr lr, [r2, #0xc]
	str ip, [r1]
	str r3, [r1, #0x80]
	str r0, [r1, #0x100]!
	ldr r3, [fp, #-0x88]
	add r4, r4, #1
	cmp r4, r3
	str lr, [r1, #0x80]
	blt _03005074
_030050F4:
	add r5, r5, #1
	cmp r5, sb
	blt _0300502C
_03005100:
	ldr r2, _03005580
	ldr r1, [fp, #-0x8c]
	ldr r3, [r2, #0x4c]
	cmp r3, r1
	ldrge r2, [fp, #-0x8c]
	strge r2, [fp, #-0x94]
	bge _030051FC
	str r3, [fp, #-0x94]
	mov r5, r3
_03005124:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _03005148
	ldr lr, _03005580
	ldr r4, [lr, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_03005148:
	ldr r0, [fp, #-0x80]
	ldr ip, [fp, #-0x88]
	cmp r0, ip
	mov r4, r0
	bge _030051EC
	and sb, r5, #0x1f
	ldr r8, _03005580
	ldr r7, _0300559C
	lsl sl, sb, #7
_0300516C:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _0300518C
	ldr r1, [r8, #8]
	ldrh r3, [r1]
	cmp r4, r3
	subge r2, r3, #1
_0300518C:
	ldr lr, [r8, #8]
	ldrh r0, [lr]
	mla r2, r6, r0, r2
	and sb, r4, #0x1f
	add r3, lr, r2, lsl #1
	add ip, sl, sb
	lsl sb, ip, #2
	ldrh ip, [r3, #4]
	lsl r0, ip, #4
	add r2, r0, r7
	ldr ip, [r0, r7]
	add lr, sb, #0x6000000
	ldr r3, [r2, #4]
	ldr r0, [r2, #8]
	add sb, lr, #0x8000
	ldr lr, [r2, #0xc]
	str ip, [sb]
	str r3, [sb, #0x80]
	str r0, [sb, #0x100]!
	ldr r2, [fp, #-0x88]
	add r4, r4, #1
	cmp r4, r2
	str lr, [sb, #0x80]
	blt _0300516C
_030051EC:
	ldr r1, [fp, #-0x8c]
	add r5, r5, #1
	cmp r5, r1
	blt _03005124
_030051FC:
	ldr lr, _03005580
	ldr r3, [fp, #-0x80]
	ldr sb, [lr, #0x40]
	cmp r3, sb
	bge _030052F4
	ldr r0, [fp, #-0x90]
	ldr r5, [fp, #-0x94]
	cmp r0, r5
	mov r5, r0
	bge _030052F4
_03005224:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _03005248
	ldr ip, _03005580
	ldr r4, [ip, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_03005248:
	ldr r1, [fp, #-0x80]
	cmp r1, sb
	mov r4, r1
	bge _030052E4
	and r2, r5, #0x1f
	ldr r8, _03005580
	ldr r7, _0300559C
	lsl sl, r2, #7
_03005268:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _03005288
	ldr lr, [r8, #8]
	ldrh r3, [lr]
	cmp r4, r3
	subge r2, r3, #1
_03005288:
	ldr lr, [r8, #8]
	ldrh r0, [lr]
	mla r2, r6, r0, r2
	and r3, r4, #0x1f
	add ip, sl, r3
	add r3, lr, r2, lsl #1
	lsl r1, ip, #2
	ldrh ip, [r3, #4]
	lsl r0, ip, #4
	add r2, r0, r7
	ldr ip, [r0, r7]
	add lr, r1, #0x6000000
	ldr r3, [r2, #4]
	ldr r0, [r2, #8]
	add r1, lr, #0x8000
	add r4, r4, #1
	ldr lr, [r2, #0xc]
	str ip, [r1]
	str r3, [r1, #0x80]
	str r0, [r1, #0x100]!
	cmp r4, sb
	str lr, [r1, #0x80]
	blt _03005268
_030052E4:
	ldr r1, [fp, #-0x94]
	add r5, r5, #1
	cmp r5, r1
	blt _03005224
_030052F4:
	ldr lr, _03005580
	ldr r2, [fp, #-0x88]
	ldr sb, [lr, #0x48]
	cmp sb, r2
	bge _030053EC
	ldr r5, [fp, #-0x90]
	ldr ip, [fp, #-0x94]
	cmp r5, ip
	bge _030053EC
_03005318:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _0300533C
	ldr r0, _03005580
	ldr r4, [r0, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_0300533C:
	ldr r3, [fp, #-0x88]
	mov r4, sb
	cmp r4, r3
	bge _030053DC
	and r1, r5, #0x1f
	ldr r8, _03005580
	ldr r7, _0300559C
	lsl sl, r1, #7
_0300535C:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _0300537C
	ldr lr, [r8, #8]
	ldrh r3, [lr]
	cmp r4, r3
	subge r2, r3, #1
_0300537C:
	ldr ip, [r8, #8]
	ldrh lr, [ip]
	mla r2, r6, lr, r2
	and r3, r4, #0x1f
	add r0, sl, r3
	add r3, ip, r2, lsl #1
	ldrh r2, [r3, #4]
	lsl r1, r0, #2
	lsl r0, r2, #4
	add r2, r0, r7
	ldr ip, [r0, r7]
	add lr, r1, #0x6000000
	ldr r3, [r2, #4]
	ldr r0, [r2, #8]
	add r1, lr, #0x8000
	ldr lr, [r2, #0xc]
	str ip, [r1]
	str r3, [r1, #0x80]
	str r0, [r1, #0x100]!
	ldr ip, [fp, #-0x88]
	add r4, r4, #1
	cmp r4, ip
	str lr, [r1, #0x80]
	blt _0300535C
_030053DC:
	ldr r1, [fp, #-0x94]
	add r5, r5, #1
	cmp r5, r1
	blt _03005318
_030053EC:
	ldr lr, [fp, #-0x8c]
	ldr r2, _03005580
	str lr, [r2, #0x4c]
	ldr lr, [fp, #-0x80]
	str lr, [r2, #0x40]
	ldr r3, [fp, #-0x84]
	str r3, [r2, #0x44]
	ldr ip, [fp, #-0x88]
	str ip, [r2, #0x48]
_03005410:
	ldr r1, _0300557C
	ldr r0, [r1]
	tst r0, #4
	beq _0300546C
	ldr r8, _030055A0
	mov r2, #0x2040
	add r3, r2, #7
	mov r5, #0
	strh r5, [r8, #0x1e]
	strh r3, [r8, #0x1c]
	add r5, r8, #0x20
	mov r2, #0xb
	mov r8, #0x1f
_03005444:
	subs r8, r8, #1
	strh r3, [r5, #0x1c]
	strh r2, [r5, #0x1e]
	add r5, r5, #0x20
	bpl _03005444
	mov r1, #0x2040
	add r0, r1, #7
	mov ip, #0
	strh r0, [r5, #0x1c]
	strh ip, [r5, #0x1e]
_0300546C:
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_03005474:
	and r6, sb, #3
	str r6, [fp, #-0xb0]
	b _03004EAC
_03005480:
	rsb r8, r4, r1
	add r0, r8, #0x1fc0
	add r5, r1, r4
	ldr r8, [fp, #-0x84]
	ldr r4, [fp, #-0x8c]
	add r2, r0, #0x3f
	asr r1, r2, #0xd
	asr ip, r5, #0xd
	cmp ip, r8
	movlt r8, ip
	cmp r1, r4
	movge r4, r1
	str r8, [fp, #-0x84]
	str r4, [fp, #-0x8c]
	b _03004E5C
_030054BC:
	rsb r0, r7, r2
	add r5, r0, #0x1fc0
	add r8, r5, #0x3f
	add ip, r2, r7
	asr r5, r8, #0xd
	ldr r2, [fp, #-0x88]
	ldr r8, [fp, #-0x80]
	asr r0, ip, #0xd
	cmp r0, r8
	movlt r8, r0
	cmp r5, r2
	movge r2, r5
	str r8, [fp, #-0x80]
	str r2, [fp, #-0x88]
	b _ovl_a_03004E20
_030054F8:
	rsb r7, r4, r1
	add r5, r7, #0x1fc0
	add sb, r1, r4
	add lr, r5, #0x3f
	asr r0, sb, #0xd
	asr ip, lr, #0xd
	str r0, [fp, #-0x84]
	str ip, [fp, #-0x8c]
	b _ovl_a_03004D24
_0300551C:
	rsb r5, r7, r2
	add sb, r5, #0x1fc0
	add r0, r2, r7
	add ip, sb, #0x3f
	asr lr, r0, #0xd
	asr r2, ip, #0xd
	str lr, [fp, #-0x80]
	str r2, [fp, #-0x88]
	b _ovl_a_03004CFC
_03005540:
	cmp r4, #0x4000
	movge r3, #0x50
	strge r3, [fp, #-0x68]
	movge r7, #0x1000
	movge sb, #0
	bge _ovl_a_03004730
	mov r0, r4
	bl tan_fx
	lsl r2, r0, #0x10
	asr r1, r2, #0x10
	sub lr, r1, #2
	str lr, [fp, #-0x68]
	b _ovl_a_03004730
_03005574:
	.4byte sub_08000C1C
_03005578:
	.4byte 0x0200436C
_0300557C:
	.4byte gModeFlags
_03005580:
	.4byte 0x020042A4
_03005584:
	.4byte 0x02000820
_03005588:
	.4byte gBrightness
_0300558C:
	.4byte 0x0200082A
_03005590:
	.4byte 0x0200082E
_03005594:
	.4byte gUnk_0803F49C
_03005598:
	.4byte 0x02001220
_0300559C:
	.4byte gUnk_081136E0
_030055A0:
	.4byte 0x02001760
	.incbin "baserom.gba", 0x3DBA0, 0x7C
