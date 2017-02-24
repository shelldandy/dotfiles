#!/bin/bash

checkOnline() {
  # check if online and assign exit code to variable
  nc -z 8.8.8.8 53  >/dev/null 2>&1
  exitCode=$?

  if [ $exitCode -eq 0 ]; then
    isOnline=1
  else
    isOnline=0
  fi
}

checkOnline
