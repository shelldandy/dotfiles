#!/bin/bash

source "$HOME/.tmux/segment.sh"

displayStatus() {
  if [[ $1 == "left" ]]; then
    displaySegment "session" "#282828" "#6699cc"
  else
    displaySegment "time" "#ffffff" "#65737e"
    displaySegment "cpu" "#ffffff" "#65737e"
    displaySegment "battery" "#ffffff" "#65737e"
    displaySegment "hostname" "#3c3836" "#6699cc"
  fi

  exit 0
}

displayStatus "$1"
