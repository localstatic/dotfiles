

if [[ -e /usr/local/share/antigen/antigen.zsh ]]; then
  source /usr/local/share/antigen/antigen.zsh
fi

which -s antigen >/dev/null 2>&1
if [[ $? == 0 ]]; then
  # Load the oh-my-zsh library.
  antigen use oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  #antigen bundle git
  antigen bundle vi-mode
  antigen bundle command-not-found

  # Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-syntax-highlighting

  # Load the theme
  antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

  # Tell Antigen that we're done
  antigen apply
elif [[ -f ${HOME}/.oh-my-zsh ]]; then
  export ZSH="${HOME}/.oh-my-zsh"

  ZSH_THEME="robbyrussell"

  plugins=(
    git
  )

  source $ZSH/oh-my-zsh.sh

  # User configuration
  unsetopt share_history
fi
