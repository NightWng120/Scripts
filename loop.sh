#!/bin/bash

# Notes
# Possible steps 
# 1. Check to see if there are songs in a specified songs file
# 2. Check if there are .mp3 files already in the directory and if so,
# 	put them in their own directory
# 3. Take the first line of the songs file copy it, and delete it from the file
# 4. Start spotdl with the song link
# 5. Run the check loop every ten seconds or something if I can
# 	and if spotdl isn't running, call the initial function again
# 6. Repeat this process until the song file is empty

function check(){
	if [ "$(ls | grep .mp3)" != "" ] ; then
		./newDir
	fi
	if [ "$(cat songs)" != "" ] ; then
		return 0
	else
		return 1
	fi
}

while [ true ]
do
	if [ "$(ps -e | grep spotdl)" = "" ] ; then
		if check; then
			line=$(head -n 1 songs)
			echo $line
			sed -i -e "1d" songs
			echo "deleted first line of songs file"
			spotdl $line
		else
			echo "Songs file empty"
			break
		fi
	fi

done
