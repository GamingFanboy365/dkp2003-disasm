@ data/audio_rodata.s: ROM 0x02F4A4-0x03222C (rom, VMA 0x0802F4A4)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 4

	.incbin "baserom.gba", 0x2F4A4, 0x2D88
