








ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -e ~/.profile ]]; then
  source ~/.profile
fi

unsetopt share_history

