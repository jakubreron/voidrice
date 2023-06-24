#!/usr/bin/env bash
xrandr --output DP1 --mode 1920x1080 --rate 144.00 --same-as LVDS1 --output LVDS1 --off

if command -v touchpad >/dev/null 2>&1; then
  touchpad --disable
fi
