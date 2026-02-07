# basic-macos-remap

Karabiner-Elements configuration for enhancing keyboard productivity on macOS. Includes Windows/Linux keyboard shortcuts, ABNT2 fast typing for Portuguese, and Caps Lock improvements.

> [!NOTE]
> This configuration was generated with AI assistance (Claude 4.5 Sonnet).

## Features

Three independent rule sets:
1. **Windows/Linux shortcuts** (25 mappings) - External keyboard only
2. **ABNT2 fast vowel accents** - External keyboard only, optimized for Portuguese
3. **Fast Caps Lock** - All devices, removes macOS delay

## Configuration

### First-time setup

1. Copy the configuration template:
```bash
cp config.jsonnet.example config.jsonnet
```

2. Find your keyboard IDs:
   - Open **Karabiner-Elements**
   - Go to the **Devices** tab
   - Find your external keyboard
   - Note the `vendor_id` and `product_id` numbers

3. Edit `config.jsonnet` with your keyboard IDs:
```jsonnet
{
  external_keyboard: {
    vendor_id: 3141,     // Your keyboard's vendor_id
    product_id: 20484,   // Your keyboard's product_id
  },
}
```

4. Build and install:
```bash
make build
make install
```

## Rule Sets

### 1. Windows/Linux shortcuts (external keyboard only)

Maps Windows/Linux keyboard shortcuts to macOS equivalents. All rules grouped in a single activation.

| Category | Windows/Linux | macOS |
|----------|--------------|-------|
| Clipboard | Ctrl+C/V/X | Cmd+C/V/X |
| Editing | Ctrl+Z/Y/A/S/F | Cmd+Z/Shift+Z/A/S/F |
| App switching | Alt+Tab / Alt+Shift+Tab | Cmd+Tab / Cmd+Shift+Tab |
| Windows | Ctrl+W/T/N | Cmd+W/T/N |
| Files | Ctrl+P/O/R | Cmd+P/O/R |
| Navigation | Ctrl+Home/End | Cmd+Up/Down |
| Word nav | Ctrl+Left/Right | Option+Left/Right |
| Selection | Ctrl+Shift+(arrow/Home/End) | Cmd/Option+Shift+(arrow) |

**Terminal protection**: Preserves Unix shortcuts (Ctrl+C, Ctrl+A, etc.) in:
- Terminal.app
- iTerm2
- Alacritty
- Kitty
- Hyper
- WezTerm

### 2. High-speed typing (ABNT2 + Portuguese)

#### ABNT2 fast vowel accents (external keyboard only)

Enables quick accented vowels for Portuguese on ABNT2 layout keyboards.

**Usage**: Press `Caps Lock + Shift + vowel` (a,e,i,o,u)

| Key combo | Result |
|-----------|--------|
| Caps Lock + Shift + A | á, à, â, ã (depending on Caps Lock state) |
| Caps Lock + Shift + E | é, ê |
| Caps Lock + Shift + I | í |
| Caps Lock + Shift + O | ó, ô, õ |
| Caps Lock + Shift + U | ú |

**How it works**: Temporarily releases Caps Lock, types the vowel, then re-engages Caps Lock, allowing the ABNT2 dead key system to work properly.

**Why this is useful**: On ABNT2 keyboards, accented vowels require pressing the acute accent key (´) followed by the vowel. With Caps Lock on, this doesn't work. This rule solves that problem for faster Portuguese typing.

#### Fast Caps Lock (all devices)

Removes macOS's built-in Caps Lock delay (accidental keystroke prevention). Makes Caps Lock respond instantly.

**Applies to**: All keyboards (built-in + external)

## Requirements

- macOS (tested on macOS Sonoma 14.2+)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) 14.0+
- [Jsonnet](https://jsonnet.org/) (for building from source)

## Installation

### Quick install
```bash
# First time only: configure your keyboard IDs
cp config.jsonnet.example config.jsonnet
# Edit config.jsonnet with your keyboard IDs

# Build and install
make install
```

### Manual installation
```bash
# Install dependencies
brew install jsonnet

# Configure keyboard IDs
cp config.jsonnet.example config.jsonnet
# Edit config.jsonnet

# Build
jsonnet src/windows-shortcuts.jsonnet > dist/windows-shortcuts.json
jsonnet src/abnt2-vowels.jsonnet > dist/abnt2-vowels.json
jsonnet src/caps-lock-fast.jsonnet > dist/caps-lock-fast.json

# Install
cp dist/*.json ~/.config/karabiner/assets/complex_modifications/
```

## Usage

1. Open Karabiner-Elements
2. Go to Complex Modifications tab
3. Click "Add predefined rule"
4. Enable the rules you want:
   - **Windows/Linux shortcuts (external keyboard only)** - All 25 mappings in one rule
   - **ABNT2 fast vowel accents** - Caps Lock + Shift + vowels
   - **Fast Caps Lock** - Instant Caps Lock response

Each rule can be enabled/disabled independently.

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

### Add new shortcuts

Edit `src/windows-shortcuts.jsonnet` and add new manipulators:
```jsonnet
manipulator('h', ['control'], 'h', ['command']),
```

### Modify terminal exceptions

Edit the `terminals` array in `src/windows-shortcuts.jsonnet`:
```jsonnet
local terminals = [
  '^com\\.apple\\.Terminal$',
  // Add more bundle IDs here
];
```

### Change keyboard configuration

Edit `config.jsonnet` to use different keyboard IDs:
```jsonnet
{
  external_keyboard: {
    vendor_id: YOUR_VENDOR_ID,
    product_id: YOUR_PRODUCT_ID,
  },
}
```

## Project Structure

```
basic-macos-remap/
├── config.jsonnet              # Your keyboard IDs (gitignored)
├── config.jsonnet.example      # Configuration template
├── .gitignore
├── LICENSE
├── README.md
├── Makefile
├── src/
│   ├── windows-shortcuts.jsonnet   # Windows/Linux shortcuts
│   ├── abnt2-vowels.jsonnet        # ABNT2 fast vowels
│   └── caps-lock-fast.jsonnet      # Fast Caps Lock
└── dist/
    └── *.json                      # Generated files (gitignored)
```

## License

MIT

## References

- [Karabiner-Elements Documentation](https://karabiner-elements.pqrs.org/docs/)
- [Jsonnet Tutorial](https://jsonnet.org/learning/tutorial.html)
- [ABNT2 Keyboard Layout](https://en.wikipedia.org/wiki/ABNT2_keyboard)
