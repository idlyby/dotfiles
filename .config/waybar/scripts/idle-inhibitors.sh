#!/usr/bin/env bash

# set -x

if [[ "$XDG_CURRENT_DESKTOP" == "sway" ]]; then
    TEXT=$(swaymsg -t get_tree | jq '..|try select(.inhibit_idle == true)' | grep -c 'inhibit_idle')
elif [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
    TEXT=$(hyprctl clients -j | jq '..|try select(.inhibitingIdle == true)' | grep -c 'inhibitingIdle')
fi

if [[ $TEXT -eq 0 ]]; then
    ALT="deactivated"
else
    ALT="activated"
fi

msg=$(jq -n --compact-output \
        --arg text "$TEXT" \
        --arg alt "$ALT" \
        '{text: $text, alt: $alt}')

echo "$msg"
