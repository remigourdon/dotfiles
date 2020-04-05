#!/bin/bash
# Configure terminfo for tmux
set -Eeuo pipefail

tic -x ${HOME}/.tmux/tmux-256color.ti
