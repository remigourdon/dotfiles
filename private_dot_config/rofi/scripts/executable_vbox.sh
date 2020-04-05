#!/bin/bash
# Rofi script for virtualbox
set -u # Treat unset variables and parameters as errors

#############
# FUNCTIONS #
#############

vmsList()
{
    vboxmanage list vms | awk -F '"' '{print $2}'
}

startVM()
{
    vboxmanage startvm "${1}"
}

poweroffVM()
{
    vboxmanage controlvm "${1}" poweroff
}

cloneVM()
{
    vboxmanage clonevm "${1}" --mode machine --register --options keepallmacs
}

deleteVM()
{
    vboxmanage unregistervm "${1}" --delete
}

#######
# RUN #
#######

# Machine selection
LAUNCHER="rofi -dmenu -i -p machine"
if ! VM=$(vmsList | ${LAUNCHER}) ; then
    exit 1
fi

# Action selection
OPTIONS="Start machine\nPower-off machine\nClone machine\nDelete machine"
LAUNCHER="rofi -dmenu -i -p action -format d"
if ! OPTION=$(echo -e "${OPTIONS}" | ${LAUNCHER}) ; then
    exit 1
fi
case "${OPTION}" in
    1) startVM "${VM}" ;;
    2) poweroffVM "${VM}" ;;
    3) cloneVM "${VM}" ;;
    4) deleteVM "${VM}" ;;
    *) exit 1 ;;
esac
