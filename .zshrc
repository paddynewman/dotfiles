autoload -Uz compinit
compinit
PS1="%# "
set -o vi
export EDITOR=vi
export LC_ALL=UTF-8
alias ls='ls -F'
alias ll='ls -lh'
alias la='ll -a'
alias tmux='tmux attach || tmux '