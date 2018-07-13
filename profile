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

# Aliases {

if [[ -f "${HOME}/.aliases" ]]; then
	source "${HOME}/.aliases"
fi

if [[ -f "${HOME}/.aliases.local" ]]; then
	source "${HOME}/.aliases.local"
fi

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
