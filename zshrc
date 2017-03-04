source ~/.zprezto/init.zsh

# Import all custom plugins and love
for f in ~/.zsh/*
  do source $f
done

# Zsh Files of Miguel Palau
export PATH="/usr/local/sbin:$PATH"
# Android Tools for React Native
# https://facebook.github.io/react-native/docs/getting-started.html
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Homebre cask
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=/etc/Caskroom"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias v='nvim'

alias tmux="env TERM=xterm-256color-italic tmux"
export TERM=xterm-256color-italic

# Setting default editor for tmuxinator
export EDITOR='nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias rst='exec zsh'
# Run local npm packages
alias npmL='PATH="$(npm bin)":"$PATH"'
# Install Quickly with --save-dev
alias npmD="npm i -D "
# Install Quickly with --save
alias npmS="npm i -S "
# Quick ground-zero
alias 0miedo="git clone git@github.com:mike3run/ground-zero.git; cd ground-zero"
# Open apps quickly from the terminal
alias oa="open -a "

# Yarn Baby!
alias yS='yarn add '
alias yD='yarn add --dev '

# Quick git status
alias g='git '
alias gs='git status'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'
alias gP='git pull'
alias gr='git rebase'

# Quick clear
alias c='clear'

# Get a random cow on login
moo

# Fuck autocorrect in zsh...
unsetopt correct_all

# Highlight stuff with less
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '

# Show or hide all files on the finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
