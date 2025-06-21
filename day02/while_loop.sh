#!/bin/bash

num=0
while [[ $num -le 5 ]]
do
	echo "lol"
	num=$num+1
done

num=0

while [[ `expr $num % 2` == 0 && $num -le 10 ]]
do
	echo $num
	num=$((num+1))
done
