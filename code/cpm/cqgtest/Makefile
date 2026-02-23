# Build cqgtest using zmac
ZMAC := ../../../tools/bin/zmac
BUILD_DIR := ../../../build/apps

.PHONY: all clean

all: $(BUILD_DIR)/cqgtest.com

# Build cqgtest.com from cqgtest.z80
$(BUILD_DIR)/cqgtest.com: cqgtest.z80
	@echo "Building cqgtest.com..."
	@mkdir -p $(BUILD_DIR)
	@$(ZMAC) -o $(BUILD_DIR)/cqgtest.cim $< > /dev/null 2>&1
	@mv $(BUILD_DIR)/cqgtest.cim $@
	@echo "cqgtest.com build complete"

clean:
	@echo "Cleaning cqgtest build..."
	@rm -f $(BUILD_DIR)/cqgtest.com
	@echo "Clean complete"
