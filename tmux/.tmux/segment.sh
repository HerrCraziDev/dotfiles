#!/bin/bash


case $1 in
	start)
	case $4 in
		round)
		separator="\ue0b6";;

		sharp | *)
		separator="\ue0b2";;
	esac
	echo -e "#[fg=colour$3,bg=colour$2]$separator#[fg=white,bg=colour$3]";;

	end)
	case $4 in
		round)
		separator="\ue0b4";;

		sharp | *)
		separator="\ue0b0";;
	esac
	echo -e "#[fg=colour$2,bg=colour$3]$separator#[fg=white]";;
esac


