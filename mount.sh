#!/bin/bash
filesystem=$1
device=$2
echo $filesystem
echo $device
sudo mount -t $filesystem -o umask=0002,gid=1000,uid=1000 $device /media/nightwng120;
