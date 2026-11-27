@ data/data_08300000.s: ROM 0x300000-0x400000 (rom, VMA 0x08300000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0x300000, 0x828
	.global gUnk_08300828
gUnk_08300828:
	.incbin "baserom.gba", 0x300828, 0x8DC0
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
	.incbin "baserom.gba", 0x309614, 0x8D8C
	.global gUnk_083123A0
gUnk_083123A0:
	.incbin "baserom.gba", 0x3123A0, 0xCA00
	.global gUnk_0831EDA0
gUnk_0831EDA0:
	.incbin "baserom.gba", 0x31EDA0, 0x7A0
	.global gUnk_0831F540
gUnk_0831F540:
	.incbin "baserom.gba", 0x31F540, 0x260
	.global gUnk_0831F7A0
gUnk_0831F7A0:
	.incbin "build/assets/graphics/sprites/001.bin"   @ from assets/graphics/sprites/001.bin
	.global gUnk_08375F80
gUnk_08375F80:
	.incbin "build/assets/graphics/sprites/012.bin"   @ from assets/graphics/sprites/012.bin
	.global gUnk_08377890
gUnk_08377890:
	.incbin "build/assets/graphics/sprites/011.bin"   @ from assets/graphics/sprites/011.bin
	.global gUnk_0837B780
gUnk_0837B780:
	.incbin "build/assets/graphics/sprites/002.bin"   @ from assets/graphics/sprites/002.bin
	.global gUnk_083CD990
gUnk_083CD990:
	.incbin "build/assets/graphics/sprites/013.bin"   @ from assets/graphics/sprites/013.bin
	.global gUnk_083D05D0
gUnk_083D05D0:
	.incbin "build/assets/levels/tracks/54_map.bin"   @ from assets/levels/tracks/54_map.bin
	.global gUnk_083D0830
gUnk_083D0830:
	.incbin "baserom.gba", 0x3D0830, 0x3E0
	.global gUnk_083D0C10
gUnk_083D0C10:
	.incbin "build/assets/levels/tracks/55_map.bin"   @ from assets/levels/tracks/55_map.bin
	.global gUnk_083D11A0
gUnk_083D11A0:
	.incbin "build/assets/levels/tracks/56_map.bin"   @ from assets/levels/tracks/56_map.bin
	.global gUnk_083D1780
gUnk_083D1780:
	.incbin "build/assets/levels/tracks/57_map.bin"   @ from assets/levels/tracks/57_map.bin
	.global gUnk_083D1D00
gUnk_083D1D00:
	.incbin "build/assets/levels/tracks/58_map.bin"   @ from assets/levels/tracks/58_map.bin
	.global gUnk_083D2300
gUnk_083D2300:
	.incbin "build/assets/levels/tracks/59_map.bin"   @ from assets/levels/tracks/59_map.bin
	.global gUnk_083D2850
gUnk_083D2850:
	.incbin "build/assets/levels/tracks/5a_map.bin"   @ from assets/levels/tracks/5a_map.bin
	.global gUnk_083D2F20
gUnk_083D2F20:
	.incbin "build/assets/levels/tracks/5b_map.bin"   @ from assets/levels/tracks/5b_map.bin
	.global gUnk_083D3570
gUnk_083D3570:
	.incbin "build/assets/levels/tracks/5c_map.bin"   @ from assets/levels/tracks/5c_map.bin
	.global gUnk_083D3A00
gUnk_083D3A00:
	.incbin "build/assets/levels/tracks/5d_map.bin"   @ from assets/levels/tracks/5d_map.bin
	.global gUnk_083D3F40
gUnk_083D3F40:
	.incbin "build/assets/levels/tracks/5e_map.bin"   @ from assets/levels/tracks/5e_map.bin
	.global gUnk_083D4510
gUnk_083D4510:
	.incbin "build/assets/levels/tracks/5f_map.bin"   @ from assets/levels/tracks/5f_map.bin
	.global gUnk_083D4A90
gUnk_083D4A90:
	.incbin "build/assets/levels/tracks/60_map.bin"   @ from assets/levels/tracks/60_map.bin
	.global gUnk_083D5230
gUnk_083D5230:
	.incbin "build/assets/levels/tracks/61_map.bin"   @ from assets/levels/tracks/61_map.bin
	.global gUnk_083D5810
gUnk_083D5810:
	.incbin "build/assets/levels/tracks/62_map.bin"   @ from assets/levels/tracks/62_map.bin
	.global gUnk_083D5D90
gUnk_083D5D90:
	.incbin "build/assets/levels/tracks/63_map.bin"   @ from assets/levels/tracks/63_map.bin
	.global gUnk_083D6250
gUnk_083D6250:
	.incbin "build/assets/levels/tracks/78_map.bin"   @ from assets/levels/tracks/78_map.bin
	.global gUnk_083D6740
gUnk_083D6740:
	.incbin "build/assets/levels/tracks/79_map.bin"   @ from assets/levels/tracks/79_map.bin
	.global gUnk_083D6C30
gUnk_083D6C30:
	.incbin "build/assets/levels/tracks/7a_map.bin"   @ from assets/levels/tracks/7a_map.bin
	.global gUnk_083D7120
gUnk_083D7120:
	.incbin "build/assets/levels/tracks/7b_map.bin"   @ from assets/levels/tracks/7b_map.bin
	.global gUnk_083D7610
gUnk_083D7610:
	.incbin "build/assets/levels/tracks/74_map.bin"   @ from assets/levels/tracks/74_map.bin
	.global gUnk_083D7E30
gUnk_083D7E30:
	.incbin "build/assets/levels/tracks/75_map.bin"   @ from assets/levels/tracks/75_map.bin
	.global gUnk_083D8460
gUnk_083D8460:
	.incbin "build/assets/levels/tracks/76_map.bin"   @ from assets/levels/tracks/76_map.bin
	.global gUnk_083D8B90
gUnk_083D8B90:
	.incbin "build/assets/levels/tracks/77_map.bin"   @ from assets/levels/tracks/77_map.bin
	.global gUnk_083D9200
gUnk_083D9200:
	.incbin "baserom.gba", 0x3D9200, 0x6E0
	.global gUnk_083D98E0
gUnk_083D98E0:
	.incbin "baserom.gba", 0x3D98E0, 0x630
	.global gUnk_083D9F10
gUnk_083D9F10:
	.incbin "baserom.gba", 0x3D9F10, 0x3950
	.global gUnk_083DD860
gUnk_083DD860:
	.incbin "build/assets/graphics/sprites/006.bin"   @ from assets/graphics/sprites/006.bin
