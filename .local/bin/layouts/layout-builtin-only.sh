#!/usr/bin/env bash
xrandr --output LVDS-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-1 --off --output HDMI-2 --off --output HDMI-3 --off --output VGA-1 --off --output VIRTUAL-1 --off
notify-send "💻 Laptop Display"

if command -v touchpad >/dev/null 2>&1; then
  touchpad --enable
fi

if command -v setbg >/dev/null 2>&1; then
  setbg
fi
