#!/bin/bash

num_cpu=$(grep processor /proc/cpuinfo | wc -l)

if [ "$#" -ne 1 ]; then
        echo "Usage: lab04_cpu_count_1.sh [MAX_NUM_CORES]"
        exit 1
elif ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Error: MAX_NUM_CORES must be a positive whole number"
        exit 1
elif [[ $num_cpu -ge $1 ]]; then
        echo "OK"
else
        echo "Error: cpu_num is not enough"
        exit 1
fi
