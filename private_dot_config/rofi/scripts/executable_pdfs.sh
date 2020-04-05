#!/bin/bash
# Rofi script to list PDFs under HOME directory
set -u # Treat unset variables and parameters as errors

LAUNCHER="rofi -dmenu -i -p pdfs -format d"

LIST="$(fd -e pdf --exclude "TresoritDrive/" . ~)"

FILTERED=$(echo "${LIST}" | ${LAUNCHER})

case ${FILTERED} in
    "") exit 1 ;;
    0) exit 1 ;;
    *) zathura "$(echo "${LIST}" | sed -n "${FILTERED}p")" ;;
esac
