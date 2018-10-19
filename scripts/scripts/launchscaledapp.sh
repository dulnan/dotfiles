#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)
APP=$1

if [ "$FOCUSEDOUTPUT" = "eDP-1" ]
	then
  $APP --force-device-scale-factor=1.5
else
  $APP --force-device-scale-factor=1.2
fi
