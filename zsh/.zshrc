# Aliases

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


# Path

export PATH=$HOME/.cargo/bin:$PATH
export PATH=/Users/mc/Library/Python/3.8/bin:$PATH
export PATH=/Applications/Julia-1.5.app/Contents/Resources/julia/bin:$PATH


# Base16 Shell

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_helios


# fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Prompt

setopt PROMPT_SUBST

autoload -Uz compinit vcs_info

compinit

zstyle ':vcs_info:*' actionformats \
    ' %F{5}(%F{2}%b%F{3}|%F{1}%a%F{5})%f'
zstyle ':vcs_info:*' formats       \
    ' %F{5}(%F{2}%b%F{5})%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

function last_cmd_status() {
	local last_status=$?
	if [[ "$last_status" != "0" ]]; then
		last_status=" | %F{9}%?%f"
	else
		last_status=""
	fi

	echo "$last_status"
}

export PS1='[%n %~$(vcs_info_wrapper)$(last_cmd_status)] '
export RPROMPT='%F{8}%T %D%f'

# Completion for kitty

kitty + complete setup zsh | source /dev/stdin


uptime
