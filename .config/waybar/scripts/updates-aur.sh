#!/usr/bin/env bash

# shellcheck source=../../../.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

if ! updates_arch=$(checkupdates 2>/dev/null | wc -l); then
    updates_arch=0
fi

if ! updates_aur=$(paru -Qum 2>/dev/null | wc -l); then
    updates_aur=0
fi

icon_color="${color2}"

updates=$((updates_arch + updates_aur))

if [ "$updates" -ge 1 ]; then
    icon_color="$color1"
fi

echo -n "<span color='${icon_color}'>󰮯</span> ${updates}"
