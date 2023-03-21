#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/88-proton.sh
# During a LineageOS upgrade, this script backs up proton,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/fonts.xml
fonts/CutiveMono.ttf
fonts/DroidSansMono.ttf
fonts/Inter-Italic.ttf
fonts/Inter-VF.ttf
fonts/NotoSerif-Bold.ttf
fonts/NotoSerif-BoldItalic.ttf
fonts/NotoSerif-Italic.ttf
fonts/NotoSerif-Regular.ttf
fonts/RobotoFallback-VF.ttf
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
