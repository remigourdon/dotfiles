#!/bin/bash
# Rofi script to list PCAPNG files under Data directory
set -u # Treat unset variables and parameters as errors

LAUNCHER="rofi -dmenu -i -p pcapng -format d"

LIST="$(fd -e pcapng . ~/Data)"

FILTERED=$(echo "${LIST}" | ${LAUNCHER})

case ${FILTERED} in
    "") exit 1 ;;
    0) exit 1 ;;
    *) wireshark "$(echo "${LIST}" | sed -n "${FILTERED}p")" ;;
esac
