#!/bin/bash

# Terminate already running bar instances
pgrep -u $UID -x polybar | xargs -r kill -9

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Find interfaces
WIRELESS="$(nmcli connection show --active | awk '{if ($3=="wifi") {print $4;exit}}')"
WIRED="$(nmcli connection show --active | awk '{if ($3=="ethernet") {print $4;exit}}')"

if type "xrandr" &>/dev/null ; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -q --reload top &
        MONITOR=$m WIRELESS=$WIRELESS WIRED=$WIRED polybar -q --reload bottom &
    done
fi

