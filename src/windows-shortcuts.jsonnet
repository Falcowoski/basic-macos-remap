// Windows/Linux keyboard shortcuts for macOS via Karabiner-Elements
// Maps Ctrl-based shortcuts to Cmd-based shortcuts on external keyboard only

local device = {
  vendor_id: 3141,
  product_id: 20484,
};

local terminals = [
  '^com\\.apple\\.Terminal$',
  '^com\\.googlecode\\.iterm2$',
  '^co\\.zeit\\.hyper$',
  '^io\\.alacritty$',
  '^net\\.kovidgoyal\\.kitty$',
  '^org\\.alacritty$',
  '^com\\.github\\.wez\\.wezterm$',
];

local shortcut(from_key, from_mods, to_key, to_mods, desc, exclude_terminals=false) = {
  description: desc,
  manipulators: [{
    type: 'basic',
    from: {
      key_code: from_key,
      modifiers: { mandatory: from_mods },
    },
    to: [{
      key_code: to_key,
      modifiers: to_mods,
    }],
    conditions: [
      {
        identifiers: [device],
        type: 'device_if',
      },
    ] + (if exclude_terminals then [{
      type: 'frontmost_application_unless',
      bundle_identifiers: terminals,
    }] else []),
  }],
};

{
  title: 'Windows/Linux shortcuts (external keyboard only)',
  rules: [
    // Clipboard & editing
    shortcut('c', ['control'], 'c', ['command'], 'Ctrl+C → Cmd+C (copy)', exclude_terminals=true),
    shortcut('v', ['control'], 'v', ['command'], 'Ctrl+V → Cmd+V (paste)'),
    shortcut('x', ['control'], 'x', ['command'], 'Ctrl+X → Cmd+X (cut)'),
    shortcut('z', ['control'], 'z', ['command'], 'Ctrl+Z → Cmd+Z (undo)'),
    shortcut('y', ['control'], 'z', ['command', 'shift'], 'Ctrl+Y → Cmd+Shift+Z (redo)'),
    shortcut('a', ['control'], 'a', ['command'], 'Ctrl+A → Cmd+A (select all)', exclude_terminals=true),
    shortcut('s', ['control'], 's', ['command'], 'Ctrl+S → Cmd+S (save)'),
    shortcut('f', ['control'], 'f', ['command'], 'Ctrl+F → Cmd+F (find)', exclude_terminals=true),

    // Window/tab management
    shortcut('w', ['control'], 'w', ['command'], 'Ctrl+W → Cmd+W (close tab/window)', exclude_terminals=true),
    shortcut('t', ['control'], 't', ['command'], 'Ctrl+T → Cmd+T (new tab)'),
    shortcut('t', ['control', 'shift'], 't', ['command', 'shift'], 'Ctrl+Shift+T → Cmd+Shift+T (reopen closed tab)'),
    shortcut('n', ['control'], 'n', ['command'], 'Ctrl+N → Cmd+N (new window)'),

    // File operations
    shortcut('p', ['control'], 'p', ['command'], 'Ctrl+P → Cmd+P (print)'),
    shortcut('o', ['control'], 'o', ['command'], 'Ctrl+O → Cmd+O (open)'),
    shortcut('r', ['control'], 'r', ['command'], 'Ctrl+R → Cmd+R (refresh/reload)'),

    // Document navigation
    shortcut('home', ['control'], 'up_arrow', ['command'], 'Ctrl+Home → Cmd+Up (beginning of document)'),
    shortcut('home', ['control', 'shift'], 'up_arrow', ['command', 'shift'], 'Ctrl+Shift+Home → Cmd+Shift+Up (select to beginning)'),
    shortcut('end', ['control'], 'down_arrow', ['command'], 'Ctrl+End → Cmd+Down (end of document)'),
    shortcut('end', ['control', 'shift'], 'down_arrow', ['command', 'shift'], 'Ctrl+Shift+End → Cmd+Shift+Down (select to end)'),

    // Word navigation
    shortcut('left_arrow', ['control'], 'left_arrow', ['option'], 'Ctrl+Left → Option+Left (word left)', exclude_terminals=true),
    shortcut('left_arrow', ['control', 'shift'], 'left_arrow', ['option', 'shift'], 'Ctrl+Shift+Left → Option+Shift+Left (select word left)', exclude_terminals=true),
    shortcut('right_arrow', ['control'], 'right_arrow', ['option'], 'Ctrl+Right → Option+Right (word right)', exclude_terminals=true),
    shortcut('right_arrow', ['control', 'shift'], 'right_arrow', ['option', 'shift'], 'Ctrl+Shift+Right → Option+Shift+Right (select word right)', exclude_terminals=true),
  ],
}
