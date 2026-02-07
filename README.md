# basic-macos-remap

Karabiner-Elements configuration for Windows/Linux keyboard shortcuts on macOS. Maps Ctrl-based shortcuts to Cmd equivalents on external keyboards only, preserving native macOS behavior on built-in keyboard.

> [!NOTE]
> This configuration was generated with AI assistance (Claude 4.5 Sonnet).

## Features

- **External keyboard only**: Rules apply exclusively to configured device (vendor_id: 3141, product_id: 20484)
- **Terminal protection**: Preserves Unix shortcuts (Ctrl+C, Ctrl+A, etc.) in terminal emulators
- **24 keyboard shortcuts**: Clipboard, editing, navigation, window management
- **Jsonnet-based**: DRY configuration with easy maintenance

## Shortcuts

| Category | Windows/Linux | macOS |
|----------|--------------|-------|
| Clipboard | Ctrl+C/V/X | Cmd+C/V/X |
| Editing | Ctrl+Z/Y/A/S/F | Cmd+Z/Shift+Z/A/S/F |
| Windows | Ctrl+W/T/N | Cmd+W/T/N |
| Files | Ctrl+P/O/R | Cmd+P/O/R |
| Navigation | Ctrl+Home/End | Cmd+Up/Down |
| Word nav | Ctrl+Left/Right | Option+Left/Right |
| Selection | Ctrl+Shift+(arrow/Home/End) | Cmd/Option+Shift+(arrow) |

## Requirements

- macOS (tested on macOS Sonoma 14.2+)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) 14.0+
- [Jsonnet](https://jsonnet.org/) (for building from source)

## Installation

### Quick install (prebuilt)
```bash
make install
```

### Custom device configuration
1. Find your keyboard IDs in Karabiner-Elements → Devices → vendor_id/product_id
2. Edit `src/windows-shortcuts.jsonnet`:
```jsonnet
   local device = {
     vendor_id: YOUR_VENDOR_ID,
     product_id: YOUR_PRODUCT_ID,
   };
```
3. Build and install:
```bash
   make build
   make install
```

### Manual installation
```bash
# Install dependencies
brew install jsonnet

# Build
jsonnet src/windows-shortcuts.jsonnet > dist/windows-shortcuts.json

# Install
cp dist/windows-shortcuts.json ~/.config/karabiner/assets/complex_modifications/
```

## Usage

1. Open Karabiner-Elements
2. Go to Complex Modifications tab
3. Click "Add predefined rule"
4. Enable "Windows/Linux shortcuts (external keyboard only)"
5. Enable individual rules as needed

## Development
```bash
# Build JSON from Jsonnet
make build

# Install to Karabiner
make install

# Check dependencies
make check

# Clean build artifacts
make clean
```

## Customization

Add new shortcuts in `src/windows-shortcuts.jsonnet`:
```jsonnet
shortcut('h', ['control'], 'h', ['command'], 'Ctrl+H → Cmd+H (replace)'),
```

Modify terminal exception list:
```jsonnet
local terminals = [
  '^com\\.apple\\.Terminal$',
  // Add more bundle IDs here
];
```

## Protected applications

The following terminal emulators preserve Unix keyboard behavior:
- Terminal.app
- iTerm2
- Alacritty
- Kitty
- Hyper
- WezTerm

## License

MIT

## References

- [Karabiner-Elements Documentation](https://karabiner-elements.pqrs.org/docs/)
- [Jsonnet Tutorial](https://jsonnet.org/learning/tutorial.html)
