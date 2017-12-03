#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)

if [ "$FOCUSEDOUTPUT" = "DP-2" ]
	then
  # High DPI
  urxvt -fn "xft:Input Mono Narrow:style=Regular:size=14:antialias=true" -fb "xft:Input Mono Narrow:style=Medium:size=14:antialias=true" -letsp -2
else
  # Low DPI
  urxvt -fn "xft:Input Mono Narrow:style=Regular:size=12:antialias=true" -fb "xft:Input Mono Narrow:style=Bold:size=12:antialias=true"
fi
