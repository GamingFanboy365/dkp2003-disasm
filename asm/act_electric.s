@ asm/act_electric.s: ROM 0x02BED4-0x02C0E0 (rom, VMA 0x0802BED4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.thumb

	.global init_electric
	.thumb_func
	.type init_electric, %function
init_electric: @ 0802BED4
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802BF16
_0802BEDE:
	ldr r1, _0802BF04
	adds r0, r4, #0
	strh r1, [r4]
	movs r2, #0x23
	movs r1, #0x3c
	bl obj_setup_sprite
	adds r2, r4, #0
	adds r2, #0x5a
	ldrh r0, [r2]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r3, _0802BF0C
	adds r0, r1, r3
	ldr r1, _0802BF08
	add sp, #4
	strh r1, [r0, #0xa]
	b _0802BF10
	.byte 0x00, 0x00
_0802BF04:
	.4byte 0x00000001
_0802BF08:
	.4byte 0x00000028
_0802BF0C:
	.4byte gSprites
_0802BF10:
	pop {r4}
	pop {r0}
	bx r0
_0802BF16:
	ldr r0, _0802BF30
	ldr r1, _0802BF34
	str r0, [sp]
	ldr r2, _0802BF38
	ldr r0, _0802BF3C
	movs r3, #0x22
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802BEDE
	.byte 0x00, 0x00
_0802BF30:
	.4byte gUnk_08053160
_0802BF34:
	.4byte gUnk_0805316C
_0802BF38:
	.4byte gUnk_08053180
_0802BF3C:
	.4byte gUnk_08053190

	.global act_electric
	.thumb_func
	.type act_electric, %function
act_electric: @ 0802BF40
	push {r4, lr}
	adds r4, r0, #0
	sub sp, #4
	cmp r4, #0
	beq _0802BF94
_0802BF4A:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r1, [r0, #4]
	ldr r0, _0802BFAC
	lsls r2, r1, #2
	ldr r1, [r0, r2]
	ldr r0, [r1, #0x24]
	str r0, [r4, #0x24]
	ldr r0, [r1, #0x28]
	str r0, [r4, #0x28]
	ldr r0, [r1, #0x2c]
	adds r2, r4, #0
	str r0, [r4, #0x2c]
	adds r2, #0x5a
	ldrh r1, [r2]
	movs r3, #0x18
	muls r3, r1, r3
	ldr r0, _0802BFB0
	adds r3, #8
	ldrh r1, [r0, r3]
	ldr r0, _0802BFB4
	ands r0, r1
	lsls r1, r0, #5
	ldr r2, _0802BFB8
	adds r1, #0x18
	ldr r0, [r2, r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802BF8C
	adds r0, r4, #0
	bl obj_free
_0802BF8C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
_0802BF94:
	ldr r0, _0802BFBC
	ldr r1, _0802BFC0
	str r0, [sp]
	ldr r2, _0802BFC4
	ldr r0, _0802BFC8
	movs r3, #0x38
	bl AGBPrintf
	bl AGBPrintFlush
	.2byte 0xEFFF @ debug trap
	b _0802BF4A
_0802BFAC:
	.4byte gRacerObjects
_0802BFB0:
	.4byte gSprites
_0802BFB4:
	.4byte 0x00007FFF
_0802BFB8:
	.4byte gSpriteFrameCache
_0802BFBC:
	.4byte gUnk_08053160
_0802BFC0:
	.4byte gUnk_0805316C
_0802BFC4:
	.4byte gUnk_080531CC
_0802BFC8:
	.4byte gUnk_08053190

	.global weaponInit
	.thumb_func
	.type weaponInit, %function
weaponInit: @ 0802BFCC
	push {lr}
	ldr r1, _0802C08C
	ldr r3, _0802C090
	movs r0, #0
	str r0, [r1]
	movs r0, #0
	ldrsh r2, [r3, r0]
	cmp r2, #0
	beq _0802C080
	cmp r2, #2
	beq _0802C074
	cmp r2, #4
	beq _0802C068
	cmp r2, #5
	beq _0802C03E
	cmp r2, #6
	beq _0802C00E
_0802BFEE:
	ldr r2, _0802C08C
	ldr r1, [r2]
	cmp r1, #0
	beq _0802C006
_0802BFF6:
	bl sub_0802B544
	bl sub_08029E10
	bl sub_0802ABEC
	pop {r0}
	bx r0
_0802C006:
	ldr r0, _0802C094
	bl AGBPrintf
	b _0802BFF6
_0802C00E:
	adds r3, #0x88
	movs r0, #0
	ldrsh r3, [r3, r0]
	cmp r3, #2
	beq _0802C032
	cmp r3, #3
	beq _0802C02C
	cmp r3, #4
	bne _0802BFEE
	ldr r0, _0802C098
	str r0, [r1]
	ldr r0, _0802C09C
	bl AGBPrintf
	b _0802BFEE
_0802C02C:
	ldr r2, _0802C0A0
	ldr r0, _0802C0A4
	b _0802C078
_0802C032:
	ldr r0, _0802C0A8
	str r0, [r1]
	ldr r0, _0802C0AC
	bl AGBPrintf
	b _0802BFEE
_0802C03E:
	adds r3, #0x88
	movs r2, #0
	ldrsh r3, [r3, r2]
	cmp r3, #2
	beq _0802C062
	cmp r3, #3
	beq _0802C056
	cmp r3, #4
	bne _0802BFEE
	ldr r2, _0802C0B0
	ldr r0, _0802C0B4
	b _0802C078
_0802C056:
	ldr r0, _0802C0B8
	str r0, [r1]
	ldr r0, _0802C0BC
	bl AGBPrintf
	b _0802BFEE
_0802C062:
	ldr r2, _0802C0C0
	ldr r0, _0802C0C4
	b _0802C078
_0802C068:
	ldr r0, _0802C0C8
	str r0, [r1]
	ldr r0, _0802C0CC
	bl AGBPrintf
	b _0802BFEE
_0802C074:
	ldr r2, _0802C0D0
	ldr r0, _0802C0D4
_0802C078:
	str r2, [r1]
	bl AGBPrintf
	b _0802BFEE
_0802C080:
	ldr r0, _0802C0D8
	str r0, [r1]
	ldr r0, _0802C0DC
	bl AGBPrintf
	b _0802BFEE
_0802C08C:
	.4byte 0x0202EC44
_0802C090:
	.4byte gGameSetup
_0802C094:
	.4byte gUnk_080531DC
_0802C098:
	.4byte gUnk_0884F95C
_0802C09C:
	.4byte gUnk_08053200
_0802C0A0:
	.4byte gUnk_0884F83C
_0802C0A4:
	.4byte gUnk_08053238
_0802C0A8:
	.4byte gUnk_0884F71C
_0802C0AC:
	.4byte gUnk_08053270
_0802C0B0:
	.4byte gUnk_0884F4DC
_0802C0B4:
	.4byte gUnk_080532A4
_0802C0B8:
	.4byte gUnk_0884F3BC
_0802C0BC:
	.4byte gUnk_080532DC
_0802C0C0:
	.4byte gUnk_0884F29C
_0802C0C4:
	.4byte gUnk_08053314
_0802C0C8:
	.4byte gUnk_0884F17C
_0802C0CC:
	.4byte gUnk_08053348
_0802C0D0:
	.4byte gUnk_0884F5FC
_0802C0D4:
	.4byte gUnk_08053374
_0802C0D8:
	.4byte gUnk_0884F05C
_0802C0DC:
	.4byte gUnk_080533A8
