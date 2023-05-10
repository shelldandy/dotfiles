#!/bin/bash

########  ########  ######## ##      ##
##     ## ##     ## ##       ##  ##  ##
##     ## ##     ## ##       ##  ##  ##
########  ########  ######   ##  ##  ##
##     ## ##   ##   ##       ##  ##  ##
##     ## ##    ##  ##       ##  ##  ##
########  ##     ## ########  ###  ###

# Install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Taps
#brew tap 'neovim/neovim'
#brew tap 'thoughtbot/formulae'
brew tap 'homebrew/cask'
brew tap 'homebrew/cask-versions'
#brew tap 'eddieantonio/eddieantonio'
#brew tap 'koekeishiya/formulae'

# Installs
## System Tools

# Casks
brew install 'balenaetcher' --cask          # Burn ISO images to USB Drives
brew install 'contexts' --cask              # Better cmd-tab
brew install 'dash' --cask                  # Docs
brew install 'docker' --cask
brew install 'dropbox' --cask
brew install 'firefox' --cask
brew install 'figma' --cask
brew install 'focus' --cask
brew install 'google-chrome' --cask
brew install 'iterm2-nightly' --cask
brew install 'rocket' --cask
brew install 'slack' --cask
brew install 'subtitles' --cask
brew install 'telegram' --cask
brew install 'transmission' --cask
