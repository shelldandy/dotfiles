#!/bin/bash

# Install fish and set as default shell
brew install 'fish'
chsh -s /usr/local/bin/fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells

# Oh-my-fish
curl -L https://get.oh-my.fish | fish
