#!/usr/bin/bash

if (( $# < 1 ))
then
	echo 'ERROR：数値を１つ指定してください'
	echo '例：./oddenven.sh 10'
	exit 0
fi

num=$1

if (( num % 2 == 0 ))
then
	echo '偶数です'
else
	echo '奇数です'
fi
