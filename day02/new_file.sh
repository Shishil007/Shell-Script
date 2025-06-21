#!/bin/bash

#This is function definition

function check(){
read -p "Enter the number: " number
if [[ $1 -eq 2 ]];
then
	echo "The number is 2"
elif [[ $1 -ge 2 ]];
then
	echo "The number $1 is greater than 2"
else
	echo "The number $1 is less than 2"
fi
}

#This is function calling
check "3"

