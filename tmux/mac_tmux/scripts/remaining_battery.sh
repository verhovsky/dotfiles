#!/bin/bash

if [ $(uname) == "Linux" ]; then
	cat /sys/class/power_supply/BAT0/capacity
else
	pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'
fi
