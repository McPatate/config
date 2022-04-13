# Aliases

# alias rose="/usr/bin/arch -x86_64"
alias ll="exa -lgb --git --group-directories-first"
alias la="exa -lagb --git --group-directories-first"
alias grep="grep --color"

alias v='nvim'

alias ga='git add'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcm='git commit -m '
alias gcmae='git commit --amend --no-edit'
alias gd='git diff'
alias glg='git log --graph --abbrev-commit'
alias gldog='git log --all --decorate --oneline --graph'
alias gpl='git pull -r'
alias gps='git push'
alias gst='git status'

alias tf='terraform'

# Kitty
# alias ssh='kitty +kitten ssh'
# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Paths

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$(npm config get prefix)/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Mac Path
# export PATH=/Users/mc/Library/Python/3.8/bin:$PATH
# export PATH=/Applications/Julia-1.5.app/Contents/Resources/julia/bin:$PATH
# export PATH=/Users/mc/go/bin:$PATH
# export PATH=${KREW_ROOT:-$HOME/.krew}/bin:$PATH
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Linux Path
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# Base16 Shell

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_helios


# fzf

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Prompt

setopt PROMPT_SUBST

autoload -Uz compinit vcs_info

compinit

# k8s stuff
alias k=kubectl
alias kgc='kubectl get cm '
alias kgp='kubectl get pods '
alias kgs='kubectl get svc '
alias kdp='kubectl describe pod '
alias keit='kubectl exec -it '
alias kl='kubectl logs '
alias klf='kubectl logs -f '
source <(kubectl completion zsh)
complete -F __start_kubectl k

# Completion for Molecule

eval "$(_MOLECULE_COMPLETE=SHELL_source molecule)"

uptime


# Weird scipy dependency
# export LDFLAGS="-L/usr/local/opt/openblas/lib"
# export CPPFLAGS="-I/usr/local/opt/openblas/include"

export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/mc/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mc/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/mc/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mc/google-cloud-sdk/completion.zsh.inc'; fi

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

eval "$(starship init zsh)"

