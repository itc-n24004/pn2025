#!/usr/bin/bash

if (( $# < 1 ))
then
	echo 'ERROR：数値を1つ指定してください'
	echo '例：./nnnumber.sh 2'
	exit 0
fi

if (( $1 <= 0 ))
then
	echo ' '
	exit 0
fi

num=0

while (( num < $1 ))
do
	echo "$1"
	num=$(( num + 1 ))
done
