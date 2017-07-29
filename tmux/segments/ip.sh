#!/bin/bash

source "$HOME/.tmux/helpers/online.sh"
source "$HOME/.tmux/helpers/cache.sh"

runSegment() {
  local cacheFile="$HOME/.current-ip"

  if [ $isOnline -eq 1 ]; then
    checkCache $cacheFile 300

    if [ $cacheInvalidated -eq 1 ]; then
      local ip=$(curl icanhazip.com)
      echo ${ip} > $cacheFile
    else
      local ip=$(cat $cacheFile)
    fi

    echo -n "  ${ip}"
  else
    # return empty value if there's no connection
    echo ""
  fi
}
