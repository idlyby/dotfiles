#!/usr/bin/env bash

# shellcheck source=/home/edward/.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

declare -A colors
colors=(
    ["background-color"]="${color0}"
    ["text-color"]="${color7}"
    ["border-color"]="${color5}"
    ["progress-color"]="over ${foreground}85"
)

for color_name in "${!colors[@]}"; do
    sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" "${XDG_CONFIG_HOME}/mako/config"
done

makoctl reload
