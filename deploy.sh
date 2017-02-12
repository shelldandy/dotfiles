#!/bin/bash

echo "I'm about to copy all the files to their respective places hang tight..."

cp -v gitignore_global ~/.gitignore_global
cp -v tmux.conf ~/.tmux.conf
cp -v zshrc ~/.zshrc
cp -v vim.vimrc ~/.vimrc
cp -v zpreztorc ~/.zpreztorc
cp -v kwmrc ~/.kwm

echo "Let's take care of our PHP debug situation now..."
cp -v ext-xdebug.ini /usr/local/etc/php/5.6/conf.d

echo '⏲.... Almost there'
cp -Rv nvim/* ~/.config/nvim

echo "🍕 🍺 All done! That wasn't that hard was it? 🎉"
