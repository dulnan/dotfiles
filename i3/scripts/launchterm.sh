#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)

echo $FOCUSEDOUTPUT

if [ "$FOCUSEDOUTPUT" = "eDP-1" ]
	then
  # High DPI
  urxvt -fn "xft:Iosevka Term:style=Regular:size=11:antialias=true" -fb "xft:Iosevka Term:style=Medium:size=11:antialias=true" -letsp 0
else
  # Low DPI
  urxvt -fn "xft:Iosevka Term:style=Regular:size=9:antialias=true" -fb "xft:Iosevka Term:style=Medium:size=9:antialias=true" -letsp 0
fi
