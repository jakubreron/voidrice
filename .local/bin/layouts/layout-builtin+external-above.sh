#!/usr/bin/env bash
if [[  "$STARTUP_DESKTOP" = "Wayland" ]]; then
  wlr-randr --output LVDS-1 --on --mode 1920x1080 --pos 0,0 --transform normal --output DP-2 --on --mode 1920x1080 --pos 0,1
fi

if [[ "$STARTUP_DESKTOP" = "X11" ]]; then
  xrandr --output DP-2 --mode 1920x1080 --rate 60.00 --above LVDS-1 --primary --output LVDS-1 --mode 1920x1080 --rate 60.00

  if command -v touchpad >/dev/null 2>&1; then
    touchpad --disable
  fi

  if command -v setbg >/dev/null 2>&1; then
    setbg
  fi
fi


notify-send "🖥️ External Display + 💻 Laptop Display"
