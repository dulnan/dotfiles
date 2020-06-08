#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)

echo $FOCUSEDOUTPUT

config=base

case "$FOCUSEDOUTPUT" in
  "DP-1")
    config=oled
    ;;

  "DP-2" | "DP-0.2" | "DP-0" | "DP-2.2")
    config=dell
    ;;

  "DP-0.3" | "DP-2.3")
    config=benq
    ;;
esac

alacritty --config-file "/home/dulnan/dotfiles/alacritty/${config}.yml"
