
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/

# Use vim mode
set -o vi

# Hide Homebrew hints
export HOMEBREW_NO_ENV_HINTS=1

for f in $(ls ~/.config/zsh/*.zsh); do
    source $f
done

export EDITOR="nvim"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# https://superuser.com/questions/1245273/iterm2-version-3-individual-history-per-tab

# Install direvn shell hooks
eval "$(direnv hook zsh)"

if type zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

