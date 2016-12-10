#!/bin/bash
DOTFILES=~/git/dotfiles
NEOVIM=$DOTFILES/nvim

echo 'Getting everything for you to commit'

cp -v ~/{.gitignore_global,.tmux.conf,.zshrc,xterm-256color-italic.terminfo,colors.sh} $DOTFILES

cp -Rv ~/.config/nvim/config $NEOVIM
cp -v ~/.config/nvim/init.vim $NEOVIM

echo "🎉🎉🍕😎"
echo "All done! That wasn't hard was it? Now commit my friend!"

