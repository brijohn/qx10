# Build BIOS 2.20 patches using zmac
ZMAC := ../../../tools/bin/zmac
BUILD_DIR := ../../../build/bios/2.20

PATCHES := bios-ba93-patch.cim bios-bab6-patch.cim bios-bc35-patch.cim \
           bios-bc81-patch.cim bios-bcef-patch.cim bios-f736-patch.cim

.PHONY: all clean

all: $(BUILD_DIR)/cpm2.sys

# Build individual patch binaries
$(BUILD_DIR)/patches/%.cim: %.asm
	@mkdir -p $(dir $@)
	@$(ZMAC) -o $@ $< > /dev/null 2>&1

# Apply all patches to cpm2.sys
$(BUILD_DIR)/cpm2.sys: $(addprefix $(BUILD_DIR)/patches/,$(PATCHES))
	@echo "Patching BIOS 2.20..."
	@mkdir -p $(BUILD_DIR)
	@cp ../cpm2.sys $@
	@dd if=$(BUILD_DIR)/patches/bios-ba93-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xba93+256))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-bab6-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbab6+256))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-bc35-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbc35+256))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-bc81-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbc81+256))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-bcef-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbcef+256))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-f736-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xc8a9))) 2>/dev/null
	@echo "BIOS 2.20 patching complete"

clean:
	@echo "Cleaning BIOS 2.20 builds..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean complete"
