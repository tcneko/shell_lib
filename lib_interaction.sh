#!/bin/bash

# tcneko <tcneko@outlook.com>
# create: 2018.08
# last update: 2018.10
# last test environment: Ubuntu 18.04
# description: 

if [ -z "$include_lib_interaction" ]; then

    function echo_info() {
        echo -e "\e[1;32m[Info]\e[0m $@"
    }

    function echo_warning() {
        echo >&2 -e "\e[1;33m[Warning]\e[0m $@"
    }

    function echo_error() {
        echo >&2 -e "\e[1;31m[Error]\e[0m $@"
    }

    function echo_exit() {
        echo_error "$@"
        exit 1
    }

    function request_input() {
        echo "$2"
        eval "read -ep '>>> ' $1"
    }

    function request_yn() {
        prompt_info=$(echo "$1 (y/n)")
        request_input "$prompt_info" cho_yn
    }

    include_lib_interaction='0'

fi
