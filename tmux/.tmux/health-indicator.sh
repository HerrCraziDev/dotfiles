#!/bin/bash

cnormal='colour255'
cprefix='colour238'

bnormal='colour24'
bprefix='colour172'
normal='●'
prefix='▲'

if [ $1 -eq 1 ]; then
	fore=$cnormal
	back=$bnormal
	sym=$normal
	text="#S"
else
	fore=$cprefix
	back=$bprefix
	sym=$prefix
	text="#[bold]⌥#[unbold]"
fi

if [ $(($(date +%s) % 2)) -eq 0 ]; then
	printf "#[fg=$back,bg=$back] $sym #[fg=$fore]$text "
else
	printf "#[fg=$fore,bg=$back] $sym #[fg=$fore]$text "
fi


#printf "#[fg=white,bg=red] $(date +%N) $@"
printf "#[fg=white]"
