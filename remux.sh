#!/bin/bash
# Source this file to get remux into your path
# then run `remux sebastion` to establish or reattach
# a tmux session called `base` on host `sebastion`

_remux_print () {
  color=$1
  message=$2
  printf "\033[$color""m$message\033[0m"
}

_remux_eval () {
  blue=34
  command=$1
  _remux_print $blue "$command\n"
  eval $command
}

_remux_fail () {
  red=31
  message=$1
  _remux_print $red "$message\n"
}

remux () {
  host=$1
  _remux_eval "ping -o $host &> /dev/null"
  pingable=$?
  if [ $pingable -eq 0 ]
    then
      _remux_eval "ssh -t $host 'tmux at -t base || tmux new -s base'"
    else
      _remux_fail "$host is not available :-("
  fi
}
