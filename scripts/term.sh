#!/bin/bash

# Crispy Smooth font rendering
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

# update terminal
tic -x ../iterm/xterm-256color-italic.terminfo
tic -x ../iterm/tmux.terminfo
tic -x ../iterm/tmux-256color.terminfo
