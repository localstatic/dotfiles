
PATH=$HOME/.composer/vendor/bin:$PATH
PATH=~/bin:$PATH

if [[ -d $HOME/.rvm/bin ]]; then
	PATH=$HOME/.rvm/bin:$PATH
fi

export PATH

alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

alias pbpwd='pwd | tr "\n" "/" | pbcopy'

alias dr='drush'
if [[ -f ~/App/drush/drush.complete.sh ]]; then
	source ~/App/drush/drush.complete.sh
fi

if [[ -f `brew --prefix`/etc/bash_completion ]]; then
	source `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
export PS1='\u@\h:\W$(__git_ps1 "(%s)") \$ '
export EDITOR=vim

set -o vi
