#!/bin/bash

upower -i /org/freedesktop/UPower/devices/battery_BAT1

upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep capacity | { awk '{print $2}' && date && echo ''; } >> ~/Scripts/logs/capacity_history.log
