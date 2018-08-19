#!/bin/bash

# tc <tcneko@outlook.com>
# Create: 2018.02
# Last update:
# Last test environment: Ubuntu 18.04
#
# Basic shell library

if [ -z "$include_lib_basic" ]; then

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
        ping -c1 -W1 www.baidu.com &>/dev/null
        test_cmd_fail_exit 'Please check network'
    }

    include_lib_basic='0'

fi
