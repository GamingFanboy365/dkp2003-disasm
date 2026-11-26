@ asm/arm_rom.s: ROM 0x03C5C4-0x03EC00 (rom, VMA 0x0803C5C4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.arm

	.global sub_0803C5C4
	.type sub_0803C5C4, %function
sub_0803C5C4: @ 0803C5C4
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr ip, _0803CB18
	ldr r3, [ip, #0x34]
	sub sp, sp, #0x24
	cmp r0, r3
	str r0, [sp, #0x20]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x18]
	beq _0803C6E0
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
	blt _0803CA68
	ldr r0, [sp, #0x20]
	rsb sl, r3, r0
	add lr, sl, #0x1f
	add sl, r0, #0x1f
	cmp lr, sl
	bge _0803C6D4
	ldr sb, _0803CB18
	ldr r4, [sb, #0xc]
	str r4, [sp, #0x14]
_0803C644:
	ldr r7, [sp, #0x14]
	ldrh r5, [r7]
	asr r0, lr, #2
	cmp r0, r5
	blt _0803C66C
	ldr r8, [sb, #0xc]
	ldrh r3, [r8]
_0803C660:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803C660
_0803C66C:
	mov r6, #0x6000000
	and r1, lr, #0x1f
	ldr r5, [sb, #0xc]
	ldr r8, _0803CB1C
	add r7, r6, #0x180
	lsl r4, r1, #1
	mov ip, #0
	and r6, lr, #3
_0803C68C:
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
	ble _0803C68C
	add lr, lr, #1
	cmp lr, sl
	blt _0803C644
_0803C6D4:
	ldr ip, _0803CB18
	ldr r0, [sp, #0x20]
	str r0, [ip, #0x34]
_0803C6E0:
	ldr r0, _0803CB18
	ldr r1, [sp, #0x18]
	ldr r3, [r0, #0x3c]
	cmp r1, r3
	beq _0803C7F0
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
	blt _0803C9B8
	ldr r1, [sp, #0x18]
	rsb sl, r3, r1
	add lr, sl, #0x1f
	add sl, r1, #0x1f
	cmp lr, sl
	bge _0803C7E4
	ldr sb, _0803CB18
	ldr r8, [sb, #0x10]
	str r8, [sp, #0x10]
_0803C754:
	ldr r0, [sp, #0x10]
	ldrh r4, [r0]
	asr r0, lr, #2
	cmp r0, r4
	blt _0803C77C
	ldr r5, [sb, #0x10]
	ldrh r3, [r5]
_0803C770:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803C770
_0803C77C:
	and r7, lr, #0x1f
	mov r6, #0x6000000
	ldr r5, [sb, #0x10]
	ldr r8, _0803CB1C
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x400
	and r6, lr, #3
_0803C79C:
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
	ble _0803C79C
	add lr, lr, #1
	cmp lr, sl
	blt _0803C754
_0803C7E4:
	ldr ip, _0803CB18
	ldr r1, [sp, #0x18]
	str r1, [ip, #0x3c]
_0803C7F0:
	ldr r0, _0803CB18
	ldr r1, [sp, #0x1c]
	ldr r3, [r0, #0x38]
	cmp r1, r3
	beq _0803C8FC
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
	blt _0803C908
	ldr r0, [sp, #0x1c]
	rsb sl, r3, r0
	add lr, sl, #0x10
	add sl, r0, #0x10
	cmp lr, sl
	bge _0803C8F0
	ldr sb, _0803CB18
	ldr ip, [sb, #0x14]
	str ip, [sp, #8]
_0803C860:
	ldr r4, [sp, #8]
	ldrh r8, [r4]
	asr r0, lr, #1
	cmp r0, r8
	blt _0803C888
	ldr r5, [sb, #0x14]
	ldrh r3, [r5]
_0803C87C:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803C87C
_0803C888:
	and r7, lr, #0xf
	mov r6, #0x6000000
	ldr r5, [sb, #0x14]
	ldr r8, _0803CB20
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x40
	and r6, lr, #1
_0803C8A8:
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
	ble _0803C8A8
	add lr, lr, #1
	cmp lr, sl
	blt _0803C860
_0803C8F0:
	ldr r0, _0803CB18
	ldr ip, [sp, #0x1c]
	str ip, [r0, #0x38]
_0803C8FC:
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
_0803C908:
	ldr r1, [sp, #0x1c]
	rsb sl, r3, r1
	cmp r1, sl
	mov lr, r1
	bge _0803C8F0
	str ip, [sp, #0xc]
	mov sb, r0
_0803C924:
	ldr r4, [sp, #0xc]
	ldrh r8, [r4]
	asr r0, lr, #1
	cmp r0, r8
	blt _0803C94C
	ldr r5, [sb, #0x14]
	ldrh r3, [r5]
_0803C940:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803C940
_0803C94C:
	and r7, lr, #0xf
	mov r6, #0x6000000
	ldr r5, [sb, #0x14]
	ldr r8, _0803CB20
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x40
	and r6, lr, #1
_0803C96C:
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
	ble _0803C96C
	add lr, lr, #1
	cmp lr, sl
	blt _0803C924
	b _0803C8F0
_0803C9B8:
	ldr lr, [sp, #0x18]
	rsb r3, r3, lr
	cmp lr, r3
	bge _0803C7E4
	str r3, [sp, #4]
	mov sl, r0
	mov sb, ip
_0803C9D4:
	ldrh r4, [sb]
	asr r0, lr, #2
	cmp r0, r4
	blt _0803C9F8
	ldr r5, [sl, #0x10]
	ldrh r3, [r5]
_0803C9EC:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803C9EC
_0803C9F8:
	and r7, lr, #0x1f
	mov r6, #0x6000000
	ldr r5, [sl, #0x10]
	ldr r8, _0803CB1C
	lsl r4, r7, #1
	mov ip, #0
	add r7, r6, #0x400
	and r6, lr, #3
_0803CA18:
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
	ble _0803CA18
	ldr ip, [sp, #4]
	add lr, lr, #1
	cmp lr, ip
	blt _0803C9D4
	b _0803C7E4
_0803CA68:
	ldr lr, [sp, #0x20]
	rsb r3, r3, lr
	cmp lr, r3
	bge _0803C6D4
	str r3, [sp]
	mov sl, ip
	mov sb, r4
_0803CA84:
	ldrh r1, [sb]
	asr r0, lr, #2
	cmp r0, r1
	blt _0803CAA8
	ldr r1, [sl, #0xc]
	ldrh r3, [r1]
_0803CA9C:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803CA9C
_0803CAA8:
	and r6, lr, #0x1f
	mov r2, #0x6000000
	ldr r5, [sl, #0xc]
	ldr r8, _0803CB1C
	lsl r4, r6, #1
	mov ip, #0
	add r7, r2, #0x180
	and r6, lr, #3
_0803CAC8:
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
	ble _0803CAC8
	ldr ip, [sp]
	add lr, lr, #1
	cmp lr, ip
	blt _0803CA84
	b _0803C6D4
_0803CB18:
	.4byte 0x020042A4
_0803CB1C:
	.4byte 0x081108A0
_0803CB20:
	.4byte 0x081136E0

	.global sub_0803CB24
	.type sub_0803CB24, %function
sub_0803CB24: @ 0803CB24
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
	ldr ip, _0803CC5C
	bge _0803CBBC
	ldr r0, _0803CC60
	mov r7, lr
	ldrh r2, [r0, #0x20]
	mov lr, r4
	mov r0, #0x100
	lsl r3, r6, #8
	mov r4, #0x1000
_0803CB9C:
	subs lr, lr, #1
	strh r2, [ip, #4]
	strh r0, [ip, #0x10]
	strh r7, [ip, #0x12]
	str r3, [ip, #0x14]
	str r4, [ip, #0x18]
	add ip, ip, #0x20
	bne _0803CB9C
_0803CBBC:
	mov lr, #0
	cmp lr, r1
	bge _0803CC0C
	ldr r7, _0803CC60
	lsl r2, r8, #8
	ldrh r4, [r7, #0x20]
	add r0, r2, #0x1000
	mov r7, lr
	mov r2, #0x100
	mov lr, r1
	lsl r3, r6, #8
_0803CBE8:
	subs lr, lr, #1
	str r0, [ip, #0x18]
	strh r4, [ip, #4]
	strh r2, [ip, #0x10]
	strh r7, [ip, #0x12]
	str r3, [ip, #0x14]
	add r0, r0, #0x100
	add ip, ip, #0x20
	bne _0803CBE8
_0803CC0C:
	mov lr, #0
	cmp lr, r5
	bge _0803CC54
	ldr r1, _0803CC60
	mov r4, lr
	ldrh r3, [r1, #0x20]
	mov lr, r5
	lsl r1, r6, #8
	mov r0, #0x100
	mov r2, #0x5f00
_0803CC34:
	subs lr, lr, #1
	strh r3, [ip, #4]
	strh r0, [ip, #0x10]
	strh r4, [ip, #0x12]
	str r1, [ip, #0x14]
	str r2, [ip, #0x18]
	add ip, ip, #0x20
	bne _0803CC34
_0803CC54:
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
_0803CC5C:
	.4byte 0x02000820
_0803CC60:
	.4byte 0x020042A4

	.global sub_0803CC64
	.type sub_0803CC64, %function
sub_0803CC64: @ 0803CC64
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	sub fp, ip, #4
	sub sp, sp, #0x8c
	ldr r5, _0803DB70
	mov lr, pc
	bx r5
	ldr r2, _0803DB74
	ldr r7, [r2]
	ldr r3, _0803DB78
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
	.4byte 0xEBFFEE9B @ bl #0x8038734
	mov r7, r0
	lsl ip, r7, #0x10
	mov r0, r4
	asr r7, ip, #0x10
	.4byte 0xEBFFEE95 @ bl #0x8038730
	mov sb, r0
	mov r0, r5
	.4byte 0xEBFFEE93 @ bl #0x8038734
	mov r2, r0
	lsl r1, r2, #0x10
	asr lr, r1, #0x10
	mov r0, r5
	str lr, [fp, #-0x6c]
	.4byte 0xEBFFEE8C @ bl #0x8038730
	lsl r8, sb, #0x10
	lsl ip, r0, #0x10
	asr sb, r8, #0x10
	cmn r4, #0x4000
	asr r8, ip, #0x10
	str r8, [fp, #-0x70]
	bgt _0803DB3C
	mov r0, #0x80000000
	mvn r4, #0x4f
	asr r7, r0, #0x13
	mov sb, #0
	str r4, [fp, #-0x68]
_0803CD2C:
	rsb r1, r5, #0
	lsl r4, r1, #0xa
	ldr r2, _0803DB7C
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
	beq _0803CDD4
	cmp r5, #1
	streq r1, [fp, #-0x50]
	streq r0, [fp, #-0x5c]
	strne r3, [fp, #-0x50]
	strne r2, [fp, #-0x5c]
_0803CDD4:
	ldr r2, [fp, #-0x68]
	cmn r2, #0x50
	mvnlt ip, #0x4f
	strlt ip, [fp, #-0x68]
	blt _0803CDF8
	ldr lr, [fp, #-0x68]
	cmp lr, #0x50
	movge lr, #0x50
	str lr, [fp, #-0x68]
_0803CDF8:
	ldr r5, _0803DB80
	mov r3, #0xa00
	ldr r2, _0803DB7C
	mov ip, r5
	mov r8, #0
	mov r0, #0x2740
	add r1, r3, #0xa
_0803CE14:
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
	ble _0803CE14
	ldr r0, [fp, #-0x68]
	cmp r0, #0x4f
	bgt _0803D0DC
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
	ble _0803CEEC
	ldr r0, _0803DB7C
	ldr r2, _0803DB84
	ldr ip, [r0, #4]
	ldr r1, [r2]
	ldrh r0, [ip]
	.4byte 0xEBFFFC7F @ bl #0x803c0c8
	cmp r4, #0
	lsl r1, r0, #0x10
	asr r0, r1, #0x10
	ble _0803CEEC
	mov r8, r4
_0803CEDC:
	subs r8, r8, #1
	strh r0, [r5, #6]
	add r5, r5, #0x20
	bne _0803CEDC
_0803CEEC:
	cmp r6, #0
	ble _0803CF3C
	ldr lr, [fp, #-0x68]
	adds r3, lr, #0x30
	movmi r3, #0
	cmp r6, #0
	ble _0803CF3C
	lsl r4, r3, #1
	mov r8, r6
_0803CF10:
	ldr r3, _0803DB7C
	ldr r2, _0803DB84
	ldr r1, [r3, #4]
	ldrh r0, [r4, r1]
	ldr r1, [r2]
	.4byte 0xEBFFFC67 @ bl #0x803c0c8
	subs r8, r8, #1
	strh r0, [r5, #6]
	add r4, r4, #2
	add r5, r5, #0x20
	bne _0803CF10
_0803CF3C:
	cmp sl, #0
	ble _0803CF80
	ldr r0, _0803DB7C
	ldr lr, _0803DB84
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r1, [lr]
	.4byte 0xEBFFFC5A @ bl #0x803c0c8
	cmp sl, #0
	lsl ip, r0, #0x10
	asr r0, ip, #0x10
	ble _0803CF80
	mov r8, sl
_0803CF70:
	subs r8, r8, #1
	strh r0, [r5, #6]
	add r5, r5, #0x20
	bne _0803CF70
_0803CF80:
	ldr r0, [fp, #-0x5c]
	ldr r1, [fp, #-0x50]
	ldr r2, [fp, #-0x68]
	bl sub_0803CB24
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
	ldr r0, _0803DB88
	rsbgt lr, r1, #0xa0
	movgt ip, #0
	cmp r1, #0
	addgt r0, r0, r1, lsl #5
	cmp lr, #0
	add r2, r2, #0x30
	ble _0803D004
	mov r3, lr
_0803CFF4:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	bne _0803CFF4
_0803D004:
	cmp ip, #0
	ble _0803D028
	sub r2, r2, #1
	mov r3, ip
_0803D014:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	sub r2, r2, #1
	bne _0803D014
_0803D028:
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
	ldr r0, _0803DB8C
	rsbgt lr, r1, #0xa0
	movgt ip, #0
	cmp r1, #0
	addgt r0, r0, r1, lsl #5
	cmp lr, #0
	add r2, r2, #0x80
	ble _0803D09C
	mov r3, lr
_0803D08C:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	bne _0803D08C
_0803D09C:
	cmp ip, #0
	ble _0803D0C0
	sub r2, r2, #1
	mov r3, ip
_0803D0AC:
	subs r3, r3, #1
	strh r2, [r0]
	add r0, r0, #0x20
	sub r2, r2, #1
	bne _0803D0AC
_0803D0C0:
	ldr r2, [fp, #-0x50]
	ldr r3, [fp, #-0x48]
	ldr ip, [fp, #-0x4c]
	lsr r1, r2, #4
	lsr r0, r3, #3
	lsr r2, ip, #3
	bl sub_0803C5C4
_0803D0DC:
	ldr r1, [fp, #-0x68]
	cmn r1, #0x50
	ble _0803DA0C
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
	.4byte 0xEBFFEE01 @ bl #0x8038948
	teq r5, sl
	rsbmi r0, r0, #0
	ldr r1, [fp, #-0x68]
	mvn r4, r0
	cmp r4, r1
	str r4, [fp, #-0x60]
	strgt r1, [fp, #-0x60]
	bgt _0803D170
	ldr r0, [fp, #-0x60]
	cmn r0, #0x51
	mvnle r0, #0x4f
	str r0, [fp, #-0x60]
_0803D170:
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
	.4byte 0xEBFFEDE7 @ bl #0x8038948
	teq r6, r8
	rsbmi r0, r0, #0
	ldr lr, [fp, #-0x60]
	mvn r4, r0
	cmp r4, lr
	str r4, [fp, #-0x64]
	strgt lr, [fp, #-0x64]
	bgt _0803D1D8
	ldr r8, [fp, #-0x64]
	cmn r8, #0x51
	mvnle r8, #0x4f
	str r8, [fp, #-0x64]
_0803D1D8:
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
	ldr r7, _0803DB90
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
	ble _0803DB18
	add sl, r2, r7
	add r6, sl, #0x1fc0
	rsb r5, r7, r2
	add r0, r6, #0x3f
	asr sb, r5, #0xd
	asr r7, r0, #0xd
	str sb, [fp, #-0x80]
	str r7, [fp, #-0x88]
_0803D2F8:
	cmp r4, #0
	ble _0803DAF4
	add r2, r1, r4
	add sl, r2, #0x1fc0
	rsb r6, r4, r1
	add r4, sl, #0x3f
	asr r7, r6, #0xd
	asr r1, r4, #0xd
	str r7, [fp, #-0x84]
	str r1, [fp, #-0x8c]
_0803D320:
	ldr sb, [fp, #-0x44]
	ldr r1, [fp, #-0x60]
	mul r1, sb, r1
	ldr r6, [fp, #-0xa0]
	add sb, r6, r1
	asr r7, sb, #2
	str r1, [fp, #-0xa8]
	ldr r0, _0803DB90
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
	ble _0803DAB8
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
_0803D41C:
	cmp r4, #0
	ble _0803DA7C
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
_0803D458:
	ldr r8, [fp, #-0x68]
	ldr r3, [fp, #-0x60]
	ldr r4, _0803DB94
	cmp r8, r3
	sub r5, r4, r8, lsl #5
	ble _0803D498
	mov r1, #0x2040
	add r3, r1, #7
	mov r2, #0x1000
_0803D47C:
	ldr r0, [fp, #-0x60]
	sub r8, r8, #1
	cmp r8, r0
	strh r3, [r5, #0x1c]
	strh r2, [r5, #0x1e]
	add r5, r5, #0x20
	bgt _0803D47C
_0803D498:
	ldr r8, [fp, #-0x60]
	ldr ip, [fp, #-0x64]
	cmp r8, ip
	ble _0803D53C
_0803D4A8:
	ldr r0, [fp, #-0xb4]
	ldr ip, _0803DB90
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
	bgt _0803DA70
_0803D53C:
	ldr r8, [fp, #-0x60]
	ldr r5, [fp, #-0xa8]
	ldr r3, [fp, #-0xa0]
	cmn r8, #0x50
	add sb, r3, r5
	sub r5, r4, r8, lsl #5
	ble _0803D604
	mvn r4, #0xf70
	sub r7, r4, #2
	str r7, [fp, #-0xac]
_0803D564:
	ldr r0, [fp, #-0xac]
	ldr r7, _0803DB90
	strh r0, [r5, #4]
	bic ip, sb, #3
	ldr r2, [r7, ip]
	and r4, sb, #3
	rsb r1, r4, #4
	mul r7, r1, r2
	ldr r3, _0803DB90
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
	bgt _0803D564
_0803D604:
	ldr lr, _0803DB7C
	ldr r1, [fp, #-0x84]
	ldr sb, [lr, #0x44]
	cmp r1, sb
	ldrge sb, [fp, #-0x84]
	strge sb, [fp, #-0x90]
	bge _0803D6FC
	str sb, [fp, #-0x90]
	mov r5, r1
_0803D628:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _0803D64C
	ldr ip, _0803DB7C
	ldr r4, [ip, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_0803D64C:
	ldr r1, [fp, #-0x80]
	ldr r2, [fp, #-0x88]
	cmp r1, r2
	mov r4, r1
	bge _0803D6F0
	and r0, r5, #0x1f
	ldr r8, _0803DB7C
	ldr r7, _0803DB98
	lsl sl, r0, #7
_0803D670:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _0803D690
	ldr lr, [r8, #8]
	ldrh r3, [lr]
	cmp r4, r3
	subge r2, r3, #1
_0803D690:
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
	blt _0803D670
_0803D6F0:
	add r5, r5, #1
	cmp r5, sb
	blt _0803D628
_0803D6FC:
	ldr r2, _0803DB7C
	ldr r1, [fp, #-0x8c]
	ldr r3, [r2, #0x4c]
	cmp r3, r1
	ldrge r2, [fp, #-0x8c]
	strge r2, [fp, #-0x94]
	bge _0803D7F8
	str r3, [fp, #-0x94]
	mov r5, r3

	.global sub_0803D720
	.type sub_0803D720, %function
sub_0803D720: @ 0803D720
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _0803D744
	ldr lr, _0803DB7C
	ldr r4, [lr, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_0803D744:
	ldr r0, [fp, #-0x80]
	ldr ip, [fp, #-0x88]
	cmp r0, ip
	mov r4, r0
	bge _0803D7E8
	and sb, r5, #0x1f
	ldr r8, _0803DB7C
	ldr r7, _0803DB98
	lsl sl, sb, #7
_0803D768:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _0803D788
	ldr r1, [r8, #8]
	ldrh r3, [r1]
	cmp r4, r3
	subge r2, r3, #1
_0803D788:
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
	blt _0803D768
_0803D7E8:
	ldr r1, [fp, #-0x8c]
	add r5, r5, #1
	cmp r5, r1
	blt sub_0803D720
_0803D7F8:
	ldr lr, _0803DB7C
	ldr r3, [fp, #-0x80]
	ldr sb, [lr, #0x40]
	cmp r3, sb
	bge _0803D8F0
	ldr r0, [fp, #-0x90]
	ldr r5, [fp, #-0x94]
	cmp r0, r5
	mov r5, r0
	bge _0803D8F0
_0803D820:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _0803D844
	ldr ip, _0803DB7C
	ldr r4, [ip, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_0803D844:
	ldr r1, [fp, #-0x80]
	cmp r1, sb
	mov r4, r1
	bge _0803D8E0
	and r2, r5, #0x1f
	ldr r8, _0803DB7C
	ldr r7, _0803DB98
	lsl sl, r2, #7
_0803D864:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _0803D884
	ldr lr, [r8, #8]
	ldrh r3, [lr]
	cmp r4, r3
	subge r2, r3, #1
_0803D884:
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
	blt _0803D864
_0803D8E0:
	ldr r1, [fp, #-0x94]
	add r5, r5, #1
	cmp r5, r1
	blt _0803D820
_0803D8F0:
	ldr lr, _0803DB7C
	ldr r2, [fp, #-0x88]
	ldr sb, [lr, #0x48]
	cmp sb, r2
	bge _0803D9E8
	ldr r5, [fp, #-0x90]
	ldr ip, [fp, #-0x94]
	cmp r5, ip
	bge _0803D9E8
_0803D914:
	cmp r5, #0
	mov r6, r5
	movlt r6, #0
	blt _0803D938
	ldr r0, _0803DB7C
	ldr r4, [r0, #8]
	ldrh r3, [r4, #2]
	cmp r5, r3
	subge r6, r3, #1
_0803D938:
	ldr r3, [fp, #-0x88]
	mov r4, sb
	cmp r4, r3
	bge _0803D9D8
	and r1, r5, #0x1f
	ldr r8, _0803DB7C
	ldr r7, _0803DB98
	lsl sl, r1, #7
_0803D958:
	cmp r4, #0
	mov r2, r4
	movlt r2, #0
	blt _0803D978
	ldr lr, [r8, #8]
	ldrh r3, [lr]
	cmp r4, r3
	subge r2, r3, #1
_0803D978:
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
	blt _0803D958
_0803D9D8:
	ldr r1, [fp, #-0x94]
	add r5, r5, #1
	cmp r5, r1
	blt _0803D914
_0803D9E8:
	ldr lr, [fp, #-0x8c]
	ldr r2, _0803DB7C
	str lr, [r2, #0x4c]
	ldr lr, [fp, #-0x80]
	str lr, [r2, #0x40]
	ldr r3, [fp, #-0x84]
	str r3, [r2, #0x44]
	ldr ip, [fp, #-0x88]
	str ip, [r2, #0x48]
_0803DA0C:
	ldr r1, _0803DB78
	ldr r0, [r1]
	tst r0, #4
	beq _0803DA68
	ldr r8, _0803DB9C
	mov r2, #0x2040
	add r3, r2, #7
	mov r5, #0
	strh r5, [r8, #0x1e]
	strh r3, [r8, #0x1c]
	add r5, r8, #0x20
	mov r2, #0xb
	mov r8, #0x1f
_0803DA40:
	subs r8, r8, #1
	strh r3, [r5, #0x1c]
	strh r2, [r5, #0x1e]
	add r5, r5, #0x20
	bpl _0803DA40
	mov r1, #0x2040
	add r0, r1, #7
	mov ip, #0
	strh r0, [r5, #0x1c]
	strh ip, [r5, #0x1e]
_0803DA68:
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_0803DA70:
	and r6, sb, #3
	str r6, [fp, #-0xb0]
	b _0803D4A8
_0803DA7C:
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
	b _0803D458
_0803DAB8:
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
	b _0803D41C
_0803DAF4:
	rsb r7, r4, r1
	add r5, r7, #0x1fc0
	add sb, r1, r4
	add lr, r5, #0x3f
	asr r0, sb, #0xd
	asr ip, lr, #0xd
	str r0, [fp, #-0x84]
	str ip, [fp, #-0x8c]
	b _0803D320
_0803DB18:
	rsb r5, r7, r2
	add sb, r5, #0x1fc0
	add r0, r2, r7
	add ip, sb, #0x3f
	asr lr, r0, #0xd
	asr r2, ip, #0xd
	str lr, [fp, #-0x80]
	str r2, [fp, #-0x88]
	b _0803D2F8
_0803DB3C:
	cmp r4, #0x4000
	movge r3, #0x50
	strge r3, [fp, #-0x68]
	movge r7, #0x1000
	movge sb, #0
	bge _0803CD2C
	mov r0, r4
	.4byte 0xEBFFEB05 @ bl #0x8038774
	lsl r2, r0, #0x10
	asr r1, r2, #0x10
	sub lr, r1, #2
	str lr, [fp, #-0x68]
	b _0803CD2C
_0803DB70:
	.4byte sub_08000C1C
_0803DB74:
	.4byte 0x0200436C
_0803DB78:
	.4byte 0x0300566C
_0803DB7C:
	.4byte 0x020042A4
_0803DB80:
	.4byte 0x02000820
_0803DB84:
	.4byte 0x0201BAEC
_0803DB88:
	.4byte 0x0200082A
_0803DB8C:
	.4byte 0x0200082E
_0803DB90:
	.4byte 0x0803F49C
_0803DB94:
	.4byte 0x02001220
_0803DB98:
	.4byte 0x081136E0
_0803DB9C:
	.4byte 0x02001760
	.incbin "baserom.gba", 0x3DBA0, 0x7C

	.global sub_0803DC1C
	.type sub_0803DC1C, %function
sub_0803DC1C: @ 0803DC1C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr ip, _0803DFC4
	ldr r3, [ip, #0x20]
	sub sp, sp, #0x20
	cmp r0, r3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x18]
	beq _0803DD34
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
	blt _0803DF14
	ldr r0, [sp, #0x1c]
	rsb sl, r3, r0
	add r4, sl, #0x10
	add sl, r0, #0x10
	cmp r4, sl
	bge _0803DD28
	ldr sb, _0803DFC4
	ldr r5, [sb, #0x10]
	str r5, [sp, #0x14]
_0803DC98:
	ldr r7, [sp, #0x14]
	ldrh r6, [r7]
	asr lr, r4, #1
	cmp lr, r6
	blt _0803DCC0
	ldr r8, [sb, #0x10]
	ldrh r3, [r8]
_0803DCB4:
	rsb lr, r3, lr
	cmp lr, r3
	bge _0803DCB4
_0803DCC0:
	and r2, r4, #0xf
	mov r1, #0x6000000
	ldr r5, [sb, #0x10]
	ldr r8, _0803DFC8
	lsl r0, r2, #1
	mov ip, #0
	add r7, r1, #0x8000
	and r6, r4, #1
_0803DCE0:
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
	ble _0803DCE0
	add r4, r4, #1
	cmp r4, sl
	blt _0803DC98
_0803DD28:
	ldr ip, _0803DFC4
	ldr r0, [sp, #0x1c]
	str r0, [ip, #0x20]
_0803DD34:
	ldr r0, _0803DFC4
	ldr r1, [sp, #0x18]
	ldr r3, [r0, #0x24]
	cmp r1, r3
	beq _0803DE4C
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
	blt _0803DE58
	ldr ip, [sp, #0x18]
	rsb sl, r3, ip
	add r4, sl, #0x10
	add sl, ip, #0x10
	cmp r4, sl
	bge _0803DE40
	ldr sb, _0803DFC4
	mov lr, #0x6000000
	ldr r5, [sb, #0x14]
	add r0, lr, #0x8100
	str r5, [sp, #0xc]
	str r0, [sp, #4]
_0803DDB0:
	ldr r7, [sp, #0xc]
	ldrh r6, [r7]
	asr r0, r4, #1
	cmp r0, r6
	blt _0803DDD8
	ldr r8, [sb, #0x14]
	ldrh r3, [r8]
_0803DDCC:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803DDCC
_0803DDD8:
	ldr r1, [sp, #4]
	and r2, r4, #0xf
	ldr r5, [sb, #0x14]
	ldr r8, _0803DFC8
	lsl lr, r2, #1
	mov ip, #0
	add r7, r1, #0x40
	and r6, r4, #1
_0803DDF8:
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
	ble _0803DDF8
	add r4, r4, #1
	cmp r4, sl
	blt _0803DDB0
_0803DE40:
	ldr ip, _0803DFC4
	ldr r0, [sp, #0x18]
	str r0, [ip, #0x24]
_0803DE4C:
	add sp, sp, #0x20
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
_0803DE58:
	ldr r1, [sp, #0x18]
	rsb sl, r3, r1
	cmp r1, sl
	mov r4, r1
	bge _0803DE40
	mov r5, #0x6000000
	add lr, r5, #0x8100
	str ip, [sp, #0x10]
	str lr, [sp]
	mov sb, r0
_0803DE80:
	ldr r7, [sp, #0x10]
	ldrh r6, [r7]
	asr r0, r4, #1
	cmp r0, r6
	blt _0803DEA8
	ldr r8, [sb, #0x14]
	ldrh r3, [r8]
_0803DE9C:
	rsb r0, r3, r0
	cmp r0, r3
	bge _0803DE9C
_0803DEA8:
	ldr r3, [sp]
	and r2, r4, #0xf
	ldr r5, [sb, #0x14]
	ldr r8, _0803DFC8
	lsl lr, r2, #1
	mov ip, #0
	add r7, r3, #0x40
	and r6, r4, #1
_0803DEC8:
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
	ble _0803DEC8
	add r4, r4, #1
	cmp r4, sl
	blt _0803DE80
	b _0803DE40
_0803DF14:
	ldr r4, [sp, #0x1c]
	rsb r3, r3, r4
	cmp r4, r3
	bge _0803DD28
	str r3, [sp, #8]
	mov sl, ip
	mov sb, lr
_0803DF30:
	ldrh r0, [sb]
	asr lr, r4, #1
	cmp lr, r0
	blt _0803DF54
	ldr r0, [sl, #0x10]
	ldrh r3, [r0]
_0803DF48:
	rsb lr, r3, lr
	cmp lr, r3
	bge _0803DF48
_0803DF54:
	and r2, r4, #0xf
	mov r1, #0x6000000
	ldr r5, [sl, #0x10]
	ldr r8, _0803DFC8
	lsl r0, r2, #1
	mov ip, #0
	add r7, r1, #0x8000
	and r6, r4, #1
_0803DF74:
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
	ble _0803DF74
	ldr ip, [sp, #8]
	add r4, r4, #1
	cmp r4, ip
	blt _0803DF30
	b _0803DD28
_0803DFC4:
	.4byte 0x02004320
_0803DFC8:
	.4byte 0x081136E0

	.global sub_0803DFCC
	.type sub_0803DFCC, %function
sub_0803DFCC: @ 0803DFCC
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	ldr r0, _0803E9D0
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
	.4byte 0xEBFFEF5F @ bl #0x8039d8c
	mov sb, r0
	lsl r6, sb, #0x10
	asr r1, r6, #0x10
	mov r0, r4
	str r1, [fp, #-0x58]
	.4byte 0xEBFFEF58 @ bl #0x8039d88
	mov r2, r0
	lsl lr, r2, #0x10
	asr ip, lr, #0x10
	mov r0, r5
	str ip, [fp, #-0x5c]
	.4byte 0xEBFFEF53 @ bl #0x8039d8c
	mov sb, r0
	lsl r6, sb, #0x10
	asr r1, r6, #0x10
	mov r0, r5
	str r1, [fp, #-0x60]
	.4byte 0xEBFFEF4C @ bl #0x8039d88
	lsl r2, r0, #0x10
	asr r1, r2, #0x10
	cmn r4, #0x4000
	str r1, [fp, #-0x64]
	bgt _0803E990
	mov r6, #0x80000000
	mvn sb, #0x4f
	asr r1, r6, #0x13
	mov r4, #0
	str sb, [fp, #-0x54]
	str r1, [fp, #-0x58]
	str r4, [fp, #-0x5c]
_0803E084:
	rsb sb, r5, #0
	lsl r2, sb, #0x10
	lsr r1, r2, #0x16
	ldr r6, _0803E9D4
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
	blt _0803E0EC
	ldr ip, [fp, #-0x54]
	cmp ip, #0x50
	movge ip, #0x50
	str ip, [fp, #-0x54]
_0803E0EC:
	mov r0, #0xa00
	ldr r4, _0803E9D8
	mov r2, #0x2c40
	add r3, r0, #0xa
	mov r6, #0x9f
_0803E100:
	subs r6, r6, #1
	strh r2, [r4, #4]
	strh r3, [r4, #6]
	add r4, r4, #0x20
	bpl _0803E100
	ldr r3, [fp, #-0x54]
	cmp r3, #0x4f
	bgt _0803E428
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
	ldr sl, _0803E9DC
	ble _0803E1A4
	ldr r6, _0803E9D4
	ldr r4, _0803E9E0
	ldr r1, [r6, #4]
	ldrh r0, [r1]
	ldr r1, [r4]
	bl sub_0803D720
	cmp r5, #0
	lsl lr, r0, #0x10
	asr r0, lr, #0x10
	ble _0803E1A4
	mov r6, r5
_0803E198:
	subs r6, r6, #1
	strh r0, [sl], #2
	bne _0803E198
_0803E1A4:
	cmp r8, #0
	ble _0803E1F0
	ldr r5, [fp, #-0x54]
	adds r3, r5, #0x30
	movmi r3, #0
	cmp r8, #0
	ble _0803E1F0
	ldr r5, _0803E9E0
	lsl r4, r3, #1
	mov r6, r8
_0803E1CC:
	ldr r3, _0803E9D4
	ldr r2, [r3, #4]
	ldr r1, [r5]
	ldrh r0, [r4, r2]
	bl sub_0803D720
	subs r6, r6, #1
	strh r0, [sl], #2
	add r4, r4, #2
	bne _0803E1CC
_0803E1F0:
	cmp r7, #0
	ble _0803E230
	ldr r0, _0803E9D4
	ldr r8, _0803E9E0
	ldr lr, [r0]
	ldr r1, [r8]
	ldrh r0, [lr]
	bl sub_0803D720
	cmp r7, #0
	lsl ip, r0, #0x10
	asr r0, ip, #0x10
	ble _0803E230
	mov r6, r7
_0803E224:
	subs r6, r6, #1
	strh r0, [sl], #2
	bne _0803E224
_0803E230:
	ldr r7, [fp, #-0x54]
	rsb r5, r7, #0x50
	cmp r5, #0xa0
	movge r5, #0xa0
	mov r6, #0
	cmp r6, r5
	ldr r4, _0803E9D8
	bge _0803E2A0
	mov r1, r6
	ldr r8, [fp, #-0x44]
	mov r6, r5
	ldr r5, [fp, #-0x48]
	mov r2, #0x7000
	add r3, r2, #0x88
	lsl ip, r8, #8
	mov r2, #0x100
	lsl r0, r5, #8
_0803E274:
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
	bne _0803E274
_0803E2A0:
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
	ldr r4, _0803E9D8
	bge _0803E310
	mov r2, r6
	mov r6, r5
_0803E300:
	subs r6, r6, #1
	str r2, [r4, #0x10]
	add r4, r4, #0x20
	bne _0803E300
_0803E310:
	cmp r8, #0
	ble _0803E334
	lsl r3, r3, #8
	mov r6, r8
_0803E320:
	subs r6, r6, #1
	str r3, [r4, #0x10]
	add r4, r4, #0x20
	add r3, r3, #0x100
	bne _0803E320
_0803E334:
	cmp r7, #0
	ble _0803E354
	mov r6, r7
	mov r3, #0x4f00
_0803E344:
	subs r6, r6, #1
	str r3, [r4, #0x10]
	add r4, r4, #0x20
	bne _0803E344
_0803E354:
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
	ldr r4, _0803E9D8
	bge _0803E3CC
	mov r2, r6
	mov r6, r5
_0803E3BC:
	subs r6, r6, #1
	str r2, [r4, #0x1c]
	add r4, r4, #0x20
	bne _0803E3BC
_0803E3CC:
	cmp r8, #0
	ble _0803E3F4
	lsl r2, r3, #8
	add r3, r2, #0x5000
	mov r6, r8
_0803E3E0:
	subs r6, r6, #1
	str r3, [r4, #0x1c]
	add r4, r4, #0x20
	add r3, r3, #0x100
	bne _0803E3E0
_0803E3F4:
	cmp r7, #0
	ble _0803E414
	mov r6, r7
	mov r3, #0x9f00
_0803E404:
	subs r6, r6, #1
	str r3, [r4, #0x1c]
	add r4, r4, #0x20
	bne _0803E404
_0803E414:
	ldr r1, [fp, #-0x44]
	ldr ip, [fp, #-0x48]
	lsr r0, r1, #4
	lsr r1, ip, #4
	bl sub_0803DC1C
_0803E428:
	ldr r3, [fp, #-0x54]
	cmn r3, #0x50
	ble _0803E92C
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
	.4byte 0xEBFFEEC4 @ bl #0x8039fa0
	teq r5, sb
	rsbmi r0, r0, #0
	ldr r3, [fp, #-0x54]
	mvn sb, r0
	cmp sb, r3
	movgt sb, r3
	bgt _0803E4B0
	cmn sb, #0x51
	mvnle sb, #0x4f
_0803E4B0:
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
	.4byte 0xEBFFEEAD @ bl #0x8039fa0
	teq r7, sl
	rsbmi r0, r0, #0
	mvn r4, r0
	cmp r4, sb
	str r4, [fp, #-0x50]
	strgt sb, [fp, #-0x50]
	bgt _0803E514
	ldr sl, [fp, #-0x50]
	cmn sl, #0x51
	mvnle sl, #0x4f
	str sl, [fp, #-0x50]
_0803E514:
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
	ldr r0, _0803E9E4
	str lr, [fp, #-0x30]
	cmp r6, sb
	lsl lr, r6, #5
	sub r8, r4, r7, asr #4
	str lr, [fp, #-0x80]
	add r7, ip, r2
	rsb r4, lr, r0
	ble _0803E618
	mov r1, #0x2040
	add r3, r1, #0xc
	mov r2, #0x1000
_0803E600:
	sub r6, r6, #1
	cmp r6, sb
	strh r3, [r4, #4]
	strh r2, [r4, #6]
	add r4, r4, #0x20
	bgt _0803E600
_0803E618:
	ldr r0, [fp, #-0x50]
	mov r6, sb
	cmp r6, r0
	ble _0803E6A8
	mov r3, #0x2040
	add r2, r3, #0xc
	ldr lr, _0803E9E8
	str r2, [fp, #-0x84]
_0803E638:
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
	bgt _0803E638
_0803E6A8:
	ldr r4, [fp, #-0x7c]
	mov r6, sb
	ldr r3, [fp, #-0x78]
	ldr lr, _0803E9E4
	cmn r6, #0x50
	add r7, r3, r4
	sub r4, lr, sb, lsl #5
	ble _0803E770
	mvn r0, #0x1740
	sub r1, r0, #0x37
	ldr r5, _0803E9E8
	str r1, [fp, #-0x88]
_0803E6D8:
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
	bgt _0803E6D8
_0803E770:
	ldr r2, _0803E9D0
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
	ldr r3, _0803E9E4
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
	ble _0803E868
	mov r0, #0x7000
	add r2, r0, #0x88
	mov r1, #0x100
	mov r3, #0
_0803E840:
	ldr r0, [fp, #-0x50]
	sub r6, r6, #1
	cmp r6, r0
	strh r2, [r4, #2]
	strh r1, [r4, #0x14]
	strh r3, [r4, #0x16]
	str r3, [r4, #0x18]
	str r3, [r4, #0x1c]
	add r4, r4, #0x20
	bgt _0803E840
_0803E868:
	ldr r6, [fp, #-0x50]
	cmn r6, #0x50
	ble _0803E92C
	ldr r1, [fp, #-0x68]
	ldr lr, [fp, #-0x70]
	asr ip, r1, #2
	asr sb, lr, #2
	mvn r3, #0x1f40
	ldr r5, _0803E9E8
	str ip, [fp, #-0x8c]
	str sb, [fp, #-0x90]
	sub sb, r3, #0x33
_0803E898:
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
	bgt _0803E898
_0803E92C:
	ldr r0, _0803E9EC
	ldr ip, [r0]
	tst ip, #4
	beq _0803E988
	ldr r6, _0803E9F0
	mov r2, #0x2c40
	add r3, r2, #0xc
	mov r4, #0
	strh r4, [r6, #6]
	strh r3, [r6, #4]
	add r4, r6, #0x20
	mov r2, #0xb
	mov r6, #0x1f
_0803E960:
	subs r6, r6, #1
	strh r3, [r4, #4]
	strh r2, [r4, #6]
	add r4, r4, #0x20
	bpl _0803E960
	mov ip, #0x2c40
	add r1, ip, #0xc
	mov r3, #0
	strh r1, [r4, #4]
	strh r3, [r4, #6]
_0803E988:
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_0803E990:
	cmp r4, #0x4000
	blt _0803E9B4
	mov lr, #0x50
	mov r3, #0x1000
	mov ip, #0
	str lr, [fp, #-0x54]
	str r3, [fp, #-0x58]
	str ip, [fp, #-0x5c]
	b _0803E084
_0803E9B4:
	mov r0, r4
	.4byte 0xEBFFED03 @ bl #0x8039dcc
	lsl r1, r0, #0x10
	asr r4, r1, #0x10
	sub r2, r4, #2
	str r2, [fp, #-0x54]
	b _0803E084
_0803E9D0:
	.4byte 0x0200436C
_0803E9D4:
	.4byte 0x02004320
_0803E9D8:
	.4byte 0x02001C20
_0803E9DC:
	.4byte 0x02023FA4
_0803E9E0:
	.4byte 0x0201BAEC
_0803E9E4:
	.4byte 0x02002620
_0803E9E8:
	.4byte 0x0803F49C
_0803E9EC:
	.4byte 0x0300566C
_0803E9F0:
	.4byte 0x02002B60

	.global sub_0803E9F4
	.type sub_0803E9F4, %function
sub_0803E9F4: @ 0803E9F4
	str lr, [sp, #-4]!
	mov ip, #0x4000000
	ldrh r0, [ip, #6]
	ldr r1, _0803EA88
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
	ldr r3, _0803EA8C
	str r1, [ip, #0x3c]
	ldrh r1, [r3, lr]
	ldr r2, [r0, #4]
	mov r0, #0x5000000
	str r2, [ip, #0x50]
	strh r1, [r0]
	ldm sp!, {lr}
	bx lr
_0803EA88:
	.4byte 0x02001C20
_0803EA8C:
	.4byte 0x02023FA4
	.incbin "baserom.gba", 0x3EA90, 0x170
