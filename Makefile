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

.PHONY: all compare clean extract assets
all: $(ROM)

# Game assets (graphics, palettes, levels): `make extract` writes assets/ from
# baserom.gba once; the build converts them to build/assets/*.bin.
ASSET_STAMP := build/assets/.stamp
ASSET_SRCS  := $(shell find assets -type f 2>/dev/null)

extract: $(BASEROM)
	python3 tools/assets.py extract $(BASEROM)

assets: $(ASSET_STAMP)
$(ASSET_STAMP): config/assets.txt tools/assets.py $(ASSET_SRCS)
	@test -d assets || { echo "assets/ is missing: run 'make extract' first"; exit 1; }
	python3 tools/assets.py build
	@touch $@

compare: $(ROM)
	@sha1sum -c dkp.sha1

$(ROM): $(ELF)
	$(OBJCOPY) -O binary $< $@

$(ELF): $(OBJS) ld_script.ld
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

build/%.o: %.s asm/macros.inc $(BASEROM) $(ASSET_STAMP)
	@mkdir -p $(dir $@)
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -rf build $(ROM) $(ELF) $(ROM:.gba=.map)
# (assets/ is kept; delete it and run `make extract` to start over)

# Bug-fix IPS patch (see patches/README.md)
.PHONY: patch
patch: patches/fix_sound_loop.ips
patches/fix_sound_loop.ips: patches/fix_sound_loop.s tools/make_patch.py $(BASEROM)
	python3 tools/make_patch.py $(BASEROM) $< $@ dkp_fixed.gba
