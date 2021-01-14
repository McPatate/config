alias rose="/usr/bin/arch -x86_64"
alias ll="exa -lgb --git"
alias la="exa -lagb --git"
alias grep="grep --color"

alias v='nvim'
alias ga='git add .'
alias gcm='git commit -m '
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias glg='git log --graph --abbrev-commit'
alias gldog='git log --all --decorate --oneline --graph'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'

export PATH=$HOME/.cargo/bin:$PATH
export PATH=/Users/mc/Library/Python/3.8/bin:$PATH
export PATH=/Applications/Julia-1.5.app/Contents/Resources/julia/bin:$PATH


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_helios

uptime
