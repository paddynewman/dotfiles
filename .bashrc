PS1='\[\033[1;33m\]\$\[\033[0m\] '
set -o vi
export EDITOR='vi'
export GOROOT='/usr/local/go'
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
alias ls='ls -F'
alias ll='ls -lh'
alias la='ll -a'
alias tmux='tmux attach || tmux '
