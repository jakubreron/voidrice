#!/usr/bin/env bash
xrandr --output DP1 --mode 1920x1080 --rate 144.00 --above LVDS1 --primary --output LVDS1 --mode 1920x1080 --rate 60.00

if command -v disable-touchpad >/dev/null 2>&1; then
  disable-touchpad
fi
