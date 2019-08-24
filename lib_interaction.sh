#!/bin/bash

# tcneko <tcneko@outlook.com>
# create: 2018.08
# last test environment: Ubuntu 18.04
# description:

# to use this library, please add the following line to the main script
# source $(dirname ${BASH_SOURCE[0]})/lib/lib_interaction.sh
# export flag_lib_interaction=0

if [[ -z "$flag_lib_interaction" ]]; then

  echo_info() {
    echo -e "\e[1;32m[Info]\e[0m $@"
  }
  export -f echo_info

  echo_warning() {
    echo >&2 -e "\e[1;33m[Warning]\e[0m $@"
  }
  export -f echo_warning

  echo_error() {
    echo >&2 -e "\e[1;31m[Error]\e[0m $@"
  }
  export -f echo_error

  echo_exit() {
    echo_error "$@"
    exit 1
  }
  export -f echo_exit

  request_input() {
    echo "$2"
    eval "read -ep '>>> ' $1"
  }
  export -f request_input

  request_yn() {
    prompt_info=$(echo "$1 (y/n)")
    request_input "$prompt_info" cho_yn
  }
  export -f request_yn

fi
