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

# Homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=/etc/Caskroom"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias v='nvim'
alias dc='docker-compose'
alias x='exit'
alias df='cd ~/dotfiles'
alias gf='cd ~/git'

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

alias ll='exa -lah'

# Get a random cow on login
moo

# Fuck autocorrect in zsh...
unsetopt correct
setopt rm_star_silent

# Highlight stuff with less
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '

# Show or hide all files on the finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
