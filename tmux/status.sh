#!/bin/bash

source "$HOME/.tmux/segment.sh"

displayStatus() {
  if [[ $1 == "left" ]]; then
    displaySegment "session" "#282828" "#a89984"
  else
    displaySegment "time" "#a89984" "#504945"
    displaySegment "cpu" "#a89984" "#504945"
    displaySegment "battery" "#a89984" "#504945"
    displaySegment "hostname" "#3c3836" "#a89984"
  fi

  exit 0
}

displayStatus "$1"
