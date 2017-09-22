#!/bin/bash

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Prezto
# 1. Launch zsh
zsh
# 2. Clone the repository
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# 3. Create a new Zsh configuration by copying the Zsh configuration files provided
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
# 4. Set zsh as your default shell
chsh -s /bin/zsh

# Install RVM
curl -sSL https://get.rvm.io | bash -s stable --ruby
