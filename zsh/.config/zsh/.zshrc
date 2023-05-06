
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/

for f in $(ls ~/.config/zsh/*.zsh); do
    source $f
done

path+=('/Users/dakotaknutson/Library/Python/3.9/bin')

export PATH


# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

