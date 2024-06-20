#!/bin/bash

upower -i /org/freedesktop/UPower/devices/battery_BAT0

upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep capacity | { awk '{print $2}' && date && echo ''; } >> ~/Scripts/logs/capacity_history.log
