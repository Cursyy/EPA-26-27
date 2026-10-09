#!/bin/bash

num_cpu=$(nproc --all)

function user_help {
        echo "Usage: lab04_cpu_count_2.sh [MAX_NUM_CORES]"
}

if [ "$#" -ne 1 ]; then #checking the user passed exactly one parameter
        user_help
        exit 1
elif ! [[ "$1" =~ ^[0-9]+$ ]]; then #checking the parameter is a whole number
        echo "Error: MAX_NUM_CORES must be a positive whole number"
        user_help
        exit 1
elif [[ $num_cpu -ge $1 ]]; then #checking num_cpu is greater or equal to user input
        echo "OK"
else
        echo "Error: cpu_num is not enough"
        exit 1
fi
