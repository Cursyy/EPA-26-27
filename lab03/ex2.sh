#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c" >> out.log

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item" >> out.log
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0" >> out.log
else
	echo "You passed in $1 to $0" >> out.log
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine" >> out.log
if [[ $ct -lt $1 ]]; then
	echo "The maximum number of processes NOT exceeded" >> out.log
else
	echo "Maximum number of processes exceeded" >> out.log
fi

echo "LOG DATE ~~~$(date +"%Y-%m-%d_%H-%M-%S")~~~" >> out.log
