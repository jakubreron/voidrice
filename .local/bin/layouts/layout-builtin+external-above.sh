#!/usr/bin/env bash
xrandr --output DP1 --mode 1920x1080 --rate 144.00 --above LVDS1 --primary --output LVDS1 --mode 1920x1080 --rate 60.00

if xinput --list | grep -q "TouchPad"; then
  touchpad_id=$(xinput --list | grep "TouchPad" | sed -n "s/.*id=\([0-9]*\).*/\1/p")
  xinput --disable "$touchpad_id"
fi
