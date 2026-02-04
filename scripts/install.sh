#!/bin/bash

# suppress welcome message
if [ ! -f "$HOME"/.hushlogin ]; then
  touch "$HOME"/.hushlogin
fi

# prepare for vim
#source ./vim.sh

# install with brew
#source ./brew.sh

# install ruby gems
#source ./ruby.sh

# install app store apps with mas
while test $# -gt 0; do
  case "$1" in
  -m | --mas-install)
    echo "Now installing purchased App Store Items"
    source ./mas.sh
    break
    ;;
  *)
    echo "You're missing out App Store Goodies"
    echo "Run"
    echo "./install.sh --mas-install"
    echo "To get them..."
    break
    ;;
  esac
done

# update terminal
source ./term.sh

# install npm packages
source ./npm.sh

# install yarn global packages
source ./yarn.sh

# install python packages
source ./pip.sh

# install fish
source ./fish.sh

# install YDP.app
source ./install-ydp-app.sh
