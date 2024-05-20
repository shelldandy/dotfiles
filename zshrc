source_if_exists() {
  for file in "$@"; do
    if [ -f "$file" ]; then
      source "$file"
    fi
  done
}

# Array of file paths
files=(
  "~/.zprezto/init.zsh"
  "~/.env.secret.zsh"
  "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
)

source_if_exists "${files[@]}"

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
alias gp='git push'
alias gP='git pull'
alias gr='git rebase'
alias gd='git diff'
alias gxo='git checkout'
alias gb='git branch'
alias gbd='git branch -d'

# Quick clear
alias c='clear'
alias ll='exa -lah'
alias x='exit'

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
eval "$(fzf --zsh)"

. /usr/local/etc/profile.d/z.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export GPG_TTY=$(tty)

# Starship prompt
eval "$(starship init zsh)"

# allow locally installed npm binaries to be executed;
# added by `npm i -g add-local-binaries-to-path`
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/go/bin:$PATH"
