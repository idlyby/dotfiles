#!/usr/bin/env bash

if [ "$#" -lt 1 ]; then
    echo "Missing hwmon"
    exit 1
fi

# shellcheck source=../../../.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

_hwmon="/sys/class/drm/card0/device/hwmon"
_val=""
_warning=""
_critical=""
_icon=""
_icon_color=""

case $1 in
edge)
    _val=$(($(cat "${_hwmon}"/*/temp1_input) / 1000))
    _tmp=$(($(cat "${_hwmon}"/*/temp1_crit) / 1000))
    _warning=$((_tmp - 35))
    _critical=$((_tmp - 15))
    ;;
junc)
    _val=$(($(cat "${_hwmon}"/*/temp2_input) / 1000))
    _tmp=$(($(cat "${_hwmon}"/*/temp2_crit) / 1000))
    _warning=$((_tmp - 35))
    _critical=$((_tmp - 20))
    ;;
mem)
    _val=$(($(cat "${_hwmon}"/*/temp3_input) / 1000))
    _tmp=$(($(cat "${_hwmon}"/*/temp3_crit) / 1000))
    _warning=$((_tmp - 35))
    _critical=$((_tmp - 20))
    ;;
*)
    echo "Bad argument"
    exit 1
    ;;
esac

if [ "${_val}" -ge "${_critical}" ]; then
    _icon_color="${color1}"
    _icon=""
elif [ "${_val}" -ge "${_warning}" ]; then
    _icon_color="${color3}"
    _icon=""
else
    _icon_color="${color5}"
    _icon=""
fi

echo -n "<span color='${_icon_color}'>${_icon}</span> ${_val}℃"
