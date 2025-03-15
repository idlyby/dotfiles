#!/usr/bin/env bash

# notify-send "Restarting waybar"

killall -q waybar
pkill waybar

while pgrep -x waybar >/dev/null; do sleep 0.5; done

waybar -c "${XDG_CONFIG_HOME}/waybar/config-top" | tee -a "/tmp/waybar-top.log" & disown
