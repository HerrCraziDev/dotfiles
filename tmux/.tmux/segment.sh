#!/bin/bash

if [ -z "$1" ] ; then
	printf "#[fg=white,bg=red]\ue0b2"
	exit -1
fi
side=$1

if [ -n "$3" ] && [[ $3 =~ ^[0-9]+$ ]] ; then
	# $3 was provided and is a number
	from=$2
	to=$3
	shape=$4
	echo "1"
elif [ -z "$3" ] ; then
	# $3 was null
	to=$2
	echo "2"
else
	# $3 was provided but not a number (assumed shape)
	to=$2
	shape=$3
	echo "3"
fi


if [ -z "$from" ] ; then
	before_start="#[fg=colour$to]"
	before_end="#[bg=colour$to]"
else
	before_start="#[fg=colour$to,bg=colour$from]"
	before_end="#[fg=colour$from,bg=colour$to]"
fi


case $side in
	start)
	case $shape in
		round)
		separator="\ue0b6";;

		sharp | *)
		separator="\ue0b2";;
	esac
	echo -e "$before_start$separator#[fg=white,bg=colour$to]";;

	end)
	case $shape in
		round)
		separator="\ue0b4";;

		sharp | *)
		separator="\ue0b0";;
	esac
	echo -e "$before_end$separator#[fg=white]";;
esac


