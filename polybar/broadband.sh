#!/bin/sh

icon_color=$(xgetres color8)

is_connected=false
provider=''
tech=''
strength=''

while read -r line ; do
  firstchar=$(echo $line | cut -c1-1)

  if [ "$firstchar" == "|" ]; then
    l=$(echo $line | cut -c3-)
    id=${l%%:*}
    val=${l#*:}
    val=$(echo ${val//\'} | cut -c1-)
    if [ "$id" == "state" ]; then
      if [ "$val" == "connected" ]; then
        is_connected=true
      fi
    fi
    if [ "$id" == "operator name" ]; then
      provider=$val
    fi
    if [ "$id" == "access tech" ]; then
      tech=$val
    fi

    if [ "$id" == "signal quality" ]; then
      strength=${val%% *}
    fi
  fi
done <<< "$(mmcli -m 0)"

icon_tech=鈴

case "$tech" in
"lte")
  icon_tech=ﰒ
  ;;
"hspa" | "hsupa" | "hsdpa" | "umts")
  icon_tech=ﰑ
  ;;
"edge" | "gprs")
  icon_tech=ﰐ
  ;;
esac


if [ $is_connected = true ]; then
  text=" $provider"
  icon_color=$(xgetres color2)
fi

icon="%{F$icon_color}$icon_tech%{F-}"

echo "$icon$text"
