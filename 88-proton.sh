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
fonts/FiraCode-Regular.ttf
fonts/Inter-Black.ttf
fonts/Inter-BlackItalic.ttf
fonts/Inter-Bold.ttf
fonts/Inter-BoldItalic.ttf
fonts/Inter-Italic.ttf
fonts/Inter-Light.ttf
fonts/Inter-LightItalic.ttf
fonts/Inter-MediumI.ttf
fonts/Inter-MediumItalic.ttf
fonts/Inter-Regular.ttf
fonts/Inter-Thin.ttf
fonts/Inter-ThinItalic.ttf
fonts/RobotoFallback-VF.ttf
fonts/SourceSerif4-Bold.ttf
fonts/SourceSerif4-BoldIt.ttf
fonts/SourceSerif4-It.ttf
fonts/SourceSerif4-Regular.ttf
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
