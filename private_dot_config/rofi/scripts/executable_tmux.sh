#!/bin/bash
# Rofi script to list tmux scripts and take action
set -u # Treat unset variables and parameters as errors

# Script selection
LIST="$(find ~/.config/tmux/ -type f -name '*.sh')"
LAUNCHER="rofi -dmenu -i -p script -format d"
FILTERED=$(echo "${LIST}" \
    | sed -e "s!.*/tmux/\(.*\)\.sh!\1!gi" \
    | ${LAUNCHER})

# Action selection
OPTIONS="Start session\nKill session"
LAUNCHER="rofi -dmenu -i -p action -format d"
if ! OPTION=$(echo -e "${OPTIONS}" | ${LAUNCHER}) ; then
    exit 1
fi

SCRIPT="$(echo "${LIST}" | sed -n "${FILTERED}p")"
echo "${SCRIPT}"

case ${OPTION} in
    1) st -e "${SCRIPT}" ;;
    2) ${SCRIPT} -k ;;
    *) exit 1 ;;
esac
