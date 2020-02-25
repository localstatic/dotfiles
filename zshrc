#
# .zshrc
#


if [[ -e ~/.profile ]]; then
  source ~/.profile
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
