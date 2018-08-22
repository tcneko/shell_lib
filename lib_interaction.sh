#!/bin/bash

# tc <tcneko@outlook.com>
# Create: 2018.08
# Last update:
# Last test environment: Ubuntu 18.04
#
# interaction shell library

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
        echo "$1"
        eval "read -ep '>>> ' $2"
    }

    function request_yn() {
        prompt_info=$(echo "$1 (y/n)")
        request_input "$prompt_info" cho_yn
    }

    include_lib_interaction='0'

fi
