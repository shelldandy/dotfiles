#!/bin/bash

source "$HOME/.tmux/online.sh"
source "$HOME/.tmux/cache.sh"

getTemperature() {
  temperature=$(
    # get weather report
    curl -s wttr.in/Puebla |
    # grep first mention of temperature
    grep -m 1 '°C' |
    # remove terminal escape sequences
    sed -E 's///g;s/\[[[:digit:]]+((;[[:digit:]]+){1,})?m//g' |
    # get everything from first digit on
    grep -Eo -e '-?[[:digit:]].*'
  )

  # check if temperature is a range
  if [[ $temperature == *–* ]]; then

    # use regex to extract temperature values
    local range='(-?[[:digit:]])+.*–.*(-?[[:digit:]]+)'
    [[ $temperature =~ $range ]]
    local lower=${BASH_REMATCH[1]}
    local upper=${BASH_REMATCH[2]}

    # calculate average (truncates to integers)
    temperature="$(( (lower + upper) / 2 )) °C"
  fi

  # truncate all leftover whitespace
  temperature=$(echo ${temperature} | tr -d '[:space:]')
}

runSegment() {
  local cacheFile="$HOME/.current-temperature"

  if [ $isOnline -eq 1 ]; then
    checkCache $cacheFile 300

    if [ $cacheInvalidated -eq 1 ]; then
      getTemperature
      echo ${temperature} > $cacheFile
    else
      local temperature=$(cat $cacheFile)
    fi

    echo -n "  ${temperature}"
  else
    # return empty value if there's no connection
    echo ""
  fi
}
