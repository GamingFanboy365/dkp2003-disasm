@ asm/iwram.s: ROM 0x0385FC-0x03C5C4 (iwram, VMA 0x03000000)

	.include "asm/macros.inc"

	.section .iwram, "ax", %progbits
	.balign 4

	.arm

	.global IntrMain
	.type IntrMain, %function
IntrMain: @ 03000000
	mov r3, #0x4000000
	add r3, r3, #0x200
	ldr r2, [r3]
	ldrh r1, [r3, #8]
	mrs r0, spsr
	push {r0, r1, r2, r3, lr}
	mov r0, #1
	strh r0, [r3, #8]
	and r1, r2, r2, lsr #16
	ldr ip, _0300012C
	ands r0, r1, #1
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #2
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #4
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #8
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x10
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x20
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x40
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x80
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x100
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x200
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x400
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x800
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x1000
	bne _030000D0
	add ip, ip, #4
	ands r0, r1, #0x2000
	strbne r0, [r3, #-0x17c]
_030000CC:
	bne _030000CC
_030000D0:
	strh r0, [r3, #2]
	ldr r1, _03000130
	bic r2, r2, r0
	and r1, r1, r2
	strh r1, [r3]
	mrs r3, apsr
	bic r3, r3, #0xdf
	orr r3, r3, #0x1f
	msr cpsr_fc, r3
	ldr r0, [ip]
	stmdb sp!, {lr}
	add lr, pc, #0
	bx r0

	.global sub_03000104
	.type sub_03000104, %function
sub_03000104: @ 03000104
	ldm sp!, {lr}
	mrs r3, apsr
	bic r3, r3, #0xdf
	orr r3, r3, #0x92
	msr cpsr_fc, r3
	pop {r0, r1, r2, r3, lr}
	strh r2, [r3]
	strh r1, [r3, #8]
	msr spsr_fc, r0
	bx lr
_0300012C:
	.4byte gIrqHandler
_03000130:
	.4byte 0x000020C2

	.global cos_fx
	.type cos_fx, %function
cos_fx: @ 03000134
	add r0, r0, #0x4000

	.global sin_fx
	.type sin_fx, %function
sin_fx: @ 03000138
	tst r0, #0x4000
	addne r0, r0, #1
	rsbne r0, r0, #0x8000
	and r1, r0, #0x3fc0
	ldr r3, _0300082C
	add r3, r3, r1, lsr #5
	ldrh r1, [r3]
	ldrh r2, [r3, #2]
	and r3, r0, #0x3f
	mul r2, r3, r2
	rsb r3, r3, #0x40
	mla r1, r3, r1, r2
	tst r0, #0x8000
	rsbne r1, r1, #0
	asr r0, r1, #6
	bx lr

	.global tan_fx
	.type tan_fx, %function
tan_fx: @ 03000178
	tst r0, #0x4000
	rsbne r0, r0, #0
	orrne r0, r0, #0x10000
	and r1, r0, #0x3fc0
	ldr r3, _03000830
	add r3, r3, r1, lsr #5
	ldrh r1, [r3]
	ldrh r2, [r3, #2]
	and r3, r0, #0x3f
	mul r2, r3, r2
	rsb r3, r3, #0x40
	mla r1, r3, r1, r2
	tst r0, #0x10000
	rsbne r1, r1, #0
	asr r0, r1, #6
	bx lr
	.byte 0x00, 0x10, 0xA0, 0xE1, 0x02, 0x09, 0x10, 0xE3, 0x00, 0x10, 0x61, 0x12, 0x01, 0x0C, 0x51, 0xE3
	.byte 0x01, 0x1C, 0xA0, 0xC3, 0x60, 0x26, 0x9F, 0xE5, 0x81, 0x20, 0x82, 0xE0, 0xB0, 0x10, 0xD2, 0xE1
	.byte 0x02, 0x09, 0x10, 0xE3, 0x00, 0x10, 0x61, 0x12, 0x01, 0x00, 0xA0, 0xE1, 0x1E, 0xFF, 0x2F, 0xE1

	.global atan2_fx
	.type atan2_fx, %function
atan2_fx: @ 030001E8
	stmdb sp!, {lr}
	cmp r1, #0
	blt _0300029C
	cmp r0, #0
	blt _03000248
	cmp r0, r1
	bge _03000220
	lsl r0, r0, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	ldm sp!, {lr}
	bx lr
_03000220:
	mov r2, r1
	mov r1, r0
	lsl r0, r2, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	rsb r0, r0, #0x4000
	ldm sp!, {lr}
	bx lr
_03000248:
	rsb r0, r0, #0
	cmp r0, r1
	bge _03000274
	lsl r0, r0, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	rsb r0, r0, #0x10000
	ldm sp!, {lr}
	bx lr
_03000274:
	mov r2, r1
	mov r1, r0
	lsl r0, r2, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	add r0, r0, #0xc000
	ldm sp!, {lr}
	bx lr
_0300029C:
	rsb r1, r1, #0
	cmp r0, #0
	blt _030002F8
	cmp r0, r1
	bge _030002D0
	lsl r0, r0, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	rsb r0, r0, #0x8000
	ldm sp!, {lr}
	bx lr
_030002D0:
	mov r2, r1
	mov r1, r0
	lsl r0, r2, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	add r0, r0, #0x4000
	ldm sp!, {lr}
	bx lr
_030002F8:
	rsb r0, r0, #0
	cmp r0, r1
	bge _03000324
	lsl r0, r0, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	add r0, r0, #0x8000
	ldm sp!, {lr}
	bx lr
_03000324:
	mov r2, r1
	mov r1, r0
	lsl r0, r2, #8
	bl udiv
	lsl r0, r0, #1
	ldr r2, _03000838
	ldrh r0, [r2, r0]
	rsb r0, r0, #0xc000
	ldm sp!, {lr}
	bx lr

	.global udiv
	.type udiv, %function
udiv: @ 0300034C
	mov r3, #0x1c
	lsr r2, r0, #4
	cmp r1, r2, lsr #12
	suble r3, r3, #0x10
	lsrle r2, r2, #0x10
	cmp r1, r2, lsr #4
	suble r3, r3, #8
	lsrle r2, r2, #8
	cmp r1, r2
	suble r3, r3, #4
	lsrle r2, r2, #4
	lsl r0, r0, r3
	rsb r1, r1, #0
	adds r0, r0, r0
	add r3, r3, r3, lsl #1
	add pc, pc, r3, lsl #2
_0300038C:
	mov r0, r0
_03000390:
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	adcs r2, r1, r2, lsl #1
	rsblo r2, r1, r2
	adcs r0, r0, r0
	mov r1, r2
	bx lr

	.global sub_03000518
	.type sub_03000518, %function
sub_03000518: @ 03000518
	stmdb sp!, {lr}
	cmp r1, #0
	lsr ip, r1, #1
	rsbpl r1, r1, #0
	eor ip, ip, r0, asr #1
	rsbmi r0, r0, #0
	bl udiv
	lsls ip, ip, #1
	rsbmi r0, r0, #0
	rsbhs r1, r1, #0
	ldm sp!, {ip}
	bx ip

	.global umod
	.type umod, %function
umod: @ 03000548
	stmdb sp!, {lr}
	bl udiv
	mov r0, r1
	ldm sp!, {ip}
	bx ip

	.global sub_0300055C
	.type sub_0300055C, %function
sub_0300055C: @ 0300055C
	stmdb sp!, {lr}
	bl sub_03000518
	mov r0, r1
	ldm sp!, {ip}
	bx ip
	.global _03000570
_03000570:
	mov r1, #0x10000000
	mov r3, #0x54
	cmp r0, r1, lsr #12
	suble r3, r3, #0x30
	lsrle r1, r1, #0x10
	cmp r0, r1, lsr #4
	suble r3, r3, #0x18
	lsrle r1, r1, #8
	cmp r0, r1
	suble r3, r3, #0xc
	lsrle r1, r1, #4
	mov r2, #0
	adds r2, r2, r2
	rsb r0, r0, #0
	add pc, pc, r3, lsl #2
	.byte 0x00, 0x00, 0xA0, 0xE1
_030005B0:
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	adcs r1, r0, r1, lsl #1
	rsblo r1, r0, r1
	adcs r2, r2, r2
	mov r0, r2
	bx lr
	.global _03000738
_03000738:
	smull r2, r3, r0, r1
	mov r0, r3
	bx lr

	.global isqrt
	.type isqrt, %function
isqrt: @ 03000744
	mov r1, #0xc0000000
	mov r2, #0x40000000
	cmp r0, r2
	subhs r0, r0, r2
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #2
	subhs r0, r0, r2, ror #2
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #4
	subhs r0, r0, r2, ror #4
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #6
	subhs r0, r0, r2, ror #6
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #8
	subhs r0, r0, r2, ror #8
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #10
	subhs r0, r0, r2, ror #10
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #12
	subhs r0, r0, r2, ror #12
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #14
	subhs r0, r0, r2, ror #14
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #16
	subhs r0, r0, r2, ror #16
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #18
	subhs r0, r0, r2, ror #18
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #20
	subhs r0, r0, r2, ror #20
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #22
	subhs r0, r0, r2, ror #22
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #24
	subhs r0, r0, r2, ror #24
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #26
	subhs r0, r0, r2, ror #26
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #28
	subhs r0, r0, r2, ror #28
	adc r2, r1, r2, lsl #1
	cmp r0, r2, ror #30
	subhs r0, r0, r2, ror #30
	adc r2, r1, r2, lsl #1
	bic r0, r2, #0xc0000000
	bx lr
	.global _03000814
_03000814:
	sub r0, r0, r1
	tst r0, #0x8000
	subne r0, r0, #0x10000
	tst r0, #0x80000000
	addne r0, r0, #0x10000
	bx lr
_0300082C:
	.4byte gUnk_0803EA90
_03000830:
	.4byte gUnk_0803EC94
	.4byte gUnk_0803EE98
_03000838:
	.4byte gUnk_0803F09A

	.global sub_0300083C
	.type sub_0300083C, %function
sub_0300083C: @ 0300083C
	push {r4, r5, r6, r7, r8, sb, lr}
	ldm r1!, {r3, r4, r5}
	ldm r0!, {r6, r7, r8, sb}
	mul r6, r3, r6
	mla r6, r4, r7, r6
	mla r6, r5, r7, r6
	add r6, sb, r6, asr #8
	str r6, [r1, #-0xc]
	ldm r0!, {r6, r7, r8, sb}
	mul r6, r3, r6
	mla r6, r4, r7, r6
	mla r6, r5, r7, r6
	add r6, sb, r6, asr #8
	str r6, [r1, #-8]
	ldm r0!, {r6, r7, r8, sb}
	mul r6, r3, r6
	mla r6, r4, r7, r6
	mla r6, r5, r7, r6
	add r6, sb, r6, asr #8
	str r6, [r1, #-4]
	sub r0, r0, #0x30
	pop {r4, r5, r6, r7, r8, sb, ip}
	bx ip

	.global rspr_upload_frames
	.type rspr_upload_frames, %function
rspr_upload_frames: @ 03000898
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r3, _03000A6C
	ldr r2, [r3]
	ldr r0, [r3]
	lsr r6, r2, #9
	eor ip, r6, #1
	lsr lr, r0, #9
	ldr r0, _03000A70
	and r1, ip, #1
	add ip, r0, r1, lsl #10
	eor r8, lr, #1
	ldr r1, _03000A74
	and r6, r8, #1
	add r0, r1, r6, lsl #9
	sub sp, sp, #4
	mov r1, #0x7000000
	mov r6, #0
_030008DC:
	ldrb r2, [r0, r6, lsl #2]
	lsl r8, r2, #3
	ldr lr, [ip, r8]
	str lr, [r1], #4
	add lr, ip, r8
	ldr r8, [lr, #4]
	add r6, r6, #1
	cmp r6, #0x7f
	str r8, [r1], #4
	ble _030008DC
	mov r6, #0x7000000
	add r1, r6, #6
	add r3, ip, #6
	mov r6, #0x7f
_03000914:
	ldrh ip, [r3]
	subs r6, r6, #1
	strh ip, [r1]
	add r3, r3, #8
	add r1, r1, #8
	bpl _03000914
	ldr r8, _03000A6C
	ldr r6, _03000A78
	ldr r1, [r8]
	sub r2, r6, #0x108
	tst r1, #0x200
	moveq r8, r6
	movne r8, r2
	ldr lr, _03000A7C
	ldr ip, [r8]
	ldr r1, [lr]
	mov r3, #0x6000000
	mov r6, #0
	add r0, r3, #0x10000
	cmp r6, ip
	orr lr, r0, r1, lsl #5
	bge _030009CC
	mov r0, #0x4000000
	add sl, r0, #0xd4
_03000974:
	lsl r1, r6, #2
	add r2, r1, #4
	ldr r1, [r8, r2]
	mov r0, r1
	ldrh r3, [r0], #2
	tst r3, #0x8000
	beq _030009D8
	lsl r1, r3, #0x16
	lsr r2, r1, #0x16
	lsl r3, r2, #5
	lsr sb, r3, #1
	orr ip, sb, #0x80000000
	mov sb, #0x4000000
	str r0, [sb, #0xd4]
	str lr, [sl, #4]
	str ip, [sl, #8]
	ldr r1, [sl, #8]
	ldr ip, [r8]
	add lr, lr, r3
_030009C0:
	add r6, r6, #1
	cmp r6, ip
	blt _03000974
_030009CC:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
_030009D8:
	ldrh r2, [r1, #2]
	cmp r2, #0
	add r0, r0, #2
	beq _030009C0
	mov r7, #0x4000000
	add r5, r7, #0xd4
_030009F0:
	lsr r3, r2, #8
	add sb, sp, #4
	tst r2, #0x80
	and r4, r2, #0x7f
	and ip, r2, #0x7f
	mov r1, sb
	orr r3, r3, r3, lsl #8
	beq _03000A48
	add r1, r4, #1
	orr r3, r1, #0x80000000
	str r0, [r7, #0xd4]
	str lr, [r5, #4]
	str r3, [r5, #8]
	lsl ip, r1, #1
	ldr r3, [r5, #8]
	add r0, r0, ip
	add lr, lr, ip
_03000A34:
	ldrh r2, [r0], #2
	cmp r2, #0
	bne _030009F0
	ldr ip, [r8]
	b _030009C0
_03000A48:
	strh r3, [r1, #-2]!
	add r2, ip, #1
	orr ip, r2, #0x81000000
	str r1, [r7, #0xd4]
	str lr, [r5, #4]
	str ip, [r5, #8]
	ldr r3, [r5, #8]
	add lr, lr, r2, lsl #1
	b _03000A34
_03000A6C:
	.4byte gModeFlags
_03000A70:
	.4byte 0x02000008
_03000A74:
	.4byte 0x03005674
_03000A78:
	.4byte 0x0201A93C
_03000A7C:
	.4byte 0x02018EB0

	.global rspr_queue_frame
	.type rspr_queue_frame, %function
rspr_queue_frame: @ 03000A80
	push {r4, r5, r6, lr}
	ldr ip, _03000BA8
	ldr lr, [ip]
	ldr ip, _03000BAC
	tst lr, #0x200
	ldrh r2, [r0]
	add r4, ip, #0x108
	movne ip, r4
	lsl r3, r1, #1
	add r4, r0, r2
	ldr r2, [ip]
	ldrh lr, [r3, r4]
	cmp r2, #0
	add r0, r4, lr, lsl #4
	ldrle r6, _03000BB0
	ldrle r5, _03000BB4
	ble _03000B30
	ldr r4, _03000BB0
	ldr lr, _03000BB4
	mov r1, #0
_03000AD0:
	lsl r3, r1, #2
	add r2, r3, #4
	ldr r3, [ip, r2]
	cmp r3, r0
	ldreq r3, _03000BB8
	lsleq ip, r1, #1
	mov r2, r1
	ldrheq r0, [r3, ip]
	beq _03000BA0
	ldrblo r1, [r4, r1]
	ldrbhs r1, [lr, r1]
	cmp r1, #0
	bne _03000AD0
	cmp r3, r0
	ldrbhs r6, [ip]
	ldrlo r6, _03000BB0
	ldrblo r1, [ip]
	ldrhs r5, _03000BB4
	strblo r1, [r6, r2]
	strbhs r6, [r5, r2]
	ldrlo r5, _03000BB4
	ldrlo r2, [ip]
	ldrhs r6, _03000BB0
	ldrhs r2, [ip]
_03000B30:
	mov r1, r2
	lsl r2, r1, #2
	add r4, r2, #4
	add lr, r1, #1
	str lr, [ip]
	str r0, [ip, r4]
	mov r3, #0x104
	ldrh r3, [ip, r3]
	ldr r4, _03000BB8
	mov r2, #0
	lsl lr, r1, #1
	strh r3, [r4, lr]
	strb r2, [r1, r5]
	strb r2, [r6, r1]
	ldrh r1, [r0]
	ldr r0, [ip]
	lsl r2, r1, #0x16
	ldr r1, [ip, #0x104]
	lsr r3, r2, #0x16
	add r2, r1, r3
	cmp r0, #0x3f
	str r2, [ip, #0x104]
	ble _03000B90
	.4byte 0xE7FFFFFF @ debug trap
_03000B90:
	cmp r2, #0x400
	blo _03000B9C
	.4byte 0xE7FFFFFF @ debug trap
_03000B9C:
	ldrh r0, [r4, lr]
_03000BA0:
	pop {r4, r5, r6, lr}
	bx lr
_03000BA8:
	.4byte gModeFlags
_03000BAC:
	.4byte 0x0201A834
_03000BB0:
	.4byte 0x02018EB4
_03000BB4:
	.4byte 0x02018EF4
_03000BB8:
	.4byte 0x02018E30

	.global sub_03000BBC
	.type sub_03000BBC, %function
sub_03000BBC: @ 03000BBC
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	ldr r0, _030015CC
	sub fp, ip, #4
	sub sp, sp, #0x39c
	ldr sl, [r0]
	ldr ip, [r0]
	ldr lr, _030015A8
	lsl r8, ip, #1
	and sb, sl, #0x200
	and r7, r8, #0x400
	ldr r4, [lr]
	str sb, [fp, #-0x30c]
	str r7, [fp, #-0x308]
	ldr r5, [fp, #-0x30c]
	ldr r1, [fp, #-0x308]
	ldr r6, _030015AC
	ldr r3, _030015B0
	str r4, [fp, #-0x2ec]
	cmp r4, #0
	add r2, r5, r6
	mov r4, #0
	add r0, r1, r3
	str r4, [fp, #-0x2f8]
	str r2, [fp, #-0x30c]
	str r0, [fp, #-0x308]
	str r4, [fp, #-0x2fc]
	beq _03000F88
_03000C2C:
	ldr r5, [fp, #-0x2ec]
	ldr r7, [r5, #0x24]
	str r7, [fp, #-0x64]
	ldr r4, [r5, #0x28]
	str r4, [fp, #-0x60]
	ldr r6, [r5, #0x2c]
	str r6, [fp, #-0x5c]
	ldr r2, [fp, #-0x2f8]
	ldrh r3, [r5, #0x5a]
	cmp r2, #0x7f
	movhi r1, #0
	movls r1, #1
	cmp r3, #0xff
	moveq r1, #0
	andne r1, r1, #1
	cmp r1, #0
	str r3, [fp, #-0x310]
	beq _03000F74
	ldr r7, [fp, #-0x2fc]
	cmp r7, #0x1f
	bhi _03000F74
	lsl r8, r7, #5
	str r8, [fp, #-0x3c4]
_03000C88:
	ldr r1, [fp, #-0x310]
	add lr, r1, r1, lsl #1
	lsl ip, lr, #3
	ldr lr, _030015E4
	add r0, ip, #0x14
	ldr r6, [lr, r0]
	add sl, ip, lr
	ldrh sb, [sl, #6]
	cmp r6, #0
	str sb, [fp, #-0x314]
	beq _03000F34
	ldrsh r0, [lr, ip]
	ldr sl, [fp, #-0x64]
	add r8, r0, sl, asr #8
	ldrsh r7, [r6, #0xe]
	str r8, [fp, #-0x318]
	add sb, ip, lr
	ldrsh r4, [sb, #2]
	ldr r5, [fp, #-0x60]
	add r2, r4, r5, asr #8
	str r2, [fp, #-0x31c]
	ldr r5, [fp, #-0x31c]
	ldrsh r2, [r6, #0x10]
	add r3, r7, r8
	subs r0, r3, #0x78
	add lr, r2, r5
	ldrsh r3, [r6, #0x12]
	ldrsh r8, [r6, #0x14]
	rsbmi r0, r0, #0
	subs r1, lr, #0x50
	rsbmi r1, r1, #0
	add r7, r3, #0x78
	add r4, r8, #0x50
	cmp r0, r7
	cmplt r1, r4
	bge _03000F34
	ldr sl, _030015E4
	ldr r1, _030015E4
	add r4, ip, #8
	add r8, r4, sl
	add r5, ip, #0xc
	ldr r3, [fp, #-0x314]
	ldrh sl, [r8, #2]
	ldrh r8, [r1, r5]
	ands r7, r3, #0x10
	ldr r2, [fp, #-0x314]
	ldrh r5, [r1, r4]
	moveq r0, #0
	movne r0, #0x1000
	cmp r8, #0
	moveq r8, sl
	lsl sb, r2, #8
	and lr, sb, #0x2000
	add r1, sl, r8
	tst r5, #0x8000
	str r7, [fp, #-0x324]
	orr sb, r0, lr
	asr r7, r1, #1
	beq _03000D8C
	lsl r1, r5, #0x11
	lsr r4, r1, #0x11
	lsl r2, r4, #5
	ldr lr, _030015B4
	add r0, r2, #8
	ldr r5, [lr, r0]
_03000D8C:
	ldr lr, _030015E4
	add r4, ip, #0x10
	ldr r0, [lr, r4]
	bl sub_03003EB4
	mov r1, r5
	mov r2, r0
	mov r0, r6
	lsl r4, r2, #0xc
	bl rspr_queue_frame
	ldrh ip, [r6, #2]
	lsl r1, r5, #1
	add lr, r6, ip
	lsl r3, r0, #0x10
	ldrh r5, [r1, lr]
	add r6, r4, r3, lsr #16
	str r6, [fp, #-0x320]
	add ip, lr, r5
	cmp r7, #0x100
	ldrh r6, [lr, r5]
	add r5, ip, #2
	beq _0300271C
	cmp r7, #0x100
	ble _03002644
	mov r4, #0
	cmp r4, r6
	bhs _03000EBC
	ldr sb, [fp, #-0x2fc]
	lsl r7, sb, #9
_03000DFC:
	ldrsb lr, [r5]
	mul r2, r8, lr
	ldrh sb, [r5]
	ldrh r3, [r5, #2]
	lsr r0, sb, #0xe
	lsr ip, r3, #0xe
	ldr r1, _030015E8
	orr lr, ip, r0, lsl #2
	ldr r0, [fp, #-0x31c]
	ldrb ip, [r1, lr]
	add r1, r0, r2, asr #8
	sub r3, r1, ip, lsl #1
	and ip, r3, #0xff
	bic r0, sb, #0xff
	ldr r3, [fp, #-0x2f8]
	orr sb, r0, ip
	ldr ip, [fp, #-0x308]
	orr r2, sb, #0x300
	lsl sb, r3, #3
	strh r2, [sb, ip]
	ldrsb r0, [r5, #2]
	mul r1, sl, r0
	ldr r3, _030015EC
	ldr r2, [fp, #-0x318]
	ldrb r0, [r3, lr]
	ldrh r3, [r5, #2]
	add ip, r2, r1, asr #8
	sub r2, ip, r0, lsl #1
	and ip, r3, #0xfe00
	orr lr, r7, ip
	ldr ip, [fp, #-0x308]
	bic r0, r2, #0xfe00
	orr r2, lr, r0
	add lr, sb, ip
	strh r2, [lr, #2]
	ldr r0, [fp, #-0x320]
	ldrh sb, [r5, #4]
	add r3, sb, r0
	strh r3, [lr, #4]
	ldr r0, [fp, #-0x2f8]
	add r4, r4, #1
	ldr r2, [fp, #-0x30c]
	add r1, r0, #1
	cmp r4, r6
	str r0, [r2, r0, lsl #2]
	add r5, r5, #6
	str r1, [fp, #-0x2f8]
	blo _03000DFC
_03000EBC:
	ldr r7, _030015D8
	ldr r4, [r7, r8, lsl #2]
	ldr r8, [r7, sl, lsl #2]
	ldr sl, [fp, #-0x324]
	ldr r5, [fp, #-0x3c4]
	ldr r6, [fp, #-0x308]
	cmp sl, #0
	lsr r2, r8, #0x10
	add r0, r5, r6
	rsbne lr, r2, #0
	strheq r2, [r0, #6]
	strhne lr, [r0, #6]
	ldr r0, [fp, #-0x314]
	ldr ip, [fp, #-0x3c4]
	ldr r3, [fp, #-0x308]
	lsr r1, r4, #0x10
	tst r0, #0x20
	rsbne sb, r1, #0
	add r0, ip, r3
	strheq r1, [r0, #0x1e]
	strhne sb, [r0, #0x1e]
	mov r2, #0
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x16]
	ldr r4, [fp, #-0x3c4]
	ldr r6, [fp, #-0x2fc]
	add r5, r4, #0x20
	add r1, r6, #1
	str r5, [fp, #-0x3c4]
	str r1, [fp, #-0x2fc]
_03000F34:
	ldr r2, [fp, #-0x310]
	ldr lr, _030015B8
	ldr r7, [fp, #-0x2f8]
	ldrb sl, [lr, r2]
	cmp r7, #0x7f
	movhi r8, #0
	movls r8, #1
	cmp sl, #0xff
	moveq r8, #0
	andne r8, r8, #1
	cmp r8, #0
	str sl, [fp, #-0x310]
	beq _03000F74
	ldr r3, [fp, #-0x2fc]
	cmp r3, #0x1f
	bls _03000C88
_03000F74:
	ldr r0, [fp, #-0x2ec]
	ldr ip, [r0, #0xc]
	cmp ip, #0
	str ip, [fp, #-0x2ec]
	bne _03000C2C
_03000F88:
	ldr r0, _030015E0
	ldr r5, [r0]
	ldrsh r7, [r5, #0x54]
	mov r0, r7
	bl sin_fx
	mov r4, r0
	lsl ip, r4, #0x10
	mov r0, r7
	asr r7, ip, #0x10
	bl cos_fx
	ldrsh sb, [r5, #0x56]
	mov r6, r0
	mov r0, sb
	bl sin_fx
	mov r1, r0
	lsl r2, r1, #0x10
	asr sl, r2, #0x10
	mov r0, sb
	str sl, [fp, #-0x2f0]
	bl cos_fx
	lsl lr, r0, #0x10
	asr sb, lr, #0x10
	str sb, [fp, #-0x2f4]
	ldr sl, [fp, #-0x2f0]
	lsl r4, r6, #0x10
	sub r1, fp, #0x2f4
	ldm r1, {r1, r8}
	asr r3, r4, #0x10
	mul sb, r7, sb
	mul r1, r3, r1
	mul r8, r7, r8
	mul r3, sl, r3
	rsb ip, r7, #0
	rsb r6, sl, #0
	asr r2, lr, #0x14
	asr r4, r4, #0x14
	asr lr, r8, #0x10
	asr r7, ip, #4
	asr r8, r3, #0x10
	asr ip, r6, #4
	asr r6, sb, #0x10
	asr sb, r1, #0x10
	mov r1, #0
	str r1, [fp, #-0x54]
	str r2, [fp, #-0x58]
	str lr, [fp, #-0x48]
	str r4, [fp, #-0x44]
	str ip, [fp, #-0x50]
	str sb, [fp, #-0x30]
	str r8, [fp, #-0x38]
	str r7, [fp, #-0x34]
	str r6, [fp, #-0x40]
	ldr r3, [r5, #0x2c]
	mul r1, ip, r3
	ldr r3, [r5, #0x24]
	mla ip, r2, r3, r1
	asr r0, ip, #8
	rsb r2, r0, #0
	str r2, [fp, #-0x4c]
	ldr ip, [r5, #0x28]
	mul r0, r4, ip
	ldr r1, [r5, #0x24]
	mla r4, lr, r1, r0
	ldr r3, [r5, #0x2c]
	mla lr, r6, r3, r4
	asr ip, lr, #8
	rsb r2, ip, #0
	str r2, [fp, #-0x3c]
	ldr r1, [r5, #0x28]
	mul r0, r7, r1
	ldr r4, [r5, #0x24]
	mla lr, r8, r4, r0
	ldr r3, [r5, #0x2c]
	mla ip, sb, r3, lr
	asr r1, ip, #8
	rsb r2, r1, #0
	str r2, [fp, #-0x2c]
	ldr sb, _030015BC
	ldr r4, [sb]
	ldr r3, [fp, #-0x2f4]
	str r4, [fp, #-0x2ec]
	rsb r0, sl, sl, lsl #3
	ldr sb, [r5, #0x24]
	ldr r4, [r5, #0x2c]
	rsb lr, r3, r3, lsl #3
	ldr ip, [fp, #-0x2ec]
	add r1, sl, r0, lsl #2
	add r0, r3, lr, lsl #2
	cmp ip, #0
	add lr, sb, r1
	add sb, r4, r0
	str lr, [fp, #-0x300]
	str sb, [fp, #-0x304]
	beq _0300123C
_03001100:
	ldr r3, [fp, #-0x2ec]
	ldr sb, [r3, #0x24]
	str sb, [fp, #-0x64]
	ldr ip, [r3, #0x28]
	str ip, [fp, #-0x60]
	ldr r1, [fp, #-0x300]
	ldr lr, [r3, #0x2c]
	ldr r2, [fp, #-0x304]
	subs r3, sb, r1
	rsb r1, r2, lr
	rsbmi r3, r3, #0
	cmp r1, #0
	rsblt r1, r1, #0
	cmp r3, #0x20000
	cmplt r1, #0x20000
	str lr, [fp, #-0x5c]
	bge _03001228
	ldr r6, [fp, #-0x2ec]
	ldrh r5, [r6, #0x5a]
	ldr r6, [fp, #-0x2f8]
	cmp r6, #0x7f
	movhi r4, #0
	movls r4, #1
	cmp r5, #0xff
	moveq r4, #0
	andne r4, r4, #1
	cmp r4, #0
	str r5, [fp, #-0x328]
	beq _03001228
	ldr r7, [fp, #-0x2fc]
	cmp r7, #0x1f
	bhi _03001228
	lsl sl, r7, #5
	lsl r7, r6, #3
	str sl, [fp, #-0x3bc]
	str r7, [fp, #-0x3c0]
_03001190:
	ldr r6, [fp, #-0x328]
	ldr ip, [fp, #-0x328]
	lsl r4, r6, #1
	add r1, r4, ip
	str r4, [fp, #-0x330]
	lsl r6, r1, #3
	ldr r2, _030015E4
	add r3, r6, #0x14
	ldr sb, [r2, r3]
	ldr lr, _030015E4
	str sb, [fp, #-0x32c]
	add r1, r6, #4
	add r0, r1, lr
	cmp sb, #0
	ldrh r7, [r0, #2]
	beq _030011E8
	tst r7, #0x100
	beq _030015F0
	ldr lr, _030015C0
	ldr r0, [lr]
	tst r0, #1
	beq _030015F0
_030011E8:
	ldr r2, [fp, #-0x328]
	ldr r3, _030015B8
	ldr r0, [fp, #-0x2f8]
	ldrb lr, [r3, r2]
	cmp r0, #0x7f
	movhi ip, #0
	movls ip, #1
	cmp lr, #0xff
	moveq ip, #0
	andne ip, ip, #1
	cmp ip, #0
	str lr, [fp, #-0x328]
	beq _03001228
	ldr r4, [fp, #-0x2fc]
	cmp r4, #0x1f
	bls _03001190
_03001228:
	ldr r1, [fp, #-0x2ec]
	ldr sb, [r1, #0xc]
	cmp sb, #0
	str sb, [fp, #-0x2ec]
	bne _03001100
_0300123C:
	ldr r4, [fp, #-0x2f8]
	cmp r4, #0x7f
	bhi _03001404
	ldr r0, _030015C4
	bl sub_03003EB4
	lsl sl, r0, #0x1c
	sub ip, sl, #0x10000
	asr r8, ip, #0x10
	ldr sl, _030015C8
	str r8, [fp, #-0x3b8]
	mov sb, #0
_03001268:
	ldr r8, [sl, #0x18]
	cmp r8, #0
	beq _030013D8
	ldr r0, [sl, #4]
	ldr r5, [fp, #-0x34]
	ldr ip, [fp, #-0x44]
	mul r7, r5, r0
	mul r5, ip, r0
	ldr r3, [fp, #-0x38]
	ldr ip, [sl]
	ldr r0, [sl, #8]
	ldr r4, [fp, #-0x50]
	ldr r1, [fp, #-0x48]
	mla r6, r3, ip, r7
	mul lr, r4, r0
	mla r7, r1, ip, r5
	ldr r4, [fp, #-0x30]
	ldr r2, [fp, #-0x58]
	ldr r1, [fp, #-0x40]
	mla r5, r4, r0, r6
	mla r6, r2, ip, lr
	mla r4, r1, r0, r7
	ldr r2, [fp, #-0x2c]
	ldr r1, [fp, #-0x4c]
	ldr lr, [fp, #-0x3c]
	add r0, r2, r5, asr #8
	add r3, r1, r6, asr #8
	add ip, lr, r4, asr #8
	cmp r0, #0xff
	str r3, [fp, #-0x7c]
	str ip, [fp, #-0x78]
	str r0, [fp, #-0x74]
	ble _030013D8
	ldr lr, _030015D8
	asr r1, r0, #4
	ldr r4, [lr, r1, lsl #2]
	lsl r1, ip, #4
	lsl lr, r3, #4
	smull r0, ip, lr, r4
	smull lr, r3, r1, r4
	rsb lr, r3, #0x50
	rsb r0, ip, #0x78
	cmn lr, #3
	movlt r1, #0
	movge r1, #1
	add r3, r0, #3
	cmp r3, #0xf6
	movhi r1, #0
	andls r1, r1, #1
	cmp r1, #0
	beq _030013D8
	cmp lr, #0xa3
	bgt _030013D8
	ldr r2, [sl, #0x1c]
	and ip, r2, #0xf0
	asr r2, ip, #2
	cmp r2, #0
	moveq r2, #0x10
	beq _0300135C
	cmp r8, r2
	movlt r2, r8
_0300135C:
	lsl r3, r2, #0xa
	smull r1, ip, r3, r4
	add r3, ip, #1
	asr r2, r3, #1
	cmp r2, #0
	ble _030013D8
	ldr ip, [fp, #-0x3b8]
	ldrh r5, [sl, #0x1c]
	ldr r6, [fp, #-0x74]
	sub r7, lr, #4
	cmp r2, #4
	addle ip, ip, r2
	addgt ip, ip, #4
	and r2, r5, #0xf
	ldr r5, [fp, #-0x2f8]
	add ip, ip, r2, lsl #2
	and r2, r7, #0xff
	bic r7, r6, #0xff
	ldr r6, [fp, #-0x308]
	lsl lr, r5, #3
	sub r1, r0, #4
	bic r0, r1, #0xfe00
	add r3, lr, r6
	strh r2, [lr, r6]
	strh r0, [r3, #2]
	strh ip, [r3, #4]
	orr r0, r7, r5
	ldr r7, [fp, #-0x30c]
	str r0, [r7, r5, lsl #2]
	add r5, r5, #1
	str r5, [fp, #-0x2f8]
_030013D8:
	ldr r3, [fp, #-0x2f8]
	add sb, sb, #1
	cmp r3, #0x7f
	movhi lr, #0
	movls lr, #1
	cmp sb, #0x3f
	movgt lr, #0
	andle lr, lr, #1
	cmp lr, #0
	add sl, sl, #0x20
	bne _03001268
_03001404:
	ldr lr, [fp, #-0x2f8]
	cmp lr, #0
	beq _03001530
	mov r8, #1
	sub sl, fp, #0x2e8
	cmp r8, lr
	ldr r6, [fp, #-0x30c]
	mov r7, sl
	bhs _03001528
_03001428:
	ldr sb, [fp, #-0x2f8]
	mov r4, #0
	cmp r4, sb
	bhs _0300150C
_03001438:
	ldr r1, [fp, #-0x2f8]
	add ip, r4, r8
	cmp ip, r1
	mov r2, r8
	rsbhi r2, r4, r1
	add r1, r4, r2
	ldr r5, [fp, #-0x2f8]
	add r0, r1, r8
	cmp r0, r5
	mov ip, r8
	rsbhi ip, r1, r5
	add r3, r4, #1
	cmp r2, #0
	cmpne ip, #0
	ldr r5, [r6, r1, lsl #2]
	ldr lr, [r6, r4, lsl #2]
	mov r0, r3
	add r1, r1, #1
	beq _030014C0
_03001484:
	cmp lr, r5
	strls lr, [r7, r4, lsl #2]
	strhi r5, [r7, r4, lsl #2]
	subls r2, r2, #1
	subhi ip, ip, #1
	ldrls lr, [r6, r3, lsl #2]
	movls r4, r0
	ldrhi r5, [r6, r1, lsl #2]
	movhi r4, r0
	addls r3, r3, #1
	addhi r1, r1, #1
	cmp r2, #0
	cmpne ip, #0
	add r0, r0, #1
	bne _03001484
_030014C0:
	cmp r2, #0
	beq _030014E0
_030014C8:
	str lr, [r7, r4, lsl #2]
	subs r2, r2, #1
	ldr lr, [r6, r3, lsl #2]
	add r4, r4, #1
	add r3, r3, #1
	bne _030014C8
_030014E0:
	cmp ip, #0
	beq _03001500
_030014E8:
	str r5, [r7, r4, lsl #2]
	subs ip, ip, #1
	ldr r5, [r6, r1, lsl #2]
	add r4, r4, #1
	add r1, r1, #1
	bne _030014E8
_03001500:
	ldr r1, [fp, #-0x2f8]
	cmp r4, r1
	blo _03001438
_0300150C:
	ldr lr, [fp, #-0x2f8]
	lsl r8, r8, #1
	mov r2, r6
	cmp r8, lr
	mov r6, r7
	mov r7, r2
	blo _03001428
_03001528:
	cmp r6, sl
	beq _0300157C
_03001530:
	ldr sb, [fp, #-0x2f8]
	cmp sb, #0x7f
	bgt _03001574
	mov r4, #0x1f80000
	add r2, r4, #0xf8
	mvn r1, #0xff
_03001548:
	ldr r0, [fp, #-0x2f8]
	ldr r5, [fp, #-0x308]
	str r2, [r5, r0, lsl #3]
	ldr r6, [fp, #-0x30c]
	orr ip, sb, r1
	str ip, [r6, sb, lsl #2]
	add sb, sb, #1
	add r4, r0, #1
	cmp sb, #0x7f
	str r4, [fp, #-0x2f8]
	ble _03001548
_03001574:
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_0300157C:
	ldr r2, [fp, #-0x2f8]
	mov ip, #0x4000000
	str r6, [ip, #0xd4]
	add sb, ip, #0xd4
	bic r1, r2, #0xc0000000
	ldr ip, [fp, #-0x30c]
	orr r3, r1, #0x84000000
	str ip, [sb, #4]
	str r3, [sb, #8]
	ldr r1, [sb, #8]
	b _03001530
_030015A8:
	.4byte 0x02004380
_030015AC:
	.4byte 0x03005674
_030015B0:
	.4byte 0x02000008
_030015B4:
	.4byte 0x0201AA4C
_030015B8:
	.4byte 0x0201A734
_030015BC:
	.4byte 0x02004384
_030015C0:
	.4byte 0x03005660
_030015C4:
	.4byte gUnk_08638C30
_030015C8:
	.4byte 0x020185AC
_030015CC:
	.4byte gModeFlags
_030015D0:
	.4byte gUnk_08BB4F90
_030015D4:
	.4byte gUnk_080537F0
_030015D8:
	.4byte gUnk_0803F49C
_030015DC:
	.4byte gUnk_08715A68
_030015E0:
	.4byte 0x0200436C
_030015E4:
	.4byte 0x02018F34
_030015E8:
	.4byte gUnk_080537E4
_030015EC:
	.4byte gUnk_080537D8
_030015F0:
	ands r8, r7, #0x80
	beq _03001608
	ldr r2, _030015CC
	ldr sb, [r2]
	tst sb, #0x2000
	bne _030011E8
_03001608:
	ldr r0, _030015E4
	add lr, r6, r0
	ldrsh r2, [lr, #2]
	ldr r5, [fp, #-0x60]
	ldrsh lr, [r0, r1]
	ldr r1, [fp, #-0x5c]
	cmp r8, #0
	add r4, r5, r2, lsl #8
	add r5, r1, lr, lsl #8
	movne r1, #0
	ldrsh r3, [r0, r6]
	ldr ip, [fp, #-0x64]
	str r4, [fp, #-0x6c]
	strne r1, [fp, #-0x6c]
	add sb, ip, r3, lsl #8
	ldr r4, [fp, #-0x34]
	ldr ip, [fp, #-0x6c]
	mul lr, r4, ip
	str sb, [fp, #-0x70]
	ldr r1, [fp, #-0x38]
	ldr r4, [fp, #-0x70]
	str r5, [fp, #-0x68]
	mla r5, r1, r4, lr
	ldr r0, [fp, #-0x30]
	ldr lr, [fp, #-0x68]
	mla sb, r0, lr, r5
	ldr r3, [fp, #-0x2c]
	mov r2, #0x38c00
	add r5, r3, sb, asr #8
	sub sb, r5, #0x1000
	add r1, r2, #0x3fc
	sub r0, sb, #1
	add sb, r1, #2
	cmp r0, sb
	str r5, [fp, #-0x74]
	bhi _030011E8
	ldr r1, [fp, #-0x44]
	mul sl, r1, ip
	ldr r2, [fp, #-0x48]
	ldr ip, [fp, #-0x50]
	mla sb, r2, r4, sl
	mul sl, ip, lr
	ldr r1, [fp, #-0x58]
	ldr r0, [fp, #-0x40]
	mla lr, r0, lr, sb
	mla sb, r1, r4, sl
	ldr ip, [fp, #-0x4c]
	ldr r4, [fp, #-0x3c]
	lsl r3, ip, #4
	lsl sl, r4, #4
	add r2, r3, sb, asr #4
	add ip, sl, lr, asr #4
	ldr sl, _030015E4
	str r2, [fp, #-0x7c]
	str ip, [fp, #-0x78]
	add r1, r6, sl
	ldrh r4, [r1, #0xa]
	ldr sb, _030015D8
	asr lr, r5, #4
	ldr r3, [sb, lr, lsl #2]
	smull lr, sb, r2, r3
	lsl lr, r4, #0xc
	smull r1, r4, lr, r3
	str r4, [fp, #-0x334]
	ldr r2, [fp, #-0x32c]
	ldr r0, [fp, #-0x334]
	ldrsh lr, [r2, #0xe]
	smull r2, r4, ip, r3
	cmp r0, #0x200
	movge r0, #0x200
	mov r1, r0
	mul r1, lr, r1
	rsb r3, r4, #0x50
	bic r2, r5, #0xff
	rsb ip, sb, #0x78
	str r0, [fp, #-0x334]
	str r3, [fp, #-0x33c]
	str ip, [fp, #-0x338]
	str r2, [fp, #-0x340]
	ldr r0, [fp, #-0x32c]
	rsbs lr, sb, r1, asr #8
	ldrsh r4, [r0, #0x10]
	ldr sb, [fp, #-0x334]
	mul sb, r4, sb
	ldr r3, [fp, #-0x33c]
	add r5, r3, sb, asr #8
	rsbmi lr, lr, #0
	subs ip, r5, #0x50
	ldr r5, [fp, #-0x32c]
	ldr r4, [fp, #-0x334]
	ldrsh r1, [r5, #0x14]
	ldrsh r2, [r5, #0x12]
	ldr sb, [fp, #-0x334]
	mul r4, r2, r4
	mul sb, r1, sb
	asr r1, r4, #8
	asr r0, sb, #8
	rsbmi ip, ip, #0
	cmp r0, #2
	cmple r1, #2
	ble _030011E8
	add sb, r1, #0x78
	cmp lr, sb
	bge _030011E8
	add lr, r0, #0x50
	cmp ip, lr
	bge _030011E8
	ldr ip, [fp, #-0x334]
	cmp ip, #0xbf
	bgt _030017FC
	ldrh r6, [r5, #4]
	cmp r6, #0
	beq _030017FC
_030017CC:
	ldr r4, [fp, #-0x334]
	lsl r3, r4, #1
	ldr r5, [fp, #-0x32c]
	str r3, [fp, #-0x334]
	ldrh r0, [r5, #4]
	cmp r3, #0xbf
	add ip, r5, r0, lsl #4
	str ip, [fp, #-0x32c]
	bgt _030017FC
	ldrh sl, [ip, #4]
	cmp sl, #0
	bne _030017CC
_030017FC:
	ldr r6, _030015D8
	ldr sb, [fp, #-0x334]
	ldr r2, [r6, sb, lsl #2]
	tst r7, #2
	lsr r1, r2, #8
	str r1, [fp, #-0x344]
	beq _030021A8
	ldr lr, [fp, #-0x33c]
	rsb r5, lr, #0x50
	mul r8, r5, r5
	ldr r7, [fp, #-0x338]
	sub r4, r7, #0x78
	mla r0, r4, r4, r8
	cmp r0, #0x40
	ble _0300214C
	bl isqrt
	ldr ip, [r6, r0, lsl #2]
	mov r1, #0x100
	lsr lr, ip, #4
	mul sl, lr, r5
	mul r6, lr, r4
	bl atan2_fx
	mov r3, r0
	lsl r0, r3, #0x10
	asr r7, r0, #0x10
	mov r0, r7
	bl sin_fx
	mov r2, r0
	mov r0, r7
	lsl sb, r2, #0x10
	bl cos_fx
	asr r5, r6, #0x14
	mul lr, r5, r5
	asr r6, sl, #0x14
	mul sl, r5, r6
	asr r7, sb, #0x10
	lsl r0, r0, #0x10
	rsb r4, r6, #0
	mul sb, r6, r6
	asr ip, r0, #0x10
	mul r4, r7, r4
	rsb r8, ip, #0x1000
	lsl r1, lr, #0xc
	mul lr, ip, lr
	mul sl, r8, sl
	mla r1, ip, sb, r1
	str r4, [fp, #-0x360]
	str lr, [fp, #-0x358]
	ldr lr, [fp, #-0x360]
	ldr r4, [fp, #-0x48]
	asr ip, sl, #0x14
	str ip, [fp, #-0xdc]
	rsb r8, r5, #0
	asr ip, lr, #0xc
	str ip, [fp, #-0xcc]
	mul lr, r7, r8
	mul r8, r7, r5
	mul r7, r6, r7
	mov r5, ip
	ldr r6, [fp, #-0xdc]
	mul ip, r4, ip
	mul r6, r4, r6
	str r1, [fp, #-0x35c]
	ldr r3, [fp, #-0x35c]
	ldr r1, [fp, #-0x40]
	asr sl, r3, #0x14
	rsb r2, r1, #0
	str sl, [fp, #-0xd8]
	mul r5, r2, r5
	mul sl, r2, sl
	str ip, [fp, #-0x378]
	ldr ip, [fp, #-0xdc]
	str r6, [fp, #-0x364]
	mul ip, r2, ip
	ldr r6, [fp, #-0xd8]
	mul r6, r4, r6
	ldr r2, [fp, #-0x358]
	ldr r3, [fp, #-0x50]
	add r4, r2, sb, lsl #12
	asr sb, lr, #0xc
	str sb, [fp, #-0xe0]
	asr sb, r7, #0xc
	asr r7, r8, #0xc
	ldr r8, [fp, #-0xdc]
	rsb r3, r3, #0
	str r7, [fp, #-0xd0]
	mov lr, r7
	ldr r2, [fp, #-0x58]
	mla r8, r3, r8, sl
	asr r4, r4, #0x14
	mla lr, r3, lr, r5
	ldr sl, [fp, #-0xd0]
	ldr r5, [fp, #-0x378]
	str sb, [fp, #-0xd4]
	ldr r1, [fp, #-0x34]
	str r4, [fp, #-0xe8]
	mov r7, r4
	mla r7, r3, r7, ip
	mla sl, r2, sl, r5
	ldr ip, [fp, #-0x364]
	ldr r4, [fp, #-0xe8]
	ldr r3, [fp, #-0xdc]
	ldr r5, [fp, #-0xd4]
	rsb r1, r1, #0
	mla r4, r2, r4, ip
	mla r3, r2, r3, r6
	mul r5, r1, r5
	str sl, [fp, #-0x37c]
	str r4, [fp, #-0x368]
	str r3, [fp, #-0x36c]
	ldr r4, [fp, #-0xe0]
	str r5, [fp, #-0x370]
	ldr ip, [fp, #-0x30]
	asr sb, r0, #0x14
	mla lr, ip, sb, lr
	mul sl, r1, sb
	mul r4, r1, r4
	ldr r6, [fp, #-0x38]
	rsb r2, r6, #0
	ldr r6, [fp, #-0xd4]
	ldr r1, [fp, #-0x44]
	mla r6, ip, r6, r8
	str lr, [fp, #-0x380]
	ldr r5, [fp, #-0xe0]
	ldr lr, [fp, #-0x368]
	ldr r8, [fp, #-0xcc]
	ldr r3, [fp, #-0xe0]
	mla r5, ip, r5, r7
	mla r8, r1, r8, sl
	mla r3, r2, r3, lr
	ldr sl, [fp, #-0x36c]
	ldr r7, [fp, #-0x37c]
	ldr ip, [fp, #-0xdc]
	ldr lr, [fp, #-0xd4]
	mla ip, r1, ip, r4
	mla lr, r2, lr, sl
	mla r7, r2, sb, r7
	ldr r4, [fp, #-0x370]
	ldr r2, [fp, #-0xd8]
	mla r2, r1, r2, r4
	asr ip, ip, #8
	ldr r1, [fp, #-0x380]
	str ip, [fp, #-0xc0]
	ldr ip, [fp, #-0xdc]
	asr r4, r2, #8
	asr r3, r3, #8
	asr r5, r5, #8
	asr lr, lr, #8
	asr r6, r6, #8
	asr r7, r7, #8
	asr r2, r8, #8
	asr sl, r1, #8
	str r3, [fp, #-0xc4]
	str r5, [fp, #-0xbc]
	str lr, [fp, #-0xb8]
	str r4, [fp, #-0xb4]
	str r6, [fp, #-0xb0]
	str r7, [fp, #-0xac]
	str r2, [fp, #-0xa8]
	str sl, [fp, #-0xa4]
	str ip, [fp, #-0xe4]
	str sb, [fp, #-0xc8]
_03001A84:
	ldr r0, [fp, #-0x2ec]
	ldrsh r6, [r0, #0x54]
	mov r0, r6
	bl sin_fx
	sub lr, fp, #0x300
	strh r0, [lr, #-0x84]
	sub sb, fp, #0x300
	ldrh r3, [sb, #-0x84]
	mov r0, r6
	lsl sb, r3, #0x10
	str sb, [fp, #-0x388]
	bl cos_fx
	ldr sl, [fp, #-0x2ec]
	ldrsh r5, [sl, #0x56]
	mov r8, r0
	lsl ip, r8, #0x10
	mov r0, r5
	asr r8, ip, #0x10
	bl sin_fx
	mov r7, r0
	lsl r2, r7, #0x10
	asr r4, r2, #0x10
	mov r0, r5
	str r4, [fp, #-0x2f0]
	bl cos_fx
	ldrsh r5, [sl, #0x58]
	mov r1, r0
	lsl lr, r1, #0x10
	asr ip, lr, #0x10
	mov r0, r5
	str ip, [fp, #-0x2f4]
	bl sin_fx
	mov r7, r0
	mov r0, r5
	bl cos_fx
	ldr r2, [fp, #-0x2f0]
	asr r4, sb, #0x10
	mul r2, r4, r2
	lsl sl, r7, #0x10
	lsl r3, r0, #0x10
	asr sb, sl, #0x10
	asr sl, r3, #0x10
	mul r5, sl, r8
	asr r1, r2, #0xc
	mul r6, sl, r1
	ldr lr, [fp, #-0x2f4]
	mul lr, r4, lr
	ldr r4, [fp, #-0xb4]
	ldr r7, [fp, #-0x2f4]
	str r4, [fp, #-0x3a0]
	asr r4, r5, #0x10
	ldr r5, [fp, #-0x3a0]
	mla r7, sb, r7, r6
	mul r5, r4, r5
	ldr ip, [fp, #-0xc0]
	ldr r2, [fp, #-0x2f0]
	asr r6, lr, #0xc
	str ip, [fp, #-0x394]
	mul r0, sl, r6
	mul r1, sb, r1
	mul r2, sb, r2
	ldr lr, [fp, #-0x394]
	mul lr, r4, lr
	ldr r3, [fp, #-0xb8]
	asr ip, r7, #0x10
	mov r7, r3
	mla r7, ip, r7, r5
	str r1, [fp, #-0x38c]
	rsb r1, r0, r2
	ldr r2, [fp, #-0xc4]
	str r2, [fp, #-0x390]
	mla r2, ip, r2, lr
	ldr r5, [fp, #-0xb0]
	asr r0, r1, #0x10
	str r5, [fp, #-0x3a4]
	mla r5, r0, r5, r7
	ldr lr, [fp, #-0xbc]
	mov r1, lr
	mla r1, r0, r1, r2
	asr r7, r5, #4
	str lr, [fp, #-0x398]
	mov r5, r7
	mul lr, sb, r6
	mul r5, r7, r5
	ldr r2, [fp, #-0xa8]
	mov r6, r2
	mul r6, r4, r6
	str r7, [fp, #-0x354]
	asr r7, r1, #4
	mul r1, sb, r8
	ldr sb, [fp, #-0xac]
	str r2, [fp, #-0x3ac]
	str sb, [fp, #-0x3a8]
	ldr r2, [fp, #-0x2f0]
	ldr sb, [fp, #-0x2f4]
	str r7, [fp, #-0x350]
	str r3, [fp, #-0x39c]
	mul r2, r8, r2
	ldr r3, [fp, #-0x2f4]
	mul r8, sb, r8
	ldr r7, [fp, #-0x2f0]
	ldr sb, [fp, #-0x350]
	mul r3, sl, r3
	mla r7, sl, r7, lr
	mov sl, sb
	mla sb, sl, sb, r5
	ldr lr, [fp, #-0x3a8]
	mla lr, ip, lr, r6
	ldr r5, [fp, #-0xa4]
	ldr r6, [fp, #-0x38c]
	str sb, [fp, #-0x3b4]
	rsb sl, r1, #0
	str r5, [fp, #-0x3b0]
	rsb sb, r6, r3
	ldr r3, [fp, #-0x388]
	rsb r2, r2, #0
	asr r1, sl, #0x10
	ldr sl, [fp, #-0x3b4]
	asr r5, sb, #0x10
	asr sb, r2, #0x10
	asr r2, r3, #0x14
	ldr r3, [fp, #-0x3b0]
	asr r7, r7, #0x10
	asr r6, r8, #0x10
	cmp sl, #0x60000
	mla r3, r0, r3, lr
	str r5, [fp, #-0xa0]
	str ip, [fp, #-0x94]
	str sb, [fp, #-0x88]
	str r1, [fp, #-0x9c]
	str r4, [fp, #-0x90]
	str r2, [fp, #-0x84]
	str r7, [fp, #-0x98]
	str r0, [fp, #-0x8c]
	str r6, [fp, #-0x80]
	bge _03002004
	cmp r3, #0
	blt _03001F90
	ldr r2, [fp, #-0x394]
	mul r2, r1, r2
	ldr r4, [fp, #-0x3a0]
	ldr r6, [fp, #-0x390]
	mul r4, r1, r4
	mla r6, r5, r6, r2
	ldr ip, [fp, #-0x39c]
	ldr r3, [fp, #-0x398]
	mla ip, r5, ip, r4
	mla r3, r7, r3, r6
	ldr sl, [fp, #-0x3a4]
	mla sl, r7, sl, ip
	asr r6, r3, #4
	mul lr, r6, r6
	asr r0, sl, #4
	rsb r4, r0, #0
	mla r0, r4, r4, lr
	bl isqrt
	ldr sb, _030015D8
	ldr r2, [sb, r0, lsl #2]
	lsr r7, r2, #4
	mul ip, r7, r4
	mul r7, r6, r7
	asr sb, ip, #0x14
	asr sl, r7, #0x14
	rsb r5, sb, #0
	mov r1, #0
	str r5, [fp, #-0x348]
_03001D1C:
	str sl, [fp, #-0x34c]
_03001D20:
	lsl r7, r1, #0x10
	lsr r4, r7, #0x10
	cmp r4, #0xff
	bls _03001D48
	ldr r6, _030015D0
	ldr r0, _030015D4
	mov r1, r4
	ldr ip, [r6]
	mov lr, pc
	bx ip
_03001D48:
	ldr r1, [fp, #-0x32c]
	ldrh r3, [r1, #2]
	lsl r0, r4, #1
	add r6, r1, r3
	ldrh r5, [r0, r6]
	add r1, r6, r5
	ldrsb ip, [r1, #2]
	mul lr, sl, ip
	mul r4, sb, ip
	add r6, r1, #2
	ldrsb r2, [r6, #2]
	ldr r0, [fp, #-0x348]
	ldr r5, [fp, #-0x34c]
	mla r0, r2, r0, lr
	mla r5, r2, r5, r4
	ldr ip, [fp, #-0x334]
	ldr r4, [fp, #-0x334]
	mul ip, r5, ip
	mul r4, r0, r4
	ldrh r5, [r1, #2]
	ldrh r2, [r6, #2]
	ldr r3, [fp, #-0x2ec]
	ldr lr, [fp, #-0x334]
	ldrsb r1, [r3, #0x95]
	ldrsb r0, [r3, #0x97]
	lsr r2, r2, #0xe
	lsr r3, r5, #0xe
	cmp lr, #0x100
	orr lr, r2, r3, lsl #2
	ldr r2, [fp, #-0x338]
	add r3, r2, r1
	ldr r1, [fp, #-0x33c]
	add r2, r1, r0
	str r3, [fp, #-0x338]
	str r2, [fp, #-0x33c]
	asr ip, ip, #0x10
	asr r3, r4, #0x10
	ble _03001F20
	ldr r4, _030015E8
	ldr r0, [fp, #-0x33c]
	ldrb r1, [r4, lr]
	add r2, r3, r0
	sub r0, r2, r1, lsl #1
	bic r4, r5, #0xff
	and r2, r0, #0xff
	orr r0, r4, r2
	orr r5, r0, #0x300
	ldr r1, [fp, #-0x3c0]
	ldr r0, [fp, #-0x308]
	ldr r4, _030015EC
	strh r5, [r1, r0]
	ldr r3, [fp, #-0x338]
	ldrb r1, [r4, lr]
	ldrh r5, [r6, #2]
	add r2, ip, r3
	sub r4, r2, r1, lsl #1
	ldr r1, [fp, #-0x2fc]
	and lr, r5, #0xfe00
	ldr r5, [fp, #-0x3c0]
	orr ip, lr, r1, lsl #9
	bic r1, r4, #0xfe00
	orr lr, ip, r1
	add r4, r5, r0
	strh lr, [r4, #2]
_03001E48:
	ldr r3, [fp, #-0x330]
	ldr ip, [fp, #-0x328]
	add lr, r3, ip
	lsl r0, lr, #3
	ldr r1, _030015E4
	add r4, r0, #0x10
	ldr r0, [r1, r4]
	bl sub_03003EB4
	ldrh r2, [r6, #4]
	mov r5, r0
	lsr r1, r7, #0x10
	ldr r0, [fp, #-0x32c]
	add r4, r2, r5, lsl #12
	bl rspr_queue_frame
	ldr r7, [fp, #-0x344]
	ldr r2, [fp, #-0x344]
	ldr r5, [fp, #-0x348]
	mov r1, r7
	mul r2, sl, r2
	mul r5, r7, r5
	mul r1, sb, r1
	ldr lr, [fp, #-0x34c]
	mul lr, r7, lr
	ldr r3, [fp, #-0x340]
	ldr r7, [fp, #-0x2f8]
	ldr ip, [fp, #-0x30c]
	orr sb, r3, r7
	str sb, [ip, r7, lsl #2]
	ldr sl, [fp, #-0x3c0]
	ldr r6, [fp, #-0x308]
	add r0, r0, r4
	ldr r4, [fp, #-0x3bc]
	asr r3, r5, #0x10
	add sb, r4, r6
	asr r5, r1, #0x10
	asr r1, r2, #0x10
	add r2, sl, r6
	add r6, r7, #1
	ldr r4, [fp, #-0x2fc]
	str r6, [fp, #-0x2f8]
	add r6, sl, #8
	ldr sl, [fp, #-0x3bc]
	asr ip, lr, #0x10
	add r7, sl, #0x20
	add sl, r4, #1
	str r6, [fp, #-0x3c0]
	str r7, [fp, #-0x3bc]
	str sl, [fp, #-0x2fc]
	strh r0, [r2, #4]
	strh r1, [sb, #0x1e]
	strh ip, [sb, #6]
	strh r3, [sb, #0xe]
	strh r5, [sb, #0x16]
	b _030011E8
_03001F20:
	ldr r0, _030015E8
	ldr r4, [fp, #-0x33c]
	ldrb r1, [r0, lr]
	add r2, r3, r4
	rsb r4, r1, r2
	bic r0, r5, #0xff
	and r2, r4, #0xff
	orr r4, r0, r2
	ldr r5, [fp, #-0x308]
	ldr r0, [fp, #-0x3c0]
	orr r1, r4, #0x100
	strh r1, [r0, r5]
	ldr r4, _030015EC
	ldrh r5, [r6, #2]
	ldr r3, [fp, #-0x338]
	ldrb r0, [r4, lr]
	ldr lr, [fp, #-0x2fc]
	add r2, ip, r3
	and r1, r5, #0xfe00
	orr ip, r1, lr, lsl #9
	ldr r5, [fp, #-0x308]
	ldr lr, [fp, #-0x3c0]
	rsb r4, r0, r2
	bic r0, r4, #0xfe00
	orr r1, ip, r0
	add r3, lr, r5
	strh r1, [r3, #2]
	b _03001E48
_03001F90:
	ldr sl, [fp, #-0x394]
	mul sl, r1, sl
	ldr r1, [fp, #-0x394]
	ldr r0, [fp, #-0x390]
	mul r2, r1, r2
	mla r0, r5, r0, sl
	ldr r4, [fp, #-0x390]
	ldr r3, [fp, #-0x398]
	mla r4, sb, r4, r2
	mla r3, r7, r3, r0
	ldr lr, [fp, #-0x398]
	mla lr, r6, lr, r4
	asr r7, r3, #4
	mul sb, r7, r7
	asr r6, lr, #8
	rsb sl, r6, #0
	mla r0, sl, sl, sb
	bl isqrt
	ldr ip, _030015D8
	ldr r2, [ip, r0, lsl #2]
	lsr r4, r2, #4
	mul r5, r4, sl
	mul r4, r7, r4
	asr sb, r5, #0x14
	rsb r1, sb, #0
	asr sl, r4, #0x14
	str r1, [fp, #-0x348]
	mov r1, #0xff
	b _03001D1C
_03002004:
	ldr r0, [fp, #-0x3b4]
	rsb r7, r3, #0
	bl isqrt
	ldr r3, _030015D8
	ldr sl, [r3, r0, lsl #2]
	sub r5, fp, #0x354
	ldm r5, {r5, lr}
	lsr sb, sl, #4
	mul r5, sb, r5
	mul lr, sb, lr
	asr sl, r5, #0x14
	asr sb, lr, #0x14
	eor r1, sl, sl, asr #31
	sub r1, r1, sl, asr #31
	eor r8, sb, sb, asr #31
	sub r8, r8, sb, asr #31
	cmp r1, r8
	ble _03002134
	mul r0, r7, sl
	cmp sl, #0
	asr r7, r0, #0xc
	ldr r8, [fp, #-0x354]
	blt _0300212C
_03002060:
	ldr r1, [fp, #-0x9c]
	ldr r4, [fp, #-0x3ac]
	ldr r3, [fp, #-0x84]
	mul r4, r1, r4
	ldr r5, [fp, #-0x3ac]
	mul r5, r3, r5
	ldr r2, [fp, #-0xa0]
	ldr r6, [fp, #-0x3a8]
	ldr lr, [fp, #-0x88]
	mla r6, r2, r6, r4
	ldr r2, [fp, #-0x3a8]
	mla r2, lr, r2, r5
	ldr r0, [fp, #-0x98]
	ldr ip, [fp, #-0x3b0]
	ldr r1, [fp, #-0x80]
	ldr r4, [fp, #-0x3b0]
	cmp r8, #0
	rsblt r8, r8, #0
	mla r4, r1, r4, r2
	mlas ip, r0, ip, r6
	rsb r6, sb, #0
	str ip, [fp, #-0x2f0]
	str r4, [fp, #-0x2f4]
	str r6, [fp, #-0x348]
	str sl, [fp, #-0x34c]
	bmi _03002110
_030020C8:
	mov r1, r8
	mov r0, r7
	bl atan2_fx
	mov r7, r0
	add ip, r7, #0x4100
	lsr r0, ip, #9
	and lr, r0, #0x7f
	ldr r1, [fp, #-0x2f4]
	ldr r0, [fp, #-0x2f0]
	add r5, lr, lr, lsl #6
	bl atan2_fx
	add r1, r0, #0x100
	lsr r2, r1, #9
	and r3, r2, #0x7f
	ldr r6, _030015DC
	add r7, r5, r3
	ldrb r1, [r6, r7]
	b _03001D20
_03002110:
	ldr ip, [fp, #-0x2f0]
	rsb r5, sl, #0
	rsb lr, ip, #0
	str lr, [fp, #-0x2f0]
	str sb, [fp, #-0x348]
	str r5, [fp, #-0x34c]
	b _030020C8
_0300212C:
	rsb r7, r7, #0
	b _03002060
_03002134:
	mul ip, r7, sb
	cmp sb, #0
	asr r7, ip, #0xc
	ldr r8, [fp, #-0x350]
	rsblt r7, r7, #0
	b _03002060
_0300214C:
	ldr sb, [fp, #-0x38]
	ldr r2, [fp, #-0x50]
	ldr r1, [fp, #-0x40]
	ldr r0, [fp, #-0x34]
	sub ip, fp, #0x58
	ldm ip, {ip, lr}
	sub r5, fp, #0x48
	ldm r5, {r5, r6}
	ldr r8, [fp, #-0x30]
	rsb r7, sb, #0
	rsb r4, r2, #0
	rsb sl, r1, #0
	rsb sb, r0, #0
	str ip, [fp, #-0xc4]
	str lr, [fp, #-0xc0]
	str r4, [fp, #-0xbc]
	str r5, [fp, #-0xb8]
	str r6, [fp, #-0xb4]
	str sl, [fp, #-0xb0]
	str r7, [fp, #-0xac]
	str sb, [fp, #-0xa8]
	str r8, [fp, #-0xa4]
	b _03001A84
_030021A8:
	ldr r1, [fp, #-0x330]
	ldr r5, [fp, #-0x328]
	ldr r4, _030015E4
	add r2, r1, r5
	lsl r1, r2, #3
	add sb, r1, r4
	ldrh r6, [sb, #6]
	ldr sl, [fp, #-0x340]
	cmp r8, #0
	movne sl, #0x10000
	tst r6, #0x200
	movne sl, #0
	tst r7, #1
	str sl, [fp, #-0x340]
	beq _0300260C
	ldr r4, _030015E0
	ldr r2, [fp, #-0x2ec]
	ldr r1, [r4]
	ldr r5, [r2, #0x24]
	ldr r6, [r2, #0x2c]
	ldr sb, [r1, #0x24]
	ldr sl, [r1, #0x2c]
	rsb r0, r5, sb
	rsb r1, r6, sl
	bl atan2_fx
	ldr r3, [fp, #-0x2ec]
	ldrh ip, [r3, #0x56]
	rsb lr, r0, ip
	sub r0, lr, #0x7c00
	lsl r4, r0, #5
	and r2, r4, #0x1f0000
_03002224:
	ldr lr, [fp, #-0x330]
	ldr r6, [fp, #-0x328]
	add sl, lr, r6
	lsl r0, sl, #3
	ldr sl, _030015E4
	add r5, r0, #0x10
	ldr r0, [sl, r5]
	lsr sb, r2, #0x10
	bl sub_03003EB4
	mov r1, sb
	mov ip, r0
	ldr r0, [fp, #-0x32c]
	lsl r5, ip, #0xc
	bl rspr_queue_frame
	ldr r3, [fp, #-0x32c]
	ldrh r4, [r3, #2]
	lsl r1, sb, #1
	add r2, r3, r4
	ldrh sb, [r1, r2]
	ldr r4, [fp, #-0x334]
	add lr, r0, r5
	lsl ip, lr, #0x10
	cmp r4, #0x100
	add r1, r2, sb
	ldrh r4, [r2, sb]
	asr r0, ip, #0x10
	add r5, r1, #2
	beq _030024FC
	ldr r6, [fp, #-0x334]
	cmp r6, #0x100
	ble _03002414
	mov r6, #0
	cmp r6, r4
	bge _03002394
	ldr lr, [fp, #-0x2fc]
	lsl r8, r0, #0x10
	lsr sl, r8, #0x10
	lsl r8, lr, #9
_030022BC:
	ldrsb lr, [r5]
	ldr ip, [fp, #-0x334]
	mul ip, lr, ip
	ldrh r2, [r5]
	ldrh r3, [r5, #2]
	lsr r1, r2, #0xe
	lsr r0, r3, #0xe
	ldr sb, _030015E8
	orr lr, r0, r1, lsl #2
	ldr r1, [fp, #-0x33c]
	ldrb r3, [sb, lr]
	add sb, r1, ip, asr #8
	sub r0, sb, r3, lsl #1
	and r3, r0, #0xff
	bic sb, r2, #0xff
	orr ip, sb, r3
	ldr r3, [fp, #-0x3c0]
	ldr sb, [fp, #-0x308]
	orr r0, ip, #0x300
	strh r0, [r3, sb]
	ldr r0, [fp, #-0x334]
	ldrsb r2, [r5, #2]
	mul r0, r2, r0
	ldr ip, _030015EC
	ldr r1, [fp, #-0x338]
	ldrh r2, [r5, #2]
	ldrb sb, [ip, lr]
	add r3, r1, r0, asr #8
	sub ip, r3, sb, lsl #1
	ldr r1, [fp, #-0x3c0]
	and sb, r2, #0xfe00
	ldr r2, [fp, #-0x308]
	bic lr, ip, #0xfe00
	orr r0, r8, sb
	orr sb, r0, lr
	add r0, r1, r2
	strh sb, [r0, #2]
	ldrh ip, [r5, #4]
	ldr sb, [fp, #-0x2f8]
	ldr r1, [fp, #-0x340]
	add r3, sl, ip
	strh r3, [r0, #4]
	orr lr, r1, sb
	ldr r1, [fp, #-0x30c]
	str lr, [r1, sb, lsl #2]
	ldr r0, [fp, #-0x3c0]
	add r6, r6, #1
	add r2, r0, #8
	add ip, sb, #1
	cmp r6, r4
	add r5, r5, #6
	str r2, [fp, #-0x3c0]
	str ip, [fp, #-0x2f8]
	blt _030022BC
_03002394:
	ldr r6, [fp, #-0x344]
	asr r0, r6, #8
	str r0, [fp, #-0x344]
	tst r7, #0x10
	ldr r5, [fp, #-0x3bc]
	ldr r4, [fp, #-0x308]
	subeq r1, fp, #0x300
	ldrheq ip, [r1, #-0x44]
	add r2, r5, r4
	rsbne sb, r0, #0
	strhne sb, [r2, #6]
	strheq ip, [r2, #6]
	ldr r5, [fp, #-0x3bc]
	ldr r6, [fp, #-0x308]
	mov r0, #0
	add r2, r5, r6
	strh r0, [r2, #0xe]
	strh r0, [r2, #0x16]
	tst r7, #0x20
	ldrne r7, [fp, #-0x344]
	subeq r3, fp, #0x300
	ldrheq sl, [r3, #-0x44]
	rsbne lr, r7, #0
	strhne lr, [r2, #0x1e]
	strheq sl, [r2, #0x1e]
	ldr r1, [fp, #-0x3bc]
	ldr r4, [fp, #-0x2fc]
	add sb, r1, #0x20
	add r2, r4, #1
	str sb, [fp, #-0x3bc]
	str r2, [fp, #-0x2fc]
	b _030011E8
_03002414:
	cmp r4, #0
	beq _03002394
	ldr sl, [fp, #-0x2fc]
	lsl r6, r0, #0x10
	lsr r8, r6, #0x10
	lsl r6, sl, #9
_0300242C:
	ldrsb lr, [r5]
	ldr ip, [fp, #-0x334]
	mul ip, lr, ip
	ldrh sb, [r5]
	ldrh r3, [r5, #2]
	lsr sl, sb, #0xe
	lsr r0, r3, #0xe
	ldr r2, _030015E8
	ldr r1, [fp, #-0x33c]
	orr lr, r0, sl, lsl #2
	ldrb sl, [r2, lr]
	add r2, r1, ip, asr #8
	rsb r3, sl, r2
	and r0, r3, #0xff
	bic sl, sb, #0xff
	orr ip, sl, r0
	orr sb, ip, #0x100
	ldr sl, [fp, #-0x3c0]
	ldr ip, [fp, #-0x308]
	strh sb, [sl, ip]
	ldr r0, [fp, #-0x334]
	ldrsb r2, [r5, #2]
	mul r0, r2, r0
	ldr r3, _030015EC
	ldr r1, [fp, #-0x338]
	ldrh r2, [r5, #2]
	ldrb sb, [r3, lr]
	add r3, r1, r0, asr #8
	rsb lr, sb, r3
	and sb, r2, #0xfe00
	bic r0, lr, #0xfe00
	orr r2, r6, sb
	orr sb, r2, r0
	add r0, sl, ip
	strh sb, [r0, #2]
	ldrh r1, [r5, #4]
	add r3, r8, r1
	ldr sb, [fp, #-0x2f8]
	ldr sl, [fp, #-0x340]
	strh r3, [r0, #4]
	ldr r0, [fp, #-0x30c]
	orr lr, sl, sb
	str lr, [r0, sb, lsl #2]
	ldr ip, [fp, #-0x3c0]
	add sl, sb, #1
	add r2, ip, #8
	subs r4, r4, #1
	add r5, r5, #6
	str r2, [fp, #-0x3c0]
	str sl, [fp, #-0x2f8]
	bne _0300242C
	b _03002394
_030024FC:
	tst r7, #0x10
	movne r1, #0x1000
	moveq r1, #0
	tst r7, #0x20
	beq _030025FC
	cmp r1, #0
	movne r2, #0x3000
	moveq r2, #0x2000
_0300251C:
	mov lr, #0
	cmp lr, r4
	bge _030011E8
	lsl r1, r0, #0x10
	mov r7, r2
	lsr r6, r1, #0x10
_03002534:
	ldrh sb, [r5]
	ldrh sl, [r5, #2]
	lsr r1, sb, #0xe
	lsr r3, sl, #0xe
	ldr r0, _030015E8
	orr sl, r3, r1, lsl #2
	ldrsb r3, [r5]
	ldr r1, [fp, #-0x33c]
	ldrb r2, [r0, sl]
	add r0, r3, r1
	rsb r3, r2, r0
	bic r1, sb, #0xff
	and sb, r3, #0xff
	orr r2, r1, sb
	ldr sb, [fp, #-0x3c0]
	ldr r1, [fp, #-0x308]
	strh r2, [sb, r1]
	ldr r2, _030015EC
	ldrsb r0, [r5, #2]
	ldr r3, [fp, #-0x338]
	ldrh ip, [r5, #2]
	ldrb sb, [r2, sl]
	add r2, r0, r3
	rsb sl, sb, r2
	ldr r0, [fp, #-0x3c0]
	ldr r3, [fp, #-0x308]
	eor sb, r7, ip
	bic r1, sl, #0xfe00
	and ip, sb, #0xfe00
	orr sb, ip, r1
	add r1, r0, r3
	strh sb, [r1, #2]
	ldrh sl, [r5, #4]
	add r2, r6, sl
	ldr sb, [fp, #-0x2f8]
	ldr sl, [fp, #-0x340]
	strh r2, [r1, #4]
	ldr r1, [fp, #-0x30c]
	orr r0, sl, sb
	str r0, [r1, sb, lsl #2]
	ldr ip, [fp, #-0x3c0]
	add lr, lr, #1
	add r3, ip, #8
	add r2, sb, #1
	cmp lr, r4
	add r5, r5, #6
	str r3, [fp, #-0x3c0]
	str r2, [fp, #-0x2f8]
	blt _03002534
	b _030011E8
_030025FC:
	cmp r1, #0
	movne r2, #0x1000
	moveq r2, #0
	b _0300251C
_0300260C:
	add lr, r1, #8
	ldrsh r0, [r4, lr]
	lsl r2, r0, #0x10
	cmp r2, #0
	lsr r3, r2, #0x10
	bge _03002224
	lsl r2, r3, #0x11
	lsr r5, r2, #0x11
	lsl sb, r5, #5
	ldr sl, _030027E4
	add r6, sb, #8
	ldrsh ip, [sl, r6]
	lsl r2, ip, #0x10
	b _03002224
_03002644:
	mov r4, #0
	cmp r4, r6
	bhs _03000EBC
	ldr r2, [fp, #-0x2fc]
	lsl r7, r2, #9
_03002658:
	ldrsb r1, [r5]
	mul r2, r8, r1
	ldrh sb, [r5, #2]
	ldrh r1, [r5]
	lsr ip, sb, #0xe
	lsr r3, r1, #0xe
	ldr r0, _030027E8
	orr sb, ip, r3, lsl #2
	ldrb ip, [r0, sb]
	ldr r0, [fp, #-0x31c]
	add r3, r0, r2, asr #8
	rsb r2, ip, r3
	and r0, r2, #0xff
	bic r3, r1, #0xff
	orr ip, r3, r0
	ldr r0, [fp, #-0x2f8]
	ldr r2, [fp, #-0x308]
	orr r3, ip, #0x100
	lsl ip, r0, #3
	strh r3, [ip, r2]
	ldrsb r0, [r5, #2]
	mul r1, sl, r0
	ldr r3, _030027EC
	ldr r2, [fp, #-0x318]
	ldrb r0, [r3, sb]
	ldrh r3, [r5, #2]
	add sb, r2, r1, asr #8
	rsb r2, r0, sb
	ldr r1, [fp, #-0x308]
	and sb, r3, #0xfe00
	bic r0, r2, #0xfe00
	orr lr, r7, sb
	orr sb, lr, r0
	add lr, ip, r1
	strh sb, [lr, #2]
	ldr r2, [fp, #-0x320]
	ldrh r3, [r5, #4]
	add r0, r3, r2
	strh r0, [lr, #4]
	ldr r1, [fp, #-0x2f8]
	add r4, r4, #1
	ldr ip, [fp, #-0x30c]
	add sb, r1, #1
	cmp r4, r6
	str r1, [ip, r1, lsl #2]
	add r5, r5, #6
	str sb, [fp, #-0x2f8]
	blo _03002658
	b _03000EBC
_0300271C:
	mov r4, #0
	cmp r4, r6
	bhs _03000F34
_03002728:
	ldrh ip, [r5]
	ldrh r7, [r5, #2]
	lsl r8, ip, #0x10
	lsr sl, r8, #0x1e
	lsr r3, r7, #0xe
	ldr lr, _030027E8
	ldr r0, [fp, #-0x31c]
	orr r7, r3, sl, lsl #2
	ldrsb r3, [r5]
	ldrb r2, [lr, r7]
	add sl, r3, r0
	ldr r1, [fp, #-0x2f8]
	rsb r0, r2, sl
	ldr r2, [fp, #-0x308]
	lsr sl, r8, #0x18
	and r8, r0, #0xff
	orr lr, r8, sl, lsl #8
	lsl r8, r1, #3
	strh lr, [r8, r2]
	ldr r0, _030027EC
	ldrsb sl, [r5, #2]
	ldr r3, [fp, #-0x318]
	ldrh ip, [r5, #2]
	ldrb lr, [r0, r7]
	add r2, sl, r3
	rsb r1, lr, r2
	eor r0, ip, sb
	ldr lr, [fp, #-0x308]
	and r7, r0, #0xfe00
	bic sl, r1, #0xfe00
	orr ip, r7, sl
	add r0, r8, lr
	strh ip, [r0, #2]
	ldr r3, [fp, #-0x320]
	ldrh r2, [r5, #4]
	add r1, r2, r3
	strh r1, [r0, #4]
	ldr r8, [fp, #-0x2f8]
	add r4, r4, #1
	ldr sl, [fp, #-0x30c]
	add r7, r8, #1
	cmp r4, r6
	str r8, [sl, r8, lsl #2]
	add r5, r5, #6
	str r7, [fp, #-0x2f8]
	blo _03002728
	b _03000F34
_030027E4:
	.4byte 0x0201AA4C
_030027E8:
	.4byte gUnk_080537E4
_030027EC:
	.4byte gUnk_080537D8

	.global sub_030027F0
	.type sub_030027F0, %function
sub_030027F0: @ 030027F0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldrh lr, [ip], #2
	mov r5, #0x6000000
	add r2, r5, #0x10000
	tst lr, #0x8000
	sub sp, sp, #4
	orr r5, r2, r1, lsl #5
	beq _03002848
	lsl r2, lr, #0x16
	lsr r1, r2, #0x16
	lsl r0, r1, #4
	mov r1, #0x4000000
	orr r2, r0, #0x80000000
	add r0, r1, #0xd4
	str ip, [r1, #0xd4]
	str r5, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
_0300283C:
	add sp, sp, #4
	pop {r4, r5, r6, r7, lr}
	bx lr
_03002848:
	ldrh r0, [r0, #2]
	cmp r0, #0
	add ip, ip, #2
	beq _0300283C
	mov r6, #0x4000000
	add r4, r6, #0xd4
_03002860:
	lsr r3, r0, #8
	add r7, sp, #4
	tst r0, #0x80
	and r1, r0, #0x7f
	and r2, r0, #0x7f
	mov lr, r7
	orr r3, r3, r3, lsl #8
	beq _030028B4
	add r2, r1, #1
	orr r3, r2, #0x80000000
	str ip, [r6, #0xd4]
	str r5, [r4, #4]
	str r3, [r4, #8]
	lsl r1, r2, #1
	ldr r3, [r4, #8]
	add ip, ip, r1
_030028A0:
	ldrh r0, [ip], #2
	cmp r0, #0
	add r5, r5, r1
	bne _03002860
	b _0300283C
_030028B4:
	strh r3, [lr, #-2]!
	add r0, r2, #1
	orr r3, r0, #0x81000000
	str lr, [r6, #0xd4]
	str r5, [r4, #4]
	str r3, [r4, #8]
	ldr r3, [r4, #8]
	lsl r1, r0, #1
	b _030028A0

	.global obj_check_hits
	.type obj_check_hits, %function
obj_check_hits: @ 030028D8
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	mov r0, #0
	sub fp, ip, #4
	sub sp, sp, #0xbc
	str r0, [fp, #-0xdc]
	mov r0, #0x100
	str r0, [fp, #-0xd4]
_030028F8:
	ldr r2, _03002F28
	ldr r6, [r2]
	mov r1, #0
	cmp r6, #0
	str r1, [fp, #-0xd8]
	beq _03002928
_03002910:
	ldrh ip, [r6]
	tst ip, #0x4000
	beq _03002B48
_0300291C:
	ldr r3, [r6, #0x1c]
_03002920:
	subs r6, r3, #0
	bne _03002910
_03002928:
	ldr ip, [fp, #-0xd8]
	mov r2, #0
	cmp r2, ip
	mvn r0, #0
	mov r1, #0x100
	bge _03002968
	sub ip, fp, #0xc8
_03002944:
	add r8, ip, r2, lsl #4
	ldr r3, [r8, #8]
	ldr lr, [fp, #-0xd8]
	cmp r3, r1
	movle r0, r2
	add r2, r2, #1
	movle r1, r3
	cmp r2, lr
	blt _03002944
_03002968:
	cmn r0, #1
	beq _03002B3C
	sub r7, fp, #0xc8
	add r8, r7, r0, lsl #4
	ldr r7, [r8, #8]
	ldr r0, [fp, #-0xd4]
	rsb r6, r7, #0x100
	mul r0, r6, r0
	ldr r3, _03002F28
	ldr r6, [r3]
	asr r4, r0, #8
	cmp r6, #0
	str r4, [fp, #-0xd4]
	beq _030029F4
_030029A0:
	add ip, r6, #0x84
	ldm ip, {ip, lr}
	ldr r4, [r6, #0x8c]
	add r0, r6, #0x24
	ldm r0, {r0, r3, r5}
	rsb r1, ip, r0
	rsb r2, lr, r3
	rsb r3, r4, r5
	mul r5, r7, r3
	mul r3, r7, r1
	mul r1, r7, r2
	add r0, ip, r3, asr #8
	add lr, lr, r1, asr #8
	add r1, r4, r5, asr #8
	str r0, [r6, #0x84]
	str lr, [r6, #0x88]
	str r1, [r6, #0x8c]
	ldr r6, [r6, #0x1c]
	cmp r6, #0
	ldrne r7, [r8, #8]
	bne _030029A0
_030029F4:
	ldr r6, [r8]
	ldrb r2, [r6, #2]
	cmp r2, #1
	ldr r4, [r8, #4]
	beq _03002B24
_03002A08:
	cmp r2, #2
	beq _03002AF8
_03002A10:
	ldrh r2, [r6]
	tst r2, #0x80
	beq _03002A44
	ldrb ip, [r6, #2]
	lsl lr, ip, #4
	add r3, lr, #8
	ldr ip, _03002F2C
	mov r0, r6
	mov r1, r4
	ldr r2, [fp, #-0xd4]
	ldr ip, [ip, r3]
	mov lr, pc
	bx ip
_03002A44:
	ldrh r1, [r4]
	tst r1, #0x80
	beq _03002A78
	ldrb r2, [r4, #2]
	lsl r0, r2, #4
	add r3, r0, #8
	mov r1, r6
	ldr ip, _03002F2C
	mov r0, r4
	ldr r2, [fp, #-0xd4]
	ldr ip, [ip, r3]
	mov lr, pc
	bx ip
_03002A78:
	ldr ip, [fp, #-0xdc]
	add r3, ip, #1
	cmp r3, #0xa
	str r3, [fp, #-0xdc]
	ble _03002AE4
	ldr lr, _03002F28
	ldr r6, [lr]
	cmp r6, #0
	beq _03002AC0
_03002A9C:
	ldr r2, [r6, #0x30]
	ldr r1, [r6, #0x34]
	ldr r0, [r6, #0x38]
	str r2, [r6, #0x24]
	str r1, [r6, #0x28]
	str r0, [r6, #0x2c]
	ldr r6, [r6, #0x1c]
	cmp r6, #0
	bne _03002A9C
_03002AC0:
	mov lr, #0
	ldrb r1, [r6, #2]
	ldrb r2, [r4, #2]
	ldr r3, _03002F30
	ldr r0, _03002F34
	str lr, [fp, #-0xd4]
	ldr ip, [r3]
	mov lr, pc
	bx ip
_03002AE4:
	ldr r3, [fp, #-0xd4]
	cmp r3, #0
	bgt _030028F8
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_03002AF8:
	ldrb r3, [r4, #2]
	cmp r3, #1
	beq _03002B0C
	cmp r3, #2
	bne _03002A10
_03002B0C:
	ldr r3, [r8, #0xc]
	mov r0, r6
	mov r1, r4
	ldr r2, [fp, #-0xd4]
	bl sub_03003224
	b _03002A10
_03002B24:
	ldrb r0, [r4, #2]
	add r1, r0, #0xff
	and ip, r1, #0xff
	cmp ip, #1
	bls _03002B0C
	b _03002A08
_03002B3C:
	mov lr, #0
	str lr, [fp, #-0xd4]
	b _03002AE4
_03002B48:
	ldr r3, [r6, #0x6c]
	ldrb r2, [r6, #2]
	str r3, [fp, #-0xe0]
	ldr lr, [r6, #0x74]
	add r7, r2, #0xeb
	str lr, [fp, #-0xe4]
	and r4, r7, #0xff
	cmp r2, #0x2b
	cmpne r4, #2
	ldr sb, [r6, #0x7c]
	ldr sl, [r6, #0x70]
	ldr r8, [r6, #0x78]
	ldr r7, [r6, #0x80]
	bls _03002CF4
	cmp r2, #0x2c
	beq _03002CF4
	ldr r0, _03002F38
	ldr r4, [r0]
	cmp r4, #0
	beq _03002CF4
_03002B98:
	ldr ip, [r6, #0x64]
	ldr r1, [r4, #0x64]
	tst ip, r1
	beq _03002CE8
	ldr r3, [r6, #0x68]
	ldr r0, [r4, #0x68]
	tst r3, r0
	beq _03002CE8
	ldrb r2, [r6, #2]
	cmp r2, #2
	mov r1, #0
	beq _03002EF0
_03002BC8:
	ldr ip, [r6, #0x90]
	cmp ip, r4
	beq _03002CE8
	ldr r3, [r4, #0x90]
	cmp r1, #0
	movne r0, #0
	moveq r0, #1
	cmp r3, r6
	moveq r0, #0
	andne r0, r0, #1
	cmp r0, #0
	beq _03002CE8
	ldr r2, [r4, #0x6c]
	ldr ip, [fp, #-0xe0]
	cmp ip, r2
	cmplt sl, r2
	ldr r3, [r4, #0x70]
	add r1, r4, #0x74
	ldm r1, {r1, r2, ip}
	ldr r0, [r4, #0x80]
	movlt r3, #0
	blt _03002C34
	ldr lr, [fp, #-0xe0]
	cmp lr, r3
	cmpgt sl, r3
	movle r3, #1
	movgt r3, #0
_03002C34:
	cmp r3, #0
	beq _03002CE8
	ldr lr, [fp, #-0xe4]
	cmp lr, r1
	cmplt r8, r1
	movlt r3, #0
	blt _03002C60
	ldr r1, [fp, #-0xe4]
	cmp r1, r2
	cmpgt r8, r2
	movgt r3, #0
_03002C60:
	cmp r3, #0
	beq _03002CE8
	cmp sb, ip
	cmplt r7, ip
	movlt r3, #0
	blt _03002C84
	cmp sb, r0
	cmpgt r7, r0
	movgt r3, #0
_03002C84:
	cmp r3, #0
	beq _03002CE8
	ldrh r3, [r4]
	tst r3, #0x400
	mov r0, #0
	beq _03002ED4
	mov r0, r6
	mov r1, r4
	sub r2, fp, #0xcc
	bl sub_03003938
_03002CAC:
	cmp r0, #0
	beq _03002CE8
	ldr lr, [fp, #-0xd8]
	ldr r0, [fp, #-0xcc]
	lsl r3, lr, #4
	sub r2, fp, #0xc8
	mov lr, r2
	add r1, r3, #8
	add ip, r3, #4
	str r6, [lr, r3]
	str r4, [lr, ip]
	str r0, [lr, r1]
	ldr r1, [fp, #-0xd8]
	add lr, r1, #1
	str lr, [fp, #-0xd8]
_03002CE8:
	ldr r4, [r4, #0x14]
	cmp r4, #0
	bne _03002B98
_03002CF4:
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	mov r3, r4
	beq _03002920
_03002D04:
	ldrh r0, [r4]
	ands r1, r0, #0x4000
	beq _03002D20
_03002D10:
	ldr r4, [r4, #0x1c]
	cmp r4, #0
	bne _03002D04
	b _0300291C
_03002D20:
	ldr r3, [r6, #0x64]
	ldr ip, [r4, #0x64]
	tst r3, ip
	beq _03002D10
	ldr ip, [r6, #0x68]
	ldr r0, [r4, #0x68]
	tst ip, r0
	beq _03002D10
	ldrb r3, [r6, #2]
	cmp r3, #0x2b
	beq _03002EA4
	cmp r3, #0x2c
	beq _03002E74
_03002D54:
	ldr r2, [r6, #0x90]
	cmp r2, r4
	beq _03002D10
	ldr r3, [r4, #0x90]
	cmp r1, #0
	movne r0, #0
	moveq r0, #1
	cmp r3, r6
	moveq r0, #0
	andne r0, r0, #1
	cmp r0, #0
	beq _03002D10
	ldr ip, [r4, #0x6c]
	ldr r2, [fp, #-0xe0]
	cmp r2, ip
	cmplt sl, ip
	ldr r3, [r4, #0x70]
	add r1, r4, #0x74
	ldm r1, {r1, r2, ip}
	ldr r0, [r4, #0x80]
	movlt r3, #0
	blt _03002DC0
	ldr lr, [fp, #-0xe0]
	cmp lr, r3
	cmpgt sl, r3
	movle r3, #1
	movgt r3, #0
_03002DC0:
	cmp r3, #0
	beq _03002D10
	ldr lr, [fp, #-0xe4]
	cmp lr, r1
	cmplt r8, r1
	movlt r3, #0
	blt _03002DEC
	ldr r1, [fp, #-0xe4]
	cmp r1, r2
	cmpgt r8, r2
	movgt r3, #0
_03002DEC:
	cmp r3, #0
	beq _03002D10
	cmp sb, ip
	cmplt r7, ip
	movlt r3, #0
	blt _03002E10
	cmp sb, r0
	cmpgt r7, r0
	movgt r3, #0
_03002E10:
	cmp r3, #0
	beq _03002D10
	mov r0, r6
	mov r1, r4
	sub r2, fp, #0xd0
	bl sub_03002F3C
	mov r5, r0
	cmp r5, #0
	beq _03002D10
	ldr lr, [fp, #-0xd8]
	ldr r0, [fp, #-0xd0]
	lsl r3, lr, #4
	sub r2, fp, #0xc8
	mov lr, r2
	add r1, r3, #8
	add ip, r3, #0xc
	add r2, r3, #4
	str r6, [lr, r3]
	str r4, [lr, r2]
	str r0, [lr, r1]
	str r5, [lr, ip]
	ldr r0, [fp, #-0xd8]
	add r1, r0, #1
	str r1, [fp, #-0xd8]
	b _03002D10
_03002E74:
	ldrb r3, [r4, #2]
	cmp r3, #0x15
	cmpne r3, #0x2c
	beq _03002EB4
	and r3, r3, #0xff
	cmp r3, #0x16
	beq _03002EB4
	cmp r3, #0x17
	beq _03002EB4
	cmp r3, #2
	bne _03002D54
	b _03002EB4
_03002EA4:
	ldrb r3, [r4, #2]
	cmp r3, #0x15
	cmpne r3, #0x2b
	bne _03002EBC
_03002EB4:
	mov r1, #1
	b _03002D54
_03002EBC:
	and r3, r3, #0xff
	cmp r3, #0x16
	beq _03002EB4
	cmp r3, #0x17
	bne _03002D54
	b _03002EB4
_03002ED4:
	tst r3, #0x800
	beq _03002CAC
	mov r0, r6
	mov r1, r4
	sub r2, fp, #0xcc
	bl sub_03003A14
	b _03002CAC
_03002EF0:
	ldrb r3, [r4, #2]
	cmp r3, #4
	cmpne r3, #0x18
	bne _03002F08
_03002F00:
	mov r1, #1
	b _03002BC8
_03002F08:
	and r3, r3, #0xff
	cmp r3, #0x1b
	beq _03002F00
	cmp r3, #0x2d
	beq _03002F00
	cmp r3, #0x2e
	bne _03002BC8
	b _03002F00
_03002F28:
	.4byte 0x0200437C
_03002F2C:
	.4byte gUnk_08713FD0
_03002F30:
	.4byte gUnk_08BB4F94
_03002F34:
	.4byte gUnk_08053800
_03002F38:
	.4byte gObjStaticHitList

	.global sub_03002F3C
	.type sub_03002F3C, %function
sub_03002F3C: @ 03002F3C
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	sub fp, ip, #4
	sub sp, sp, #0x50
	ldr r6, [r0, #0x24]
	str r6, [fp, #-0x4c]
	ldr r5, [r0, #0x84]
	str r5, [fp, #-0x50]
	ldr r7, [r0, #0x28]
	str r7, [fp, #-0x54]
	ldr ip, [r0, #0x88]
	str ip, [fp, #-0x58]
	ldr sb, [r1, #0x24]
	str sb, [fp, #-0x64]
	ldr r4, [r1, #0x84]
	str r4, [fp, #-0x68]
	ldr r8, [r1, #0x28]
	str r8, [fp, #-0x6c]
	ldr r3, [r1, #0x88]
	str r3, [fp, #-0x70]
	ldr lr, [r0, #0x8c]
	str lr, [fp, #-0x60]
	ldr sl, [r1, #0x8c]
	str sl, [fp, #-0x78]
	ldr r6, [r0, #0x2c]
	str r6, [fp, #-0x5c]
	sub r7, fp, #0x50
	ldm r7, {r7, ip}
	ldr r8, [fp, #-0x54]
	ldr sb, [fp, #-0x58]
	ldr sl, [fp, #-0x64]
	ldr lr, [fp, #-0x68]
	ldr r5, [r1, #0x2c]
	rsb r4, r7, ip
	rsb r3, sb, r8
	rsb r6, lr, sl
	str r5, [fp, #-0x74]
	str r4, [fp, #-0x30]
	str r3, [fp, #-0x34]
	str r6, [fp, #-0x3c]
	ldr r8, [fp, #-0x74]
	ldr sb, [fp, #-0x78]
	rsb r3, sb, r8
	str r3, [fp, #-0x44]
	ldr lr, [fp, #-0x3c]
	ldr r3, [fp, #-0x30]
	sub r5, fp, #0x70
	ldm r5, {r5, r7}
	mul r3, lr, r3
	ldr lr, [fp, #-0x34]
	rsb sl, r5, r7
	ldr r4, [fp, #-0x5c]
	ldr ip, [fp, #-0x60]
	str sl, [fp, #-0x40]
	mul lr, sl, lr
	ldr sl, [fp, #-0x34]
	rsb r7, ip, r4
	str r7, [fp, #-0x38]
	mov ip, sl
	ldr r4, [fp, #-0x44]
	mul sl, ip, sl
	mov ip, r7
	mul ip, r4, ip
	ldrh r4, [r0, #0x5c]
	ldrh r0, [r1, #0x5c]
	ldr r1, [fp, #-0x3c]
	ldr r8, [fp, #-0x30]
	mov r5, r1
	mul r1, r5, r1
	ldr r5, [fp, #-0x40]
	mov r6, r8
	mul r8, r6, r8
	mov r7, r5
	ldr r6, [fp, #-0x38]
	mul r5, r7, r5
	ldr r7, [fp, #-0x44]
	mov sb, r6
	mul r6, sb, r6
	mov sb, r7
	mul r7, sb, r7
	add sb, r4, r0
	mul r0, sb, sb
	asr lr, lr, #7
	mov sb, r0
	asr r0, r3, #7
	rsb r3, r0, r8, asr #8
	rsb r0, lr, sl, asr #8
	asr r8, ip, #7
	add sl, r3, r1, asr #8
	add lr, r0, r5, asr #8
	rsb r0, r8, r6, asr #8
	add r1, sl, lr
	add r8, r0, r7, asr #8
	adds r0, r1, r8
	mov sl, #0
	str r0, [fp, #-0x48]
	str r2, [fp, #-0x2c]
	asr sb, sb, #8
	mov r8, sl
	beq _030031C8
	ldr r7, [fp, #-0x70]
	ldr r3, [fp, #-0x58]
	ldr r5, [fp, #-0x78]
	ldr r4, [fp, #-0x60]
	ldr r2, [fp, #-0x68]
	ldr r6, [fp, #-0x50]
	rsb lr, r3, r7
	rsb ip, r4, r5
	ldr r1, [fp, #-0x30]
	ldr r4, [fp, #-0x34]
	ldr r7, [fp, #-0x40]
	rsb r0, r6, r2
	ldr r6, [fp, #-0x3c]
	mul r7, lr, r7
	mul r2, lr, lr
	mul r1, r0, r1
	mul r4, lr, r4
	ldr lr, [fp, #-0x38]
	mul r5, r0, r0
	mul r6, r0, r6
	ldr r0, [fp, #-0x44]
	mul lr, ip, lr
	mul r3, ip, ip
	mul r0, ip, r0
	asr r2, r2, #8
	asr r1, r1, #7
	asr r4, r4, #7
	add ip, r2, r5, asr #8
	rsb r4, r4, r7, asr #7
	rsb r1, r1, r6, asr #7
	add r7, ip, r3, asr #8
	asr ip, lr, #7
	add r3, r1, r4
	ldr r1, [fp, #-0x48]
	rsb lr, ip, r0, asr #7
	rsb r0, sb, r7
	mul r1, r0, r1
	add r4, r3, lr
	mul ip, r4, r4
	asr r2, r1, #6
	rsb r0, r2, ip, asr #8
	cmp r0, r8
	ble _030031C8
	lsl r0, r0, #8
	bl isqrt
	rsb ip, r4, #0
	ldr r8, [fp, #-0x48]
	rsb r1, r0, ip
	lsl r4, r1, #8
	lsl r5, r8, #1
	eor r0, r4, r4, asr #31
	sub r0, r0, r4, asr #31
	eor r1, r5, r5, asr #31
	sub r1, r1, r5, asr #31
	bl udiv
	teq r4, r5
	rsbmi r0, r0, #0
	mov r8, r0
	cmp r8, #0x100
	bhi _030031C8
	cmp r8, #0
	movle r8, #1
	mov sl, #1
_030031C8:
	cmp sl, #0
	beq _030031E4
_030031D0:
	ldr r7, [fp, #-0x2c]
	mov r0, sl
	str r8, [r7]
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_030031E4:
	ldr lr, [fp, #-0x6c]
	ldr r3, [fp, #-0x54]
	rsb r4, r3, lr
	mul r5, r4, r4
	ldr r2, [fp, #-0x64]
	ldr r4, [fp, #-0x4c]
	rsb r6, r4, r2
	mla ip, r6, r6, r5
	ldr r5, [fp, #-0x74]
	ldr r6, [fp, #-0x5c]
	rsb r0, r6, r5
	mla r7, r0, r0, ip
	cmp sb, r7, asr #8
	movge r8, #0x100
	movge sl, #2
	b _030031D0

	.global sub_03003224
	.type sub_03003224, %function
sub_03003224: @ 03003224
	mov ip, sp
	push {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr, pc}
	sub fp, ip, #4
	mov r8, r0
	mov sl, r1
	sub sp, sp, #0x28
	ldr r0, [sl, #0x84]
	add r4, r8, #0x84
	ldm r4, {r4, sb}
	ldr r7, [sl, #0x88]
	ldr r1, [sl, #0x8c]
	ldr r6, [r8, #0x8c]
	rsb r5, r4, r0
	cmp r3, #1
	rsb r4, sb, r7
	rsb r0, r6, r1
	mov sb, r2
	str r5, [fp, #-0x34]
	str r4, [fp, #-0x30]
	str r0, [fp, #-0x2c]
	beq _03003728
	mul lr, r4, r4
	mla ip, r5, r5, lr
	mla r5, r0, r0, ip
	mov r0, r5
	bl isqrt
	mov r6, r0
	eor r1, r6, r6, asr #31
	sub r1, r1, r6, asr #31
	mov r0, #0x10000
	bl udiv
	ldrh r4, [r8, #0x5c]
	mov ip, r0
	ldrh r0, [sl, #0x5c]
	add sb, r4, r0
	mul r3, sb, sb
	cmp r6, #0
	asr r7, r3, #8
	rsblt ip, ip, #0
	eor r0, r5, r5, asr #31
	sub r0, r0, r5, asr #31
	eor r1, r7, r7, asr #31
	sub r1, r1, r7, asr #31
	mov r6, ip
	bl udiv
	teq r5, r7
	rsbmi r0, r0, #0
	mov r5, #0x200
	rsb sb, r0, #0x100
_030032E8:
	ldr r2, [fp, #-0x2c]
	ldr r4, [fp, #-0x34]
	ldr r0, [fp, #-0x30]
	mul r1, r6, r4
	mul r7, r6, r2
	mul ip, r6, r0
	ldr r3, [r8, #0xa0]
	asr lr, r1, #8
	asr r6, ip, #8
	asr r2, r7, #8
	str r6, [fp, #-0x30]
	str r2, [fp, #-0x2c]
	str lr, [fp, #-0x34]
	tst r3, #0x800000
	ldreq lr, [r8, #0xf0]
	movne r6, #0x400
	strne r6, [fp, #-0x4c]
	streq lr, [fp, #-0x4c]
	ldr r7, [sl, #0xa0]
	ldr r2, [fp, #-0x34]
	tst r7, #0x800000
	ldreq r7, [sl, #0xf0]
	ldr lr, [r8, #0x40]
	ldr r0, [sl, #0x40]
	ldr r1, [r8, #0x3c]
	ldr ip, [sl, #0x3c]
	str r2, [fp, #-0x50]
	rsb r4, r0, lr
	ldr r6, [sl, #0x44]
	ldr r0, [r8, #0x44]
	rsb lr, ip, r1
	ldr ip, [fp, #-0x30]
	mul r2, ip, r4
	rsb ip, r6, r0
	ldr r0, [fp, #-0x50]
	ldr r6, [fp, #-0x2c]
	mul r0, lr, r0
	mul r1, r6, ip
	asr r6, r2, #8
	add r3, r6, r0, asr #8
	add r6, r5, #0x100
	add r0, r3, r1, asr #8
	rsb r5, r6, #0
	mul r6, r0, r5
	ldr r1, [fp, #-0x4c]
	movne r7, #0x400
	add r5, r1, r7
	eor r1, r5, r5, asr #31
	sub r1, r1, r5, asr #31
	eor r0, r6, r6, asr #31
	sub r0, r0, r6, asr #31
	str lr, [fp, #-0x40]
	str r4, [fp, #-0x3c]
	str ip, [fp, #-0x38]
	bl udiv
	ldr r1, [r8, #0xa0]
	teq r6, r5
	rsbmi r0, r0, #0
	tst r1, #0x40
	str r0, [fp, #-0x44]
	beq _03003718
_030033DC:
	ldr r2, [fp, #-0x44]
	asr ip, r2, #2
	str ip, [fp, #-0x44]
_030033E8:
	ldr r0, [fp, #-0x44]
	ldr r5, [fp, #-0x4c]
	ldr ip, [fp, #-0x44]
	mul r0, r7, r0
	mul ip, r5, ip
	asr r3, r0, #8
	tst r1, #0x800000
	asr r5, ip, #8
	str r3, [fp, #-0x48]
	beq _030035A4
_03003410:
	ldr r1, [sl, #0xa0]
	tst r1, #0x800000
	beq _03003424
_0300341C:
	ldmdb fp, {r4, r5, r6, r7, r8, sb, sl, fp, sp, lr}
	bx lr
_03003424:
	ldr r2, [fp, #-0x2c]
	ldr r3, [fp, #-0x34]
	ldr r0, [fp, #-0x48]
	ldr r1, [fp, #-0x48]
	ldr r4, [fp, #-0x30]
	ldr ip, [fp, #-0x48]
	mul r0, r2, r0
	mul r1, r3, r1
	mul ip, r4, ip
	ldrh r6, [sl, #0xf8]
	ldr r5, [sl, #0x3c]
	ldr r7, [sl, #0x44]
	rsb r3, r6, #0
	ldr lr, [sl, #0x40]
	sub r6, r5, r1, asr #8
	sub r5, r7, r0, asr #8
	lsl r0, r3, #0x10
	sub r7, lr, ip, asr #8
	asr r4, r0, #0x10
	str r7, [sl, #0x40]
	mov r0, r4
	str r6, [sl, #0x3c]
	str r5, [sl, #0x44]
	bl cos_fx
	mov ip, r0
	lsl lr, ip, #0x10
	mov r0, r4
	asr r4, lr, #0x10
	bl sin_fx
	lsl r1, r0, #0x10
	asr r2, r1, #0x10
	mul ip, r5, r2
	mul lr, r6, r2
	mul r1, r6, r4
	mul r0, r5, r4
	asr r3, ip, #0xc
	add ip, r3, r1, asr #12
	asr r1, lr, #0xc
	rsb lr, r1, r0, asr #12
	asr r2, ip, #1
	asr r0, lr, #1
	cmn r2, #0x190
	str r0, [sl, #0x50]
	movlt r0, #0x9c000000
	asr r7, r7, #1
	asrlt r1, r0, #0x16
	str r2, [sl, #0x48]
	str r7, [sl, #0x4c]
	strlt r1, [sl, #0x48]
	blt _030034F8
	cmp r2, #0x190
	movgt lr, #0x190
	strgt lr, [sl, #0x48]
_030034F8:
	ldr r3, [sl, #0x4c]
	cmn r3, #0x190
	movlt r2, #0x9c000000
	asrlt ip, r2, #0x16
	strlt ip, [sl, #0x4c]
	blt _0300351C
	cmp r3, #0x190
	movgt r1, #0x190
	strgt r1, [sl, #0x4c]
_0300351C:
	ldr r3, [sl, #0x50]
	cmn r3, #0x7d0
	movlt lr, #0x83000000
	asrlt r0, lr, #0x14
	strlt r0, [sl, #0x50]
	blt _03003540
	cmp r3, #0x7d0
	movgt ip, #0x7d0
	strgt ip, [sl, #0x50]
_03003540:
	ldr ip, [sl, #0x3c]
	add r1, sl, #0x40
	ldm r1, {r1, r2}
	mul r0, sb, ip
	mul lr, sb, r2
	mul ip, sb, r1
	ldr r2, [sl, #0x88]
	ldr r1, [sl, #0x8c]
	ldr r3, [sl, #0x84]
	add r3, r3, r0, asr #8
	add r0, r2, ip, asr #8
	add ip, r1, lr, asr #8
	str r0, [sl, #0x28]
	str r3, [sl, #0x24]
	mov r0, sl
	str ip, [sl, #0x2c]
	bl sub_03003750
	ldr r2, [sl, #0xa0]
	ldr r0, [fp, #-0x44]
	orr r1, r2, #0x10000
	cmn r0, #0xc8
	str r1, [sl, #0xa0]
	orrlt r1, r2, #0x30000
	strlt r1, [sl, #0xa0]
	b _0300341C
_030035A4:
	ldr r0, [fp, #-0x50]
	ldr r2, [fp, #-0x2c]
	ldr r4, [fp, #-0x30]
	mul r0, r5, r0
	mul r1, r2, r5
	mul ip, r4, r5
	ldrh r6, [r8, #0xf8]
	ldr r5, [r8, #0x3c]
	rsb r3, r6, #0
	ldr lr, [r8, #0x40]
	ldr r7, [r8, #0x44]
	add r6, r5, r0, asr #8
	lsl r0, r3, #0x10
	add r5, r7, r1, asr #8
	asr r4, r0, #0x10
	add r7, lr, ip, asr #8
	str r7, [r8, #0x40]
	mov r0, r4
	str r6, [r8, #0x3c]
	str r5, [r8, #0x44]
	bl cos_fx
	mov ip, r0
	lsl lr, ip, #0x10
	mov r0, r4
	asr r4, lr, #0x10
	bl sin_fx
	lsl r1, r0, #0x10
	asr r2, r1, #0x10
	mul ip, r5, r2
	mul lr, r6, r2
	mul r1, r6, r4
	mul r0, r5, r4
	asr r3, ip, #0xc
	add ip, r3, r1, asr #12
	asr r1, lr, #0xc
	rsb lr, r1, r0, asr #12
	asr r0, ip, #1
	cmn r0, #0x190
	movlt ip, #0x9c000000
	asr r1, lr, #1
	asr r7, r7, #1
	asrlt lr, ip, #0x16
	str r0, [r8, #0x48]
	str r7, [r8, #0x4c]
	str r1, [r8, #0x50]
	strlt lr, [r8, #0x48]
	blt _0300366C
	cmp r0, #0x190
	movgt r1, #0x190
	strgt r1, [r8, #0x48]
_0300366C:
	ldr r3, [r8, #0x4c]
	cmn r3, #0x190
	movlt r2, #0x9c000000
	asrlt r0, r2, #0x16
	strlt r0, [r8, #0x4c]
	blt _03003690
	cmp r3, #0x190
	movgt lr, #0x190
	strgt lr, [r8, #0x4c]
_03003690:
	ldr r3, [r8, #0x50]
	cmn r3, #0x7d0
	movlt r1, #0x83000000
	asrlt ip, r1, #0x14
	strlt ip, [r8, #0x50]
	blt _030036B4
	cmp r3, #0x7d0
	movgt r0, #0x7d0
	strgt r0, [r8, #0x50]
_030036B4:
	add r2, r8, #0x3c
	ldm r2, {r2, lr}
	ldr r1, [r8, #0x44]
	mul ip, sb, lr
	mul r0, sb, r2
	mul lr, sb, r1
	ldr r3, [r8, #0x84]
	ldr r1, [r8, #0x8c]
	ldr r2, [r8, #0x88]
	add r3, r3, r0, asr #8
	add r2, r2, ip, asr #8
	add r0, r1, lr, asr #8
	str r2, [r8, #0x28]
	str r0, [r8, #0x2c]
	str r3, [r8, #0x24]
	mov r0, r8
	bl sub_03003750
	ldr r2, [r8, #0xa0]
	ldr r1, [fp, #-0x44]
	orr ip, r2, #0x10000
	cmn r1, #0xc8
	str ip, [r8, #0xa0]
	orrlt ip, r2, #0x30000
	strlt ip, [r8, #0xa0]
	b _03003410
_03003718:
	ldr r5, [sl, #0xa0]
	tst r5, #0x40
	bne _030033DC
	b _030033E8
_03003728:
	ldrh r2, [r8, #0x5c]
	ldrh r5, [sl, #0x5c]
	add r1, r2, r5
	cmp r1, #0
	rsblt r1, r1, #0
	mov r0, #0x10000
	bl udiv
	mov r5, #0xcc
	mov r6, r0
	b _030032E8

	.global sub_03003750
	.type sub_03003750, %function
sub_03003750: @ 03003750
	push {r4, r5, r6, r7, r8, sl, lr}
	mov lr, r0
	ldr r6, [lr, #0x84]
	add r5, lr, #0x24
	ldm r5, {r5, ip}
	cmp r6, r5
	ldr r4, [lr, #0x88]
	movgt r0, r6
	ldr sl, [lr, #0x8c]
	ldr r8, [lr, #0x2c]
	movgt r6, r5
	movgt r5, r0
	cmp r4, ip
	movgt r0, r4
	ldr r2, _030038A4
	movgt r4, ip
	movgt ip, r0
	cmp sl, r8
	movgt r1, sl
	ldr r7, [r2]
	movgt sl, r8
	ldrh r2, [lr, #0x5c]
	movgt r8, r1
	ldr r1, _030038A8
	add r8, r8, r2
	ldr r0, [r1]
	asr r3, r7, #5
	rsb r6, r2, r6
	add r5, r5, r2
	rsb sl, r2, sl
	add r7, ip, r2
	rsb r4, r2, r4
	str r6, [lr, #0x6c]
	add r2, r3, #1
	str r5, [lr, #0x70]
	str sl, [lr, #0x7c]
	str r8, [lr, #0x80]
	str r4, [lr, #0x74]
	str r7, [lr, #0x78]
	mov ip, r0
	add r1, r2, r0
	mov r7, #0
	mov r4, #1
	mov r0, #0x1f
_03003800:
	cmp r5, ip
	movlt r3, #0
	movge r3, #1
	cmp r6, r1
	movgt r3, #0
	andle r3, r3, #1
	cmp r3, #0
	orrne r7, r7, r4
	subs r0, r0, #1
	add r1, r1, r2
	add ip, ip, r2
	lsl r4, r4, #1
	bpl _03003800
	ldr r2, _030038AC
	ldr r0, _030038B0
	ldr r1, [r2]
	ldr ip, [r0]
	asr r4, r1, #5
	add r2, r4, #1
	str r7, [lr, #0x64]
	mov r0, ip
	add r1, r2, ip
	mov r7, #0
	mov r4, #1
	mov ip, #0x1f
_03003864:
	cmp r8, r0
	movlt r3, #0
	movge r3, #1
	cmp sl, r1
	movgt r3, #0
	andle r3, r3, #1
	cmp r3, #0
	orrne r7, r7, r4
	subs ip, ip, #1
	add r1, r1, r2
	add r0, r0, r2
	lsl r4, r4, #1
	bpl _03003864
	str r7, [lr, #0x68]
	pop {r4, r5, r6, r7, r8, sl, lr}
	bx lr
_030038A4:
	.4byte 0x0200428C
_030038A8:
	.4byte 0x02004284
_030038AC:
	.4byte 0x02004298
_030038B0:
	.4byte 0x02004290

	.global sub_030038B4
	.type sub_030038B4, %function
sub_030038B4: @ 030038B4
	mov ip, sp
	push {r4, r5, r6, fp, ip, lr, pc}
	ldr r0, _0300392C
	ldr r2, [r0]
	tst r2, #8
	sub fp, ip, #4
	beq _03003908
	ldr r1, _03003930
	ldr r4, [r1]
	and r0, r2, #7
	cmp r4, #0
	orr r5, r0, #8
	beq _03003908
	ldr r6, _03003934
_030038EC:
	ldrh r2, [r4]
	bics r3, r5, r2
	mov r0, r4
	beq _03003910
_030038FC:
	ldr r4, [r4, #4]
	cmp r4, #0
	bne _030038EC
_03003908:
	ldmdb fp, {r4, r5, r6, fp, sp, lr}
	bx lr
_03003910:
	ldrb r1, [r4, #2]
	lsl lr, r1, #4
	add ip, lr, #4
	ldr ip, [r6, ip]
	mov lr, pc
	bx ip
	b _030038FC
_0300392C:
	.4byte gFrameCount
_03003930:
	.4byte gObjProcessList
_03003934:
	.4byte gUnk_08713FD0

	.global sub_03003938
	.type sub_03003938, %function
sub_03003938: @ 03003938
	mov ip, sp
	push {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	sub fp, ip, #4
	ldr r6, [r1, #0x28]
	add r4, r0, #0x84
	ldm r4, {r4, ip}
	ldr r5, [r1, #0x24]
	ldr r7, [r0, #0x40]
	rsb lr, r6, ip
	ldr r3, [r0, #0x3c]
	ldr r6, [r1, #0x2c]
	ldr ip, [r0, #0x8c]
	rsb r8, r5, r4
	asr lr, lr, #4
	ldr r5, [r0, #0x44]
	asr r7, r7, #4
	asr r4, r8, #4
	rsb ip, r6, ip
	asr r8, r3, #4
	mul r6, r7, lr
	asr ip, ip, #4
	mul r7, r8, r4
	asr r5, r5, #4
	mul r8, r5, ip
	ldrh r3, [r0, #0x5c]
	ldrh r5, [r1, #0x5c]
	mul r0, lr, lr
	asr r1, r6, #4
	add lr, r3, r5
	mul r5, r4, r4
	add r6, r1, r7, asr #4
	asr r1, lr, #4
	mul lr, ip, ip
	add r4, r6, r8, asr #4
	mul ip, r1, r1
	mul r6, r4, r4
	asr r1, r0, #4
	add r3, r1, r5, asr #4
	add r1, r3, lr, asr #4
	sub r5, r1, ip, lsr #4
	rsbs r3, r5, r6, asr #4
	lsl r0, r3, #4
	mov r5, r2
	mov r6, #0
	bmi _03003A08
	bl isqrt
	rsb r2, r4, #0
	rsb r1, r0, r2
	cmp r1, #0x10
	lsl r2, r1, #4
	strls r2, [r5]
	addls r6, r6, #1
_03003A08:
	mov r0, r6
	ldmdb fp, {r4, r5, r6, r7, r8, fp, sp, lr}
	bx lr

	.global sub_03003A14
	.type sub_03003A14, %function
sub_03003A14: @ 03003A14
	mov ip, sp
	push {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	mov r7, r0
	mov r8, r1
	sub fp, ip, #4
	ldr lr, [r7, #0x8c]
	ldr ip, [r8, #0x2c]
	ldr r4, [r7, #0x84]
	ldr r6, [r8, #0x24]
	ldr r0, [r7, #0x44]
	rsb r1, ip, lr
	ldr r3, [r7, #0x3c]
	rsb lr, r6, r4
	mul r4, r0, r1
	mul r6, r3, lr
	ldrh r5, [r7, #0x5c]
	ldrh ip, [r8, #0x5c]
	mul r0, r1, r1
	add r3, r5, ip
	asr r1, r4, #8
	mul r5, lr, lr
	add r4, r1, r6, asr #8
	mul r1, r3, r3
	mul lr, r4, r4
	asr r3, r0, #8
	add ip, r3, r5, asr #8
	sub r3, ip, r1, asr #8
	rsb r1, r3, lr, asr #8
	lsl r0, r1, #8
	mov r5, r2
	bl isqrt
	rsb r1, r4, #0
	rsb r4, r0, r1
	cmp r4, #0x100
	mov r0, #0
	bhi _03003AC4
	ldr r3, [r7, #0x40]
	mul r1, r4, r3
	ldr r3, [r7, #0x88]
	ldrh ip, [r8, #0x5e]
	add r2, r3, r1, asr #8
	cmp r2, ip
	strle r4, [r5]
	addle r0, r0, #1
_03003AC4:
	ldmdb fp, {r4, r5, r6, r7, r8, fp, sp, lr}
	bx lr

	.global sub_03003ACC
	.type sub_03003ACC, %function
sub_03003ACC: @ 03003ACC
	cmp r1, #0
	mov r2, r0
	str lr, [sp, #-4]!
	moveq r0, r1
	ldmeq sp!, {lr}
	bxeq lr
	cmp r1, #0x10
	ldmeq sp!, {lr}
	bxeq lr
	cmp r1, #0x20
	moveq r1, #0x7f00
	addeq r0, r1, #0xff
	ldmeq sp!, {lr}
	bxeq lr
	cmp r1, #0xf
	bgt _03003B58
	mvn ip, #0x2100000
	sub r0, ip, #0xc200
	sub r3, r0, #0x10
	tst r1, #8
	and ip, r3, r2, lsr #1
	moveq r2, #0
	movne r2, ip
	and r0, r3, ip, lsr #1
	tst r1, #4
	addne r2, r2, r0
	tst r1, #2
	and r0, r3, r0, lsr #1
	addne r2, r2, r0
	tst r1, #1
	andne r1, r3, r0, lsr #1
	addne r2, r2, r1
	mov r0, r2
	ldm sp!, {lr}
	bx lr
_03003B58:
	mov r0, #0x7f00
	add ip, r0, #0xff
	mvn r3, #0x2100000
	orr lr, ip, ip, lsl #16
	sub r0, r3, #0xc200
	rsb r1, r1, #0x20
	sub ip, r0, #0x10
	eor r3, r2, lr
	tst r1, #8
	and r0, ip, r3, lsr #1
	moveq r2, #0
	movne r2, r0
	tst r1, #4
	and r0, ip, r0, lsr #1
	addne r2, r2, r0
	tst r1, #2
	and r0, ip, r0, lsr #1
	addne r2, r2, r0
	tst r1, #1
	andne r1, ip, r0, lsr #1
	addne r2, r2, r1
	eor r0, r2, lr
	ldm sp!, {lr}
	bx lr

	.global sub_03003BB8
	.type sub_03003BB8, %function
sub_03003BB8: @ 03003BB8
	push {r4, r5, r6, r7, r8, sl, lr}
	cmp r3, #0
	mov r5, r0
	sub sp, sp, #4
	mov r4, r1
	mov r0, r2
	beq _03003D28
	cmp r3, #0x10
	beq _03003D08
	cmp r3, #0x20
	beq _03003CF4
	cmp r3, #0xf
	bgt _03003C6C
	asr r0, r0, #1
	mov lr, #0
	cmp lr, r0
	bge _03003C60
	mvn r6, #0x2100000
	sub r2, r6, #0xc200
	and sl, r3, #1
	and r8, r3, #8
	and r7, r3, #4
	and r6, r3, #2
	sub ip, r2, #0x10
_03003C18:
	ldr r2, [r5], #4
	cmp r8, #0
	and r1, ip, r2, lsr #1
	movne r2, r1
	moveq r2, #0
	and r3, ip, r1, lsr #1
	cmp r7, #0
	addne r2, r2, r3
	cmp r6, #0
	and r3, ip, r3, lsr #1
	addne r2, r2, r3
	add lr, lr, #1
	cmp sl, #0
	and r1, ip, r3, lsr #1
	addne r2, r2, r1
	cmp lr, r0
	str r2, [r4], #4
	blt _03003C18
_03003C60:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sl, lr}
	bx lr
_03003C6C:
	asr r0, r0, #1
	cmp r0, #0
	rsb r3, r3, #0x20
	ble _03003C60
	mov r8, #0x7f00
	mvn r7, #0x2100000
	add ip, r8, #0xff
	sub lr, r7, #0xc200
	and sl, r3, #1
	and r8, r3, #8
	and r7, r3, #4
	and r6, r3, #2
	orr r1, ip, ip, lsl #16
	sub r2, lr, #0x10
_03003CA4:
	ldr lr, [r5], #4
	eor ip, lr, r1
	and lr, r2, ip, lsr #1
	cmp r8, #0
	movne r3, lr
	moveq r3, #0
	and ip, r2, lr, lsr #1
	cmp r7, #0
	addne r3, r3, ip
	and ip, r2, ip, lsr #1
	cmp r6, #0
	addne r3, r3, ip
	and lr, r2, ip, lsr #1
	cmp sl, #0
	addne r3, r3, lr
	eor ip, r3, r1
	subs r0, r0, #1
	str ip, [r4], #4
	bne _03003CA4
	b _03003C60
_03003CF4:
	add ip, sp, #4
	mov r2, ip
	mvn r1, #0x8000
	strh r1, [r2, #-2]!
	b _03003D34
_03003D08:
	mov r1, #0x4000000
	orr r3, r0, #0x80000000
	add r0, r1, #0xd4
	str r5, [r1, #0xd4]
	str r4, [r0, #4]
	str r3, [r0, #8]
	ldr r2, [r0, #8]
	b _03003C60
_03003D28:
	add ip, sp, #4
	mov r2, ip
	strh r3, [r2, #-2]!
_03003D34:
	mov r1, #0x4000000
	add ip, r1, #0xd4
	orr r3, r0, #0x81000000
	str r2, [r1, #0xd4]
	str r4, [ip, #4]
	str r3, [ip, #8]
	ldr r2, [ip, #8]
	b _03003C60

	.global sub_03003D54
	.type sub_03003D54, %function
sub_03003D54: @ 03003D54
	mov ip, sp
	push {r4, r5, r6, r7, r8, fp, ip, lr, pc}
	ldr r2, _03003EA0
	sub fp, ip, #4
	ldr r1, [r2]
	ldr ip, _03003EA4
	ldr r6, [r2]
	tst r1, #0x200
	sub r0, ip, #0x50
	moveq r7, ip
	movne r7, r0
	tst r6, #0x1000
	beq _03003E48
	ldr r6, _03003EA8
	ldr r0, [r6]
	cmp r0, #0
	beq _03003DE4
	mov ip, #0
	mov lr, r6
_03003DA0:
	ldr r1, [lr]
	mov r2, #1
	ands r3, r1, r2, lsl ip
	beq _03003DD8
	ldr r3, _03003EAC
	lsl r0, ip, #5
	add r1, r0, r3
	add r2, r0, #0x5000000
	mov r0, #7
_03003DC4:
	ldr r3, [r1], #4
	subs r0, r0, #1
	mvn r3, r3
	str r3, [r2], #4
	bpl _03003DC4
_03003DD8:
	add ip, ip, #1
	cmp ip, #0xf
	ble _03003DA0
_03003DE4:
	mov r2, #0
	str r2, [r6]
	ldr r3, [r7]
	cmp r3, r2
	ble _03003E40
	mov r5, r2
	cmp r5, r3
	bge _03003E40
	mov r6, #0x5000000
	ldr r8, _03003EB0
	add r4, r6, #0x200
	mov r6, #8
_03003E14:
	ldr r0, [r7, r6]
	mov r1, r4
	ldr r3, [r8]
	mov r2, #0x10
	bl sub_03003BB8
	ldr r0, [r7]
	add r5, r5, #1
	cmp r5, r0
	add r4, r4, #0x20
	add r6, r6, #4
	blt _03003E14
_03003E40:
	ldmdb fp, {r4, r5, r6, r7, r8, fp, sp, lr}
	bx lr
_03003E48:
	ldr r6, _03003EA8
	ldr ip, [r6]
	cmp ip, #0
	beq _03003DE4
	mov r4, #0
	mov r5, r6
_03003E60:
	ldr ip, [r5]
	ldr r1, _03003EAC
	mov r3, #1
	lsl r2, r4, #5
	ands r3, ip, r3, lsl r4
	add r0, r2, r1
	ldr lr, _03003EB0
	add r1, r2, #0x5000000
	add r4, r4, #1
	mov r2, #0x10
	beq _03003E94
	ldr r3, [lr]
	bl sub_03003BB8
_03003E94:
	cmp r4, #0xf
	ble _03003E60
	b _03003DE4
_03003EA0:
	.4byte gModeFlags
_03003EA4:
	.4byte 0x0201BA9C
_03003EA8:
	.4byte gPalDirty
_03003EAC:
	.4byte gPalBuffer
_03003EB0:
	.4byte gBrightness

	.global sub_03003EB4
	.type sub_03003EB4, %function
sub_03003EB4: @ 03003EB4
	push {r4, lr}
	ldr r4, _03003F9C
	ldr r3, _03003FA0
	ldr r1, [r4]
	add r2, r3, #0x50
	tst r1, #0x200
	moveq lr, r3
	movne lr, r2
	ldr r1, [lr, #0x48]
	mov r4, r0
	cmp r4, r1
	ldreq r0, [lr, #0x4c]
	beq _03003F94
	ldr r0, [lr]
	cmp r0, #0
	str r4, [lr, #0x48]
	ble _03003F58
	ldr r0, _03003FA4
	ldr r2, _03003FA8
	mov ip, #0
_03003F04:
	lsl r3, ip, #2
	add r1, r3, #8
	ldr r3, [lr, r1]
	cmp r3, r4
	mov r1, ip
	moveq r0, ip
	streq ip, [lr, #0x4c]
	beq _03003F94
	ldrblo ip, [r0, ip]
	ldrbhs ip, [r2, ip]
	cmp ip, #0
	bne _03003F04
	cmp r3, r4
	ldrlo r0, _03003FA4
	ldrhs r0, _03003FA8
	ldrblo ip, [lr]
	ldrbhs r3, [lr]
	strblo ip, [r0, r1]
	strbhs r3, [r0, r1]
	ldrlo r0, [lr]
	ldrhs r0, [lr]
_03003F58:
	cmp r0, #0x10
	movgt r0, #0
	bgt _03003F94
	mov ip, r0
	lsl r1, ip, #2
	add r2, r1, #8
	add r3, ip, #1
	str r3, [lr]
	str r4, [lr, r2]
	ldr r3, _03003FA4
	ldr r2, _03003FA8
	mov r1, #0
	strb r1, [r2, ip]
	strb r1, [r3, ip]
	str ip, [lr, #0x4c]
_03003F94:
	pop {r4, lr}
	bx lr
_03003F9C:
	.4byte gModeFlags
_03003FA0:
	.4byte 0x0201BA4C
_03003FA4:
	.4byte 0x0201BAF8
_03003FA8:
	.4byte 0x0201BB08
	.byte 0x07, 0x20, 0xA0, 0xE3, 0x04, 0x30, 0x90, 0xE4, 0x01, 0x20, 0x52, 0xE2, 0x03, 0xC0, 0xE0, 0xE1
	.byte 0x04, 0xC0, 0x81, 0xE4, 0xFA, 0xFF, 0xFF, 0x5A, 0x1E, 0xFF, 0x2F, 0xE1
