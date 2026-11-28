@ data/data_08AF2100.s: ROM 0xAF2100-0xB7C200 (rom, VMA 0x08AF2100)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.global gUnk_08AF2100
gUnk_08AF2100:
	.incbin "build/assets/audio/samples/303_12000hz.bin"   @ from assets/audio/samples/303_12000hz.wav
.Lasset_end_AF2100:
	.global gUnk_08AF2100_len
	.set gUnk_08AF2100_len, .Lasset_end_AF2100 - gUnk_08AF2100 - 1
	.global gUnk_08AF35A9
	.set gUnk_08AF35A9, .Lasset_end_AF2100 - 1
	.global gUnk_08AF35AA
gUnk_08AF35AA:
	.incbin "build/assets/audio/samples/304_12000hz.bin"   @ from assets/audio/samples/304_12000hz.wav
.Lasset_end_AF35AA:
	.global gUnk_08AF35AA_len
	.set gUnk_08AF35AA_len, .Lasset_end_AF35AA - gUnk_08AF35AA - 1
	.global gUnk_08AFB890
	.set gUnk_08AFB890, .Lasset_end_AF35AA - 1
	.global gUnk_08AFB891
gUnk_08AFB891:
	.incbin "build/assets/audio/samples/305_12000hz.bin"   @ from assets/audio/samples/305_12000hz.wav
.Lasset_end_AFB891:
	.global gUnk_08AFB891_len
	.set gUnk_08AFB891_len, .Lasset_end_AFB891 - gUnk_08AFB891 - 1
	.global gUnk_08AFF1F6
	.set gUnk_08AFF1F6, .Lasset_end_AFB891 - 1
	.global gUnk_08AFF1F7
gUnk_08AFF1F7:
	.incbin "build/assets/audio/samples/306_12000hz.bin"   @ from assets/audio/samples/306_12000hz.wav
.Lasset_end_AFF1F7:
	.global gUnk_08AFF1F7_len
	.set gUnk_08AFF1F7_len, .Lasset_end_AFF1F7 - gUnk_08AFF1F7 - 1
	.global gUnk_08B0008C
	.set gUnk_08B0008C, gUnk_08AFF1F7 + 0xE95
	.global gUnk_08B07737
	.set gUnk_08B07737, .Lasset_end_AFF1F7 - 1
	.global gUnk_08B07738
gUnk_08B07738:
	.incbin "build/assets/audio/samples/307_12000hz.bin"   @ from assets/audio/samples/307_12000hz.wav
.Lasset_end_B07738:
	.global gUnk_08B07738_len
	.set gUnk_08B07738_len, .Lasset_end_B07738 - gUnk_08B07738 - 1
	.global gUnk_08B0B52D
	.set gUnk_08B0B52D, .Lasset_end_B07738 - 1
	.global gUnk_08B0B52E
gUnk_08B0B52E:
	.incbin "build/assets/audio/samples/308_11025hz.bin"   @ from assets/audio/samples/308_11025hz.wav
.Lasset_end_B0B52E:
	.global gUnk_08B0B52E_len
	.set gUnk_08B0B52E_len, .Lasset_end_B0B52E - gUnk_08B0B52E - 1
	.global gUnk_08B0C108
	.set gUnk_08B0C108, .Lasset_end_B0B52E - 1
	.global gUnk_08B0C109
gUnk_08B0C109:
	.incbin "build/assets/audio/samples/309_11025hz.bin"   @ from assets/audio/samples/309_11025hz.wav
.Lasset_end_B0C109:
	.global gUnk_08B0C109_len
	.set gUnk_08B0C109_len, .Lasset_end_B0C109 - gUnk_08B0C109 - 1
	.global gUnk_08B0E1A9
	.set gUnk_08B0E1A9, .Lasset_end_B0C109 - 1
	.global gUnk_08B0E1AA
gUnk_08B0E1AA:
	.incbin "build/assets/audio/samples/310_11025hz.bin"   @ from assets/audio/samples/310_11025hz.wav
.Lasset_end_B0E1AA:
	.global gUnk_08B0E1AA_len
	.set gUnk_08B0E1AA_len, .Lasset_end_B0E1AA - gUnk_08B0E1AA - 1
	.global gUnk_08B12083
	.set gUnk_08B12083, .Lasset_end_B0E1AA - 1
	.global gUnk_08B12084
gUnk_08B12084:
	.incbin "build/assets/audio/samples/311_11025hz.bin"   @ from assets/audio/samples/311_11025hz.wav
.Lasset_end_B12084:
	.global gUnk_08B12084_len
	.set gUnk_08B12084_len, .Lasset_end_B12084 - gUnk_08B12084 - 1
	.global gUnk_08B12F8F
	.set gUnk_08B12F8F, .Lasset_end_B12084 - 1
	.global gUnk_08B12F90
gUnk_08B12F90:
	.incbin "build/assets/audio/samples/312_11025hz.bin"   @ from assets/audio/samples/312_11025hz.wav
.Lasset_end_B12F90:
	.global gUnk_08B12F90_len
	.set gUnk_08B12F90_len, .Lasset_end_B12F90 - gUnk_08B12F90 - 1
	.global gUnk_08B15F99
	.set gUnk_08B15F99, .Lasset_end_B12F90 - 1
	.global gUnk_08B15F9A
gUnk_08B15F9A:
	.incbin "build/assets/audio/samples/313_11025hz.bin"   @ from assets/audio/samples/313_11025hz.wav
.Lasset_end_B15F9A:
	.global gUnk_08B15F9A_len
	.set gUnk_08B15F9A_len, .Lasset_end_B15F9A - gUnk_08B15F9A - 1
	.global gUnk_08B1797E
	.set gUnk_08B1797E, .Lasset_end_B15F9A - 1
	.global gUnk_08B1797F
gUnk_08B1797F:
	.incbin "build/assets/audio/samples/314_11025hz.bin"   @ from assets/audio/samples/314_11025hz.wav
.Lasset_end_B1797F:
	.global gUnk_08B1797F_len
	.set gUnk_08B1797F_len, .Lasset_end_B1797F - gUnk_08B1797F - 1
	.global gUnk_08B18DF9
	.set gUnk_08B18DF9, .Lasset_end_B1797F - 1
	.global gUnk_08B18DFA
gUnk_08B18DFA:
	.incbin "build/assets/audio/samples/315_13379hz.bin"   @ from assets/audio/samples/315_13379hz.wav
.Lasset_end_B18DFA:
	.global gUnk_08B18DFA_len
	.set gUnk_08B18DFA_len, .Lasset_end_B18DFA - gUnk_08B18DFA - 1
	.global gUnk_08B1958B
	.set gUnk_08B1958B, .Lasset_end_B18DFA - 1
	.global gUnk_08B1958C
gUnk_08B1958C:
	.incbin "build/assets/audio/samples/316_8000hz.bin"   @ from assets/audio/samples/316_8000hz.wav
.Lasset_end_B1958C:
	.global gUnk_08B1958C_len
	.set gUnk_08B1958C_len, .Lasset_end_B1958C - gUnk_08B1958C - 1
	.global gUnk_08B1D0AD
	.set gUnk_08B1D0AD, .Lasset_end_B1958C - 1
	.global gUnk_08B1D0AE
gUnk_08B1D0AE:
	.incbin "build/assets/audio/samples/317_8000hz.bin"   @ from assets/audio/samples/317_8000hz.wav
.Lasset_end_B1D0AE:
	.global gUnk_08B1D0AE_len
	.set gUnk_08B1D0AE_len, .Lasset_end_B1D0AE - gUnk_08B1D0AE - 1
	.global gUnk_08B1F7FC
	.set gUnk_08B1F7FC, .Lasset_end_B1D0AE - 1
	.global gUnk_08B1F7FD
gUnk_08B1F7FD:
	.incbin "build/assets/audio/samples/318_11025hz.bin"   @ from assets/audio/samples/318_11025hz.wav
.Lasset_end_B1F7FD:
	.global gUnk_08B1F7FD_len
	.set gUnk_08B1F7FD_len, .Lasset_end_B1F7FD - gUnk_08B1F7FD - 1
	.global gUnk_08B20200
	.set gUnk_08B20200, gUnk_08B1F7FD + 0xA03
	.global gUnk_08B22E3D
	.set gUnk_08B22E3D, .Lasset_end_B1F7FD - 1
	.global gUnk_08B22E3E
gUnk_08B22E3E:
	.incbin "build/assets/audio/samples/319_11025hz.bin"   @ from assets/audio/samples/319_11025hz.wav
.Lasset_end_B22E3E:
	.global gUnk_08B22E3E_len
	.set gUnk_08B22E3E_len, .Lasset_end_B22E3E - gUnk_08B22E3E - 1
	.global gUnk_08B25C90
	.set gUnk_08B25C90, .Lasset_end_B22E3E - 1
	.global gUnk_08B25C91
gUnk_08B25C91:
	.incbin "build/assets/audio/samples/320_13379hz.bin"   @ from assets/audio/samples/320_13379hz.wav
.Lasset_end_B25C91:
	.global gUnk_08B25C91_len
	.set gUnk_08B25C91_len, .Lasset_end_B25C91 - gUnk_08B25C91 - 1
	.global gUnk_08B28978
	.set gUnk_08B28978, .Lasset_end_B25C91 - 1
	.global gUnk_08B28979
gUnk_08B28979:
	.incbin "build/assets/audio/samples/321_11025hz.bin"   @ from assets/audio/samples/321_11025hz.wav
.Lasset_end_B28979:
	.global gUnk_08B28979_len
	.set gUnk_08B28979_len, .Lasset_end_B28979 - gUnk_08B28979 - 1
	.global gUnk_08B295D9
	.set gUnk_08B295D9, .Lasset_end_B28979 - 1
	.global gUnk_08B295DA
gUnk_08B295DA:
	.incbin "build/assets/audio/samples/322_13379hz.bin"   @ from assets/audio/samples/322_13379hz.wav
.Lasset_end_B295DA:
	.global gUnk_08B295DA_len
	.set gUnk_08B295DA_len, .Lasset_end_B295DA - gUnk_08B295DA - 1
	.global gUnk_08B296FE
	.set gUnk_08B296FE, .Lasset_end_B295DA - 1
	.global gUnk_08B296FF
gUnk_08B296FF:
	.incbin "build/assets/audio/samples/323_12000hz.bin"   @ from assets/audio/samples/323_12000hz.wav
.Lasset_end_B296FF:
	.global gUnk_08B296FF_len
	.set gUnk_08B296FF_len, .Lasset_end_B296FF - gUnk_08B296FF - 1
	.global gUnk_08B2A0BB
	.set gUnk_08B2A0BB, .Lasset_end_B296FF - 1
	.global gUnk_08B2A0BC
gUnk_08B2A0BC:
	.incbin "build/assets/audio/samples/324_8000hz.bin"   @ from assets/audio/samples/324_8000hz.wav
.Lasset_end_B2A0BC:
	.global gUnk_08B2A0BC_len
	.set gUnk_08B2A0BC_len, .Lasset_end_B2A0BC - gUnk_08B2A0BC - 1
	.global gUnk_08B2C4D1
	.set gUnk_08B2C4D1, .Lasset_end_B2A0BC - 1
	.global gUnk_08B2C4D2
gUnk_08B2C4D2:
	.incbin "build/assets/audio/samples/325_13379hz.bin"   @ from assets/audio/samples/325_13379hz.wav
.Lasset_end_B2C4D2:
	.global gUnk_08B2C4D2_len
	.set gUnk_08B2C4D2_len, .Lasset_end_B2C4D2 - gUnk_08B2C4D2 - 1
	.global gUnk_08B31771
	.set gUnk_08B31771, .Lasset_end_B2C4D2 - 1
	.global gUnk_08B31772
gUnk_08B31772:
	.incbin "build/assets/audio/samples/326_11025hz.bin"   @ from assets/audio/samples/326_11025hz.wav
.Lasset_end_B31772:
	.global gUnk_08B31772_len
	.set gUnk_08B31772_len, .Lasset_end_B31772 - gUnk_08B31772 - 1
	.global gUnk_08B31F3C
	.set gUnk_08B31F3C, .Lasset_end_B31772 - 1
	.global gUnk_08B31F3D
gUnk_08B31F3D:
	.incbin "build/assets/audio/samples/327_13379hz.bin"   @ from assets/audio/samples/327_13379hz.wav
.Lasset_end_B31F3D:
	.global gUnk_08B31F3D_len
	.set gUnk_08B31F3D_len, .Lasset_end_B31F3D - gUnk_08B31F3D - 1
	.global gUnk_08B32BD3
	.set gUnk_08B32BD3, .Lasset_end_B31F3D - 1
	.global gUnk_08B32BD4
gUnk_08B32BD4:
	.incbin "build/assets/audio/samples/328_13379hz.bin"   @ from assets/audio/samples/328_13379hz.wav
.Lasset_end_B32BD4:
	.global gUnk_08B32BD4_len
	.set gUnk_08B32BD4_len, .Lasset_end_B32BD4 - gUnk_08B32BD4 - 1
	.global gUnk_08B3409C
	.set gUnk_08B3409C, .Lasset_end_B32BD4 - 1
	.global gUnk_08B3409D
gUnk_08B3409D:
	.incbin "build/assets/audio/samples/329_13379hz.bin"   @ from assets/audio/samples/329_13379hz.wav
.Lasset_end_B3409D:
	.global gUnk_08B3409D_len
	.set gUnk_08B3409D_len, .Lasset_end_B3409D - gUnk_08B3409D - 1
	.global gUnk_08B35DB4
	.set gUnk_08B35DB4, .Lasset_end_B3409D - 1
	.global gUnk_08B35DB5
gUnk_08B35DB5:
	.incbin "build/assets/audio/samples/330_12000hz.bin"   @ from assets/audio/samples/330_12000hz.wav
.Lasset_end_B35DB5:
	.global gUnk_08B35DB5_len
	.set gUnk_08B35DB5_len, .Lasset_end_B35DB5 - gUnk_08B35DB5 - 1
	.global gUnk_08B3753A
	.set gUnk_08B3753A, .Lasset_end_B35DB5 - 1
	.global gUnk_08B3753B
gUnk_08B3753B:
	.incbin "build/assets/audio/samples/331_11025hz.bin"   @ from assets/audio/samples/331_11025hz.wav
.Lasset_end_B3753B:
	.global gUnk_08B3753B_len
	.set gUnk_08B3753B_len, .Lasset_end_B3753B - gUnk_08B3753B - 1
	.global gUnk_08B39159
	.set gUnk_08B39159, .Lasset_end_B3753B - 1
	.global gUnk_08B3915A
gUnk_08B3915A:
	.incbin "build/assets/audio/samples/332_11025hz.bin"   @ from assets/audio/samples/332_11025hz.wav
.Lasset_end_B3915A:
	.global gUnk_08B3915A_len
	.set gUnk_08B3915A_len, .Lasset_end_B3915A - gUnk_08B3915A - 1
	.global gUnk_08B3B645
	.set gUnk_08B3B645, .Lasset_end_B3915A - 1
	.global gUnk_08B3B646
gUnk_08B3B646:
	.incbin "build/assets/audio/samples/333_13379hz.bin"   @ from assets/audio/samples/333_13379hz.wav
.Lasset_end_B3B646:
	.global gUnk_08B3B646_len
	.set gUnk_08B3B646_len, .Lasset_end_B3B646 - gUnk_08B3B646 - 1
	.global gUnk_08B3DDC6
	.set gUnk_08B3DDC6, .Lasset_end_B3B646 - 1
	.global gUnk_08B3DDC7
gUnk_08B3DDC7:
	.incbin "build/assets/audio/samples/334_11025hz.bin"   @ from assets/audio/samples/334_11025hz.wav
.Lasset_end_B3DDC7:
	.global gUnk_08B3DDC7_len
	.set gUnk_08B3DDC7_len, .Lasset_end_B3DDC7 - gUnk_08B3DDC7 - 1
	.global gUnk_08B47F22
	.set gUnk_08B47F22, .Lasset_end_B3DDC7 - 1
	.global gUnk_08B47F23
gUnk_08B47F23:
	.incbin "build/assets/audio/samples/335_11025hz.bin"   @ from assets/audio/samples/335_11025hz.wav
.Lasset_end_B47F23:
	.global gUnk_08B47F23_len
	.set gUnk_08B47F23_len, .Lasset_end_B47F23 - gUnk_08B47F23 - 1
	.global gUnk_08B4D720
	.set gUnk_08B4D720, .Lasset_end_B47F23 - 1
	.global gUnk_08B4D721
gUnk_08B4D721:
	.incbin "build/assets/audio/samples/336_13379hz.bin"   @ from assets/audio/samples/336_13379hz.wav
.Lasset_end_B4D721:
	.global gUnk_08B4D721_len
	.set gUnk_08B4D721_len, .Lasset_end_B4D721 - gUnk_08B4D721 - 1
	.global gUnk_08B4DB33
	.set gUnk_08B4DB33, .Lasset_end_B4D721 - 1
	.global gUnk_08B4DB34
gUnk_08B4DB34:
	.incbin "build/assets/audio/samples/337_11025hz.bin"   @ from assets/audio/samples/337_11025hz.wav
.Lasset_end_B4DB34:
	.global gUnk_08B4DB34_len
	.set gUnk_08B4DB34_len, .Lasset_end_B4DB34 - gUnk_08B4DB34 - 1
	.global gUnk_08B4F0DE
	.set gUnk_08B4F0DE, .Lasset_end_B4DB34 - 1
	.global gUnk_08B4F0DF
gUnk_08B4F0DF:
	.incbin "build/assets/audio/samples/338_11025hz.bin"   @ from assets/audio/samples/338_11025hz.wav
.Lasset_end_B4F0DF:
	.global gUnk_08B4F0DF_len
	.set gUnk_08B4F0DF_len, .Lasset_end_B4F0DF - gUnk_08B4F0DF - 1
	.global gUnk_08B5C85F
	.set gUnk_08B5C85F, .Lasset_end_B4F0DF - 1
	.global gUnk_08B5C860
gUnk_08B5C860:
	.incbin "build/assets/audio/samples/339_11025hz.bin"   @ from assets/audio/samples/339_11025hz.wav
.Lasset_end_B5C860:
	.global gUnk_08B5C860_len
	.set gUnk_08B5C860_len, .Lasset_end_B5C860 - gUnk_08B5C860 - 1
	.global gUnk_08B66402
	.set gUnk_08B66402, .Lasset_end_B5C860 - 1
	.global gUnk_08B66403
gUnk_08B66403:
	.incbin "build/assets/audio/samples/340_13379hz.bin"   @ from assets/audio/samples/340_13379hz.wav
.Lasset_end_B66403:
	.global gUnk_08B66403_len
	.set gUnk_08B66403_len, .Lasset_end_B66403 - gUnk_08B66403 - 1
	.global gUnk_08B70AAF
	.set gUnk_08B70AAF, .Lasset_end_B66403 - 1
	.global gUnk_08B70AB0
gUnk_08B70AB0:
	.incbin "build/assets/audio/samples/341_11025hz.bin"   @ from assets/audio/samples/341_11025hz.wav
.Lasset_end_B70AB0:
	.global gUnk_08B70AB0_len
	.set gUnk_08B70AB0_len, .Lasset_end_B70AB0 - gUnk_08B70AB0 - 1
	.global gUnk_08B75831
	.set gUnk_08B75831, .Lasset_end_B70AB0 - 1
	.global gUnk_08B75832
gUnk_08B75832:
	.incbin "build/assets/audio/samples/342_11025hz.bin"   @ from assets/audio/samples/342_11025hz.wav
.Lasset_end_B75832:
	.global gUnk_08B75832_len
	.set gUnk_08B75832_len, .Lasset_end_B75832 - gUnk_08B75832 - 1
	.global gUnk_08B7C18B
	.set gUnk_08B7C18B, .Lasset_end_B75832 - 1
	.global gUnk_08B7C18C
gUnk_08B7C18C:
	.byte 0x00, 0x20, 0xA1, 0x07, 0x02, 0x80, 0x01, 0x02, 0x00, 0xAE, 0x0B
	.global gUnk_08B7C197
gUnk_08B7C197:
	.incbin "baserom.gba", 0xB7C197, 0x69
