#!/bin/bash
# Set Zoom light on/off using webhooks
set -Eeuo pipefail

source "${HOME}/.profile_local"

TRIGGER_FILE="${HOME}/.zoomison"

if pgrep -x zoom >/dev/null 2>&1 ; then
    echo "Zoom"
    if ! [[ -f "${TRIGGER_FILE}" ]] ; then
        curl --silent --request POST "${WEBHOOK_ZOOM_ON}" >/dev/null 2>&1
        touch "${TRIGGER_FILE}"
    fi
else
    echo ""
    if [[ -f "${TRIGGER_FILE}" ]] ; then
        curl --silent --request POST "${WEBHOOK_ZOOM_OFF}" >/dev/null 2>&1
        rm -f "${TRIGGER_FILE}"
    fi
fi
