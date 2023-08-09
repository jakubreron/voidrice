#!/usr/bin/env bash
xrandr --output DP-1 --mode 1920x1080 --rate 144.00 --above LVDS-1 --primary --output LVDS-1 --mode 1920x1080 --rate 60.00
notify-send "🖥️ External Display + 💻 Laptop Display"

if command -v touchpad >/dev/null 2>&1; then
  touchpad --disable
fi

if command -v setbg >/dev/null 2>&1; then
  setbg
fi
