# Zsh Files of Miguel Palau
export PATH="/usr/local/sbin:$PATH"
# PHP Path
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Homebre cask
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=/etc/Caskroom"

if type nvim > /dev/null 2>&1; then
  alias v='nvim'
fi

alias tmux="env TERM=xterm-256color-italic tmux"
export TERM=xterm-256color-italic

# Setting default editor for tmuxinator
export EDITOR='nvim'

# Theme to use see ~/.oh-my-zsh/themes
# Bullet train theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
ZSH_THEME="bullet-train"
# Specific bullet train things
BULLETTRAIN_PROMPT_CHAR="\$"
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_NVM_SHOW=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git wp-cli)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
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
alias gs='git status'

# Quick clear
alias c='clear'
# NVM all the way
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
