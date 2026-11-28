@ asm/ovl_b.s: ROM 0x03DC1C-0x03EA90 (ovl_b, VMA 0x03003FC8)

	.include "asm/macros.inc"

	.section .ovl_b, "ax", %progbits
	.balign 4

	.arm

	.global ovl_b_stream_map
	.type ovl_b_stream_map, %function
ovl_b_stream_map: @ 03003FC8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr ip, _ovl_b_03004370
	ldr r3, [ip, #0x20]
	sub sp, sp, #0x20
	cmp r0, r3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x18]
	beq _ovl_b_030040E0
	ldr lr, [ip, #0x10]
	ldrh r2, [lr]
	rsb r3, r3, r0
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
	blt _ovl_b_030042C0
	ldr r0, [sp, #0x1c]
	rsb sl, r3, r0
	add r4, sl, #0x10
	add sl, r0, #0x10
	cmp r4, sl
	bge _ovl_b_030040D4
	ldr sb, _ovl_b_03004370
	ldr r5, [sb, #0x10]
	str r5, [sp, #0x14]
_ovl_b_03004044:
	ldr r7, [sp, #0x14]
	ldrh r6, [r7]
	asr lr, r4, #1
	cmp lr, r6
	blt _ovl_b_0300406C
	ldr r8, [sb, #0x10]
	ldrh r3, [r8]
_ovl_b_03004060:
	rsb lr, r3, lr
	cmp lr, r3
	bge _ovl_b_03004060
_ovl_b_0300406C:
	and r2, r4, #0xf
	mov r1, #0x6000000
	ldr r5, [sb, #0x10]
	ldr r8, _ovl_b_03004374
	lsl r0, r2, #1
	mov ip, #0
	add r7, r1, #0x8000
	and r6, r4, #1
_ovl_b_0300408C:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, lr
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #1
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r0, r7]
	add r0, r0, #0x20
	ble _ovl_b_0300408C
	add r4, r4, #1
	cmp r4, sl
	blt _ovl_b_03004044
_ovl_b_030040D4:
	ldr ip, _ovl_b_03004370
	ldr r0, [sp, #0x1c]
	str r0, [ip, #0x20]
_ovl_b_030040E0:
	ldr r0, _ovl_b_03004370
	ldr r1, [sp, #0x18]
	ldr r3, [r0, #0x24]
	cmp r1, r3
	beq _ovl_b_030041F8
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
	blt _ovl_b_03004204
	ldr ip, [sp, #0x18]
	rsb sl, r3, ip
	add r4, sl, #0x10
	add sl, ip, #0x10
	cmp r4, sl
	bge _ovl_b_030041EC
	ldr sb, _ovl_b_03004370
	mov lr, #0x6000000
	ldr r5, [sb, #0x14]
	add r0, lr, #0x8100
	str r5, [sp, #0xc]
	str r0, [sp, #4]
_ovl_b_0300415C:
	ldr r7, [sp, #0xc]
	ldrh r6, [r7]
	asr r0, r4, #1
	cmp r0, r6
	blt _ovl_b_03004184
	ldr r8, [sb, #0x14]
	ldrh r3, [r8]
_ovl_b_03004178:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_b_03004178
_ovl_b_03004184:
	ldr r1, [sp, #4]
	and r2, r4, #0xf
	ldr r5, [sb, #0x14]
	ldr r8, _ovl_b_03004374
	lsl lr, r2, #1
	mov ip, #0
	add r7, r1, #0x40
	and r6, r4, #1
_ovl_b_030041A4:
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
	strh r1, [lr, r7]
	add lr, lr, #0x20
	ble _ovl_b_030041A4
	add r4, r4, #1
	cmp r4, sl
	blt _ovl_b_0300415C
_ovl_b_030041EC:
	ldr ip, _ovl_b_03004370
	ldr r0, [sp, #0x18]
	str r0, [ip, #0x24]
_ovl_b_030041F8:
	add sp, sp, #0x20
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
_ovl_b_03004204:
	ldr r1, [sp, #0x18]
	rsb sl, r3, r1
	cmp r1, sl
	mov r4, r1
	bge _ovl_b_030041EC
	mov r5, #0x6000000
	add lr, r5, #0x8100
	str ip, [sp, #0x10]
	str lr, [sp]
	mov sb, r0
_ovl_b_0300422C:
	ldr r7, [sp, #0x10]
	ldrh r6, [r7]
	asr r0, r4, #1
	cmp r0, r6
	blt _ovl_b_03004254
	ldr r8, [sb, #0x14]
	ldrh r3, [r8]
_ovl_b_03004248:
	rsb r0, r3, r0
	cmp r0, r3
	bge _ovl_b_03004248
_ovl_b_03004254:
	ldr r3, [sp]
	and r2, r4, #0xf
	ldr r5, [sb, #0x14]
	ldr r8, _ovl_b_03004374
	lsl lr, r2, #1
	mov ip, #0
	add r7, r3, #0x40
	and r6, r4, #1
_ovl_b_03004274:
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
	strh r1, [lr, r7]
	add lr, lr, #0x20
	ble _ovl_b_03004274
	add r4, r4, #1
	cmp r4, sl
	blt _ovl_b_0300422C
	b _ovl_b_030041EC
_ovl_b_030042C0:
	ldr r4, [sp, #0x1c]
	rsb r3, r3, r4
	cmp r4, r3
	bge _ovl_b_030040D4
	str r3, [sp, #8]
	mov sl, ip
	mov sb, lr
_ovl_b_030042DC:
	ldrh r0, [sb]
	asr lr, r4, #1
	cmp lr, r0
	blt _ovl_b_03004300
	ldr r0, [sl, #0x10]
	ldrh r3, [r0]
_ovl_b_030042F4:
	rsb lr, r3, lr
	cmp lr, r3
	bge _ovl_b_030042F4
_ovl_b_03004300:
	and r2, r4, #0xf
	mov r1, #0x6000000
	ldr r5, [sl, #0x10]
	ldr r8, _ovl_b_03004374
	lsl r0, r2, #1
	mov ip, #0
	add r7, r1, #0x8000
	and r6, r4, #1
_ovl_b_03004320:
	ldrh r1, [r5]
	asr r3, ip, #2
	mla r2, r3, r1, lr
	add r3, r5, r2, lsl #1
	ldrh r1, [r3, #4]
	and r3, ip, #3
	add r2, r3, r1, lsl #2
	add r1, r6, r2, lsl #1
	lsl r2, r1, #1
	ldrh r1, [r2, r8]
	add ip, ip, #1
	cmp ip, #9
	strh r1, [r0, r7]
	add r0, r0, #0x20
	ble _ovl_b_03004320
	ldr ip, [sp, #8]
	add r4, r4, #1
	cmp r4, ip
	blt _ovl_b_030042DC
	b _ovl_b_030040D4
_ovl_b_03004370:
	.4byte 0x02004320
_ovl_b_03004374:
	.4byte gGroundBlocks

	.global ovl_b_render
	.type ovl_b_render, %function
ovl_b_render: @ 03004378
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	ldr r0, _ovl_b_03004D7C
	sub fp, ip, #4
	sub sp, sp, #0x68
	ldr ip, [r0]
	ldr r2, [ip, #0x24]
	ldrsh r4, [ip, #0x54]
	ldrsh r5, [ip, #0x56]
	str r2, [fp, #-0x68]
	ldr lr, [ip, #0x28]
	str lr, [fp, #-0x6c]
	ldr r3, [ip, #0x2c]
	mov r0, r4
	str r3, [fp, #-0x70]
	bl sin_fx
	mov sb, r0
	lsl r6, sb, #0x10
	asr r1, r6, #0x10
	mov r0, r4
	str r1, [fp, #-0x58]
	bl cos_fx
	mov r2, r0
	lsl lr, r2, #0x10
	asr ip, lr, #0x10
	mov r0, r5
	str ip, [fp, #-0x5c]
	bl sin_fx
	mov sb, r0
	lsl r6, sb, #0x10
	asr r1, r6, #0x10
	mov r0, r5
	str r1, [fp, #-0x60]
	bl cos_fx
	lsl r2, r0, #0x10
	asr r1, r2, #0x10
	cmn r4, #0x4000
	str r1, [fp, #-0x64]
	bgt _ovl_b_03004D3C
	mov r6, #0x80000000
	mvn sb, #0x4f
	asr r1, r6, #0x13
	mov r4, #0
	str sb, [fp, #-0x54]
	str r1, [fp, #-0x58]
	str r4, [fp, #-0x5c]
_ovl_b_03004430:
	rsb sb, r5, #0
	lsl r2, sb, #0x10
	lsr r1, r2, #0x16
	ldr r6, _ovl_b_03004D80
	str r1, [fp, #-0x44]
	ldr r2, [fp, #-0x54]
	ldr r4, [r6, #0x1c]
	ldr ip, [r6, #0x18]
	mov sb, r1
	ldr r3, [fp, #-0x58]
	add lr, r1, sb, lsl #1
	cmn r2, #0x50
	add r0, r4, lr, lsr #2
	add r6, r2, r3, asr #7
	add lr, sb, ip
	mvnlt r3, #0x4f
	str r0, [fp, #-0x48]
	str lr, [fp, #-0x44]
	mov sb, r2
	str r6, [fp, #-0x4c]
	strlt r3, [fp, #-0x54]
	blt _ovl_b_03004498
	ldr ip, [fp, #-0x54]
	cmp ip, #0x50
	movge ip, #0x50
	str ip, [fp, #-0x54]
_ovl_b_03004498:
	mov r0, #0xa00
	ldr r4, _ovl_b_03004D84
	mov r2, #0x2c40
	add r3, r0, #0xa
	mov r6, #0x9f
_ovl_b_030044AC:
	subs r6, r6, #1
	strh r2, [r4, #4]
	strh r3, [r4, #6]
	add r4, r4, #0x20
	bpl _ovl_b_030044AC
	ldr r3, [fp, #-0x54]
	cmp r3, #0x4f
	bgt _ovl_b_030047D4
	rsb sl, r3, #0xff000000
	add r8, sl, #0xff0000
	add r7, r8, #0xff00
	add r5, r7, #0xd0
	cmp r5, #0xa0
	movge r5, #0xa0
	cmp r5, #0
	movlt r5, #0
	cmn r3, #0x30
	mov r8, #0x80
	rsbgt r8, r3, #0x50
	add r3, r5, r8
	cmp r3, #0xa0
	rsbgt r8, r5, #0xa0
	addgt r3, r5, r8
	cmp r5, #0
	rsb r7, r3, #0xa0
	ldr sl, _ovl_b_03004D88
	ble _ovl_b_03004550
	ldr r6, _ovl_b_03004D80
	ldr r4, _ovl_b_03004D8C
	ldr r1, [r6, #4]
	ldrh r0, [r1]
	ldr r1, [r4]
	bl color_fade
	cmp r5, #0
	lsl lr, r0, #0x10
	asr r0, lr, #0x10
	ble _ovl_b_03004550
	mov r6, r5
_ovl_b_03004544:
	subs r6, r6, #1
	strh r0, [sl], #2
	bne _ovl_b_03004544
_ovl_b_03004550:
	cmp r8, #0
	ble _ovl_b_0300459C
	ldr r5, [fp, #-0x54]
	adds r3, r5, #0x30
	movmi r3, #0
	cmp r8, #0
	ble _ovl_b_0300459C
	ldr r5, _ovl_b_03004D8C
	lsl r4, r3, #1
	mov r6, r8
_ovl_b_03004578:
	ldr r3, _ovl_b_03004D80
	ldr r2, [r3, #4]
	ldr r1, [r5]
	ldrh r0, [r4, r2]
	bl color_fade
	subs r6, r6, #1
	strh r0, [sl], #2
	add r4, r4, #2
	bne _ovl_b_03004578
_ovl_b_0300459C:
	cmp r7, #0
	ble _ovl_b_030045DC
	ldr r0, _ovl_b_03004D80
	ldr r8, _ovl_b_03004D8C
	ldr lr, [r0]
	ldr r1, [r8]
	ldrh r0, [lr]
	bl color_fade
	cmp r7, #0
	lsl ip, r0, #0x10
	asr r0, ip, #0x10
	ble _ovl_b_030045DC
	mov r6, r7
_ovl_b_030045D0:
	subs r6, r6, #1
	strh r0, [sl], #2
	bne _ovl_b_030045D0
_ovl_b_030045DC:
	ldr r7, [fp, #-0x54]
	rsb r5, r7, #0x50
	cmp r5, #0xa0
	movge r5, #0xa0
	mov r6, #0
	cmp r6, r5
	ldr r4, _ovl_b_03004D84
	bge _ovl_b_0300464C
	mov r1, r6
	ldr r8, [fp, #-0x44]
	mov r6, r5
	ldr r5, [fp, #-0x48]
	mov r2, #0x7000
	add r3, r2, #0x88
	lsl ip, r8, #8
	mov r2, #0x100
	lsl r0, r5, #8
_ovl_b_03004620:
	subs r6, r6, #1
	strh r3, [r4]
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
	str ip, [r4, #0xc]
	strh r3, [r4, #2]
	strh r2, [r4, #0x14]
	strh r1, [r4, #0x16]
	str r0, [r4, #0x18]
	add r4, r4, #0x20
	bne _ovl_b_03004620
_ovl_b_0300464C:
	ldr r4, [fp, #-0x54]
	rsb r5, sb, #0
	cmp r5, #0xa0
	movge r5, #0xa0
	mov r8, #0x50
	cmp sb, #0
	rsbgt r8, sb, r8
	subs r7, sb, r4
	addmi r8, r8, r7
	add r6, r5, r8
	movmi r7, #0
	add r1, r6, r7
	cmp r1, #0xa0
	mov r6, #0
	rsbgt r8, r5, #0xa0
	movgt r7, #0
	cmp sb, r6
	movge r3, sb
	movlt r3, r6
	cmp r6, r5
	ldr r4, _ovl_b_03004D84
	bge _ovl_b_030046BC
	mov r2, r6
	mov r6, r5
_ovl_b_030046AC:
	subs r6, r6, #1
	str r2, [r4, #0x10]
	add r4, r4, #0x20
	bne _ovl_b_030046AC
_ovl_b_030046BC:
	cmp r8, #0
	ble _ovl_b_030046E0
	lsl r3, r3, #8
	mov r6, r8
_ovl_b_030046CC:
	subs r6, r6, #1
	str r3, [r4, #0x10]
	add r4, r4, #0x20
	add r3, r3, #0x100
	bne _ovl_b_030046CC
_ovl_b_030046E0:
	cmp r7, #0
	ble _ovl_b_03004700
	mov r6, r7
	mov r3, #0x4f00
_ovl_b_030046F0:
	subs r6, r6, #1
	str r3, [r4, #0x10]
	add r4, r4, #0x20
	bne _ovl_b_030046F0
_ovl_b_03004700:
	ldr r1, [fp, #-0x4c]
	ldr r3, [fp, #-0x4c]
	rsb r5, r1, #0
	ldr ip, [fp, #-0x54]
	cmp r5, #0xa0
	movge r5, #0xa0
	mov r8, #0x50
	cmp r1, #0
	rsbgt r8, r1, r8
	subs r7, r3, ip
	addmi r8, r8, r7
	add r0, r5, r8
	movmi r7, #0
	add lr, r0, r7
	ldr r3, [fp, #-0x4c]
	cmp lr, #0xa0
	mov r6, #0
	rsbgt r8, r5, #0xa0
	movgt r7, #0
	cmp r3, r6
	movlt r3, r6
	cmp r6, r5
	ldr r4, _ovl_b_03004D84
	bge _ovl_b_03004778
	mov r2, r6
	mov r6, r5
_ovl_b_03004768:
	subs r6, r6, #1
	str r2, [r4, #0x1c]
	add r4, r4, #0x20
	bne _ovl_b_03004768
_ovl_b_03004778:
	cmp r8, #0
	ble _ovl_b_030047A0
	lsl r2, r3, #8
	add r3, r2, #0x5000
	mov r6, r8
_ovl_b_0300478C:
	subs r6, r6, #1
	str r3, [r4, #0x1c]
	add r4, r4, #0x20
	add r3, r3, #0x100
	bne _ovl_b_0300478C
_ovl_b_030047A0:
	cmp r7, #0
	ble _ovl_b_030047C0
	mov r6, r7
	mov r3, #0x9f00
_ovl_b_030047B0:
	subs r6, r6, #1
	str r3, [r4, #0x1c]
	add r4, r4, #0x20
	bne _ovl_b_030047B0
_ovl_b_030047C0:
	ldr r1, [fp, #-0x44]
	ldr ip, [fp, #-0x48]
	lsr r0, r1, #4
	lsr r1, ip, #4
	bl ovl_b_stream_map
_ovl_b_030047D4:
	ldr r3, [fp, #-0x54]
	cmn r3, #0x50
	ble _ovl_b_03004CD8
	sub r4, fp, #0x5c
	ldm r4, {r4, r5}
	ldr r8, [fp, #-0x6c]
	ldr r6, [fp, #-0x6c]
	mul r8, r4, r8
	mul r6, r5, r6
	lsl r7, r4, #1
	lsl sl, r5, #1
	add sb, r7, r4
	rsb r3, r4, sb, lsl #3
	add r1, sl, r5
	rsb ip, r5, r1, lsl #3
	add r2, r3, r3, lsl #2
	add r0, ip, ip, lsl #2
	lsl lr, r2, #3
	add sb, lr, r6, asr #8
	sub r5, r8, r0, lsl #11
	eor r1, sb, sb, asr #31
	sub r1, r1, sb, asr #31
	eor r0, r5, r5, asr #31
	sub r0, r0, r5, asr #31
	bl udiv
	teq r5, sb
	rsbmi r0, r0, #0
	ldr r3, [fp, #-0x54]
	mvn sb, r0
	cmp sb, r3
	movgt sb, r3
	bgt _ovl_b_0300485C
	cmn sb, #0x51
	mvnle sb, #0x4f
_ovl_b_0300485C:
	ldr r5, [fp, #-0x5c]
	ldr r3, [fp, #-0x58]
	add r1, r7, r5
	add r2, r5, r1, lsl #2
	add ip, sl, r3
	add r0, r3, ip, lsl #2
	lsl lr, r2, #5
	add sl, lr, r6, asr #8
	sub r7, r8, r0, lsl #13
	eor r0, r7, r7, asr #31
	sub r0, r0, r7, asr #31
	eor r1, sl, sl, asr #31
	sub r1, r1, sl, asr #31
	bl udiv
	teq r7, sl
	rsbmi r0, r0, #0
	mvn r4, r0
	cmp r4, sb
	str r4, [fp, #-0x50]
	strgt sb, [fp, #-0x50]
	bgt _ovl_b_030048C0
	ldr sl, [fp, #-0x50]
	cmn sl, #0x51
	mvnle sl, #0x4f
	str sl, [fp, #-0x50]
_ovl_b_030048C0:
	ldr r4, [fp, #-0x64]
	ldr r3, [fp, #-0x60]
	ldr r7, [fp, #-0x6c]
	ldr lr, [fp, #-0x6c]
	mul r7, r4, r7
	mul lr, r3, lr
	sub r5, fp, #0x5c
	ldm r5, {r5, ip}
	rsb r2, r7, #0
	asr sl, lr, #8
	rsb r7, r5, #0
	asr r0, r2, #8
	str sl, [fp, #-0x38]
	mul sl, ip, sl
	str r0, [fp, #-0x34]
	mul r0, ip, r0
	asr ip, r7, #4
	str ip, [fp, #-0x40]
	mul ip, sb, ip
	asr r1, sl, #0xc
	str r1, [fp, #-0x2c]
	asr r2, r6, #0xc
	rsb r4, r0, #0
	str ip, [fp, #-0x7c]
	ldr r0, [fp, #-0x5c]
	ldr ip, [fp, #-0x38]
	ldr r1, [fp, #-0x2c]
	mov sl, r2
	asr lr, r4, #0xc
	mul ip, r0, ip
	mul sl, sb, sl
	ldr r6, [fp, #-0x5c]
	str r7, [fp, #-0x74]
	mul r1, sb, r1
	ldr r7, [fp, #-0x34]
	mov r4, lr
	mul r7, r6, r7
	mul r4, sb, r4
	ldr r5, [fp, #-0x58]
	lsl r3, r5, #4
	ldr r6, [fp, #-0x54]
	str r3, [fp, #-0x78]
	add r5, sl, r8, asr #4
	str r2, [fp, #-0x3c]
	add sl, r1, ip, asr #4
	sub r2, fp, #0x7c
	ldm r2, {r2, ip}
	ldr r0, _ovl_b_03004D90
	str lr, [fp, #-0x30]
	cmp r6, sb
	lsl lr, r6, #5
	sub r8, r4, r7, asr #4
	str lr, [fp, #-0x80]
	add r7, ip, r2
	rsb r4, lr, r0
	ble _ovl_b_030049C4
	mov r1, #0x2040
	add r3, r1, #0xc
	mov r2, #0x1000
_ovl_b_030049AC:
	sub r6, r6, #1
	cmp r6, sb
	strh r3, [r4, #4]
	strh r2, [r4, #6]
	add r4, r4, #0x20
	bgt _ovl_b_030049AC
_ovl_b_030049C4:
	ldr r0, [fp, #-0x50]
	mov r6, sb
	cmp r6, r0
	ble _ovl_b_03004A54
	mov r3, #0x2040
	add r2, r3, #0xc
	ldr lr, _ovl_b_03004D94
	str r2, [fp, #-0x84]
_ovl_b_030049E4:
	bic r1, r7, #3
	ldr r2, [lr, r1]
	and ip, r7, #3
	rsb r3, ip, #4
	mul r0, r3, r2
	add r3, r1, #4
	ldr r2, [lr, r3]
	mla r3, ip, r2, r0
	smull r0, r2, r5, r3
	asr ip, r2, #4
	sub r2, ip, #0x1a0
	asrs r1, r2, #5
	rsb r0, r1, #0x10
	ldr ip, [fp, #-0x84]
	orr r3, r0, r1, lsl #8
	movmi r1, #0x10
	strhpl r3, [r4, #6]
	strhmi r1, [r4, #6]
	strh ip, [r4, #4]
	ldr ip, [fp, #-0x50]
	sub r6, r6, #1
	ldr r2, [fp, #-0x40]
	ldr r0, [fp, #-0x3c]
	cmp r6, ip
	add r4, r4, #0x20
	rsb r7, r2, r7
	rsb r5, r0, r5
	bgt _ovl_b_030049E4
_ovl_b_03004A54:
	ldr r4, [fp, #-0x7c]
	mov r6, sb
	ldr r3, [fp, #-0x78]
	ldr lr, _ovl_b_03004D90
	cmn r6, #0x50
	add r7, r3, r4
	sub r4, lr, sb, lsl #5
	ble _ovl_b_03004B1C
	mvn r0, #0x1740
	sub r1, r0, #0x37
	ldr r5, _ovl_b_03004D94
	str r1, [fp, #-0x88]
_ovl_b_03004A84:
	ldr ip, [fp, #-0x88]
	strh ip, [r4]
	bic r0, r7, #3
	ldr r2, [r5, r0]
	and ip, r7, #3
	rsb r1, ip, #4
	mul lr, r1, r2
	add r1, r0, #4
	ldr r0, [r5, r1]
	ldr r3, [fp, #-0x34]
	mla r1, ip, r0, lr
	smull r2, ip, r3, r1
	ldr r0, [fp, #-0x38]
	smull r3, lr, r0, r1
	smull r2, r0, r8, r1
	smull r2, r3, sl, r1
	rsb r2, ip, ip, lsl #4
	sub r3, r3, r2, lsl #3
	ldr r2, [fp, #-0x68]
	rsb r1, lr, lr, lsl #4
	add r3, r3, r2
	ldr r2, [fp, #-0x70]
	sub r0, r0, r1, lsl #3
	add r1, r0, r2
	str r3, [r4, #0xc]
	str r1, [r4, #0x10]
	strh ip, [r4, #8]
	strh lr, [r4, #0xa]
	sub r6, r6, #1
	ldr lr, [fp, #-0x40]
	ldr r2, [fp, #-0x2c]
	ldr ip, [fp, #-0x30]
	cmn r6, #0x50
	rsb r7, lr, r7
	add r4, r4, #0x20
	rsb sl, r2, sl
	rsb r8, ip, r8
	bgt _ovl_b_03004A84
_ovl_b_03004B1C:
	ldr r2, _ovl_b_03004D7C
	ldr r1, [r2]
	ldr r4, [r1, #0x28]
	ldr r3, [fp, #-0x60]
	add ip, r4, #0x2000
	mov sl, ip
	mul sl, r3, sl
	ldr r7, [fp, #-0x64]
	mov lr, ip
	mul lr, r7, lr
	asr r0, sl, #8
	str r0, [fp, #-0x38]
	ldr r4, [fp, #-0x38]
	ldr r2, [fp, #-0x58]
	rsb r6, lr, #0
	ldr r8, [fp, #-0x58]
	asr r1, r6, #8
	mul r4, r2, r4
	str r1, [fp, #-0x34]
	mul r1, r8, r1
	asr r7, r4, #0xc
	rsb ip, r1, #0
	str r7, [fp, #-0x2c]
	asr lr, ip, #0xc
	ldr r6, [fp, #-0x5c]
	sub r0, fp, #0x38
	ldm r0, {r0, r4}
	ldr r8, [fp, #-0x2c]
	mov r1, lr
	mul r4, r6, r4
	mul r0, r6, r0
	mul r8, sb, r8
	mul r1, sb, r1
	ldr sl, [fp, #-0x74]
	ldr r7, [fp, #-0x80]
	ldr r3, _ovl_b_03004D90
	str lr, [fp, #-0x30]
	sub r6, fp, #0x54
	ldm r6, {r6, lr}
	asr ip, sl, #4
	add sl, r8, r0, asr #4
	sub r8, r1, r4, asr #4
	rsb r4, r7, r3
	ldr r7, [fp, #-0x78]
	cmp r6, lr
	str ip, [fp, #-0x40]
	mla r7, ip, sb, r7
	ble _ovl_b_03004C14
	mov r0, #0x7000
	add r2, r0, #0x88
	mov r1, #0x100
	mov r3, #0
_ovl_b_03004BEC:
	ldr r0, [fp, #-0x50]
	sub r6, r6, #1
	cmp r6, r0
	strh r2, [r4, #2]
	strh r1, [r4, #0x14]
	strh r3, [r4, #0x16]
	str r3, [r4, #0x18]
	str r3, [r4, #0x1c]
	add r4, r4, #0x20
	bgt _ovl_b_03004BEC
_ovl_b_03004C14:
	ldr r6, [fp, #-0x50]
	cmn r6, #0x50
	ble _ovl_b_03004CD8
	ldr r1, [fp, #-0x68]
	ldr lr, [fp, #-0x70]
	asr ip, r1, #2
	asr sb, lr, #2
	mvn r3, #0x1f40
	ldr r5, _ovl_b_03004D94
	str ip, [fp, #-0x8c]
	str sb, [fp, #-0x90]
	sub sb, r3, #0x33
_ovl_b_03004C44:
	strh sb, [r4, #2]
	bic r0, r7, #3
	ldr r2, [r5, r0]
	and ip, r7, #3
	rsb r1, ip, #4
	mul lr, r1, r2
	add r3, r0, #4
	ldr r0, [r5, r3]
	mla r1, ip, r0, lr
	ldr lr, [fp, #-0x34]
	smull r2, ip, lr, r1
	ldr r2, [fp, #-0x38]
	smull r3, lr, r2, r1
	smull r2, r0, r8, r1
	smull r2, r3, sl, r1
	rsb r2, ip, ip, lsl #4
	sub r3, r3, r2, lsl #3
	ldr r2, [fp, #-0x8c]
	rsb r1, lr, lr, lsl #4
	add r3, r3, r2
	ldr r2, [fp, #-0x90]
	sub r0, r0, r1, lsl #3
	add r1, r0, r2
	str r3, [r4, #0x18]
	str r1, [r4, #0x1c]
	strh ip, [r4, #0x14]
	strh lr, [r4, #0x16]
	sub r6, r6, #1
	ldr r0, [fp, #-0x40]
	ldr r2, [fp, #-0x2c]
	ldr lr, [fp, #-0x30]
	cmn r6, #0x50
	rsb r7, r0, r7
	add r4, r4, #0x20
	rsb sl, r2, sl
	rsb r8, lr, r8
	bgt _ovl_b_03004C44
_ovl_b_03004CD8:
	ldr r0, _ovl_b_03004D98
	ldr ip, [r0]
	tst ip, #4
	beq _ovl_b_03004D34
	ldr r6, _ovl_b_03004D9C
	mov r2, #0x2c40
	add r3, r2, #0xc
	mov r4, #0
	strh r4, [r6, #6]
	strh r3, [r6, #4]
	add r4, r6, #0x20
	mov r2, #0xb
	mov r6, #0x1f
_ovl_b_03004D0C:
	subs r6, r6, #1
	strh r3, [r4, #4]
	strh r2, [r4, #6]
	add r4, r4, #0x20
	bpl _ovl_b_03004D0C
	mov ip, #0x2c40
	add r1, ip, #0xc
	mov r3, #0
	strh r1, [r4, #4]
	strh r3, [r4, #6]
_ovl_b_03004D34:
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_ovl_b_03004D3C:
	cmp r4, #0x4000
	blt _ovl_b_03004D60
	mov lr, #0x50
	mov r3, #0x1000
	mov ip, #0
	str lr, [fp, #-0x54]
	str r3, [fp, #-0x58]
	str ip, [fp, #-0x5c]
	b _ovl_b_03004430
_ovl_b_03004D60:
	mov r0, r4
	bl tan_fx
	lsl r1, r0, #0x10
	asr r4, r1, #0x10
	sub r2, r4, #2
	str r2, [fp, #-0x54]
	b _ovl_b_03004430
_ovl_b_03004D7C:
	.4byte 0x0200436C
_ovl_b_03004D80:
	.4byte 0x02004320
_ovl_b_03004D84:
	.4byte 0x02001C20
_ovl_b_03004D88:
	.4byte 0x02023FA4
_ovl_b_03004D8C:
	.4byte gBrightness
_ovl_b_03004D90:
	.4byte 0x02002620
_ovl_b_03004D94:
	.4byte gUnk_0803F49C
_ovl_b_03004D98:
	.4byte gModeFlags
_ovl_b_03004D9C:
	.4byte 0x02002B60

	.global ovl_b_hblank
	.type ovl_b_hblank, %function
ovl_b_hblank: @ 03004DA0
	str lr, [sp, #-4]!
	mov ip, #0x4000000
	ldrh r0, [ip, #6]
	ldr r1, _ovl_b_03004E34
	add r3, r0, #1
	lsl r2, r3, #5
	cmp r3, #0x9f
	add r0, r2, r1
	lsl lr, r3, #1
	ldmgt sp!, {lr}
	bxgt lr
	ldr r3, [r2, r1]
	ldrh r1, [r0, #8]
	str r3, [ip, #0xc]
	strh r1, [ip, #0x20]
	ldr r2, [r0, #0xc]
	ldrh r1, [r0, #0xa]
	strh r1, [ip, #0x24]
	str r2, [ip, #0x28]
	ldrh r1, [r0, #0x14]
	ldr r2, [r0, #0x10]
	str r2, [ip, #0x2c]
	strh r1, [ip, #0x30]
	ldr r2, [r0, #0x18]
	ldrh r1, [r0, #0x16]
	strh r1, [ip, #0x34]
	str r2, [ip, #0x38]
	ldr r1, [r0, #0x1c]
	ldr r3, _ovl_b_03004E38
	str r1, [ip, #0x3c]
	ldrh r1, [r3, lr]
	ldr r2, [r0, #4]
	mov r0, #0x5000000
	str r2, [ip, #0x50]
	strh r1, [r0]
	ldm sp!, {lr}
	bx lr
_ovl_b_03004E34:
	.4byte 0x02001C20
_ovl_b_03004E38:
	.4byte 0x02023FA4
