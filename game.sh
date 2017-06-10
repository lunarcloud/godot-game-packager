#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR"/script-dialog/script-dialog.sh #folder local version

relaunchIfNotVisible

APP_NAME="Game Launcher"
WINDOW_ICON="$SCRIPT_DIR/game.png"

LICENSE="$SCRIPT_DIR"LICENSE
LICENSE_ACCEPTED="$LICENSE"-accepted

if [[ ! -f $LICENSE_ACCEPTED &&  -f $LICENSE ]]; then
    ACTIVITY="License"
    messagebox "You must accept the following license to use this software."
    displayFile "$SCRIPT_DIR"/LICENSE
    yesno "Do you agree to and accept the license?";

    ANSWER=$?
    ACTIVITY="Declined"
    if [ $ANSWER -eq 0 ]; then
        touch "$LICENSE_ACCEPTED"
    else
        messagebox "Please uninstall this software or re-launch and accept the terms."
        exit 1;
    fi
fi

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    LAUNCH=$(find "$SCRIPT_DIR" -maxdepth 1 -name '*.amd64')
else
    LAUNCH=$(find "$SCRIPT_DIR" -maxdepth 1 -name '*.x86')
fi

if [[ ! -f $LAUNCH ]]; then
    echo "Application file not found";
    exit 2;
fi
if [[ ! -x $LAUNCH ]]; then
    echo "Application file does not have executable permission";
    exit 3;
fi

cd $SCRIPT_DIR
$LAUNCH
exit 0
