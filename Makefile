.PHONY: all tools bios cfboot apps diskimage clean help

# Suppress "Entering/Leaving directory" messages
MAKEFLAGS += --no-print-directory

# Add tools to PATH
TOOLS_BIN := $(CURDIR)/tools/bin
export PATH := $(TOOLS_BIN):$(PATH)

# Default target
all: diskimage

# Build toolchain
tools:
	@echo "Building toolchain (libdsk, zmac, ld80, cpmtools)..."
	@$(MAKE) -C tools all

# Build BIOS patches
bios: tools
	@echo "Building BIOS patches..."
	@$(MAKE) -C bios/2.20/patches all
	@$(MAKE) -C bios/2.27/patches all

# Build cfboot IPL files
cfboot: tools
	@echo "Building cfboot IPL files..."
	@$(MAKE) -C code/cpm/cfboot all

# Build CP/M applications
apps: tools
	@echo "Building CP/M applications..."
	@$(MAKE) -C code/cpm/utility all
	@$(MAKE) -C code/cpm/tune all
	@$(MAKE) -C code/cpm/speech all
	@$(MAKE) -C code/cpm/cqgtest all
	@$(MAKE) -C code/cpm/compact_flash all

# Build disk image with updated files
diskimage: bios cfboot apps
	@echo "Creating updated disk image..."
	@mkdir -p build/diskimages
	@echo "Patching boot loader..."
	@tools/imdpatch.py diskimages/qx16lba.imd build/cfboot/LDR227.BIN build/diskimages/qx16lba.imd
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:cpm2.sys 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/bios/2.27/cpm2.sys 0:cpm2.sys
	@$(TOOLS_BIN)/cpmchattr -f epsqx10 build/diskimages/qx16lba.imd r 0:cpm2.sys
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:hdpart.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/bios/2.27/hdpart.com 0:hdpart.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:cmosload.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/cmosload.com 0:cmosload.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:cmosdump.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/cmosdump.com 0:cmosdump.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:loadrom.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/loadrom.com 0:loadrom.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:tune.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/tune.com 0:tune.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:speech.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/speech.com 0:speech.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:cqgtest.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/cqgtest.com 0:cqgtest.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:cfinfo.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/cfinfo.com 0:cfinfo.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:cfformat.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/apps/cfformat.com 0:cfformat.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:qxdisk.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/bios/2.27/qxdisk.com 0:qxdisk.com
	@$(TOOLS_BIN)/cpmrm -f epsqx10 build/diskimages/qx16lba.imd 0:qxpc.com 2>/dev/null || true
	@$(TOOLS_BIN)/cpmcp -f epsqx10 build/diskimages/qx16lba.imd build/bios/2.27/qxpc.com 0:qxpc.com
	@echo "Disk image created at build/diskimages/qx16lba.imd"

# Clean everything
clean:
	@echo "Cleaning toolchain..."
	@$(MAKE) -C tools clean
	@echo "Cleaning BIOS patches..."
	@$(MAKE) -C bios/2.20/patches clean
	@$(MAKE) -C bios/2.27/patches clean
	@echo "Cleaning cfboot..."
	@$(MAKE) -C code/cpm/cfboot clean
	@echo "Cleaning CP/M applications..."
	@$(MAKE) -C code/cpm/utility clean
	@$(MAKE) -C code/cpm/tune clean
	@$(MAKE) -C code/cpm/speech clean
	@$(MAKE) -C code/cpm/cqgtest clean
	@$(MAKE) -C code/cpm/compact_flash clean
	@echo "Cleaning build directory..."
	@rm -rf build

help:
	@echo "QX-10 CP/M Build System - Phase 3"
	@echo ""
	@echo "Targets:"
	@echo "  all       - Build toolchain, BIOS patches, cfboot IPL files, and CP/M applications"
	@echo "  tools     - Build toolchain only"
	@echo "  bios      - Build BIOS patches only"
	@echo "  cfboot    - Build cfboot IPL files only"
	@echo "  apps      - Build CP/M applications only"
	@echo "  diskimage - Create disk image with updated applications"
	@echo "  clean     - Clean everything"
	@echo "  help      - Show this help"
