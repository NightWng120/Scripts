#!/bin/bash
pactl set-sink-mute 0 toggle && kill -44 $(pidof dwmblocks)
