#!/usr/bin/env zsh

#################################################

export BUILD_THREADS="$(nproc)"
export CARGO_BUILD_JOBS="${BUILD_THREADS}"
export NINJAFLAGS="-j${BUILD_THREADS}"

#################################################

export TERMINAL=kitty
export BROWSER=qutebrowser
export EDITOR=vim
export VISUAL=l3afpad

#################################################

export THEME_FONT_FACE="Iosevka Nerd Font"
export THEME_FONT_SIZE="10"

if uwsm check may-start && uwsm select; then
    exec systemd-cat -t uwsm_start uwsm start default
fi
