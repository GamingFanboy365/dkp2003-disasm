@ data/data_08AC6C00.s: ROM 0xAC6C00-0xB7C200 (rom, VMA 0x08AC6C00)

	.include "asm/macros.inc"

	.section .text, "ax", %progbits
	.balign 256

	.incbin "baserom.gba", 0xAC6C00, 0x6340
	.global gUnk_08ACCF40
gUnk_08ACCF40:
	.byte 0x01
	.global gUnk_08ACCF41
gUnk_08ACCF41:
	.incbin "build/assets/audio/samples/283_13379hz.bin"   @ from assets/audio/samples/283_13379hz.wav
.Lasset_end_ACCF41:
	.global gUnk_08ACCF41_len
	.set gUnk_08ACCF41_len, .Lasset_end_ACCF41 - gUnk_08ACCF41 - 1
	.global gUnk_08ACDF5A
	.set gUnk_08ACDF5A, .Lasset_end_ACCF41 - 1
	.global gUnk_08ACDF5B
gUnk_08ACDF5B:
	.incbin "build/assets/audio/samples/284_8000hz.bin"   @ from assets/audio/samples/284_8000hz.wav
.Lasset_end_ACDF5B:
	.global gUnk_08ACDF5B_len
	.set gUnk_08ACDF5B_len, .Lasset_end_ACDF5B - gUnk_08ACDF5B - 1
	.global gUnk_08AD06A9
	.set gUnk_08AD06A9, .Lasset_end_ACDF5B - 1
	.global gUnk_08AD06AA
gUnk_08AD06AA:
	.incbin "build/assets/audio/samples/285_12000hz.bin"   @ from assets/audio/samples/285_12000hz.wav
.Lasset_end_AD06AA:
	.global gUnk_08AD06AA_len
	.set gUnk_08AD06AA_len, .Lasset_end_AD06AA - gUnk_08AD06AA - 1
	.global gUnk_08AD3538
	.set gUnk_08AD3538, .Lasset_end_AD06AA - 1
	.global gUnk_08AD3539
gUnk_08AD3539:
	.incbin "build/assets/audio/samples/286_11025hz.bin"   @ from assets/audio/samples/286_11025hz.wav
.Lasset_end_AD3539:
	.global gUnk_08AD3539_len
	.set gUnk_08AD3539_len, .Lasset_end_AD3539 - gUnk_08AD3539 - 1
	.global gUnk_08AD49B3
	.set gUnk_08AD49B3, .Lasset_end_AD3539 - 1
	.global gUnk_08AD49B4
gUnk_08AD49B4:
	.incbin "build/assets/audio/samples/287_11025hz.bin"   @ from assets/audio/samples/287_11025hz.wav
.Lasset_end_AD49B4:
	.global gUnk_08AD49B4_len
	.set gUnk_08AD49B4_len, .Lasset_end_AD49B4 - gUnk_08AD49B4 - 1
	.global gUnk_08AD7FF4
	.set gUnk_08AD7FF4, .Lasset_end_AD49B4 - 1
	.global gUnk_08AD7FF5
gUnk_08AD7FF5:
	.incbin "build/assets/audio/samples/288_11025hz.bin"   @ from assets/audio/samples/288_11025hz.wav
.Lasset_end_AD7FF5:
	.global gUnk_08AD7FF5_len
	.set gUnk_08AD7FF5_len, .Lasset_end_AD7FF5 - gUnk_08AD7FF5 - 1
	.global gUnk_08AD84CB
	.set gUnk_08AD84CB, .Lasset_end_AD7FF5 - 1
	.global gUnk_08AD84CC
gUnk_08AD84CC:
	.incbin "build/assets/audio/samples/289_11025hz.bin"   @ from assets/audio/samples/289_11025hz.wav
.Lasset_end_AD84CC:
	.global gUnk_08AD84CC_len
	.set gUnk_08AD84CC_len, .Lasset_end_AD84CC - gUnk_08AD84CC - 1
	.global gUnk_08AD8B3D
	.set gUnk_08AD8B3D, .Lasset_end_AD84CC - 1
	.global gUnk_08AD8B3E
gUnk_08AD8B3E:
	.incbin "build/assets/audio/samples/290_12000hz.bin"   @ from assets/audio/samples/290_12000hz.wav
.Lasset_end_AD8B3E:
	.global gUnk_08AD8B3E_len
	.set gUnk_08AD8B3E_len, .Lasset_end_AD8B3E - gUnk_08AD8B3E - 1
	.global gUnk_08AD96C2
	.set gUnk_08AD96C2, .Lasset_end_AD8B3E - 1
	.global gUnk_08AD96C3
gUnk_08AD96C3:
	.incbin "build/assets/audio/samples/291_12000hz.bin"   @ from assets/audio/samples/291_12000hz.wav
.Lasset_end_AD96C3:
	.global gUnk_08AD96C3_len
	.set gUnk_08AD96C3_len, .Lasset_end_AD96C3 - gUnk_08AD96C3 - 1
	.global gUnk_08ADD103
	.set gUnk_08ADD103, .Lasset_end_AD96C3 - 1
	.global gUnk_08ADD104
gUnk_08ADD104:
	.incbin "build/assets/audio/samples/292_12000hz.bin"   @ from assets/audio/samples/292_12000hz.wav
.Lasset_end_ADD104:
	.global gUnk_08ADD104_len
	.set gUnk_08ADD104_len, .Lasset_end_ADD104 - gUnk_08ADD104 - 1
	.global gUnk_08AE1932
	.set gUnk_08AE1932, .Lasset_end_ADD104 - 1
	.global gUnk_08AE1933
gUnk_08AE1933:
	.incbin "build/assets/audio/samples/293_12000hz.bin"   @ from assets/audio/samples/293_12000hz.wav
.Lasset_end_AE1933:
	.global gUnk_08AE1933_len
	.set gUnk_08AE1933_len, .Lasset_end_AE1933 - gUnk_08AE1933 - 1
	.global gUnk_08AE809A
	.set gUnk_08AE809A, .Lasset_end_AE1933 - 1
	.global gUnk_08AE809B
gUnk_08AE809B:
	.incbin "build/assets/audio/samples/294_11025hz.bin"   @ from assets/audio/samples/294_11025hz.wav
.Lasset_end_AE809B:
	.global gUnk_08AE809B_len
	.set gUnk_08AE809B_len, .Lasset_end_AE809B - gUnk_08AE809B - 1
	.global gUnk_08AEDC1B
	.set gUnk_08AEDC1B, .Lasset_end_AE809B - 1
	.global gUnk_08AEDC1C
gUnk_08AEDC1C:
	.incbin "build/assets/audio/samples/295_11025hz.bin"   @ from assets/audio/samples/295_11025hz.wav
.Lasset_end_AEDC1C:
	.global gUnk_08AEDC1C_len
	.set gUnk_08AEDC1C_len, .Lasset_end_AEDC1C - gUnk_08AEDC1C - 1
	.global gUnk_08AEDE75
	.set gUnk_08AEDE75, .Lasset_end_AEDC1C - 1
	.global gUnk_08AEDE76
gUnk_08AEDE76:
	.incbin "build/assets/audio/samples/296_12000hz.bin"   @ from assets/audio/samples/296_12000hz.wav
.Lasset_end_AEDE76:
	.global gUnk_08AEDE76_len
	.set gUnk_08AEDE76_len, .Lasset_end_AEDE76 - gUnk_08AEDE76 - 1
	.global gUnk_08AEFC63
	.set gUnk_08AEFC63, .Lasset_end_AEDE76 - 1
	.global gUnk_08AEFC64
gUnk_08AEFC64:
	.incbin "build/assets/audio/samples/297_13379hz.bin"   @ from assets/audio/samples/297_13379hz.wav
.Lasset_end_AEFC64:
	.global gUnk_08AEFC64_len
	.set gUnk_08AEFC64_len, .Lasset_end_AEFC64 - gUnk_08AEFC64 - 1
	.global gUnk_08AF0A0B
	.set gUnk_08AF0A0B, .Lasset_end_AEFC64 - 1
	.global gUnk_08AF0A0C
gUnk_08AF0A0C:
	.incbin "build/assets/audio/samples/298_13379hz.bin"   @ from assets/audio/samples/298_13379hz.wav
.Lasset_end_AF0A0C:
	.global gUnk_08AF0A0C_len
	.set gUnk_08AF0A0C_len, .Lasset_end_AF0A0C - gUnk_08AF0A0C - 1
	.global gUnk_08AF1744
	.set gUnk_08AF1744, .Lasset_end_AF0A0C - 1
	.global gUnk_08AF1745
gUnk_08AF1745:
	.incbin "build/assets/audio/samples/299_13379hz.bin"   @ from assets/audio/samples/299_13379hz.wav
.Lasset_end_AF1745:
	.global gUnk_08AF1745_len
	.set gUnk_08AF1745_len, .Lasset_end_AF1745 - gUnk_08AF1745 - 1
	.global gUnk_08AF1BDF
	.set gUnk_08AF1BDF, .Lasset_end_AF1745 - 1
	.global gUnk_08AF1BE0
gUnk_08AF1BE0:
	.incbin "build/assets/audio/samples/300_13379hz.bin"   @ from assets/audio/samples/300_13379hz.wav
.Lasset_end_AF1BE0:
	.global gUnk_08AF1BE0_len
	.set gUnk_08AF1BE0_len, .Lasset_end_AF1BE0 - gUnk_08AF1BE0 - 1
	.global gUnk_08AF20FF
	.set gUnk_08AF20FF, .Lasset_end_AF1BE0 - 1
	.global gUnk_08AF2100
gUnk_08AF2100:
	.incbin "build/assets/audio/samples/301_12000hz.bin"   @ from assets/audio/samples/301_12000hz.wav
.Lasset_end_AF2100:
	.global gUnk_08AF2100_len
	.set gUnk_08AF2100_len, .Lasset_end_AF2100 - gUnk_08AF2100 - 1
	.global gUnk_08AF35A9
	.set gUnk_08AF35A9, .Lasset_end_AF2100 - 1
	.global gUnk_08AF35AA
gUnk_08AF35AA:
	.incbin "build/assets/audio/samples/302_12000hz.bin"   @ from assets/audio/samples/302_12000hz.wav
.Lasset_end_AF35AA:
	.global gUnk_08AF35AA_len
	.set gUnk_08AF35AA_len, .Lasset_end_AF35AA - gUnk_08AF35AA - 1
	.global gUnk_08AFB890
	.set gUnk_08AFB890, .Lasset_end_AF35AA - 1
	.global gUnk_08AFB891
gUnk_08AFB891:
	.incbin "build/assets/audio/samples/303_12000hz.bin"   @ from assets/audio/samples/303_12000hz.wav
.Lasset_end_AFB891:
	.global gUnk_08AFB891_len
	.set gUnk_08AFB891_len, .Lasset_end_AFB891 - gUnk_08AFB891 - 1
	.global gUnk_08AFF1F6
	.set gUnk_08AFF1F6, .Lasset_end_AFB891 - 1
	.global gUnk_08AFF1F7
gUnk_08AFF1F7:
	.incbin "build/assets/audio/samples/304_12000hz.bin"   @ from assets/audio/samples/304_12000hz.wav
.Lasset_end_AFF1F7:
	.global gUnk_08AFF1F7_len
	.set gUnk_08AFF1F7_len, .Lasset_end_AFF1F7 - gUnk_08AFF1F7 - 1
	.global gUnk_08B0008C
	.set gUnk_08B0008C, gUnk_08AFF1F7 + 0xE95
	.global gUnk_08B07737
	.set gUnk_08B07737, .Lasset_end_AFF1F7 - 1
	.global gUnk_08B07738
gUnk_08B07738:
	.incbin "build/assets/audio/samples/305_12000hz.bin"   @ from assets/audio/samples/305_12000hz.wav
.Lasset_end_B07738:
	.global gUnk_08B07738_len
	.set gUnk_08B07738_len, .Lasset_end_B07738 - gUnk_08B07738 - 1
	.global gUnk_08B0B52D
	.set gUnk_08B0B52D, .Lasset_end_B07738 - 1
	.global gUnk_08B0B52E
gUnk_08B0B52E:
	.incbin "build/assets/audio/samples/306_11025hz.bin"   @ from assets/audio/samples/306_11025hz.wav
.Lasset_end_B0B52E:
	.global gUnk_08B0B52E_len
	.set gUnk_08B0B52E_len, .Lasset_end_B0B52E - gUnk_08B0B52E - 1
	.global gUnk_08B0C108
	.set gUnk_08B0C108, .Lasset_end_B0B52E - 1
	.global gUnk_08B0C109
gUnk_08B0C109:
	.incbin "build/assets/audio/samples/307_11025hz.bin"   @ from assets/audio/samples/307_11025hz.wav
.Lasset_end_B0C109:
	.global gUnk_08B0C109_len
	.set gUnk_08B0C109_len, .Lasset_end_B0C109 - gUnk_08B0C109 - 1
	.global gUnk_08B0E1A9
	.set gUnk_08B0E1A9, .Lasset_end_B0C109 - 1
	.global gUnk_08B0E1AA
gUnk_08B0E1AA:
	.incbin "build/assets/audio/samples/308_11025hz.bin"   @ from assets/audio/samples/308_11025hz.wav
.Lasset_end_B0E1AA:
	.global gUnk_08B0E1AA_len
	.set gUnk_08B0E1AA_len, .Lasset_end_B0E1AA - gUnk_08B0E1AA - 1
	.global gUnk_08B12083
	.set gUnk_08B12083, .Lasset_end_B0E1AA - 1
	.global gUnk_08B12084
gUnk_08B12084:
	.incbin "build/assets/audio/samples/309_11025hz.bin"   @ from assets/audio/samples/309_11025hz.wav
.Lasset_end_B12084:
	.global gUnk_08B12084_len
	.set gUnk_08B12084_len, .Lasset_end_B12084 - gUnk_08B12084 - 1
	.global gUnk_08B12F8F
	.set gUnk_08B12F8F, .Lasset_end_B12084 - 1
	.global gUnk_08B12F90
gUnk_08B12F90:
	.incbin "build/assets/audio/samples/310_11025hz.bin"   @ from assets/audio/samples/310_11025hz.wav
.Lasset_end_B12F90:
	.global gUnk_08B12F90_len
	.set gUnk_08B12F90_len, .Lasset_end_B12F90 - gUnk_08B12F90 - 1
	.global gUnk_08B15F99
	.set gUnk_08B15F99, .Lasset_end_B12F90 - 1
	.global gUnk_08B15F9A
gUnk_08B15F9A:
	.incbin "build/assets/audio/samples/311_11025hz.bin"   @ from assets/audio/samples/311_11025hz.wav
.Lasset_end_B15F9A:
	.global gUnk_08B15F9A_len
	.set gUnk_08B15F9A_len, .Lasset_end_B15F9A - gUnk_08B15F9A - 1
	.global gUnk_08B1797E
	.set gUnk_08B1797E, .Lasset_end_B15F9A - 1
	.global gUnk_08B1797F
gUnk_08B1797F:
	.incbin "build/assets/audio/samples/312_11025hz.bin"   @ from assets/audio/samples/312_11025hz.wav
.Lasset_end_B1797F:
	.global gUnk_08B1797F_len
	.set gUnk_08B1797F_len, .Lasset_end_B1797F - gUnk_08B1797F - 1
	.global gUnk_08B18DF9
	.set gUnk_08B18DF9, .Lasset_end_B1797F - 1
	.global gUnk_08B18DFA
gUnk_08B18DFA:
	.incbin "build/assets/audio/samples/313_13379hz.bin"   @ from assets/audio/samples/313_13379hz.wav
.Lasset_end_B18DFA:
	.global gUnk_08B18DFA_len
	.set gUnk_08B18DFA_len, .Lasset_end_B18DFA - gUnk_08B18DFA - 1
	.global gUnk_08B1958B
	.set gUnk_08B1958B, .Lasset_end_B18DFA - 1
	.global gUnk_08B1958C
gUnk_08B1958C:
	.incbin "build/assets/audio/samples/314_8000hz.bin"   @ from assets/audio/samples/314_8000hz.wav
.Lasset_end_B1958C:
	.global gUnk_08B1958C_len
	.set gUnk_08B1958C_len, .Lasset_end_B1958C - gUnk_08B1958C - 1
	.global gUnk_08B1D0AD
	.set gUnk_08B1D0AD, .Lasset_end_B1958C - 1
	.global gUnk_08B1D0AE
gUnk_08B1D0AE:
	.incbin "build/assets/audio/samples/315_8000hz.bin"   @ from assets/audio/samples/315_8000hz.wav
.Lasset_end_B1D0AE:
	.global gUnk_08B1D0AE_len
	.set gUnk_08B1D0AE_len, .Lasset_end_B1D0AE - gUnk_08B1D0AE - 1
	.global gUnk_08B1F7FC
	.set gUnk_08B1F7FC, .Lasset_end_B1D0AE - 1
	.global gUnk_08B1F7FD
gUnk_08B1F7FD:
	.incbin "build/assets/audio/samples/316_11025hz.bin"   @ from assets/audio/samples/316_11025hz.wav
.Lasset_end_B1F7FD:
	.global gUnk_08B1F7FD_len
	.set gUnk_08B1F7FD_len, .Lasset_end_B1F7FD - gUnk_08B1F7FD - 1
	.global gUnk_08B20200
	.set gUnk_08B20200, gUnk_08B1F7FD + 0xA03
	.global gUnk_08B22E3D
	.set gUnk_08B22E3D, .Lasset_end_B1F7FD - 1
	.global gUnk_08B22E3E
gUnk_08B22E3E:
	.incbin "build/assets/audio/samples/317_11025hz.bin"   @ from assets/audio/samples/317_11025hz.wav
.Lasset_end_B22E3E:
	.global gUnk_08B22E3E_len
	.set gUnk_08B22E3E_len, .Lasset_end_B22E3E - gUnk_08B22E3E - 1
	.global gUnk_08B25C90
	.set gUnk_08B25C90, .Lasset_end_B22E3E - 1
	.global gUnk_08B25C91
gUnk_08B25C91:
	.incbin "build/assets/audio/samples/318_13379hz.bin"   @ from assets/audio/samples/318_13379hz.wav
.Lasset_end_B25C91:
	.global gUnk_08B25C91_len
	.set gUnk_08B25C91_len, .Lasset_end_B25C91 - gUnk_08B25C91 - 1
	.global gUnk_08B28978
	.set gUnk_08B28978, .Lasset_end_B25C91 - 1
	.global gUnk_08B28979
gUnk_08B28979:
	.incbin "build/assets/audio/samples/319_11025hz.bin"   @ from assets/audio/samples/319_11025hz.wav
.Lasset_end_B28979:
	.global gUnk_08B28979_len
	.set gUnk_08B28979_len, .Lasset_end_B28979 - gUnk_08B28979 - 1
	.global gUnk_08B295D9
	.set gUnk_08B295D9, .Lasset_end_B28979 - 1
	.global gUnk_08B295DA
gUnk_08B295DA:
	.incbin "build/assets/audio/samples/320_13379hz.bin"   @ from assets/audio/samples/320_13379hz.wav
.Lasset_end_B295DA:
	.global gUnk_08B295DA_len
	.set gUnk_08B295DA_len, .Lasset_end_B295DA - gUnk_08B295DA - 1
	.global gUnk_08B296FE
	.set gUnk_08B296FE, .Lasset_end_B295DA - 1
	.global gUnk_08B296FF
gUnk_08B296FF:
	.incbin "build/assets/audio/samples/321_12000hz.bin"   @ from assets/audio/samples/321_12000hz.wav
.Lasset_end_B296FF:
	.global gUnk_08B296FF_len
	.set gUnk_08B296FF_len, .Lasset_end_B296FF - gUnk_08B296FF - 1
	.global gUnk_08B2A0BB
	.set gUnk_08B2A0BB, .Lasset_end_B296FF - 1
	.global gUnk_08B2A0BC
gUnk_08B2A0BC:
	.incbin "build/assets/audio/samples/322_8000hz.bin"   @ from assets/audio/samples/322_8000hz.wav
.Lasset_end_B2A0BC:
	.global gUnk_08B2A0BC_len
	.set gUnk_08B2A0BC_len, .Lasset_end_B2A0BC - gUnk_08B2A0BC - 1
	.global gUnk_08B2C4D1
	.set gUnk_08B2C4D1, .Lasset_end_B2A0BC - 1
	.global gUnk_08B2C4D2
gUnk_08B2C4D2:
	.incbin "build/assets/audio/samples/323_13379hz.bin"   @ from assets/audio/samples/323_13379hz.wav
.Lasset_end_B2C4D2:
	.global gUnk_08B2C4D2_len
	.set gUnk_08B2C4D2_len, .Lasset_end_B2C4D2 - gUnk_08B2C4D2 - 1
	.global gUnk_08B31771
	.set gUnk_08B31771, .Lasset_end_B2C4D2 - 1
	.global gUnk_08B31772
gUnk_08B31772:
	.incbin "build/assets/audio/samples/324_11025hz.bin"   @ from assets/audio/samples/324_11025hz.wav
.Lasset_end_B31772:
	.global gUnk_08B31772_len
	.set gUnk_08B31772_len, .Lasset_end_B31772 - gUnk_08B31772 - 1
	.global gUnk_08B31F3C
	.set gUnk_08B31F3C, .Lasset_end_B31772 - 1
	.global gUnk_08B31F3D
gUnk_08B31F3D:
	.incbin "build/assets/audio/samples/325_13379hz.bin"   @ from assets/audio/samples/325_13379hz.wav
.Lasset_end_B31F3D:
	.global gUnk_08B31F3D_len
	.set gUnk_08B31F3D_len, .Lasset_end_B31F3D - gUnk_08B31F3D - 1
	.global gUnk_08B32BD3
	.set gUnk_08B32BD3, .Lasset_end_B31F3D - 1
	.global gUnk_08B32BD4
gUnk_08B32BD4:
	.incbin "build/assets/audio/samples/326_13379hz.bin"   @ from assets/audio/samples/326_13379hz.wav
.Lasset_end_B32BD4:
	.global gUnk_08B32BD4_len
	.set gUnk_08B32BD4_len, .Lasset_end_B32BD4 - gUnk_08B32BD4 - 1
	.global gUnk_08B3409C
	.set gUnk_08B3409C, .Lasset_end_B32BD4 - 1
	.global gUnk_08B3409D
gUnk_08B3409D:
	.incbin "build/assets/audio/samples/327_13379hz.bin"   @ from assets/audio/samples/327_13379hz.wav
.Lasset_end_B3409D:
	.global gUnk_08B3409D_len
	.set gUnk_08B3409D_len, .Lasset_end_B3409D - gUnk_08B3409D - 1
	.global gUnk_08B35DB4
	.set gUnk_08B35DB4, .Lasset_end_B3409D - 1
	.global gUnk_08B35DB5
gUnk_08B35DB5:
	.incbin "build/assets/audio/samples/328_12000hz.bin"   @ from assets/audio/samples/328_12000hz.wav
.Lasset_end_B35DB5:
	.global gUnk_08B35DB5_len
	.set gUnk_08B35DB5_len, .Lasset_end_B35DB5 - gUnk_08B35DB5 - 1
	.global gUnk_08B3753A
	.set gUnk_08B3753A, .Lasset_end_B35DB5 - 1
	.global gUnk_08B3753B
gUnk_08B3753B:
	.incbin "build/assets/audio/samples/329_11025hz.bin"   @ from assets/audio/samples/329_11025hz.wav
.Lasset_end_B3753B:
	.global gUnk_08B3753B_len
	.set gUnk_08B3753B_len, .Lasset_end_B3753B - gUnk_08B3753B - 1
	.global gUnk_08B39159
	.set gUnk_08B39159, .Lasset_end_B3753B - 1
	.global gUnk_08B3915A
gUnk_08B3915A:
	.incbin "build/assets/audio/samples/330_11025hz.bin"   @ from assets/audio/samples/330_11025hz.wav
.Lasset_end_B3915A:
	.global gUnk_08B3915A_len
	.set gUnk_08B3915A_len, .Lasset_end_B3915A - gUnk_08B3915A - 1
	.global gUnk_08B3B645
	.set gUnk_08B3B645, .Lasset_end_B3915A - 1
	.global gUnk_08B3B646
gUnk_08B3B646:
	.incbin "build/assets/audio/samples/331_13379hz.bin"   @ from assets/audio/samples/331_13379hz.wav
.Lasset_end_B3B646:
	.global gUnk_08B3B646_len
	.set gUnk_08B3B646_len, .Lasset_end_B3B646 - gUnk_08B3B646 - 1
	.global gUnk_08B3DDC6
	.set gUnk_08B3DDC6, .Lasset_end_B3B646 - 1
	.global gUnk_08B3DDC7
gUnk_08B3DDC7:
	.incbin "build/assets/audio/samples/332_11025hz.bin"   @ from assets/audio/samples/332_11025hz.wav
.Lasset_end_B3DDC7:
	.global gUnk_08B3DDC7_len
	.set gUnk_08B3DDC7_len, .Lasset_end_B3DDC7 - gUnk_08B3DDC7 - 1
	.global gUnk_08B47F22
	.set gUnk_08B47F22, .Lasset_end_B3DDC7 - 1
	.global gUnk_08B47F23
gUnk_08B47F23:
	.incbin "build/assets/audio/samples/333_11025hz.bin"   @ from assets/audio/samples/333_11025hz.wav
.Lasset_end_B47F23:
	.global gUnk_08B47F23_len
	.set gUnk_08B47F23_len, .Lasset_end_B47F23 - gUnk_08B47F23 - 1
	.global gUnk_08B4D720
	.set gUnk_08B4D720, .Lasset_end_B47F23 - 1
	.global gUnk_08B4D721
gUnk_08B4D721:
	.incbin "build/assets/audio/samples/334_13379hz.bin"   @ from assets/audio/samples/334_13379hz.wav
.Lasset_end_B4D721:
	.global gUnk_08B4D721_len
	.set gUnk_08B4D721_len, .Lasset_end_B4D721 - gUnk_08B4D721 - 1
	.global gUnk_08B4DB33
	.set gUnk_08B4DB33, .Lasset_end_B4D721 - 1
	.global gUnk_08B4DB34
gUnk_08B4DB34:
	.incbin "build/assets/audio/samples/335_11025hz.bin"   @ from assets/audio/samples/335_11025hz.wav
.Lasset_end_B4DB34:
	.global gUnk_08B4DB34_len
	.set gUnk_08B4DB34_len, .Lasset_end_B4DB34 - gUnk_08B4DB34 - 1
	.global gUnk_08B4F0DE
	.set gUnk_08B4F0DE, .Lasset_end_B4DB34 - 1
	.global gUnk_08B4F0DF
gUnk_08B4F0DF:
	.incbin "build/assets/audio/samples/336_11025hz.bin"   @ from assets/audio/samples/336_11025hz.wav
.Lasset_end_B4F0DF:
	.global gUnk_08B4F0DF_len
	.set gUnk_08B4F0DF_len, .Lasset_end_B4F0DF - gUnk_08B4F0DF - 1
	.global gUnk_08B5C85F
	.set gUnk_08B5C85F, .Lasset_end_B4F0DF - 1
	.global gUnk_08B5C860
gUnk_08B5C860:
	.incbin "build/assets/audio/samples/337_11025hz.bin"   @ from assets/audio/samples/337_11025hz.wav
.Lasset_end_B5C860:
	.global gUnk_08B5C860_len
	.set gUnk_08B5C860_len, .Lasset_end_B5C860 - gUnk_08B5C860 - 1
	.global gUnk_08B66402
	.set gUnk_08B66402, .Lasset_end_B5C860 - 1
	.global gUnk_08B66403
gUnk_08B66403:
	.incbin "build/assets/audio/samples/338_13379hz.bin"   @ from assets/audio/samples/338_13379hz.wav
.Lasset_end_B66403:
	.global gUnk_08B66403_len
	.set gUnk_08B66403_len, .Lasset_end_B66403 - gUnk_08B66403 - 1
	.global gUnk_08B70AAF
	.set gUnk_08B70AAF, .Lasset_end_B66403 - 1
	.global gUnk_08B70AB0
gUnk_08B70AB0:
	.incbin "build/assets/audio/samples/339_11025hz.bin"   @ from assets/audio/samples/339_11025hz.wav
.Lasset_end_B70AB0:
	.global gUnk_08B70AB0_len
	.set gUnk_08B70AB0_len, .Lasset_end_B70AB0 - gUnk_08B70AB0 - 1
	.global gUnk_08B75831
	.set gUnk_08B75831, .Lasset_end_B70AB0 - 1
	.global gUnk_08B75832
gUnk_08B75832:
	.incbin "build/assets/audio/samples/340_11025hz.bin"   @ from assets/audio/samples/340_11025hz.wav
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
