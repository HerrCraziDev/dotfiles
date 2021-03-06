#!/bin/bash

cnormal1='colour31'
cnormal2='white'
cprefix='colour238'

bnormal='colour31'
bprefix='colour208'
normal='●'
prefix='▲'

if [ $1 -eq 1 ]; then
	printf "#[fg=$cprefix,bg=$bprefix] $prefix "
else
	if [ $(($(date +%s) % 2)) -eq 0 ]; then
		printf "#[fg=$cnormal1,bg=$bnormal] $normal "
	else
		printf "#[fg=$cnormal2,bg=$bnormal] $normal "
	fi
fi

#printf "#[fg=white,bg=red] $(date +%N) $@"
printf "#[fg=white]"
