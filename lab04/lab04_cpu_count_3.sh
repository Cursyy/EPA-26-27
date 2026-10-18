#!/bin/bash

num_cpu=$(nproc --all)

function user_help {
        echo "Usage: lab04_cpu_count_3.sh [MAX_NUM_CORES]"
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then #showing help if the user asked for it
        user_help
        exit 0
fi

if [ "$#" -gt 1 ]; then #checking is the user passed no more then 1 parameter 
	user_help
	exit 1
fi

num_required=$1

while ! [[ "$num_required" =~ ^[0-9]+$ ]]; do #keep asking until a whole number is given
        if [ -n "$num_required" ]; then
                echo "Error: '$num_required' is not a whole number"
        fi
	read -r -p "Enter the minimum number of CPU cores required: " num_required || exit 1
done

if [[ $num_cpu -ge $num_required ]]; then #checking if num_cpu is greater or equal to user input
        printf "OK: this VM has %d cores and %d are required\n" "$num_cpu" "$num_required"
else
        printf "Error: cpu_num is not enough (%d found, %d required)\n" "$num_cpu" "$num_required"
	exit 1
fi

echo
echo "Commands used to improve this script:"
echo "read   - reads a line typed by the user into a variable. It is in while loop so the script ask again for a valid number instead of exiting when the input is wrong."
echo "printf - prints formatted text. It lets the result show the number of cores found and the number required in one clear message."
