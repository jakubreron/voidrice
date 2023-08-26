#!/usr/bin/env bash
if [[  "$STARTUP_DESKTOP" = "Wayland" ]]; then
  if [[ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]]; then
    sed --in-place --follow-symlinks "s/size: 10/size: 11.5/" ~/.config/alacritty/alacritty.yml 
    hyprctl reload
  fi

  wlr-randr --output LVDS-1 --on --mode 1920x1080 --pos 0,0 --transform normal --output DP-2 --off
fi

if [[ "$STARTUP_DESKTOP" = "X11" ]]; then
  xrandr --output LVDS-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-1 --off --output HDMI-2 --off --output HDMI-3 --off --output VGA-1 --off --output VIRTUAL-1 --off

  if command -v touchpad >/dev/null 2>&1; then
    touchpad --enable
  fi

  if command -v setbg >/dev/null 2>&1; then
    setbg
  fi
fi

notify-send "💻 Laptop Display"
