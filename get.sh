#!/bin/bash
echo 'Getting everything for you to commit'
cp ~/{.gitignore_global,.tmux.conf,.zshrc,xterm-256color-italic.terminfo,colors.sh} ~/git/dotfiles

cp -R ~/.config/nvim/config ~/git/dotfiles
cp ~/.config/nvim/init.vim ~/git/dotfiles

echo "All done! That wasn't hard was it? Now commit my friend!"

