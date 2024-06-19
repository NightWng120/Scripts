#!/bin/bash
if [ "$(ls | grep mp3)" != "" ] ; then
	file=$(ls | grep mp3 | awk 'NR==1{print $0}')
	album=$(exiftool "$file" | grep "Album  "| awk '{$1=$2=""; print $0}' | sed 's/ //1' | sed 's/ //1')
	artist=$(exiftool "$file" | grep "Artist  "| awk '{$1=$2=""; print $0}' | sed 's/ //1' | sed 's/ //1')
	title=$(echo "$artist - $album")
	mkdir "$title"
	mv *.mp3 "$title"
else
	echo "No mp3 files to move"
fi
