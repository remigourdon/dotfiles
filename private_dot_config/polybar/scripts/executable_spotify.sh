#!/bin/bash

MP_DOMAIN="org.mpris.MediaPlayer2"
MP_PATH="/org/mpris/MediaPlayer2"
CMD="org.freedesktop.DBus.Properties.Get"

getTitle() {
    if ! pgrep -x spotify >/dev/null; then
      echo ""; exit
    fi

    META=$(dbus-send --print-reply --dest=${MP_DOMAIN}.spotify ${MP_PATH} ${CMD} string:${MP_DOMAIN}.Player string:Metadata)

    ARTIST=$(echo "${META}" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1)
    # ALBUM=$(echo "$META" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)
    TITLE=$(echo "${META}" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)

    # echo "${*:-%ARTIST% - %TITLE%}" | sed "s/%ARTIST%/$ARTIST/g;s/%TITLE%/$TITLE/g;s/%ALBUM%/$ALBUM/g"i | sed 's/&/\\&/g'
    echo "${ARTIST}" - "${TITLE}"
}

isPlaying() {
  STATUS=$(dbus-send --print-reply --dest=${MP_DOMAIN}.spotify ${MP_PATH} ${CMD} string:${MP_DOMAIN}.Player string:PlaybackStatus \
    | tail -1 \
    | sed 's/^.*"\(.*\)".*/\1/')
  if [ "${STATUS}" = "Paused" ]; then
    exit 1
  fi
  echo "${STATUS}"
  exit
}

togglePlay() {
  dbus-send --print-reply --dest=${MP_DOMAIN}.spotify ${MP_PATH} ${MP_DOMAIN}.Player.PlayPause
}

case "${1}" in
        --title)
                getTitle
        ;;
        --togglePlay)
                togglePlay
        ;;
        --isPlaying)
                isPlaying
        ;;
esac
