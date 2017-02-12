source ~/.zprezto/init.zsh
# Zsh Files of Miguel Palau
export PATH="/usr/local/sbin:$PATH"
# PHP Path
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
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
alias moo='fortune | cowsay | lolcat'
alias rst='exec zsh'
# Run local npm packages
alias npmL='PATH="$(npm bin)":"$PATH"'
# Install Quickly with --save-dev
alias npmD="npm i -D "
# Install Quickly with --save
alias npmS="npm i -S "
# iTermocil
alias i="itermocil "
# tmuxinator
alias t="tmuxinator "
# Quick ground-zero
alias 0miedo="git clone git@github.com:mike3run/ground-zero.git; cd ground-zero"

# Yarn Baby!
alias yS='yarn add '
alias yD='yarn add --dev '

# Quick git status
alias g='git '
alias gs='git status'
alias gaa='git add .'
alias gc='git commit'
alias gp='git push'

# Quick clear
alias c='clear'
# NVM all the way
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# RVM all the way
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Good ol' fun
fortune | cowsay | lolcat
