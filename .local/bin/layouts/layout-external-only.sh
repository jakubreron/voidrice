#!/usr/bin/env bash
xrandr --output DP-1 --mode 1920x1080 --rate 60.00 --same-as LVDS-1 --output LVDS-1 --off

if command -v touchpad >/dev/null 2>&1; then
  touchpad --disable
fi

if command -v setbg >/dev/null 2>&1; then
  setbg
fi
