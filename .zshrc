# Path to your oh-my-zsh installation.
export ZSH=/Users/imike/.oh-my-zsh

# Setting default editor for tmuxinator
export EDITOR='vim'

# Theme to use see ~/.oh-my-zsh/themes
# Bullet train theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
ZSH_THEME="bullet-train"
# Specific bullet train things
BULLETTRAIN_PROMPT_CHAR="🍕"
BULLETTRAIN_RUBY_SHOW=false
BULLETTRAIN_NVM_SHOW=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git)

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

# NVM all the way
export NVM_DIR="/Users/imike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
