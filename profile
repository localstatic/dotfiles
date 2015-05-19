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

# Source bash completions from known locations
# TODO: Only do this if we know we're running as Bash?

for dir in '/etc/bash_completion.d /usr/local/etc/bash_completion.d'; do
	for file in $dir/*; do
		if [[ -f $file ]]; then
			source $file
		fi
	done
done

# }

# Prompt {

# TODO: Make sure we're running bash since we're using bash completion
if [[ -n "$(type -t __git_ps1)" ]] && [[ "$(type -t __git_ps1)" = function ]]; then
	prompt_extras='$(__git_ps1 "(%s)")'
#	export PS1='\u@\h:\W$(__git_ps1 "(%s)") \$ '
#else
#	export PS1='\u@\h:\W \$ '
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
# }

# Local additions/overrides {
if [[ -r $HOME/.profile.local ]]; then
	source $HOME/.profile.local
fi
# }
