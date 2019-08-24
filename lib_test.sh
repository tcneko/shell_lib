#!/bin/bash

# tcneko <tcneko@outlook.com>
# create: 2018.08
# last test environment: Ubuntu 18.04
# description:

# to use this library, please add the following line to the main script
# source $(dirname ${BASH_SOURCE[0]})/lib/lib_interaction.sh
# export flag_lib_interaction=0
# source $(dirname ${BASH_SOURCE[0]})/lib/lib_test.sh
# export flag_lib_test=0

if [[ -z "$flag_lib_test" ]]; then

  test_cmd_fail() {
    if [ $? -ne 0 ]; then
      echo_warning "$@"
    fi
  }
  export -f test_cmd_fail

  test_cmd_fail_exit() {
    if [ $? -ne 0 ]; then
      echo_exit "$@"
    fi
  }
  export -f test_cmd_fail_exit

  test_cmd_success() {
    if [ $? -eq 0 ]; then
      echo_warning "$@"
    fi
  }
  export -f test_cmd_success

  test_cmd_success_exit() {
    if [ $? -eq 0 ]; then
      echo_exit "$@"
    fi
  }
  export -f test_cmd_success_exit

  test_root_exit() {
    if [ $(id -u) -ne 0 ]; then
      echo_exit 'Please run as root'
    fi
  }
  export -f test_root_exit

  test_network_exit() {
    ping -c1 -W1 "$1" &>/dev/null
    test_cmd_fail_exit 'Please check network'
  }
  export -f test_network_exit

  test_dir_x() {
    test -d "$1" -a -x "$1"
  }
  export -f test_dir_x

  test_dir_x_exit() {
    test_dir_x "$1"
    test_cmd_fail_exit "$2"
  }
  export -f test_dir_x_exit

  test_dir_w() {
    test -d "$1" -a -w "$1"
  }
  export -f test_dir_w

  test_dir_w_exit() {
    test_dir_x "$1"
    test_cmd_fail_exit "$2"
  }
  export -f test_dir_w_exit

  test_file_r() {
    test -f "$1" -a -r "$1"
  }
  export -f test_file_r

  test_file_r_exit() {
    test_file_r "$1"
    test_cmd_fail_exit "$2"
  }
  export -f test_file_r_exit

  test_file_w() {
    test -f "$1" -a -w "$1"
  }
  export -f test_file_w

  test_file_w_exit() {
    test_file_w "$1"
    test_cmd_fail_exit "$2"
  }
  export -f test_file_w_exit

fi
