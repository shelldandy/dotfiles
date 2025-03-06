function source_if_exists() {
    local file_path="$1"
    if [ -f "$file_path" ]; then
        . "$file_path"
    fi
}

function source_if_exists_many() {
  for file in "$@"; do
    source_if_exists "${file}"
  done
}

function add_to_path_if_exists() {
    local dir_path="$1"
    if [ -d "$dir_path" ] && [[ ":$PATH:" != *":$dir_path:"* ]]; then
        export PATH="$dir_path:$PATH"
    fi
}

# Array of file paths
files=(
  "~/.zprezto/init.zsh"
  "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
  '~/git/google-cloud-sdk/path.zsh.inc'
  '~/git/google-cloud-sdk/completion.zsh.inc'
  "$(brew --prefix)/etc/profile.d/z.sh"
)

env_file="$HOME/.env.secret.zsh"
if [ -f "$env_file" ]; then
  source "$env_file"
fi
source_if_exists_many "${files[@]}"

# Import all custom plugins and love
for f in ~/.zsh/*
  do source $f
done

export THEME_COLORS=gruvbox-dark
# Zsh Files of Miguel Palau
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"

# Homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=/etc/Caskroom"
export HOMEBREW_NO_ENV_HINTS=true

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias v='nvim'
alias dc='docker-compose'
alias x='exit'
alias df='cd ~/dotfiles'
alias gf='cd ~/git'

export TERM=xterm-256color
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
alias gP='git push'
alias gp='git pull'
alias gr='git rebase'
alias gd='git diff'
alias gxo='git checkout'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git lg'
alias update_node='nvm install --reinstall-packages-from=default --latest-npm "lts/*"'

alias k='kubectl'

# Quick clear
alias c='clear'
alias ll='eza -lah'
alias x='exit'

# SLO things for work
alias trivyscan='trivy repo . -f table --scanners vuln'
alias snykscan='snyk test'

# Movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias rm="trash"
alias nuke_modules="find . -name 'node_modules' -type d -prune -print -exec trash '{}' \;"

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

# fzf completions
source <(fzf --zsh)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export GPG_TTY=$(tty)

# Starship prompt
eval "$(starship init zsh)"

# allow locally installed npm binaries to be executed;
# added by `npm i -g add-local-binaries-to-path`
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/go/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/git/deployment_tools/scripts/gcom"

# Fix for running core grafana
ulimit -f 2097152
ulimit -c 2097152
ulimit -n 2097152

# Created by `pipx` on 2025-01-01 05:56:43
export PATH="$PATH:/Users/bowlinedandy/.local/bin"
