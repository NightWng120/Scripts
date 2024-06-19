#!/bin/sh

if [ "$(xset q | grep Caps | awk '{print $4}')" = 'on' ] ; then
	printf "\n"
else
	printf "\n"
fi
