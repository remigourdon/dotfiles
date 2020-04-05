#!/bin/sh

. "${HOME}/.aliases"

case "$1" in
    *.tar*) tar tf "$1" ;;
    *.zip) unzip -l "$1" ;;
    *.rar) unrar l "$1" ;;
    *.7z) 7z l "$1" ;;
    *.pdf) pdftotext "$1" - ;;
    *.csv) csv "$1" ;;
    *.tsv) tsv "$1" ;;
    *.json) json "$1" | bat --plain --theme=base16 --color=always -l JSON ;;
    *) bat --number --theme=base16 --color=always "$1" ;;
esac
