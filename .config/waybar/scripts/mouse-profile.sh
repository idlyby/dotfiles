#!/usr/bin/env bash

# set -x

# shellcheck source=../../../.cache/wal/colors.sh
[ -f "${XDG_CACHE_HOME}/wal/colors.sh" ] && . "${XDG_CACHE_HOME}/wal/colors.sh"

_id=$(ratbagctl list | cut -d":" -f1)
_profile=$(ratbagctl "${_id}" profile active get)
_dpi=$(ratbagctl "${_id}" dpi get)

echo "Profile ${_profile}: ${_dpi} 󰍽"
