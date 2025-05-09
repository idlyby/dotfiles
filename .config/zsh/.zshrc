#!/usr/bin/env zsh

export ZSH=/usr/share/oh-my-zsh/

export PATH=${HOME}/.local/bin:${PATH}
export PATH=${PATH}${PATH:+:}${XDG_DATA_HOME}/cargo/bin

export HISTFILE="${XDG_STATE_HOME}"/zsh/history
if  [[ ! -f "${HISTFILE}" ]]; then
    mkdir -p "${XDG_STATE_HOME}"/zsh
    touch "${HISTFILE}"
fi

export ZSH_THEME="wuffers"

plugins=(archlinux emoji git rust safe-paste)

export LANG=en_US.UTF-8

export ZSH_CACHE_DIR="${XDG_CACHE_HOME}"/oh-my-zsh
if [ ! -d "${ZSH_CACHE_DIR}" ]; then
    mkdir "${ZSH_CACHE_DIR}"
fi

source "${ZSH}/oh-my-zsh.sh"

for custom_file in "${XDG_CONFIG_HOME}"/zsh/custom/*.zsh; do
    source $custom_file
done
