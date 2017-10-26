# Modeline and Notes {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
# }

# Set up PATH {
PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [[ -d $HOME/.rbenv/shims ]]; then
	PATH=$HOME/.rbenv/shims:$PATH
elif [[ -d $HOME/.rvm/bin ]]; then
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
if [[ `type brew > /dev/null 2>&1` -eq 0 ]] && [[ -f `brew --prefix`/etc/bash_completion ]]; then
    source `brew --prefix`/etc/bash_completion
fi

# }

# Prompt {

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

if [[ -n "$(type -t __git_ps1)" ]] && [[ "$(type -t __git_ps1)" = function ]]; then
	prompt_extras='$(__git_ps1 " (%s)")'
fi

export PS1="\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]] [\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]] [$pink\w\[$black\]]\[\033[0;33m\]${prompt_extras} \[\033[00m\]\[$reset\]\n\[$reset\]\$ "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
# }

# Aliases {
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias pbpwd='pwd | tr "\n" "/" | pbcopy'
alias yr='yarn run'
# }

# Misc environment stuff {
export EDITOR=vim
export VISUAL=$EDITOR

if [[ -d "${HOME}/man" ]]; then
	export MANPATH="$(manpath):${HOME}/man"
fi

set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ -d "${HOME}/.nvm" ]]; then
	export NVM_DIR="${HOME}/.nvm"
	if [[ -s "$NVM_DIR/nvm.sh" ]]; then
		source "$NVM_DIR/nvm.sh"
	elif [[ -s "/usr/local/opt/nvm/nvm.sh" ]]; then
		source "/usr/local/opt/nvm/nvm.sh"
	fi
fi

if [[ -f "${HOME}/.ssh/id_rsa" ]]; then
	ssh-add ${HOME}/.ssh/id_rsa > /dev/null 2>&1
fi

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
