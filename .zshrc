zstyle ':completion:*' completer _complete _ignored
zstyle ":completion:*:commands" rehash 1
zstyle :compinstall filename '~/.zshrc'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' (%b)'
bindkey -e

autoload -Uz compinit add-zsh-hook vcs_info
compinit
setopt prompt_subst
add-zsh-hook precmd vcs_info
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

PATH="$HOME/.local/bin:$PATH"

PROMPT='%F{green}%n%f@%m %F{green}%~%f${vcs_info_msg_0_}> '
RPROMPT="%*"

alias ls='ls --color'
alias l='ls -lah'
alias ff='fastfetch'
alias nv='nvim'

if [[ $TERM != "linux" ]]; then
	ff
fi
