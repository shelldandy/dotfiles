#!/bin/bash

########  ########  ######## ##      ##
##     ## ##     ## ##       ##  ##  ##
##     ## ##     ## ##       ##  ##  ##
########  ########  ######   ##  ##  ##
##     ## ##   ##   ##       ##  ##  ##
##     ## ##    ##  ##       ##  ##  ##
########  ##     ## ########  ###  ###

# Install RVM
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap 'neovim/neovim'
brew tap 'thoughtbot/formulae'
brew tap 'caskroom/cask'
brew tap 'caskroom/versions'
brew tap 'eddieantonio/eddieantonio'

# Installs
brew install 'ack'                        # A faster grep
brew install 'asciinema'                  # Record videos of the terminal
brew install 'atool'                      # ranger dep for zip
brew install 'automake'                   # Make but Mac lol
brew install 'calc'                       # Simple calculator
brew install 'cmake'                      # More make tools
brew install 'cmatrix'                    # There is no spoon!
brew install 'coreutils'                  # The basics from GNU
brew install 'cowsay'                     # Moo!
brew install 'ctags'                      # For use in Vim, search by tags, etc
brew install 'docker-compose'             # Coordinate docker stuff
brew install 'editorconfig'               # Standarize Editor Configs
brew install 'exa'                        # Fancy ls with colors
brew install 'exiftool'                   # Learn about what you place online
brew install 'ffmpeg'                     # Tool used for video conversion
brew install 'figlet'                     # Use it to write cool banners
brew install 'fortune'                    # What does the future hold??
brew install 'fzf'                        # Fuzzy finder
brew install 'git'                        # Cooler newer fresher git
brew install 'git-flow'                   # Feature branch development
brew install 'glances'                    # A cooler top (to see which app is using resources)
brew install 'gnupg'                      # gpg for secure life
brew install 'go'                         # gogogogogo
brew install 'gs'                         # GhostScript for PDF tooling
brew install 'grip'                       # Github Readme Instant Preview
brew install 'highlight'                  # Highlight text (used in fzf-vim preview)
brew install 'htop'                       # top and nano finally together
brew install 'imagemagick'                # Convert images like a boss
brew install 'imgcat'                     # images in the terminal lol
brew install 'jp2a'                       # jpg2ascii (make signatures lol)
brew install 'jq'                         # parser for json https://stedolan.github.io/jq/
brew install 'less'                       # less is more
brew install 'libcaca'                    # jp2 but with colors lol
brew install 'libyaml'                    # yaml parser
brew install 'mas'                        # Mac App Store
brew install 'neovim'
brew install 'neofetch'
brew install 'openssl@1.1'                # used for self-signed certificates
brew install 'perl'
brew install 'pinentry-mac'               # Nicer gpg password entry situation
brew install 'ranger'                     # Like vim but for the finder
brew install 'rcm'                        # dotfile management tools
brew install 'reattach-to-user-namespace' # make clipboard on tmux great again
brew install 'rust'
brew install 'source-highlight'           # to give less highlight powers
brew install 'the_silver_searcher'        # ag (used in fzf-vim)
brew install 'thefuck'                    # for when you fuck up
brew install 'tmux'
brew install 'trash'                      # Send to the trash via cli
brew install 'tree'                       # See file structure
brew install 'utf8proc'                   # Unicode normalization
brew install 'w3m'                        # ranger dep for images
brew install 'watchman'                   # Watches files triggers actions
brew install 'yarn' --without-node        # faster npm
brew install 'youtube-dl'                 # Download stuff from the online

# Casks
brew cask install 'android-studio'
brew cask install 'atom'
brew cask install 'boom-3d'
brew cask install 'dash'
brew cask install 'dashlane'
brew cask install 'docker'
brew cask install 'dropbox'
brew cask install 'firefox'
brew cask install 'flux'
brew cask install 'focus'
brew cask install 'google-chrome'
brew cask install 'google-play-music-desktop-player'
brew cask install 'iterm2-nightly'
brew cask install 'journey'
brew cask install 'little-snitch'
brew cask install 'micro-snitch'
brew cask install 'rocket'
brew cask install 'sketch'
brew cask install 'skype'
brew cask install 'slack'
brew cask install 'spotify'
brew cask install 'subtitles'
brew cask install 'telegram'
brew cask install 'toggl'
brew cask install 'ubar'
brew cask install 'vanilla'
brew cask install 'whatsapp'
