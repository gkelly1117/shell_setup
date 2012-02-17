alias g="git"
alias e="emacs -nw"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias la="ls -A"
alias c="clear"

#search through history on C-P, C-N
bind "C-p":history-search-backward
bind "C-n":history-search-forward

case $TERM in
  dumb)
    export PS1='\W\$ '
    ;;
  *)
    export PS1="\[\e]2;\u@\H\a\e[32;1m\]\w\[\e[0m\] "
    ;;
esac

function cd() {
    builtin cd "$1"
    la
}

. ~/.bashrc.d/commands.sh
