# Diddy Kong Pilot (2003 prototype build) disassembly

ROM      := dkp.gba
ELF      := $(ROM:.gba=.elf)
BASEROM  := baserom.gba

PREFIX   ?= arm-none-eabi-
AS       := $(PREFIX)as
LD       := $(PREFIX)ld
OBJCOPY  := $(PREFIX)objcopy

ASFLAGS  := -mcpu=arm7tdmi -I .
LDFLAGS  := -T ld_script.ld -Map $(ROM:.gba=.map) --no-warn-rwx-segments

include objects.mk

.PHONY: all compare clean
all: $(ROM)

compare: $(ROM)
	@sha1sum -c dkp.sha1

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@

$(ELF): $(OBJS) ld_script.ld
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

build/%.o: %.s asm/macros.inc $(BASEROM)
	@mkdir -p $(dir $@)
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -rf build $(ROM) $(ELF) $(ROM:.gba=.map)

# Bug-fix IPS patch (see patches/README.md)
.PHONY: patch
patch: patches/fix_sound_loop.ips
patches/fix_sound_loop.ips: patches/fix_sound_loop.s tools/make_patch.py $(BASEROM)
	python3 tools/make_patch.py $(BASEROM) $< $@ dkp_fixed.gba
