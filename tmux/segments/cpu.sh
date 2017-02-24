#!/bin/bash

runSegment() {
  cpu=$(ps -A -o %cpu | awk '{s+=int($1)} END {printf "%03d\n", s}')
  echo -n "  ${cpu}%"
}
