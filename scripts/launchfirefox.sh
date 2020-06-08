#!/bin/sh

FOCUSEDOUTPUT=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)

if [ "$FOCUSEDOUTPUT" = "DP-2" ]
	then
  # High DPI
  echo 'user_pref("layout.css.devPixelsPerPx", "1.25");' > /home/dulnan/.mozilla/firefox/1s5qc4kk.default-release/user.js
  env MOZ_USE_XINPUT2=1 /usr/lib/firefox/firefox
else
  # Low DPI
  echo 'user_pref("layout.css.devPixelsPerPx", "2");' > /home/dulnan/.mozilla/firefox/1s5qc4kk.default-release/user.js
  env MOZ_USE_XINPUT2=1 /usr/lib/firefox/firefox
fi
