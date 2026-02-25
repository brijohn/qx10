# Build BIOS 2.27 patches using zmac
ZMAC := ../../../tools/bin/zmac
BUILD_DIR := ../../../build/bios/2.27

BIOS_PATCHES := bios-99b1-patch.cim bios-9a5f-patch.cim bios-9f2b-patch.cim

HDPART_PATCHES := hdpart-2c61-patch.cim hdpart-2cb5-patch.cim \
                  hdpart-2d35-patch.cim hdpart-3034-patch.cim \
                  hdpart-0257-patch.cim

.PHONY: all clean

all: $(BUILD_DIR)/cpm2.sys $(BUILD_DIR)/hdpart.com

# Build individual patch binaries
$(BUILD_DIR)/patches/%.cim: %.asm
	@mkdir -p $(dir $@)
	@$(ZMAC) -o $@ $< > /dev/null 2>&1

# Apply BIOS patches to cpm2.sys
$(BUILD_DIR)/cpm2.sys: $(addprefix $(BUILD_DIR)/patches/,$(BIOS_PATCHES))
	@echo "Patching BIOS 2.27..."
	@mkdir -p $(BUILD_DIR)
	@cp ../cpm2.sys $@
	@dd if=$(BUILD_DIR)/patches/bios-99b1-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x99b1+5888))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-9a5f-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x9a5f+5888))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/bios-9f2b-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x9f2b+5888))) 2>/dev/null
	@echo "BIOS 2.27 patching complete"

# Apply HDD partition patches to hdpart.com
$(BUILD_DIR)/hdpart.com: $(addprefix $(BUILD_DIR)/patches/,$(HDPART_PATCHES))
	@echo "Patching hdpart.com..."
	@mkdir -p $(BUILD_DIR)
	@cp ../hdpart.com $@
	@dd if=$(BUILD_DIR)/patches/hdpart-0257-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x0257-0x100))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/hdpart-2c61-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x2c61-0x100))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/hdpart-2cb5-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x2cb5-0x100))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/hdpart-2d35-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x2d35-0x100))) 2>/dev/null
	@dd if=$(BUILD_DIR)/patches/hdpart-3034-patch.cim of=$@ conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x3034-0x100))) 2>/dev/null
	@echo "hdpart.com patching complete"

clean:
	@echo "Cleaning BIOS 2.27 builds..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean complete"
