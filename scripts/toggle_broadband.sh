#!/bin/bash

if [[ $(nmcli radio wwan) = "enabled" ]]; then
  nmcli radio wwan off
  nmcli con down broadband_swisscom
else
  echo "it's disabled"
  nmcli radio wwan on
  nmcli con up broadband_swisscom
fi
