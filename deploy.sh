#!/bin/bash

echo "I'm about to copy all the files to their respective places hang tight..."

cp -v {.gitignore_global,.tmux.conf,.zshrc,xterm-256color-italic.terminfo,colors.sh} ~
echo '⏲.... Almost there'
cp -Rv nvim/* ~/.config/nvim

echo "🍕 🍺 All done! That wasn't that hard was it? 🎉"
