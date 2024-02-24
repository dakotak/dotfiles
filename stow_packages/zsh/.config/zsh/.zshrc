
# shellcheck shell=bash

# https://github.com/unixorn/awesome-zsh-plugins#generic-zsh

# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/

# Use vim mode
set -o vi

case $(uname) in
    Darwin)
        # Hide Homebrew hints
        export HOMEBREW_NO_ENV_HINTS=1
        ANTIDOTE_ZSH="$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
        ;;
    Linux)
        ANTIDOTE_ZSH=/usr/share/zsh-antidote/antidote.zsh
        ;;
esac


for f in "$HOME"/.config/zsh/*.zsh; do
    # shellcheck disable=SC1090
    source "$f"
done


# Load antidote, a zsh plugin manager
# https://getantidote.github.io/
# Check if antidote is installed
if [ -f "$ANTIDOTE_ZSH" ]; then
    # shellcheck disable=SC1091
    source "$ANTIDOTE_ZSH"
    # Change the default zsh antidote plugin file name
    zstyle ':antidote:bundle' file "${ZDOTDIR:-$HOME}/.zsh_plugins"
    # Plugins: https://github.com/unixorn/awesome-zsh-plugins#plugins
    antidote load
fi


# Load antigen, a zsh plugin manager
# source $HOMEBREW_PREFIX/share/antigen/antigen.zsh
# # Load the oh-my-zsh's library
# antigen use oh-my-zsh
# antigen bundle <<EOBUNDLES
#     # Bundles from the default repo (robbyrussell's oh-my-zsh)
#     # git

#     # Syntax highlighting bundle.
#     # zsh-users/zsh-syntax-highlighting
#     zdharma-continuum/fast-syntax-highlighting

#     # Fish-like auto suggestions
#     zsh-users/zsh-autosuggestions

#     # Extra zsh completions
#     # zsh-users/zsh-completions
# EOBUNDLES
# # Tell antigen that you're done
# antigen apply


# Alturnative plugin loaders
# - https://github.com/marlonrichert/zsh-snap
# - https://github.com/zsh-users/antigen
#   - https://github.com/zsh-users/antigen/wiki/Cookbook#init-command


export EDITOR="nvim"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# https://superuser.com/questions/1245273/iterm2-version-3-individual-history-per-tab

# Install direvn shell hooks
if type direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi

# Initialize zoxide (z)
if type zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi
