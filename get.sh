#!/bin/bash
DOTFILES=~/git/dotfiles
NEOVIM=$DOTFILES/nvim

echo 'Getting everything for you to commit'

if cp -v ~/{.gitignore_global,.tmux.conf,.zshrc,xterm-256color-italic.terminfo,colors.sh} $DOTFILES; then
  echo 'Copy code: $? - Successful'
else
  echo 'Something happened: $? - Unsuccessful'
fi

if cp -Rv ~/.config/nvim/config $NEOVIM; then
  echo 'Copy code: $? - Successful'
else
  echo 'Something happened: $? - Unsuccessful'
fi

if cp -v ~/.config/nvim/init.vim $NEOVIM; then
  echo 'Copy code: $? - Successful'
  echo "🎉🎉🍕😎"
  echo "All done! That wasn't hard was it? Now commit my friend!"
else
  echo 'Something happened: $? - Unsuccessful'
fi

