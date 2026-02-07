// ABNT2 Fast Vowel Accents for Portuguese
// Enables quick accented vowels with Caps Lock + Shift + vowel on ABNT2 keyboard

local config = import '../config.jsonnet';
local device = config.external_keyboard;

local vowel_manipulator(key) = {
  type: 'basic',
  from: {
    key_code: key,
    modifiers: { mandatory: ['shift', 'caps_lock'] },
  },
  to: [
    { key_code: 'caps_lock' },
    {
      hold_down_milliseconds: 100,
      key_code: 'vk_none',
    },
    { key_code: key },
    {
      hold_down_milliseconds: 100,
      key_code: 'vk_none',
    },
    { key_code: 'caps_lock' },
  ],
  conditions: [{
    identifiers: [device],
    type: 'device_if',
  }],
};

{
  title: 'ABNT2 fast vowel accents',
  rules: [{
    description: 'Caps Lock + Shift + vowels (a,e,i,o,u) for quick accents on ABNT2',
    manipulators: [
      vowel_manipulator('a'),
      vowel_manipulator('e'),
      vowel_manipulator('i'),
      vowel_manipulator('o'),
      vowel_manipulator('u'),
    ],
  }],
}
