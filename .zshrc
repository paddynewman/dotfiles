autoload -Uz colors && colors # For adding colour to the shell prompt.
autoload -Uz compinit && compinit -i # Enable autoloaded completion.

# Make context-sensitive history work. How did I live without this!?
# E.g., type the beginning of a command and then press the up arrow.

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A'  up-line-or-beginning-search
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search
bindkey '^[OB'  down-line-or-beginning-search

typeset -U path # Only keep unique items in the path/PATH list.
path=(~/bin $path)

PS1="%{$fg_bold[yellow]%}\$%{$reset_color%} " # Set a simple coloured prompt.
PS4='+ ' # Zsh's default PS4 is a bit too verbose for my liking.
precmd () {print -Pn "\e]0;$HOST:$PWD\a"} # Add more detail to the terminal window.

bindkey '^R' history-incremental-search-backward # Backwards search on CTRL+R.

export HISTFILE=~/.zhistory # Where to store our shell history.
export SAVEHIST=1000 # How much history to store in ~/.zhistory.
export HISTSIZE=1000 # How much history to store in memory.

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

alias ls='ls --color=auto'
alias ll='ls -lh'
alias lld='ll -d'
alias sl='ls'
alias ls-l='ls -l'
alias sl-l='ls -l'

alias vi='vim'
alias rv='rview -'
alias perldoc='perldoc -t'
alias bc='bc -lq'
alias tmux='tmux -2 attach || tmux -2'
alias cx='chmod +x'
alias p='python3'
alias grep='grep --color=auto --exclude-dir=.git'

alias apt='sudo apt'
alias journalctl='sudo journalctl'
alias systemctl='sudo systemctl'
alias netstat='sudo netstat'
alias lsof='sudo lsof'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

mergemaster() {
    (set -x; git co master && git pull && git co - && git merge master)
}

if [ -f ~/.workrc ]; then
    . ~/.workrc
fi
