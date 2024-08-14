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
brew tap 'homebrew/cask'
brew tap 'homebrew/cask-versions'
brew tap 'homebrew/cask-fonts'

# Installs
## System Tools
brew install 'font-fira-code-nerd-font' --cask

# Casks
brew install 'balenaetcher' --cask # Burn ISO images to USB Drives
brew install 'docker' --cask
brew install 'firefox' --cask
brew install 'slack' --cask
brew install 'telegram' --cask
brew install 'transmission' --cask
