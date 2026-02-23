# Build compact flash utilities using zmac
ZMAC := ../../../tools/bin/zmac
LD80 := ../../../tools/bin/ld80
BUILD_DIR := ../../../build/apps

CFINFO_SRC = cfinfo.z80 compact_flash.z80 strings.z80
CFINFO_REL = $(addprefix $(BUILD_DIR)/,$(CFINFO_SRC:.z80=.rel))

CFFORMAT_SRC = cfformat.z80 compact_flash.z80 strings.z80
CFFORMAT_REL = $(addprefix $(BUILD_DIR)/,$(CFFORMAT_SRC:.z80=.rel))

.PHONY: all clean

all: $(BUILD_DIR)/cfinfo.com $(BUILD_DIR)/cfformat.com

# Build cfinfo.com
$(BUILD_DIR)/cfinfo.com: $(CFINFO_REL)
	@echo "Building cfinfo.com..."
	@$(LD80) -O com -P0100 -o $@ $^ > /dev/null 2>&1
	@echo "cfinfo.com build complete"

# Build cfformat.com
$(BUILD_DIR)/cfformat.com: $(CFFORMAT_REL)
	@echo "Building cfformat.com..."
	@$(LD80) -O com -P0100 -o $@ $^ > /dev/null 2>&1
	@echo "cfformat.com build complete"

# Build .rel files from .z80 sources
$(BUILD_DIR)/%.rel: %.z80
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) --zmac --rel -o $@ $< > /dev/null 2>&1

clean:
	@echo "Cleaning compact_flash builds..."
	@rm -f $(BUILD_DIR)/cfinfo.com $(BUILD_DIR)/cfformat.com
	@rm -f $(BUILD_DIR)/*.rel
	@echo "Clean complete"
