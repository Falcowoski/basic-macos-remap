# Makefile: Automates build/install tasks (think "npm scripts" for Unix)
# Usage: make build, make install, make clean

.PHONY: build install clean check

JSONNET := jsonnet
SRC_DIR := src
DIST_DIR := dist
KARABINER_DIR := $(HOME)/.config/karabiner/assets/complex_modifications

build:
	@mkdir -p $(DIST_DIR)
	@test -f config.jsonnet || { echo "Error: config.jsonnet not found. Copy from config.jsonnet.example"; exit 1; }
	$(JSONNET) $(SRC_DIR)/windows-shortcuts.jsonnet > $(DIST_DIR)/windows-shortcuts.json
	$(JSONNET) $(SRC_DIR)/abnt2-vowels.jsonnet > $(DIST_DIR)/abnt2-vowels.json
	$(JSONNET) $(SRC_DIR)/caps-lock-fast.jsonnet > $(DIST_DIR)/caps-lock-fast.json
	@echo "✓ Built 3 configuration files"

install: build
	@mkdir -p $(KARABINER_DIR)
	cp $(DIST_DIR)/*.json $(KARABINER_DIR)/
	@echo "✓ Installed to Karabiner-Elements"
	@echo "  Open Karabiner-Elements → Complex Modifications → Add predefined rule"

clean:
	rm -rf $(DIST_DIR)/*.json
	@echo "✓ Cleaned build artifacts"

check:
	@command -v $(JSONNET) >/dev/null 2>&1 || { echo "Error: jsonnet not found. Install with: brew install jsonnet"; exit 1; }
	@echo "✓ Dependencies OK"
