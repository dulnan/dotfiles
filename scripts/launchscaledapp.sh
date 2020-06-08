#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)
APP=$1

shift

if [ "$FOCUSEDOUTPUT" = "DP-1" ]
	then
  $APP --force-device-scale-factor=2 "$@"
else
  $APP --force-device-scale-factor=1.25 "$@"
fi
