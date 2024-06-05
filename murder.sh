#!/bin/bash
num=$(($1))
result=$(ps -e | grep "tty${num}" | grep dwm | awk '{print $1}')

# echo $(($num + 1))
echo $num
if [[ "$num" -ge "1" ]] && [[ "$num" -le "6" ]] ; then
	if  [ "${result}" = "" ] ; then
		echo "DWM is not running on that tty";
	else
		kill -9 $result;
		echo "DWM on tty${num} has been killed";
	fi

else
	echo "Invalid Input";
fi
