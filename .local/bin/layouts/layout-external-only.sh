#!/usr/bin/env bash
if [[  "$STARTUP_DESKTOP" = "Wayland" ]]; then
  sed --in-place --follow-symlinks "s/size: 11.5/size: 10/" ~/.config/alacritty/alacritty.yml 
  sed --in-place --follow-symlinks "s/builtin/external/" ~/.config/hypr/monitor.conf
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
