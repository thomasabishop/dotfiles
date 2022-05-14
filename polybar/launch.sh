#!/usr/bin/env bash

killall -q polybar

# Launch Polybar on all connected monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done

