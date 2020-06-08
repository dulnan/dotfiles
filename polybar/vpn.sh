#!/bin/sh

main() {
  red=$(xgetres color1)
  green=$(xgetres color2)
  connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)

  if [ -n "$connection" ]; then
    echo "%{F$green}%{F-} Connected"
  else 
    echo "%{F$red}%{F-} Disconnected"
  fi
}

main "$@"
