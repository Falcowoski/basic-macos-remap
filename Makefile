# Makefile: Automates build/install tasks (think "npm scripts" for Unix)
# Usage: make build, make install, make clean

.PHONY: build install clean check

JSONNET := jsonnet
SRC_DIR := src
DIST_DIR := dist
KARABINER_DIR := $(HOME)/.config/karabiner/assets/complex_modifications

build:
	@mkdir -p $(DIST_DIR)
	$(JSONNET) $(SRC_DIR)/windows-shortcuts.jsonnet > $(DIST_DIR)/windows-shortcuts.json
	@echo "✓ Built $(DIST_DIR)/windows-shortcuts.json"

install: build
	@mkdir -p $(KARABINER_DIR)
	cp $(DIST_DIR)/windows-shortcuts.json $(KARABINER_DIR)/
	@echo "✓ Installed to Karabiner-Elements"
	@echo "  Open Karabiner-Elements → Complex Modifications → Add predefined rule"

clean:
	rm -rf $(DIST_DIR)/*.json
	@echo "✓ Cleaned build artifacts"

check:
	@command -v $(JSONNET) >/dev/null 2>&1 || { echo "Error: jsonnet not found. Install with: brew install jsonnet"; exit 1; }
	@echo "✓ Dependencies OK"
