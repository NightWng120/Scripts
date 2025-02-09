#!/bin/bash
xinput set-prop "TPPS/2 IBM TrackPoint" $(xinput list-props "TPPS/2 IBM TrackPoint" | grep 'Accel Speed (' | awk -F"[()]" '{print $2}') 1
