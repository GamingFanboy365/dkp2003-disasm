@ data/data_08200000.s: ROM 0x200000-0x300000 (rom, VMA 0x08200000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x200000, 0x818
	.global gUnk_08200818
gUnk_08200818:
	.incbin "baserom.gba", 0x200818, 0x1D8C0
	.global gUnk_0821E0D8
gUnk_0821E0D8:
	.incbin "build/assets/levels/18/data_14.bin"   @ from assets/levels/18/data_14.bin
	.global gUnk_0822008C
gUnk_0822008C:
	.incbin "baserom.gba", 0x22008C, 0x1E050
	.global gUnk_0823E0DC
gUnk_0823E0DC:
	.incbin "build/assets/levels/19/data_14.bin"   @ from assets/levels/19/data_14.bin
	.global gUnk_0825E0E0
gUnk_0825E0E0:
	.incbin "build/assets/levels/20/data_14.bin"   @ from assets/levels/20/data_14.bin
	.global gUnk_0827E0E4
gUnk_0827E0E4:
	.incbin "build/assets/levels/21/data_14.bin"   @ from assets/levels/21/data_14.bin
	.global gUnk_082828E8
gUnk_082828E8:
	.incbin "build/assets/levels/22/data_14.bin"   @ from assets/levels/22/data_14.bin
	.global gUnk_08288AEC
gUnk_08288AEC:
	.incbin "build/assets/levels/23/data_14.bin"   @ from assets/levels/23/data_14.bin
	.global gUnk_0828D2F0
gUnk_0828D2F0:
	.incbin "build/assets/levels/24/data_14.bin"   @ from assets/levels/24/data_14.bin
	.global gUnk_082934F8
gUnk_082934F8:
	.incbin "baserom.gba", 0x2934F8, 0x504
	.global gUnk_082939FC
gUnk_082939FC:
	.incbin "baserom.gba", 0x2939FC, 0x500
	.global gUnk_08293EFC
gUnk_08293EFC:
	.incbin "build/assets/levels/09/data_20.bin"   @ from assets/levels/09/data_20.bin
	.global gUnk_08293F60
gUnk_08293F60:
	.incbin "build/assets/levels/09/data_1c.bin"   @ from assets/levels/09/data_1c.bin
	.global gUnk_08294024
gUnk_08294024:
	.incbin "build/assets/levels/09/data_24.bin"   @ from assets/levels/09/data_24.bin
	.global gUnk_082940B8
gUnk_082940B8:
	.incbin "build/assets/levels/01/data_20.bin"   @ from assets/levels/01/data_20.bin
	.global gUnk_0829411C
gUnk_0829411C:
	.incbin "build/assets/levels/01/data_1c.bin"   @ from assets/levels/01/data_1c.bin
	.global gUnk_082941E0
gUnk_082941E0:
	.incbin "build/assets/levels/01/data_24.bin"   @ from assets/levels/01/data_24.bin
	.global gUnk_08294274
gUnk_08294274:
	.incbin "build/assets/levels/12/data_20.bin"   @ from assets/levels/12/data_20.bin
	.global gUnk_082942D8
gUnk_082942D8:
	.incbin "build/assets/levels/12/data_24.bin"   @ from assets/levels/12/data_24.bin
	.global gUnk_0829439C
gUnk_0829439C:
	.incbin "build/assets/levels/12/data_1c.bin"   @ from assets/levels/12/data_1c.bin
	.global gUnk_08294430
gUnk_08294430:
	.incbin "build/assets/levels/25/data_14.bin"   @ from assets/levels/25/data_14.bin
	.global gUnk_08294C34
gUnk_08294C34:
	.incbin "build/assets/levels/25/data_24.bin"   @ from assets/levels/25/data_24.bin
	.global gUnk_08294C98
gUnk_08294C98:
	.incbin "build/assets/levels/25/data_1c.bin"   @ from assets/levels/25/data_1c.bin
	.global gUnk_08294D5C
gUnk_08294D5C:
	.incbin "build/assets/levels/25/data_20.bin"   @ from assets/levels/25/data_20.bin
	.global gUnk_08294DF0
gUnk_08294DF0:
	.incbin "baserom.gba", 0x294DF0, 0xD0
	.global gUnk_08294EC0
gUnk_08294EC0:
	.incbin "build/assets/graphics/sprites/049.bin"   @ from assets/graphics/sprites/049.bin
	.global gUnk_082961F0
gUnk_082961F0:
	.incbin "baserom.gba", 0x2961F0, 0xB0
	.global gUnk_082962A0
gUnk_082962A0:
	.incbin "baserom.gba", 0x2962A0, 0xD0
	.global gUnk_08296370
gUnk_08296370:
	.incbin "baserom.gba", 0x296370, 0x190
	.global gUnk_08296500
gUnk_08296500:
	.incbin "baserom.gba", 0x296500, 0x640
	.global gUnk_08296B40
gUnk_08296B40:
	.incbin "baserom.gba", 0x296B40, 0x8890
	.global gUnk_0829F3D0
gUnk_0829F3D0:
	.incbin "baserom.gba", 0x29F3D0, 0x4E0
	.global gUnk_0829F8B0
gUnk_0829F8B0:
	.incbin "build/assets/graphics/sprites/009.bin"   @ from assets/graphics/sprites/009.bin
