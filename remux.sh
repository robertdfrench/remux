#!/bin/bash
# Source this file to get remux into your path
# then run `remux sebastion` to establish or reattach
# a tmux session called `base` on host `sebastion`

remux () {
  host=$1
  printf "\033[34m==> ping $hose \033[0m\n"
  ping -o $host &> /dev/null
  pingable=$?
  if [ $pingable -eq 0 ]
    then
      printf "\033[34m==> ssh $host 'tmux'\033[0m\n"
      ssh -t wooster 'tmux at -t base || tmux new -s base'
    else
      printf "\033[31mNot Available :-(\033[0m\n"
  fi
}
