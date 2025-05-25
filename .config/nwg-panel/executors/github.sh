#!/usr/bin/env bash

# Based on the 'Github notifications' example from Waybar's Wiki
# Depends on jq Command-line JSON processor
# Obtain a notifications token at https://github.com/settings/tokens
# save it to a file as below.

token=`cat ${HOME}/.config/github/notifications.token`
count=`curl -u idlyby:${token} https://api.github.com/notifications -s | jq '. | length'`

if [[ "$count" != "0" ]]; then
    echo "$XDG_CONFIG_HOME"/nwg-panel/icons_light/github.svg
    echo $count
fi
