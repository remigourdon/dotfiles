#!/bin/bash
# Rofi script to list documents under HOME directory
set -u # Treat unset variables and parameters as errors

LAUNCHER="rofi -dmenu -i -p docs -format d"

LIST="$(fd '.*\.(docx?|xlsx?|od[st])$' ~/Documents/)"

FILTERED=$(echo "${LIST}" | ${LAUNCHER})

case ${FILTERED} in
    "") exit 1 ;;
    0) exit 1 ;;
    *) libreoffice "$(echo "${LIST}" | sed -n "${FILTERED}p")" ;;
esac
