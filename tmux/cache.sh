#!/bin/bash

checkCache() {
  # file where values are cached
  local fileName="$1"
  # maximum amount of seconds to cache values
  local maxAge="$2"

  # create cache if it doesn't yet exist
  if [ ! -f $fileName ]; then
    touch $fileName
    local emptyCache=1
  fi

  # check how old cache file is
  local lastmod=$(( $(date +%s) - $(stat -f%c $fileName) ))

  # invalidate cache if age exceeds the max age or is still empty
  if [ $lastmod -gt $maxAge ] || [ $emptyCache -eq 1 ]; then
    cacheInvalidated=1
  else
    cacheInvalidated=0
  fi
}
