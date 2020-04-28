PROMPT_COMMAND='echo -ne "\033]2$HOSTNAME:$PWD\007"'
PS1='\[\033[1;33m\]\$\[\033[0m\] '

set -o vi
shopt -s histappend

export TERM='xterm'
export HISTCONTROL='ignoreboth'
export HISTSIZE='10000'

export MANWIDTH='78'
export MANOPT='--nj'

export GIT_PAGER='less -FRX'
export PAGER='less'
export LESS='-i'
export EDITOR='vi'

alias ls='ls --color=auto'
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

alias apt='sudo apt'
alias journalctl='sudo journalctl'
alias systemctl='sudo systemctl'

mergemaster() {
    (set -x; git co master && git pull && git co - && git merge master)
}
