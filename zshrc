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

# zinit - https://github.com/zdharma/zinit
if [[ -e $HOME/.zinit/bin/zinit.zsh ]]; then
  source "$HOME/.zinit/bin/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # add our preferred plugins
  zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light denysdovhan/spaceship-prompt
else
  echo "zinit not installed."
  export PS1="$"
fi

#
# Additional user configuration
#

unsetopt SHARE_HISTORY
unsetopt INC_APPEND_HISTORY

export \
  SPACESHIP_EXIT_CODE_SHOW=true \
  SPACESHIP_TIME_SHOW=true \
  SPACESHIP_PROMPT_ORDER=(
    time          # Time stamps section
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    package       # Package version
    aws           # Amazon Web Services section
    # kubecontext   # Kubectl context section
    terraform     # Terraform workspace section
    exec_time     # Execution time
    line_sep      # Line break
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )


which kubectl >/dev/null 2>&1
if [[ $? == 0 ]]; then
  source <(kubectl completion zsh)
fi

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
