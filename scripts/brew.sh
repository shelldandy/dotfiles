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
brew cask install 'android-studio'
brew cask install 'franz'
brew cask install 'google-play-music-desktop-player'
brew cask install 'ubersicht'

# Mas Will install my apps from the App Store for me
mas install 497799835         # Xcode (8.2.1)
mas install 409183694         # Keynote (7.0.5)
mas install 409201541         # Pages (6.0.5)
mas install 409203825         # Numbers (4.0.5)
mas install 425424353         # The Unarchiver (3.11.1)
mas install 417602904         # CloudApp (4.1.1)
mas install 443987910         # 1Password (6.5.3)
mas install 775737590         # iA Writer (4.0.2)
mas install 1062679359        # typeface (1.5.2)
mas install 557168941         # Tweetbot (2.4.6)
mas install 969418666         # ColorSnapper2 (1.3.1)
mas install 937984704         # Amphetamine (3.0.2)
mas install 992076693         # MindNode (2.4.6)
mas install 1081413713        # GIF Brewery 3 (3.4.1)
mas install 1031163338        # GIFHunter (1.0.12)
mas install 638332853         # Logitech Camera Settings (3.31.623)
mas install 948176063         # Boom 2 (1.6)
mas install 1035350363        # Teeny Tokyo (1.2)
mas install 872515009         # Pomodoro Timer (1.5)
mas install 969418666         # ColorSnapper2 (1.3.1)
