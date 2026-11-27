@ data/data_08200000.s: ROM 0x200000-0x3D1D00 (rom, VMA 0x08200000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x200000, 0x1E0D8
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
	.incbin "build/assets/graphics/sprites/049.bin"   @ from assets/graphics/sprites/049.png
.Lasset_295BB0:
	.incbin "build/assets/graphics/sprites/049_2.bin"   @ from assets/graphics/sprites/049_2.png
.Lasset_296010:
	.incbin "build/assets/graphics/sprites/049_3.bin"   @ from assets/graphics/sprites/049_3.png
	.global gUnk_082961F0
gUnk_082961F0:
	.incbin "build/assets/graphics/sprites/049_4.bin"   @ from assets/graphics/sprites/049_4.png
	.global gUnk_082962A0
gUnk_082962A0:
	.incbin "build/assets/graphics/sprites/049_5.bin"   @ from assets/graphics/sprites/049_5.png
	.global gUnk_08296370
gUnk_08296370:
	.incbin "build/assets/graphics/sprites/049_6.bin"   @ from assets/graphics/sprites/049_6.png
	.global gUnk_08296500
gUnk_08296500:
	.incbin "build/assets/graphics/sprites/049_7.bin"   @ from assets/graphics/sprites/049_7.png
	.global gUnk_08296B40
gUnk_08296B40:
	.incbin "build/assets/graphics/sprites/049_8.bin"   @ from assets/graphics/sprites/049_8.png
	.global gUnk_0829F3D0
gUnk_0829F3D0:
	.incbin "build/assets/graphics/sprites/049_9.bin"   @ from assets/graphics/sprites/049_9.png
	.global gUnk_0829F8B0
gUnk_0829F8B0:
	.incbin "build/assets/graphics/sprites/009.bin"   @ from assets/graphics/sprites/009.png
.Lasset_2EF5E0:
	.incbin "build/assets/graphics/sprites/009_2.bin"   @ from assets/graphics/sprites/009_2.png
.Lasset_309450:
	.incbin "build/assets/graphics/sprites/009_3.bin"   @ from assets/graphics/sprites/009_3.png
	.global gUnk_083123A0
gUnk_083123A0:
	.incbin "build/assets/graphics/sprites/009_4.bin"   @ from assets/graphics/sprites/009_4.png
	.global gUnk_0831EDA0
gUnk_0831EDA0:
	.incbin "build/assets/graphics/sprites/009_5.bin"   @ from assets/graphics/sprites/009_5.png
	.global gUnk_0831F540
gUnk_0831F540:
	.incbin "build/assets/graphics/sprites/009_6.bin"   @ from assets/graphics/sprites/009_6.png
	.global gUnk_0831F7A0
gUnk_0831F7A0:
	.incbin "build/assets/graphics/sprites/001.bin"   @ from assets/graphics/sprites/001.png
.Lasset_359350:
	.incbin "build/assets/graphics/sprites/001_2.bin"   @ from assets/graphics/sprites/001_2.png
.Lasset_36DE80:
	.incbin "build/assets/graphics/sprites/001_3.bin"   @ from assets/graphics/sprites/001_3.png
	.global gUnk_08375F80
gUnk_08375F80:
	.incbin "build/assets/graphics/sprites/012.bin"   @ from assets/graphics/sprites/012.png
	.global gUnk_08377890
gUnk_08377890:
	.incbin "build/assets/graphics/sprites/011.bin"   @ from assets/graphics/sprites/011.png
	.global gUnk_0837B780
gUnk_0837B780:
	.incbin "build/assets/graphics/sprites/002.bin"   @ from assets/graphics/sprites/002.png
.Lasset_3B2B50:
	.incbin "build/assets/graphics/sprites/002_2.bin"   @ from assets/graphics/sprites/002_2.png
.Lasset_3C59D0:
	.incbin "build/assets/graphics/sprites/002_3.bin"   @ from assets/graphics/sprites/002_3.png
	.global gUnk_083CD990
gUnk_083CD990:
	.incbin "build/assets/graphics/sprites/013.bin"   @ from assets/graphics/sprites/013.png
	.global gUnk_083D05D0
gUnk_083D05D0:
	.incbin "build/assets/levels/tracks/54_map.bin"   @ from assets/levels/tracks/54_map.png
	.global gUnk_083D0830
	.set gUnk_083D0830, gUnk_083D05D0 + 0x260
	.global gUnk_083D0C10
gUnk_083D0C10:
	.incbin "build/assets/levels/tracks/55_map.bin"   @ from assets/levels/tracks/55_map.png
	.global gUnk_083D11A0
gUnk_083D11A0:
	.incbin "build/assets/levels/tracks/56_map.bin"   @ from assets/levels/tracks/56_map.png
	.global gUnk_083D1780
gUnk_083D1780:
	.incbin "build/assets/levels/tracks/57_map.bin"   @ from assets/levels/tracks/57_map.png
