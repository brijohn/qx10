# Build tune using zmac
ZMAC := ../../../tools/bin/zmac
BUILD_DIR := ../../../build/apps

.PHONY: all clean

all: $(BUILD_DIR)/tune.com

# Build tune.com from tune.z80
$(BUILD_DIR)/tune.com: tune.z80
	@echo "Building tune.com..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) -o $(BUILD_DIR)/tune.cim $< > /dev/null 2>&1
	@mv $(BUILD_DIR)/tune.cim $@
	@echo "tune.com build complete"

clean:
	@echo "Cleaning tune build..."
	@rm -f $(BUILD_DIR)/tune.com
	@echo "Clean complete"
