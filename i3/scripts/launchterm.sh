#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)

if [ "$FOCUSEDOUTPUT" = "DP-2" ]
	then
  # High DPI
  urxvt -fn "xft:Fira Code Retina:style=Regular:size=10:antialias=true" -fb "xft:Fira Code:style=Medium:size=10:antialias=true" -letsp -1
else
  # Low DPI
  urxvt -fn "xft:Fira Code:style=Regular:size=8:antialias=true" -fb "xft:Fira Code:style=Bold:size=8:antialias=true"
fi
