#!/bin/bash

########  ########  ######## ##      ##
##     ## ##     ## ##       ##  ##  ##
##     ## ##     ## ##       ##  ##  ##
########  ########  ######   ##  ##  ##
##     ## ##   ##   ##       ##  ##  ##
##     ## ##    ##  ##       ##  ##  ##
########  ##     ## ########  ###  ###

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Taps
brew tap 'neovim/neovim'
brew tap 'thoughtbot/formulae'
brew tap 'caskroom/cask'
brew tap 'caskroom/versions'
brew tap 'eddieantonio/eddieantonio'
brew tap 'koekeishiya/formulae'

# Installs
## System Tools
brew install 'coreutils'                  # The basics from GNU
brew install 'cmake'                      # More make tools
brew install 'automake'                   # Make but Mac lol
brew install 'gnupg'                      # gpg for secure life
brew install 'openssl@1.1'                # used for self-signed certificates
brew install 'pinentry-mac'               # Nicer gpg password entry situation
brew install 'glances'                    # A cooler top (to see which app is using resources)
brew install 'htop'                       # top and nano finally together

## Commands
brew install 'perl'
brew install 'tree'                       # See file structure
brew install 'exa'                        # Fancy ls with colors
brew install 'ack'                        # A faster grep
brew install 'atool'                      # ranger dep for zip
brew install 'rcm'                        # dotfile management tools
brew install 'trash'                      # Send to the trash via cli
brew install 'youtube-dl'                 # Download stuff from the online
brew install 'calc'                       # Simple calculator
brew install 'mas'                        # Mac App Store

# visual arts
brew install 'cmatrix'                    # There is no spoon!
brew install 'cowsay'                     # Moo!
brew install 'figlet'                     # Use it to write cool banners
brew install 'fortune'                    # What does the future hold??
brew install 'fzf'                        # Fuzzy finder
brew install 'jp2a'                       # jpg2ascii (make signatures lol)
brew install 'libcaca'                    # jp2 but with colors lol
brew install 'imgcat'                     # images in the terminal lol
brew install 'asciinema'                  # Record videos of the terminal
brew install 'ffmpeg'                     # Tool used for video conversion
brew install 'imagemagick'                # Convert images like a boss


## Dev Tools
brew install 'exiftool'                   # Learn about what you place online
brew install 'editorconfig'               # Standarize Editor Configs
brew install 'docker-compose'             # Coordinate docker stuff
brew install 'git'                        # Cooler newer fresher git
brew install 'git-flow'                   # Feature branch development
brew install 'httpie'                     # POSTMan Killer

### Vim Stuff
brew install 'neovim'
brew install 'ranger'                     # Like vim but for the finder
brew install 'neofetch'
brew install 'ctags'                      # For use in Vim, search by tags, etc
brew install 'gs'                         # GhostScript for PDF tooling
brew install 'grip'                       # Github Readme Instant Preview
brew install 'highlight'                  # Highlight text (used in fzf-vim preview)

brew install 'utf8proc'                   # Unicode normalization
brew install 'jq'                         # parser for json https://stedolan.github.io/jq/
brew install 'less'                       # less is more
brew install 'libyaml'                    # yaml parser
brew install 'w3m'                        # ranger dep for images
brew install 'watchman'                   # Watches files triggers actions
brew install 'yarn' --without-node        # faster npm
brew install 'source-highlight'           # to give less highlight powers
brew install 'the_silver_searcher'        # ag (used in fzf-vim)

## Language
brew install 'ruby'
brew install 'rust'
brew install 'go'                         # gogogogogo

# Casks
brew cask install 'balenaetcher'
brew cask install 'dash'
brew cask install 'dashlane'
brew cask install 'docker'
brew cask install 'dropbox'
brew cask install 'firefox'
brew cask install 'figma'
brew cask install 'focus'
brew cask install 'google-chrome'
brew cask install 'iterm2-nightly'
brew cask install 'rocket'
brew cask install 'sketch'
brew cask install 'skype'
brew cask install 'slack'
brew cask install 'spotify'
brew cask install 'subtitles'
brew cask install 'telegram'
brew cask install 'whatsapp'
