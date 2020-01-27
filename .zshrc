autoload -U colors && colors
autoload -Uz compinit && compinit -i

path=("$HOME/python/bin" $path)
PS1="%{$fg_bold[cyan]%}%#%{$reset_color%} "
precmd () {print -Pn "\e]0;$USER:$PWD\a"}

export HISTFILE=~/.zhistory
export SAVEHIST=1000
export HISTSIZE=1000
setopt -hg

set -o vi

export GOROOT='/usr/local/go'
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"

export TERM='xterm'

export MANWIDTH='78'
export MANOPT='--nj'

export GIT_PAGER='less -FRX'
export PAGER='less'
export LESS='-i'
export EDITOR='vi'

alias ls='ls -F'
alias sl='ls'
alias ls-l='ls -l'
alias sl-l='ls -l'
alias ll='ls -lh'

alias vi='vim'
alias perldoc='perldoc -t'
alias bc='bc -lq'
alias tmux='tmux -2 attach || tmux -2'
alias cal='cal -m'
alias grep='egrep'
alias more='less'
alias cx='chmod +x'

alias journalctl='sudo journalctl'
alias systemctl='sudo systemctl'

mergemaster() {
    (set -x; git co master && git pull && git co - && git merge master)
}
