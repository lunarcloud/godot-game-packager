#!/bin/bash

# Get Variables

if [[ $# -eq 0 ]] ; then
    DATA_DIR="."
else
    DATA_DIR="$1"
fi

TITLE=$(grep 'Title' "$DATA_DIR"/gameinfo.conf | cut -d'=' -f 2 | tr -d '\n' | tr -d '\r' | sed 's/^ *//g' | sed 's/ *$//g')
VERSION=$(grep 'Version' "$DATA_DIR/"gameinfo.conf | cut -d'=' -f 2 | tr -d '\n' | tr -d '\r')


MAC_ZIP=$(find "$DATA_DIR" ! -path "*_i386*" ! -path "*_amd64/*" ! -path "*.app*" -name '*.zip' | sort -ur | tr -d '\n' | tr -d '\r')

unzip -u $MAC_ZIP -d dmg-contents/

APP_NAME=$(find "dmg-contents/" ! -path "*_i386*" ! -path "*_amd64/*" -name '*.app' -printf "%f")

png2icns dmg-contents/.VolumeIcon.icns $DATA_DIR/game.png

if [ -f $DATA_DIR/license.txt ]; then
    cp "$DATA_DIR"/license.txt dmg-contents/
fi

genisoimage -V "$TITLE" -D -R -apple -no-pad -o "$TITLE $VERSION.dmg" dmg-contents

# clean up
rm dmg-contents/.VolumeIcon.icns
rm dmg-contents/license.txt
rm -r dmg-contents/"$APP_NAME"

exit 0;
