






if [[ -f ${HOME}/.oh-my-zsh ]]; then
  export ZSH="${HOME}/.oh-my-zsh"

  ZSH_THEME="robbyrussell"

  plugins=(
    git
  )

  source $ZSH/oh-my-zsh.sh

  # User configuration
  unsetopt share_history
fi
