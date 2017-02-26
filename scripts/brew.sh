#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap neovim/neovim
brew tap thoughtbot/formulae
brew tap caskroom/cask

# Installs
brew install 'coreutils'
brew install 'git'
brew install 'mas'
brew install 'neovim'
brew install 'python'
brew install 'python3'
brew install 'rcm'
brew install 'reattach-to-user-namespace'
brew install 'the_silver_searcher'
brew install 'tmux'
brew install 'trash'
brew install 'source-highlight'
brew install 'zsh'

# Casks
brew cask install 'dropbox'
brew cask install 'google-chrome'
brew cask install 'iterm2'

# Mas
mas install 497799835 # Xcode (8.2.1)
mas install 425424353 # The Unarchiver (3.11.1)
mas install 409183694 # Keynote (7.0.5)
mas install 417602904 # CloudApp (4.1.1)
mas install 443987910 # 1Password (6.5.3)
mas install 775737590 # iA Writer (4.0.2)
mas install 1062679359 # typeface (1.5.2)
mas install 557168941 # Tweetbot (2.4.6)
mas install 409201541 # Pages (6.0.5)
mas install 969418666 # ColorSnapper2 (1.3.1)
mas install 937984704 # Amphetamine (3.0.2)
mas install 992076693 # MindNode (2.4.6)
mas install 409203825 # Numbers (4.0.5)
mas install 1081413713 # GIF Brewery 3 (3.4.1)
