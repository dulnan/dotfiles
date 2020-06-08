#!/usr/bin/env bash

dpi=192

# For applications supporting XSettings, `Xft/DPI' sets font scaling
# (and sometimes interface scaling), `Gdk/WindowScalingFactor' sets
# interface scaling with GTK 3, and `Gdk/UnscaledDPI' undo font scaling
# for GTK 3 applications.
> ~/.xsettingsd cat <<EOF
Xft/DPI $(( $dpi*1024 ))
Gdk/WindowScalingFactor $(( $dpi/96 ))
Gdk/UnscaledDPI $(( $dpi*1024/($dpi/96) ))
EOF
pkill -HUP xsettingsd || xsettingsd &

# For QT applications.
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# For miscellaneous applications.
echo Xft.dpi: $dpi | xrdb -merge
