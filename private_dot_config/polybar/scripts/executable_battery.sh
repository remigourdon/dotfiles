#!/bin/bash

# System folder
SYSDIR="/sys/class/power_supply"

# Devices
BATTERIES=( $(find /sys/class/power_supply/ -name "BAT*" | sed 's/.*\///') )
AC="AC"

# Icons
ICON_0=
ICON_1=
ICON_2=
ICON_3=
ICON_4=
ICON_5=

# Counters
FULL=0
NOW=0

for b in "${BATTERIES[@]}"; do
    f=$(cat "${SYSDIR}"/"${b}"/energy_full)
    n=$(cat "${SYSDIR}"/"${b}"/energy_now)
    FULL=$((FULL + f))
    NOW=$((NOW + n))
done

PERCENT=$(echo ${NOW} ${FULL} | awk '{ printf $1 / $2 * 100 }')
PERCENT=${PERCENT%.*}
PERCENT=$(printf "%3s" "${PERCENT}")

STATUS="$(cat "${SYSDIR}"/"$AC"/online)"
if [[ 1 -eq "${STATUS}" ]]; then
	echo "${ICON_0} ${PERCENT}%"
else
	ICON="$ICON_1"
	if [[ "${PERCENT}" -gt 25 ]]; then ICON="${ICON_2}"; fi
	if [[ "${PERCENT}" -gt 50 ]]; then ICON="${ICON_3}"; fi
	if [[ "${PERCENT}" -gt 75 ]]; then ICON="${ICON_4}"; fi
	if [[ "${PERCENT}" -gt 98 ]]; then ICON="${ICON_5}"; fi
	echo "${ICON} ${PERCENT}%"
fi
