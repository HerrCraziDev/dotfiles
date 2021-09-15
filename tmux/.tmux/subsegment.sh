#!/bin/bash


case $1 in
	start)
	case $3 in
		round)
		separator="\ue0b7";;

		sharp | *)
		separator="\ue0b3";;
	esac;;

	end)
	case $3 in
		round)
		separator="\ue0b5";;

		sharp | *)
		separator="\ue0b1";;
	esac;;
esac

if [ ! -z $2 ]; then echo -ne "#[fg=colour$2]"; fi
echo -ne "$separator"
if [ ! -z $2 ]; then echo -ne "#[fg=white]"; fi
