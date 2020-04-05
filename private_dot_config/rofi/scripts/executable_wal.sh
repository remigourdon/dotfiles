#!/bin/bash
# Rofi script to list and pick wal theme
set -u # Treat unset variables and parameters as errors

# Theme selection
LIST="$(wal --theme)"
LAUNCHER="rofi -dmenu -i -p theme"
if ! THEME=$(echo "${LIST}" | grep '-' | sed 's/ - //' | ${LAUNCHER}) ; then
    exit 1
fi
wal --theme "${THEME}"
