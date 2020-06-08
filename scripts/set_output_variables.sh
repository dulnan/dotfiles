#!/bin/bash
monitors=`xrandr --prop | grep -1 EDID`

echo $monitors
