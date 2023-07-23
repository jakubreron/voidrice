#!/usr/bin/env bash
xrandr --output LVDS1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off

if command -v touchpad >/dev/null 2>&1; then
  touchpad --enable
fi

if command -v setbg >/dev/null 2>&1; then
  setbg
fi