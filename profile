# Modeline and Notes {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
# }

# Set up PATH {
PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [[ -d $HOME/.rvm/bin ]]; then
	PATH=$HOME/.rvm/bin:$PATH
fi

if [[ -d $HOME/.composer/vendor/bin ]]; then
	PATH=$HOME/.composer/vendor/bin:$PATH
fi

if [[ -d $HOME/bin ]]; then
	PATH=$HOME/bin:$PATH
fi

export PATH
# }

# Prompt {

# TODO: Make sure we're running bash since we're using bash completion
if [[ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]]; then
	source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
	export PS1='\u@\h:\W$(__git_ps1 "(%s)") \$ '
else
	export PS1='\u@\h:\W \$ '
fi

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
# }

# Aliases {
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias pbpwd='pwd | tr "\n" "/" | pbcopy'
# }

# Misc environment stuff {
export EDITOR=vim
export VISUAL=$EDITOR

if [[ -d "${HOME}/man" ]]; then
	export MANPATH="$(manpath):${HOME}/man"
fi

set -o vi
# }

# Local additions/overrides {
if [[ -r $HOME/.profile.local ]]; then
	source $HOME/.profile.local
fi
# }
