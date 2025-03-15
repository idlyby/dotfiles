#!/usr/bin/env bash

# shellcheck source=/home/edward/.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

declare -A colors
colors=(
    ["background"]="${color0//#/}dd"
    ["text"]="${color7//#/}ff"
    ["match"]="${color4//#/}ff"
    ["selection"]="${color2//#/}dd"
    ["selection-match"]="${color5//#/}ff"
    ["selection-text"]="${color8//#/}ff"
    ["border"]="${color2//#/}ff"
)

for color_name in "${!colors[@]}"; do
    sed -i "0,/^$color_name=.*/{s//$color_name=${colors[$color_name]}/}" "${XDG_CONFIG_HOME}/fuzzel/fuzzel.ini"
done
