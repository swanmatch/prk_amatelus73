kbd = Keyboard.new

c1 = 29
c2 = 28
c3 = 27
c4 = 26
c5 = 22
c6 = 20
c7 = 23
c8 = 21
r1 = 4
r2 = 5
r3 = 6
r4 = 7
r5 = 8

# Note that defferent from init_pins
kbd.init_matrix_pins(
  [
    [ [r1,c1], [c1,r1], [r1,c2], [c2,r1], [r1,c3], [c3,r1], [r1,c4], [c4,r1], [r1,c5], [c5,r1], [r1,c6], [c6,r1], [r1,c7], [c7,r1], [r1,c8], [c8,r1] ],
    [ [r2,c1], [c1,r2], [r2,c2], [c2,r2], [r2,c3], [c3,r2], [r2,c4], [c4,r2], [r2,c5], [c5,r2], [r2,c6], [c6,r2], [r2,c7], [c7,r2], [r2,c8], [c8,r2] ],
    [     nil, [c1,r3], [r3,c2], [c2,r3], [r3,c3], [c3,r3], [r3,c4], [c4,r3], [r3,c5], [c5,r3], [r3,c6], [c6,r3], [r3,c7], [c7,r3], [r3,c8],     nil ],
    [ [r4,c1], [c1,r4], [r4,c2], [c2,r4], [r4,c3], [c3,r4], [r4,c4], [c4,r4], [r4,c5], [c5,r4], [r4,c6], [c6,r4], [r4,c7], [c7,r4], [r4,c8], [c8,r4] ],
    [ [r5,c1], [c1,r5],     nil,     nil, [r5,c3], [c3,r5], [r5,c4],     nil, [r5,c5], [c5,r5], [r5,c6],     nil,     nil, [c7,r5], [r5,c8], [c8,r5] ],
  ]
)

# default layer should be added at first
kbd.add_layer :default, %i[
  KC_PGUP   KC_ESCAPE KC_GRAVE KC_1        KC_2        KC_3      KC_4     KC_5      KC_6      KC_7      KC_8      KC_9      KC_0     KC_MINUS  KC_PLUS   KC_BSPACE
  KC_PGDOWN KC_ESCAPE KC_Q     KC_W        KC_E        KC_R      KC_T     KC_NO     KC_NO     KC_Y      KC_U      KC_I      KC_O     KC_P      KC_MINUS  KC_DELETE
  XXXXXXX   KC_TAB    KC_A     KC_S        KC_D        KC_F      KC_G     KC_NO     KC_NO     KC_H      KC_J      KC_K      KC_L     KC_SCOLON KC_BSPACE XXXXXXX
  KC_LSFT   KC_Z      KC_X     KC_C        KC_V        KC_B      KC_NO    KC_NO     KC_NO     KC_N      KC_M      KC_COMMA  KC_DOT   KC_SLASH  KC_RSFT   KC_RSFT
  RGB_MOD   KC_LALT   XXXXXXX  XXXXXXX     KC_LCTL     LOWER_SPC KC_LALT  XXXXXXX   KC_RGUI   RAISE_ENT SPC_CTL   XXXXXXX   XXXXXXX  RGB_HUI   RGB_SAI   RGB_VAI
]
kbd.add_layer :raise, %i[
  KC_PGUP   KC_ESCAPE KC_GRAVE KC_F1       KC_F2       KC_F3     KC_F4    KC_F5     KC_F6     KC_F7     KC_F8     KC_F9     KC_F10   KC_F11    KC_F12    KC_BSPACE
  KC_PGDOWN KC_GRAVE  KC_EXLM  KC_AT       KC_HASH     KC_DLR    KC_PERC  KC_NO     KC_NO     KC_CIRC   KC_AMPR   KC_ASTER  KC_LPRN  KC_RPRN   KC_EQUAL  KC_DELETE
  XXXXXXX   KC_TAB    KC_LABK  KC_LCBR     KC_LBRACKET KC_LPRN   KC_QUOTE KC_NO     KC_NO     KC_LEFT   KC_DOWN   KC_UP     KC_RIGHT KC_UNDS   KC_PIPE   XXXXXXX
  KC_LSFT   KC_RABK   KC_RCBR  KC_RBRACKET KC_RPRN     KC_DQUO   KC_NO    KC_NO     KC_NO     KC_TILD   KC_BSLASH KC_COMMA  KC_DOT   KC_SLASH  KC_RSFT   KC_RSFT
  RGB_MOD   KC_LALT   XXXXXXX  XXXXXXX     KC_LCTL     LOWER_SPC KC_LALT  XXXXXXX   KC_RGUI   RAISE_ENT SPC_CTL   XXXXXXX   XXXXXXX  RGB_HUI   RGB_SAI   RGB_VAI
]
kbd.add_layer :lower, %i[
  KC_PGUP   KC_ESCAPE KC_GRAVE KC_F1       KC_F2       KC_F3     KC_F4    KC_F5     KC_F6     KC_F7     KC_F8     KC_F9     KC_F10   KC_F11    KC_F12    KC_BSPACE
  KC_PGDOWN KC_ESCAPE KC_1     KC_2        KC_3        KC_4      KC_5     KC_NO     KC_NO     KC_6      KC_7      KC_8      KC_9     KC_0      KC_EQUAL  KC_DELETE
  XXXXXXX   KC_TAB    KC_NO    KC_NO       KC_NO       KC_LPRN   KC_QUOTE KC_NO     KC_NO     KC_DOT    KC_4      KC_5      KC_6     KC_PLUS   KC_DELETE XXXXXXX
  KC_LSFT   KC_RABK   KC_RCBR  KC_RBRACKET KC_RPRN     KC_DQUO   KC_NO    KC_NO     KC_NO     KC_0      KC_1      KC_2      KC_3     KC_SLASH  KC_COMMA  KC_RSFT
  RGB_MOD   KC_LALT   XXXXXXX  XXXXXXX     KC_LCTL     LOWER_SPC KC_LALT  XXXXXXX   KC_RGUI   RAISE_ENT SPC_CTL   XXXXXXX   XXXXXXX  RGB_HUI   RGB_SAI   RGB_VAI
]

kbd.define_composite_key :SPC_CTL, %i(KC_SPACE KC_RCTL)

kbd.define_mode_key :RAISE_ENT, [ :KC_ENTER,             :raise, 150, 150 ]
kbd.define_mode_key :LOWER_SPC, [ :KC_SPACE,             :lower, 150, 150 ]
kbd.define_mode_key :RUBY,      [ Proc.new { kbd.ruby }, nil,    300, nil ]

# Initialize RGBLED with pin, underglow_size, backlight_size and is_rgbw.
rgb = RGB.new(
  0,    # pin number
  0,    # size of underglow pixel
  74,   # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
rgb.effect = :swirl
kbd.append rgb

kbd.start!
