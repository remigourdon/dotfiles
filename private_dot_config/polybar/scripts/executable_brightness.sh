#!/bin/bash

CURRENT_VALUE=$(brightnessctl g)
MAX_VALUE=$(brightnessctl m)

CURRENT_PERCENT=$(( CURRENT_VALUE * 100 / MAX_VALUE ))

if [ "${CURRENT_PERCENT}" -gt 85 ]; then
    ICON="🌑"
elif [ "${CURRENT_PERCENT}" -gt 60 ]; then
    ICON="🌒"
elif [ "${CURRENT_PERCENT}" -gt 35 ]; then
    ICON="🌓"
elif [ "${CURRENT_PERCENT}" -gt 10 ]; then
    ICON="🌔"
else
    ICON="🌕"
fi

echo "%{u#555753 +u}$ICON $CURRENT_PERCENT%"
