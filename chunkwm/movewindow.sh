#!/usr/bin/env bash

DIRECTION=$1
FOCUSEDMONITOR=$(chunkc tiling::query --monitor id)

if [ "$FOCUSEDMONITOR" = "1" ]
	then
  if [ "$DIRECTION" = "left" ]
    then
    chunkc tiling::window --send-to-monitor 2
  else
    chunkc tiling::window --send-to-monitor 3
  fi
elif [ "$FOCUSEDMONITOR" = "2" ]
	then
  if [ "$DIRECTION" = "left" ]
    then
    chunkc tiling::window --send-to-monitor 3
  else
    chunkc tiling::window --send-to-monitor 1
  fi
else
  if [ "$DIRECTION" = "left" ]
    then
    chunkc tiling::window --send-to-monitor 1
  else
    chunkc tiling::window --send-to-monitor 2
  fi
fi
