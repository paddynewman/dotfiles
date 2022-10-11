autoload -Uz colors && colors # For adding colour to the shell prompt.
autoload -Uz compinit && compinit -i # Enable autoloaded completion.

# Enable context-sensitive history search using the cursor keys. Type the
# beginning of a command, like "curl", and then press the up arrow.

bindkey "$key[Up]" history-beginning-search-backward
bindkey "$key[Down]" history-beginning-search-forward
bindkey '^R' history-incremental-search-backward # Like Bash does.

typeset -U path # Only keep unique items in the path/PATH list.
path=(~/bin $path) # I'll put examples and hacky stuff in ~/bin.

PS1="%{$fg_bold[yellow]%}\$%{$reset_color%} " # Set a simple coloured prompt.
PS4='$ ' # The default too verbose. This works well when copying output too.
precmd () { print -Pn "\e]0;$HOST:$PWD\a" } # Add details to the terminal window.

export HISTFILE=~/.zhistory # Where to store our shell history.
export SAVEHIST=10000 # How much history to store in ~/.zhistory.
export HISTSIZE=10000 # How much history to store in memory.

setopt hist_ignore_dups # No Duplicates in the history file.
setopt hist_ignore_space # Don't add whitespace junk to history.
setopt hist_reduce_blanks # Trim all the spaces before saving.
setopt inc_append_history # Each shell will append to ~/.zhistory.
setopt share_history # Each shell will share the same history.

set -o vi # Vim-stype command line editing, not Emacs.

export TERM='xterm'
export MANWIDTH='78'
export MANOPT='--nj'
export GIT_PAGER='less -FRX'
export PAGER='less'
export LESS='-i'
export EDITOR='vi'

alias ls='ls -F'
alias ll='ls -lh'
alias la='ll -a'

alias vi='vim'
alias rv='rview -'
alias bc='bc -lq'
alias tmux='tmux -2 attach || tmux -2'
alias cx='chmod 755'
alias p='python3 -q'
alias pd='pydoc3'
alias pdb='python3 -mpdb'
alias grep="grep --color=auto --exclude='*.swp' --exclude-dir=.git"
alias decomment="egrep -v '^\s*(#|$)'"
alias ipcalc='ipcalc -n'
alias zreload='. ~/.zshrc'
alias gup='(set -x; git co master && git pull)'
alias aup='(set -x; apt update && apt upgrade -y && apt autoremove -y)'
alias myip='(set -x; curl httpbin.org/ip)'

alias journalctl='sudo journalctl'
alias systemctl='sudo systemctl'
alias netstat='sudo netstat'
alias ss='sudo ss'
alias lsof='sudo lsof'
alias traceroute='sudo traceroute'
alias apt='sudo apt'
alias iptables='sudo iptables'

gp() {
    local _branch=$(git rev-parse --abbrev-ref HEAD)
    (set -x; git push --set-upstream origin $_branch)
}

mergemaster() {
    (set -x; git co master && git pull && git co - && git merge master)
}

if [ -f ~/.workrc ]; then
    . ~/.workrc
fi
