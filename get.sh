#!/bin/bash
DOTFILES=~/git/dotfiles
NEOVIM=$DOTFILES/nvim

echo 'Getting everything for you to commit'

if cp -v ~/{.gitignore_global,.tmux.conf,.zshrc,xterm-256color-italic.terminfo,colors.sh} $DOTFILES; then
  echo 'Successful first copy'
else
  echo 'Something happened: $? - Unsuccessful'
fi

if cp -Rv ~/.config/nvim/config $NEOVIM; then
  echo 'Successful second copy'
else
  echo 'Something happened: $? - Unsuccessful'
fi

if cp -v ~/.config/nvim/init.vim $NEOVIM; then
  echo 'Successful final copy'
  echo "🎉🎉🍕😎"
  echo "All done! That wasn't hard was it? Now commit my friend!"
else
  echo 'Something happened: $? - Unsuccessful'
fi

