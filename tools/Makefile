# Paths for local installation
PREFIX := $(CURDIR)
BIN_DIR := $(PREFIX)/bin
LIB_DIR := $(PREFIX)/lib
INC_DIR := $(PREFIX)/include

export PATH := $(BIN_DIR):$(PATH)

.PHONY: all clean

all: .libdsk_built .cpmtools_built .zmac_built .ld80_built

# Build libdsk first (cpmtools dependency)
.libdsk_built:
	@echo "Building libdsk..."
	@cd libdsk-1.5.19 && \
	./configure --prefix=$(PREFIX) > /dev/null 2>&1 && \
	$(MAKE) -C lib > /dev/null 2>&1 && \
	$(MAKE) -C lib install > /dev/null 2>&1
	@touch .libdsk_built
	@echo "libdsk build complete"

# Build zmac
.zmac_built:
	@echo "Building zmac..."
	@cd zmac && \
	$(MAKE) > /dev/null 2>&1 && \
	cp zmac $(BIN_DIR)/
	@touch .zmac_built
	@echo "zmac build complete"

# Build ld80 (may be part of zmac, adjust as needed)
.ld80_built:
	@echo "Building ld80..."
	@cd ld80 && \
	$(MAKE) > /dev/null 2>&1 && \
	cp ld80 $(BIN_DIR)/
	@touch .ld80_built
	@echo "ld80 build complete"

# Build cpmtools with our local libdsk
.cpmtools_built: .libdsk_built
	@echo "Building cpmtools..."
	@cd cpmtools-2.23 && \
	LDFLAGS="-L$(LIB_DIR) -Wl,-rpath,$(LIB_DIR)" CPPFLAGS=-I$(INC_DIR) \
	./configure --prefix=$(PREFIX) --with-libdsk > /dev/null 2>&1 && \
	$(MAKE) > /dev/null 2>&1 && \
	$(MAKE) install > /dev/null 2>&1
	@touch .cpmtools_built
	@echo "cpmtools build complete"

clean:
	@echo "Cleaning tool builds..."
	@cd libdsk-1.5.19 && $(MAKE) distclean > /dev/null 2>&1 || true
	@cd zmac && $(MAKE) clean > /dev/null 2>&1 || true
	@cd ld80 && $(MAKE) distclean > /dev/null 2>&1 || true
	@cd cpmtools-2.23 && $(MAKE) distclean > /dev/null 2>&1 || true
	@rm -rf bin lib include share .libdsk_built .zmac_built .ld80_built .cpmtools_built
	@echo "Clean complete"
