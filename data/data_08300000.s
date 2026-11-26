@ data/data_08300000.s: ROM 0x300000-0x400000 (rom, VMA 0x08300000)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.byte 0x99, 0xAA, 0x88, 0x88, 0x38, 0x33, 0x01, 0x88, 0xB7, 0x00, 0x9A, 0x5A, 0x44, 0x00, 0xA7, 0x75
	.byte 0x77, 0x00, 0xA3, 0x5A, 0x75, 0x00, 0xA3, 0x75, 0x77, 0x00, 0xA6, 0x5A, 0x44, 0x00, 0xA5, 0x5A
	.byte 0x77, 0x00, 0x88, 0x68, 0x77, 0x00, 0x33, 0x56, 0x55, 0x00, 0x00, 0x99, 0x37, 0x66, 0x00, 0x0A
	.byte 0x36, 0x33, 0x00, 0x00, 0x60, 0x33, 0x00, 0x00
	.global gUnk_08300038
gUnk_08300038:
	.incbin "baserom.gba", 0x300038, 0x7F0
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
	.incbin "baserom.gba", 0x31F7A0, 0x198
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
	.incbin "baserom.gba", 0x31F964, 0x139D4
	.global gUnk_08333338
gUnk_08333338:
	.incbin "baserom.gba", 0x333338, 0x50
	.global gUnk_08333388
gUnk_08333388:
	.incbin "baserom.gba", 0x333388, 0x500
	.global gUnk_08333888
gUnk_08333888:
	.incbin "baserom.gba", 0x333888, 0x23EBC
	.global gUnk_08357744
gUnk_08357744:
	.incbin "baserom.gba", 0x357744, 0x1DA4
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
	.incbin "baserom.gba", 0x359514, 0x730C
	.global gUnk_08360820
gUnk_08360820:
	.incbin "baserom.gba", 0x360820, 0xD7F8
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
	.incbin "baserom.gba", 0x36E044, 0x7F3C
	.global gUnk_08375F80
gUnk_08375F80:
	.incbin "baserom.gba", 0x375F80, 0x1910
	.global gUnk_08377890
gUnk_08377890:
	.incbin "baserom.gba", 0x377890, 0x3EF0
	.global gUnk_0837B780
gUnk_0837B780:
	.incbin "baserom.gba", 0x37B780, 0x198
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
	.incbin "baserom.gba", 0x37B944, 0x46BC
	.global gUnk_08380000
gUnk_08380000:
	.incbin "baserom.gba", 0x380000, 0x1110
	.global gUnk_08381110
gUnk_08381110:
	.incbin "baserom.gba", 0x381110, 0x31BD8
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
	.incbin "baserom.gba", 0x3B2D14, 0x12E54
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
	.incbin "baserom.gba", 0x3C5B94, 0x7DFC
	.global gUnk_083CD990
gUnk_083CD990:
	.incbin "baserom.gba", 0x3CD990, 0x2C40
	.global gUnk_083D05D0
gUnk_083D05D0:
	.incbin "baserom.gba", 0x3D05D0, 0x640
	.global gUnk_083D0C10
gUnk_083D0C10:
	.incbin "baserom.gba", 0x3D0C10, 0x590
	.global gUnk_083D11A0
gUnk_083D11A0:
	.incbin "baserom.gba", 0x3D11A0, 0x5E0
	.global gUnk_083D1780
gUnk_083D1780:
	.incbin "baserom.gba", 0x3D1780, 0x580
	.global gUnk_083D1D00
gUnk_083D1D00:
	.incbin "baserom.gba", 0x3D1D00, 0x600
	.global gUnk_083D2300
gUnk_083D2300:
	.incbin "baserom.gba", 0x3D2300, 0x550
	.global gUnk_083D2850
gUnk_083D2850:
	.incbin "baserom.gba", 0x3D2850, 0x6D0
	.global gUnk_083D2F20
gUnk_083D2F20:
	.incbin "baserom.gba", 0x3D2F20, 0x650
	.global gUnk_083D3570
gUnk_083D3570:
	.incbin "baserom.gba", 0x3D3570, 0x490
	.global gUnk_083D3A00
gUnk_083D3A00:
	.incbin "baserom.gba", 0x3D3A00, 0x540
	.global gUnk_083D3F40
gUnk_083D3F40:
	.incbin "baserom.gba", 0x3D3F40, 0x5D0
	.global gUnk_083D4510
gUnk_083D4510:
	.incbin "baserom.gba", 0x3D4510, 0x580
	.global gUnk_083D4A90
gUnk_083D4A90:
	.incbin "baserom.gba", 0x3D4A90, 0x7A0
	.global gUnk_083D5230
gUnk_083D5230:
	.incbin "baserom.gba", 0x3D5230, 0x5E0
	.global gUnk_083D5810
gUnk_083D5810:
	.incbin "baserom.gba", 0x3D5810, 0x580
	.global gUnk_083D5D90
gUnk_083D5D90:
	.incbin "baserom.gba", 0x3D5D90, 0x4C0
	.global gUnk_083D6250
gUnk_083D6250:
	.incbin "baserom.gba", 0x3D6250, 0x4F0
	.global gUnk_083D6740
gUnk_083D6740:
	.incbin "baserom.gba", 0x3D6740, 0x4F0
	.global gUnk_083D6C30
gUnk_083D6C30:
	.incbin "baserom.gba", 0x3D6C30, 0x4F0
	.global gUnk_083D7120
gUnk_083D7120:
	.incbin "baserom.gba", 0x3D7120, 0x4F0
	.global gUnk_083D7610
gUnk_083D7610:
	.incbin "baserom.gba", 0x3D7610, 0x820
	.global gUnk_083D7E30
gUnk_083D7E30:
	.incbin "baserom.gba", 0x3D7E30, 0x630
	.global gUnk_083D8460
gUnk_083D8460:
	.incbin "baserom.gba", 0x3D8460, 0x730
	.global gUnk_083D8B90
gUnk_083D8B90:
	.incbin "baserom.gba", 0x3D8B90, 0x670
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
	.incbin "baserom.gba", 0x3DD860, 0x198
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
	.incbin "baserom.gba", 0x3DDA24, 0x225DC
