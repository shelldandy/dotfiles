#!/bin/bash

displaySegment() {
  local segmentName="$1"
  local foreground="$2"
  local background="$3"

  source "$HOME/.tmux/segments/${segmentName}.sh"

  local result=$(runSegment)
  local output="#[fg=${foreground}, bg=${background}] ${result} "

  local exitCode="$?"
  unset -f runSegment

  # show error when exit code != 0
  if [ "$exitCode" -ne 0 ]; then
    echo "Segment '${segmentName}' exited with code ${exitCode}. Aborting."
    exit 1
  fi

  # hide output if the result is empty
  if [[ -z "${result// }" ]]; then
    echo -n ""
  else
    echo -ne "${output}"
  fi
}
