// Windows/Linux keyboard shortcuts for macOS via Karabiner-Elements
// Maps Ctrl-based shortcuts to Cmd-based shortcuts on external keyboard only

local config = import '../config.jsonnet';
local device = config.external_keyboard;

local terminals = [
  '^com\\.apple\\.Terminal$',
  '^com\\.googlecode\\.iterm2$',
  '^co\\.zeit\\.hyper$',
  '^io\\.alacritty$',
  '^net\\.kovidgoyal\\.kitty$',
  '^org\\.alacritty$',
  '^com\\.github\\.wez\\.wezterm$',
];

local manipulator(from_key, from_mods, to_key, to_mods, exclude_terminals=false) = {
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
};

{
  title: 'Windows/Linux shortcuts (external keyboard only)',
  rules: [{
    description: 'Windows/Linux shortcuts (25 mappings: Ctrl→Cmd, Alt+Tab→Cmd+Tab)',
    manipulators: [
      // Clipboard & editing
      manipulator('c', ['control'], 'c', ['command'], exclude_terminals=true),
      manipulator('v', ['control'], 'v', ['command']),
      manipulator('x', ['control'], 'x', ['command']),
      manipulator('z', ['control'], 'z', ['command']),
      manipulator('y', ['control'], 'z', ['command', 'shift']),
      manipulator('a', ['control'], 'a', ['command'], exclude_terminals=true),
      manipulator('s', ['control'], 's', ['command']),
      manipulator('f', ['control'], 'f', ['command'], exclude_terminals=true),

      // Window/tab management
      manipulator('w', ['control'], 'w', ['command'], exclude_terminals=true),
      manipulator('t', ['control'], 't', ['command']),
      manipulator('t', ['control', 'shift'], 't', ['command', 'shift']),
      manipulator('n', ['control'], 'n', ['command']),

      // App switching
      manipulator('tab', ['option'], 'tab', ['command']),
      manipulator('tab', ['option', 'shift'], 'tab', ['command', 'shift']),

      // File operations
      manipulator('p', ['control'], 'p', ['command']),
      manipulator('o', ['control'], 'o', ['command']),
      manipulator('r', ['control'], 'r', ['command']),

      // Document navigation
      manipulator('home', ['control'], 'up_arrow', ['command']),
      manipulator('home', ['control', 'shift'], 'up_arrow', ['command', 'shift']),
      manipulator('end', ['control'], 'down_arrow', ['command']),
      manipulator('end', ['control', 'shift'], 'down_arrow', ['command', 'shift']),

      // Word navigation
      manipulator('left_arrow', ['control'], 'left_arrow', ['option'], exclude_terminals=true),
      manipulator('left_arrow', ['control', 'shift'], 'left_arrow', ['option', 'shift'], exclude_terminals=true),
      manipulator('right_arrow', ['control'], 'right_arrow', ['option'], exclude_terminals=true),
      manipulator('right_arrow', ['control', 'shift'], 'right_arrow', ['option', 'shift'], exclude_terminals=true),
    ],
  }],
}
