alias rose="/usr/bin/arch -x86_64"
alias ls="ls -G"
alias grep="grep --color"
alias ll="ls -l"
alias la="ls -la"

alias v='nvim'
alias ga='git add .'
alias gcm='git commit -m '
alias gc='git checkout'
alias gpl='git pull'
alias gps='git push'

export PATH=$HOME/.cargo/bin:$PATH
export PATH=/Users/mc/Library/Python/3.8/bin:$PATH
export PATH=/Applications/Julia-1.5.app/Contents/Resources/julia/bin:$PATH


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

