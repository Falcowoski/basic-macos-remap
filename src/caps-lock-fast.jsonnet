// Disable Caps Lock delay on macOS
// Makes Caps Lock respond instantly without macOS's accidental keystroke prevention

{
  title: 'Fast Caps Lock',
  rules: [{
    description: 'Disable Caps Lock delay (all devices)',
    manipulators: [{
      type: 'basic',
      from: {
        key_code: 'caps_lock',
        modifiers: { optional: ['any'] },
      },
      to: [
        {
          hold_down_milliseconds: 100,
          key_code: 'caps_lock',
        },
        { key_code: 'vk_none' },
      ],
    }],
  }],
}
