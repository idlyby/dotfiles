#!/usr/bin/env bash

if [ "$#" -lt 1 ]; then
    echo "Missing mountpoint"
    exit 1
fi

# shellcheck source=../../../.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

percentage_used=$(df "$1" | awk 'END{ print $(NF-1) }' | sed 's/%//g')

icon_color="${color5}"

if [ "$percentage_used" -ge 90 ]; then
    icon_color="${color1}"
elif [ "$percentage_used" -ge 75 ]; then
    icon_color="${color3}"
fi

echo -n "<span color='${icon_color}'>🖴</span> ${percentage_used}%"
