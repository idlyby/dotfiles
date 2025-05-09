#!/usr/bin/env bash

# shellcheck source=../../../.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

_icon="󰺵"
_icon_color="${color5}"
_percent=$(cat /sys/class/drm/card0/device/gpu_busy_percent)

if [ "$_percent" -ge 85 ]; then
    _icon_color="${color1}"
elif [ "$_percent" -ge 65 ]; then
    _icon_color="${color3}"
fi

echo -n "<span color='${_icon_color}'>${_icon}</span> ${_percent}%"
