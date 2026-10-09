#!/bin/bash

num_cpu=$(grep processor /proc/cpuinfo | wc -l)

if [[ $num_cpu -ge $1 ]]; then #checking if num_cpu is greater or equal to user input
        echo "OK"
else
        echo "Error: cpu_num is not enough"
        exit 1
fi
