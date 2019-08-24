#!/bin/bash

# tcneko <tcneko@outlook.com>
# create: 2018.08
# last test environment: Ubuntu 18.04
# description:

if [[ "$flag_lib_test" -ne 0 ]]; then

  # export flag_lib_test=0 # <-- add this to father script
  source $(dirname ${BASH_SOURCE[0]})/lib_interaction.sh

  test_cmd_fail() {
    if [ $? -ne 0 ]; then
      echo_warning "$@"
    fi
  }

  test_cmd_fail_exit() {
    if [ $? -ne 0 ]; then
      echo_exit "$@"
    fi
  }

  test_cmd_success() {
    if [ $? -eq 0 ]; then
      echo_warning "$@"
    fi
  }

  test_cmd_success_exit() {
    if [ $? -eq 0 ]; then
      echo_exit "$@"
    fi
  }

  test_root_exit() {
    if [ $(id -u) -ne 0 ]; then
      echo_exit 'Please run as root'
    fi
  }

  test_network_exit() {
    ping -c1 -W1 "$1" &>/dev/null
    test_cmd_fail_exit 'Please check network'
  }

  test_dir_x() {
    test -d "$1" -a -x "$1"
  }

  test_dir_x_exit() {
    test_dir_x "$1"
    test_cmd_fail_exit "$2"
  }
  test_dir_w() {
    test -d "$1" -a -w "$1"
  }

  test_dir_w_exit() {
    test_dir_x "$1"
    test_cmd_fail_exit "$2"
  }

  test_file_r() {
    test -f "$1" -a -r "$1"
  }

  test_file_r_exit() {
    test_file_r "$1"
    test_cmd_fail_exit "$2"
  }

  test_file_w() {
    test -f "$1" -a -w "$1"
  }

  test_file_w_exit() {
    test_file_w "$1"
    test_cmd_fail_exit "$2"
  }

fi
