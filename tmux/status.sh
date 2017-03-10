#!/bin/bash

source "$HOME/.tmux/segment.sh"

displayStatus() {
  if [[ $1 == "left" ]]; then
    displaySegment "session" "#d8dee9" "#6699cc"
  else
    displaySegment "cpu" "#d8dee9" "#65737e"
    displaySegment "weather" "#d8dee9" "#65737e"
    displaySegment "time" "#d8dee9" "#65737e"
    displaySegment "battery" "#d8dee9" "#65737e"
    displaySegment "hostname" "#d8dee9" "#6699cc"
  fi

  exit 0
}

displayStatus "$1"
