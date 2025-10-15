#!/bin/bash

while getopts ":-:" o; do
    case "${OPTARG}" in
        reboot)
            REBOOT=1
            ;;
        use_remount)
            USE_REMOUNT=1
            ;;
    esac
done

adb wait-for-device root
adb wait-for-device shell "mount | grep -q ^tmpfs\ on\ /system && umount -fl /system/{bin,etc} 2>/dev/null"
if [[ "${USE_REMOUNT}" = "1" ]]; then
    adb wait-for-device shell "remount"
elif [[ "$(adb shell stat -f --format %a /system)" = "0" ]]; then
    echo "ERROR: /system has 0 available blocks, consider using --use_remount"
    exit -1
else
    adb wait-for-device shell "stat --format %m /system | xargs mount -o rw,remount"
fi
adb wait-for-device push 88-proton.sh /system/addon.d/
adb wait-for-device push font_fallback.xml /systemetc/font_fallback.xml
adb wait-for-device push fonts.xml /systemetc/fonts.xml
adb wait-for-device push CutiveMono.ttf /systemfonts/CutiveMono.ttf
adb wait-for-device push DroidSansMono.ttf /systemfonts/DroidSansMono.ttf
adb wait-for-device push NotoSerif-Bold.ttf /systemfonts/NotoSerif-Bold.ttf
adb wait-for-device push NotoSerif-BoldItalic.ttf /systemfonts/NotoSerif-BoldItalic.ttf
adb wait-for-device push NotoSerif-Italic.ttf /systemfonts/NotoSerif-Italic.ttf
adb wait-for-device push NotoSerif-Regular.ttf /systemfonts/NotoSerif-Regular.ttf
adb wait-for-device push Roboto-Fallback.ttf /systemfonts/Roboto-Fallback.ttf
adb wait-for-device push Roboto-Italic.ttf /systemfonts/Roboto-Italic.ttf
adb wait-for-device push Roboto-Regular.ttf /systemfonts/Roboto-Regular.ttf

if [[ "${REBOOT}" = "1" ]]; then
    adb wait-for-device reboot
fi
