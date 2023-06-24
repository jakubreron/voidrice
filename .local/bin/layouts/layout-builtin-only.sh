#!/usr/bin/env bash

xrandr --output LVDS1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off

if xinput --list | grep -q "TouchPad"; then
  touchpad_id=$(xinput --list | grep "TouchPad" | sed -n "s/.*id=\([0-9]*\).*/\1/p")
  xinput --enable "$touchpad_id"
fi
