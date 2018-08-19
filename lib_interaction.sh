#!/bin/bash

# tc <tcneko@outlook.com>
# Create: 2018.08
# Last update:
# Last test environment: Ubuntu 18.04
#
# interaction shell library

if [ -z "$include_lib_interaction" ]; then

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
