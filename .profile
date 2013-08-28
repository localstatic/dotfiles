
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=/opt/local/lib/mysql5/bin:$PATH
PATH=/opt/local/apache2/bin:$PATH
PATH=~/bin:$PATH
export PATH

alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

alias pbpwd='pwd | tr "\n" "/" | pbcopy'

alias dr='drush'
source ~/App/drush/drush.complete.sh

source /opt/local/share/git-core/git-prompt.sh

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
export PS1='\u@\h:\W$(__git_ps1 "(%s)") \$ '
export EDITOR=vim

set -o vi
