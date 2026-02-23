# Build IPL (Initial Program Loader) files for CF boot
ZMAC := ../../../tools/bin/zmac
LD80 := ../../../tools/bin/ld80
BUILD_DIR := ../../../build/cfboot

TARGETS := $(BUILD_DIR)/IPL006CF.BIN $(BUILD_DIR)/IPL30ACF.BIN $(BUILD_DIR)/LDR227.BIN

.PHONY: all clean

all: $(TARGETS)

# Build IPL006CF
$(BUILD_DIR)/IPL006CF.BIN: IPL006CF.MAC
	@echo "Building IPL006CF..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) --zmac --rel -o $(BUILD_DIR)/IPL006CF.rel IPL006CF.MAC > /dev/null 2>&1
	@$(LD80) -O bin -o $@ $(BUILD_DIR)/IPL006CF.rel > /dev/null 2>&1
	@echo "IPL006CF build complete"

# Build IPL30ACF
$(BUILD_DIR)/IPL30ACF.BIN: IPL30ACF.MAC
	@echo "Building IPL30ACF..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) --zmac --rel -o $(BUILD_DIR)/IPL30ACF.rel IPL30ACF.MAC > /dev/null 2>&1
	@$(LD80) -O bin -o $@ $(BUILD_DIR)/IPL30ACF.rel > /dev/null 2>&1
	@echo "IPL30ACF build complete"

# Build LDR227
$(BUILD_DIR)/LDR227.BIN: LDR227.MAC
	@echo "Building LDR227..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) --zmac --rel -o $(BUILD_DIR)/LDR227.rel LDR227.MAC > /dev/null 2>&1
	@$(LD80) -O bin -o $@ $(BUILD_DIR)/LDR227.rel > /dev/null 2>&1
	@echo "LDR227 build complete"

clean:
	@echo "Cleaning cfboot builds..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean complete"
