#!/bin/sh

SOURCE=$1
REPO=$2

TARGET=$REPO/.nlsp-settings


if [ -d "$TARGET" ]; then
    rm -r "$TARGET"
fi

ln -sf  $(pwd)/$SOURCE $TARGET

EXCLUDE=$REPO/.git/info/exclude

if [ -f "$EXCLUDE" ]; then
    rg -qF ".nlsp-settings" $EXCLUDE
    STATUS=$?
    if [ $STATUS -ne 0 ]; then 
        echo ".nlsp-settings" >> $EXCLUDE
    fi
fi
