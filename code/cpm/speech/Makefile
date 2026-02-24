# Build speech using zmac
ZMAC := ../../../tools/bin/zmac
BUILD_DIR := ../../../build/apps

.PHONY: all clean

all: $(BUILD_DIR)/speech.com

# Build speech.com from speech.z80
$(BUILD_DIR)/speech.com: speech.z80
	@echo "Building speech.com..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) -o $(BUILD_DIR)/speech.cim $< > /dev/null 2>&1
	@mv $(BUILD_DIR)/speech.cim $@
	@echo "speech.com build complete"

clean:
	@echo "Cleaning speech build..."
	@rm -f $(BUILD_DIR)/speech.com
	@echo "Clean complete"
