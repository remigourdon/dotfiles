#!/bin/bash
# Rofi script to list tmux session and attach or kill
set -u # Treat unset variables and parameters as errors

# Script selection
if ! SESSION_NAME="$(tmux list-sessions -F '#S' | rofi -dmenu -i -p script)" ; then
    exit 1
fi

# Action selection
OPTIONS="Attach session\nKill session"
LAUNCHER="rofi -dmenu -i -p action -format d"
if ! OPTION=$(echo -e "${OPTIONS}" | ${LAUNCHER}) ; then
    exit 2
fi

case ${OPTION} in
    1) "${TERMINAL}" -e "bash" -c "tmux attach -t ${SESSION_NAME}" ;;
    2) tmux kill-session -t "${SESSION_NAME}" ;;
    *) exit 1 ;;
esac
