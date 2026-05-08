# shellcheck shell=bash

# Enable and improve the zsh vi mode

# Enable vi mode
# `set -o vi` is a higher level operation that will call `setop vi` but also does some other things
set -o vi

# Make switching between modes quicker
export KEYTIMEOUT=1 

export EDITOR='nvim'

autoload edit-command-line
zle -N edit-command-line
# Open the current cmd line in vim
# When in vi cmd mode `v` will run the `edit-command-line` function
bindkey -M vicmd v edit-command-line


# Enable different curosr to indicate vi mode
export VI_MODE_SET_CURSOR=true
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]]; then
        echo -ne '\e[2 q' # block
    else
        echo -ne '\e[6 q' # beam
    fi
}
zle -N zle-keymap-select

# Go back to insert mode for each new prompt
function zle-line-init {
    zle -K viins
    echo -ne '\e[6 q'
}
zle -N zle-line-init
