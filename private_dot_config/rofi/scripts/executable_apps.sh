#!/bin/bash
# Rofi script to open links to useful apps repositories
set -u # Treat unset variables and parameters as errors

LAUNCHER="rofi -dmenu -i -p apps -format d"

LIST="$(grep -E '^http[^ ]+$' ~/Projects/wiki-public/useful-applications.md)"

FILTERED=$(echo "${LIST}" | ${LAUNCHER})

case ${FILTERED} in
    "") exit 1 ;;
    0) exit 1 ;;
    *) "${BROWSER}" "$(echo "${LIST}" | sed -n "${FILTERED}p")" ;;
esac
