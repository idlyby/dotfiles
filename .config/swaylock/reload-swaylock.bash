#!/usr/bin/env bash

killall -e swayidle
killall -e sway-audio-idle-inhibit

# shellcheck source=/home/edward/.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

declare -A colors
colors=(
    ["line-color"]="${color8}"
    ["text-color"]="${color7}"
    ["inside-color"]="${color0}98"
    ["inside-ver-color"]="${color5}"
    ["line-ver-color"]="${color5}"
    ["ring-ver-color"]="${color5}98"
    ["ring-color"]="${color8}"
    ["key-hl-color"]="${color5}"
    ["separator-color"]="${color8}"
    ["layout-text-color"]="${color7}"
    ["line-wrong-color"]="${color1}"
)

for color_name in "${!colors[@]}"; do
    sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" "${XDG_CONFIG_HOME}/swaylock/config"
done

swayidle -w before-sleep 'swaylock -C ~/.config/swaylock/config' & disown
sway-audio-idle-inhibit & disown
