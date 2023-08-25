#!/usr/bin/env bash
if [[  "$STARTUP_DESKTOP" = "Wayland" ]]; then
  wlr-randr --output DP-2 --on --mode 1920x1080 --pos 0,0 --transform normal --output LVDS-1 --off
fi

if [[ "$STARTUP_DESKTOP" = "X11" ]]; then
  xrandr --output DP-2 --mode 1920x1080 --rate 60.00 --same-as LVDS-1 --output LVDS-1 --off

  if command -v touchpad >/dev/null 2>&1; then
    touchpad --disable
  fi

  if command -v setbg >/dev/null 2>&1; then
    setbg
  fi
fi

notify-send "🖥️ External Display"
