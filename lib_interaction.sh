#!/bin/bash

# tcneko <tcneko@outlook.com>
# create: 2018.08
# last test environment: Ubuntu 18.04
# description:

if [[ "$flag_lib_interaction" -ne 0 ]]; then

  # export flag_lib_interaction=0 # <-- add this to father script

  echo_info() {
    echo -e "\e[1;32m[Info]\e[0m $@"
  }

  echo_warning() {
    echo >&2 -e "\e[1;33m[Warning]\e[0m $@"
  }

  echo_error() {
    echo >&2 -e "\e[1;31m[Error]\e[0m $@"
  }

  echo_exit() {
    echo_error "$@"
    exit 1
  }

  request_input() {
    echo "$2"
    eval "read -ep '>>> ' $1"
  }

  request_yn() {
    prompt_info=$(echo "$1 (y/n)")
    request_input "$prompt_info" cho_yn
  }
fi
