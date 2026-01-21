#!/usr/bin/bash

#1ドル１５８円とする

if (( $# < 1))
then
	echo 'ERROR：円の金額を指定してください'
	echo '例：./dollar.sh 1000'
	exit 0
fi

dolu=$(( $1 / 158 ))
echo "およそ$doluドルです"
