#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap neovim/neovim
brew tap thoughtbot/formulae
brew tap caskroom/cask

# Installs
brew install 'ack'
brew install 'automake'
brew install 'calc'
brew install 'cmake'
brew install 'coreutils'
brew install 'cowsay'
brew install 'ctags'
brew install 'doxygen'
brew install 'editorconfig'
brew install 'fortune'
brew install 'git'
brew install 'git-flow'
brew install 'grip'
brew install 'iandrewt/tap/gpmdp-remote'
brew install 'ical-buddy'
brew install 'koekeishiya/formulae/kwm'
brew install 'libksba'
brew install 'lua'
brew install 'mas'
brew install 'mongodb'
brew install 'mysql'
brew install 'neofetch'
brew install 'neovim/neovim/neovim'
brew install 'perl'
brew install 'python'
brew install 'python3'
brew install 'reattach-to-user-namespace'
brew install 'rcm'
brew install 'ruby'
brew install 'source-highlight'
brew install 'the_silver_searcher'
brew install 'thoughtbot/formulae/rcm'
brew install 'tmux'
brew install 'tomanthony/brews/itermocil'
brew install 'trash'
brew install 'tree'
brew install 'utf8proc'
brew install 'watchman'
brew install 'youtube-dl'

# Casks
brew cask install 'android-studio'
brew cask install 'dropbox'
brew cask install 'firefox'
brew cask install 'flux'
brew cask install 'franz'
brew cask install 'google-chrome'
brew cask install 'google-play-music-desktop-player'
brew cask install 'iterm2'
brew cask install 'ubersicht'
brew cask install 'rightfont'
brew cask install 'sketch'
brew cask install 'subtitles'

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
