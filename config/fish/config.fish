# Exports
set -x EDITOR nvim
set -x HOMEBREW_CASK_OPTS '--appdir=/Applications'
set -x TERM xterm-256color
set -x GPG_TTY (tty)

set -x LANGUAGE en_US.UTF8
set -x LANG en_US.UTF8
set -x LC_CTYPE en_US.UTF8
set -x LC_TYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x NNN_USE_EDITOR 1
set -x COMPOSE_HTTP_TIMEOUT 180 # Docker lol

set PYTHON /usr/local/Cellar/python
test -d $PYTHON; and set PATH $PYTHON $PATH

test -d $HOME/.bin; and set PATH $HOME/.bin $PATH

# Making syntax highlight work with Fish
set hilite (which src-hilite-lesspipe.sh)
set -x LESSOPEN "| $hilite %s"
set -x LESS " -R -X -F "

set -g fish_user_paths /usr/local/opt/ruby/bin $fish_user_paths
set -g fish_user_paths /usr/local/opt/ruby/bin $fish_user_paths
set -g fish_user_paths /usr/local/sbin $fish_user_paths

starship init fish | source

# allow locally installed npm binaries to be executed;
# added by `npm i -g add-local-binaries-to-path`
set -gx PATH $PATH ./node_modules/.bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/shelldandy/.lmstudio/bin
# End of LM Studio CLI section

