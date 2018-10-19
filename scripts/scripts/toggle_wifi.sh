#!/bin/bash
wlan=`/sbin/ifconfig wlan0 | grep inet\ addr | wc -l`

if [ $wlan -eq 0 ]; then
  # put it down
  wifi off
else
  # put it up
  wifi on
fi
