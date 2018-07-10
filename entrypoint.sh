#!/usr/bin/env bash

if [ -f "$FRONTEND_SETTINGS_SOURCE" ] && [ ! -z "$FRONTEND_SETTINGS_TARGET" ]
then
    echo "$FRONTEND_SETTINGS_SOURCE => $FRONTEND_SETTINGS_TARGET"
    cp $FRONTEND_SETTINGS_SOURCE $FRONTEND_SETTINGS_TARGET
    /usr/local/bin/ep -v $FRONTEND_SETTINGS_TARGET
fi

nginx -g "daemon off;"
