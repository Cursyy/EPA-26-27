#!/bin/bash

# this is a comment

if [[ ! "$1" =~ ^[0-9]+$ ]]; then
        echo "Usage: $0 MAX_PROCESSES (whole number)"
        exit 1
fi

read -r  -p "Input 1 for terminal display or 0 to store log in file: " choice
echo 

while [[ ! "$choice" =~ ^[01]$ ]]; do

	echo "Wrong input, try again :("
	read -r -p "Input 1 for terminal display or 0 to store log in file: " choice
done

choice_check(){
	if [[ $1 -eq 1 ]]; then
		echo "$2"
	else
		echo "$2" >> out.log
	fi
	}


# for loop to count to 10
for c in {1..5}; do
	choice_check $choice  "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		choice_check $choice "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	choice_check $choice "You didn't pass any paraemters to $0"
else
	choice_check $choice "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
choice_check $choice "There are $ct processes running on this machine"
if [[ $1 -ge $ct ]]; then
	choice_check $choice "The maximum number of processes NOT exceeded"
else
	choice_check $choice "Maximum number of processes exceeded"
fi

choice_check $choice "LOG DATE ~~~$(date +"%Y-%m-%d_%H-%M-%S")~~~"
