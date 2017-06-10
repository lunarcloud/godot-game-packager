#!/bin/bash

# Get Variables

if [[ $# -eq 0 ]] ; then
    DATA_DIR="."
else
    DATA_DIR="$1"
fi

MAC_ZIP=$(find "$DATA_DIR" ! -path "*_i386*" ! -path "*_amd64/*" ! -path "*.app*" -name '*.zip' | sort -ur | tr -d '\n' | tr -d '\r')

unzip -u $MAC_ZIP -d dmg-contents/

APP_NAME=$(find "dmg-contents/" ! -path "*_i386*" ! -path "*_amd64/*" -name '*.app' -printf "%f")
APP_NAME="${APP_NAME%.*}"

png2icns dmg-contents/.VolumeIcon.icns $DATA_DIR/game.png

if [ -f $DATA_DIR/license.txt ]; then
    cp "$DATA_DIR"/license.txt dmg-contents/
fi

genisoimage -V "$APP_NAME" -D -R -apple -no-pad -o "$APP_NAME $VERSION.dmg" dmg-contents

# clean up
rm dmg-contents/.VolumeIcon.icns
rm dmg-contents/license.txt
rm -r dmg-contents/"$APP_NAME".app

exit 0;
