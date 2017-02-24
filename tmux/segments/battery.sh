#!/bin/bash

runSegment() {
  # get battery level
  battery=$(pmset -g batt | egrep "([0-9]+\%).*" -o | cut -f1 -d';')

  # check if on ac or battery power
  if [[ $(pmset -g ps | head -1) =~ "AC Power" ]]; then
    # if on ac
    echo -n " ${battery}"
  else
    # if on battery
    echo -n "  ${battery}"
  fi
}
