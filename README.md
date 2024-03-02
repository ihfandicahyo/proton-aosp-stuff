# ProtonAOSP Stuff

Credit:
- [Base](https://github.com/kdrag0n) for all base of this repo
- [Inter](https://github.com/rsms/inter) for most text - 4.0
- [Fira Code](https://github.com/tonsky/FiraCode) for monospace text - 6.2
- [Source Serif](https://github.com/adobe-fonts/source-serif) for serif text - 4.005
- [Config](https://dumps.tadiphone.dev/dumps/samsung/e3q/-/blob/e3qxxx-user-14-UP1A.231005.007-S928BXXU1AXB5-release-keys/system/system/etc/fonts_additional.xml) fonts.xml

Inter was chosen as the UI font for its cleanliness and legibility; it is neutral and looks similar to Apple's San Francisco UI font. Because it was specifically designed for use in GUIs, it is a great replacement for Roboto on Android.

Source Serif was chosen as the serif font because it is one of the best open-source fonts that complement Inter's style.

All fonts included in this repo are open-source and licensed under the SIL Open Font License.

## Compatibility

Compatible with Android 14 OneUI 6. This fixes some issues in third-party apps, such Firefox falling back to Fira Sans instead of using the new fonts.

Additionally, Roboto will be used as a fallback for characters not supported by Inter. A fallback variant and registering it as a proper fallback rather than modifying the Inter font itself. As a result, most text will be rendered with the original Inter font, and unsupported characters will still be displayed with proper metrics and hinting.

Tested on *not tested*
