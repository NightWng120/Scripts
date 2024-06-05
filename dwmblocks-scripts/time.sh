#!/bin/sh
date | awk '{print $2 " " $3 "(" $1 ")" $4 $5}'

