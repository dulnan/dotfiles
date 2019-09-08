#!/usr/bin/env bash

DIRECTION=$1

function west {
  yabai -m window --focus west|| yabai -m window --focus "$( (yabai -m query --spaces --display next || yabai -m query --spaces --display first) | jq -re '.[] | select(.visible == 1)."first-window"')" || yabai -m display --focus next || yabai -m display --focus first
}

function east {
  yabai -m window --focus east || yabai -m window --focus "$( (yabai -m query --spaces --display prev || yabai -m query --spaces --display last) | jq -re '.[] | select(.visible == 1)."last-window"')" || yabai -m display --focus prev || yabai -m display --focus last
}

if [ "$DIRECTION" = "west" ]
then
  west
else
  east
fi

