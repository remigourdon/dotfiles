#!/bin/bash
# Configure terminfo for tmux
set -Eeuo pipefail

# Install scripts
if ! [ -e "${HOME}/.scripts" ] ; then
    git clone git@github.com:remigourdon/scripts.git "${HOME}/.scripts"
fi

# Install cheats
if ! [ -e "${HOME}/.cheats" ] ; then
    git clone git@github.com:remigourdon/cheats.git "${HOME}/.cheats"
fi

# Install snippets
if ! [ -e "${HOME}/.snippets" ] ; then
    git clone git@github.com:remigourdon/snippets.git "${HOME}/.snippets"
fi
