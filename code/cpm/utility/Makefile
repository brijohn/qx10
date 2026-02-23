# Build CP/M utilities using zmac
ZMAC := ../../../tools/bin/zmac
BUILD_DIR := ../../../build/apps

UTILITIES := cmosload.com cmosdump.com loadrom.com

.PHONY: all clean

all: $(addprefix $(BUILD_DIR)/,$(UTILITIES))

# Build .com files from .asm sources
$(BUILD_DIR)/%.com: %.asm
	@echo "Building $(@F)..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) -o $(BUILD_DIR)/$*.cim $< > /dev/null 2>&1
	@mv $(BUILD_DIR)/$*.cim $@
	@echo "$(@F) build complete"

clean:
	@echo "Cleaning utility builds..."
	@rm -f $(addprefix $(BUILD_DIR)/,$(UTILITIES))
	@echo "Clean complete"
