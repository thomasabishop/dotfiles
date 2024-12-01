#!/bin/bash
if xrandr | grep "HDMI-1 connected"; then
    xrandr --output HDMI-1 --primary --mode 3440x1440 --output eDP-1 --off
else
    xrandr --output eDP-1 --primary --auto --output HDMI-1 --off
fi

