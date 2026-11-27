@ data/data_08400000.s: ROM 0x400000-0x500000 (rom, VMA 0x08400000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x400000, 0x838
	.global gUnk_08400838
gUnk_08400838:
	.incbin "baserom.gba", 0x400838, 0x97A4
	.4byte gUnk_08880000
	.4byte gUnk_08A60000
	.4byte gUnk_08660000
	.incbin "baserom.gba", 0x409FE8, 0x15750
	.4byte gUnk_08100808
	.4byte gUnk_08200818
	.4byte gUnk_08300828
	.4byte gUnk_08400838
	.4byte gUnk_08500848
	.4byte gUnk_08600858
	.4byte gUnk_08700868
	.4byte gUnk_08800878
	.4byte gUnk_08900888
	.4byte gUnk_08A00898
	.4byte gUnk_08B008A8
	.incbin "baserom.gba", 0x41F764, 0x17444
	.4byte gUnk_08100808
	.4byte gUnk_08200818
	.4byte gUnk_08300828
	.4byte gUnk_08400838
	.4byte gUnk_08500848
	.4byte gUnk_08600858
	.4byte gUnk_08700868
	.4byte gUnk_08800878
	.4byte gUnk_08900888
	.4byte gUnk_08A00898
	.4byte gUnk_08B008A8
	.incbin "baserom.gba", 0x436BD4, 0x88AC
	.global gUnk_0843F480
gUnk_0843F480:
	.incbin "baserom.gba", 0x43F480, 0x680
	.global gUnk_0843FB00
gUnk_0843FB00:
	.incbin "baserom.gba", 0x43FB00, 0x29F0
	.global gUnk_084424F0
gUnk_084424F0:
	.incbin "baserom.gba", 0x4424F0, 0x5330
	.global gUnk_08447820
gUnk_08447820:
	.incbin "baserom.gba", 0x447820, 0x18A0
	.global gUnk_084490C0
gUnk_084490C0:
	.incbin "baserom.gba", 0x4490C0, 0x33C0
	.global gUnk_0844C480
gUnk_0844C480:
	.incbin "build/assets/graphics/sprites/004.bin"   @ from assets/graphics/sprites/004.bin
	.global gUnk_0849F7C0
gUnk_0849F7C0:
	.incbin "baserom.gba", 0x49F7C0, 0x36D0
	.global gUnk_084A2E90
gUnk_084A2E90:
	.incbin "baserom.gba", 0x4A2E90, 0x3810
	.global gUnk_084A66A0
gUnk_084A66A0:
	.incbin "build/assets/graphics/sprites/003.bin"   @ from assets/graphics/sprites/003.bin
