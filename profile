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

# Bash Completion {

# TODO: Only do this if we know we're running as Bash?
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi

# }

# Prompt {

if [[ -n "$(type -t __git_ps1)" ]] && [[ "$(type -t __git_ps1)" = function ]]; then
	prompt_extras='$(__git_ps1 "(%s)")'
fi

export PS1="\u@\h:\W${prompt_extras} \$ "
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# }

# Misc app-related config {

if [[ -d $HOME/.profile.d ]]; then
	source $HOME/.profile.d/*
fi

# }

# Local additions/overrides {
if [[ -r $HOME/.profile.local ]]; then
	source $HOME/.profile.local
fi
# }
