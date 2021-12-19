#!/bin/sh

if ! hash playerctl 2>/dev/null; then
	return 1
fi

playing=$(playerctl -a metadata --format='{{status}}:{{artist}} - {{title}}' | grep 'Playing' | sed -e "s/^Playing://")
#echo $playing

if [ -n "$playing" ]; then
	echo $playing | sed -E 's/(.{30})(.{1,})$/\1.../'
	return 0
else
	return 1
fi
