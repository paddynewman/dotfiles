autoload -U colors && colors
autoload -Uz compinit && compinit -i

typeset -U path
path=("$HOME/python/bin" ~/bin $path)

PS1="%{$fg_bold[yellow]%}%#%{$reset_color%} "
precmd () {print -Pn "\e]0;$HOST:$PWD\a"}

bindkey '^R' history-incremental-search-backward

export HISTFILE=~/.zhistory
export SAVEHIST=1000
export HISTSIZE=1000
setopt -hg

set -o vi

export TERM='xterm'
export MANWIDTH='78'
export MANOPT='--nj'

export GOPATH="$HOME/go"
export GIT_PAGER='less -FRX'
export PAGER='less'
export LESS='-i'
export EDITOR='vi'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias lld='ll -d'

alias sl='ls'
alias ls-l='ls -l'
alias sl-l='ls -l'

alias vi='vim'
alias perldoc='perldoc -t'
alias bc='bc -lq'
alias tmux='tmux -2 attach || tmux -2'
alias cx='chmod +x'
alias p='python3'

alias journalctl='sudo journalctl'
alias systemctl='sudo systemctl'

mergemaster() {
    (set -x; git co master && git pull && git co - && git merge master)
}

if [ -f ~/.workrc ]; then
    . ~/.workrc
fi
