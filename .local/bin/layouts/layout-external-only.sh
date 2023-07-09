#!/usr/bin/env bash
xrandr --output DP1 --mode 1920x1080 --rate 60.00 --same-as LVDS1 --output LVDS1 --off

if command -v touchpad >/dev/null 2>&1; then
  touchpad --disable
fi

if command -v setbg >/dev/null 2>&1; then
  setbg
fi
