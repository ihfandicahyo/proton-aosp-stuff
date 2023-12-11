# ProtonAOSP Stuff

Credit:
- [Base](https://github.com/kdrag0n) for all base of this repo
- [Inter](https://github.com/rsms/inter) for most text - X
- [Fira Code](https://github.com/tonsky/FiraCode) for monospace text - X
- [Source Serif](https://github.com/adobe-fonts/source-serif) for serif text - X

Inter was chosen as the UI font for its cleanliness and legibility; it is neutral and looks similar to Apple's San Francisco UI font. Because it was specifically designed for use in GUIs, it is a great replacement for Roboto on Android.

Source Serif was chosen as the serif font because it is one of the best open-source fonts that complement Inter's style.

All fonts included in this repo are open-source and licensed under the SIL Open Font License.

## Compatibility

Compatible with Android 11 (i.e not costum vendor: MIUI, OneUI, etc). This fixes some issues in third-party apps, such Firefox falling back to Fira Sans instead of using the new fonts.

Additionally, Roboto will be used as a fallback for characters not supported by Inter. A fallback variant and registering it as a proper fallback rather than modifying the Inter font itself. As a result, most text will be rendered with the original Inter font, and unsupported characters will still be displayed with proper metrics and hinting.

Tested on LineageOS-18.1
