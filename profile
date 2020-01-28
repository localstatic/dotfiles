# Modeline and Notes {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
# }

if [[ -d ${HOME}/go ]]; then
  GOPATH=${HOME}/go
fi

# Set up PATH {
PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [[ ! -z $GOPATH ]]; then
  PATH=${GOPATH}/bin:${PATH}
fi

if [[ -d $HOME/bin ]]; then
	PATH=$HOME/bin:$PATH
fi

export PATH
# }

# Aliases {

if [[ -f "${HOME}/.aliases" ]]; then
	source "${HOME}/.aliases"
fi

if [[ -f "${HOME}/.aliases.local" ]]; then
	source "${HOME}/.aliases.local"
fi

which mvim >/dev/null 2>&1
if [[ $? == 0 ]]; then
	alias vim="mvim -v"
fi

alias ls='ls -GF'
alias la='ls -A'
alias ll='ls -l'
alias lla='ll -A'
alias lld='ll -d'
alias pbpwd='pwd | tr "\n" "/" | pbcopy'
alias k='kubectl'
alias tf='terraform'
alias weather='curl http://wttr.in'
# }

# Misc environment stuff {
export EDITOR=vim
export VISUAL=$EDITOR

if [[ -d "${HOME}/man" ]]; then
	export MANPATH="$(manpath):${HOME}/man"
fi

if [[ -d "${HOME}/.nvm" ]]; then
	export NVM_DIR="${HOME}/.nvm"
	if [[ -s "$NVM_DIR/nvm.sh" ]]; then
		source "$NVM_DIR/nvm.sh"
	fi
elif [[ -s "/usr/local/opt/nvm/nvm.sh" ]]; then
	export NVM_DIR="/usr/local/opt/nvm"
	source "/usr/local/opt/nvm/nvm.sh"
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
