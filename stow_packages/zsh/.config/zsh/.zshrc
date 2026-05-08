
# shellcheck shell=bash

# Profiling if needed for slow startup times
# zmodload zsh/zprof
#source() {
#  local start=$EPOCHREALTIME
#  builtin source "$@"
#  local end=$EPOCHREALTIME
#  printf "%.0fms\t%s\n" "$(( (end - start) * 1000 ))" "$1" >&2
#}

# https://github.com/unixorn/awesome-zsh-plugins#generic-zsh
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/

export EDITOR="nvim"
export XDG_CONFIG_HOME=$HOME/.config

autoload -Uz compinit && compinit
#if [[ -n $ZDOTDIR/.zcompdump(#qN.mh+24) ]]; then
#  compinit -d "$ZDOTDIR/.zcompdump"
#else
#  compinit -C -d "$ZDOTDIR/.zcompdump"
#fi


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

# Defer loading atuin as it was slowing down my shell start times
zsh-defer eval "$(atuin init zsh)" 


# This nvm stuff fucked my zsh start times
# Related artical: https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
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

export PATH="$PATH:/Users/dakota.knutson/bin"

# zprof
