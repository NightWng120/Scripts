#!/bin/bash
xinput set-prop "TPPS/2 IBM TrackPoint" $(xinput list-props "TPPS/2 IBM TrackPoint" | grep 'Accel Speed (' | awk -F"[()]" '{print $2}') 1
xinput --disable $(xinput list | grep Synaptics | awk '{print $5}' | grep -o '[0-9]\+')
