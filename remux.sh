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
  remote_command="tmux at -t base || tmux new -s base"
  if [ "$2" != "" ]
    then
      remote_command="$2; $remote_command"
  fi
  _remux_eval "ssh -t -o ConnectTimeout=1 $host '$remote_command'"
  successful=$?
  if [ $successful -ne 0 ]
    then
      _remux_fail "$host is not available :-("
  fi
}
