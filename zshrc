#
# .zshrc
#

autoload -Uz compinit
compinit

if [[ -e ~/.profile ]]; then
  source ~/.profile
fi

if [[ -e ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# 
# Handle plugins
# 

# antibody - https://getantibody.github.io/
which antibody >/dev/null 2>&1
if [[ $? == 0 ]]; then
  source <(antibody init)

  antibody bundle < ~/.zsh_plugins.txt
fi

# 
# Additional user configuration
# 

unsetopt SHARE_HISTORY
unsetopt INC_APPEND_HISTORY

export \
  SPACESHIP_EXIT_CODE_SHOW=true \
  SPACESHIP_TIME_SHOW=true

source <(kubectl completion zsh)

fpath=(/usr/local/share/zsh-completions $fpath)

# 
# Tooling integrations
# 

# direnv - https://direnv.net/
which direnv > /dev/null 2>&1
if [[ $? == 0 ]]; then
  eval "$(direnv hook zsh)"
fi

# fzf - https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
