# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# git auto complete
#. ~/.bashrc.d/git-completion.sh
#complete -o default -o nospace -F _git g

# PS1
case $TERM in
  dumb)
    export PS1='\W\$ '
    ;;
  *)
    export PS1='\[\033[01;32m\]\w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]\[\033[00m\]'
    ;;
esac

# cd + ls
function cl() {
    builtin cd "$1"
    ls -A
}

# diff deleted (assuming first file is original)
function did() {
    diff "$1" "$2" | grep ">"
}

# diff added (assuming first file is origonal)
function dia() {
    diff "$1" "$2" | grep "<"
}

# shortcuts
alias g5="git5"
alias g="git"
alias e="emacs -nw"
alias ..="cl .."
alias ...="cl ../.."
alias ....="cl ../../.."
alias ~="cl ~"
alias la="ls -A"
alias c="clear"
alias di="diff"

#search through history on C-P, C-N
bind "C-p":history-search-backward
bind "C-n":history-search-forward

. ~/.bashrc.d/commands.sh
