# Modeline and Notes {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
# }

# Source .profile so we can have the same setup for login & other interactive shells {
if [[ -r $HOME/.profile ]]; then
	source $HOME/.profile
fi
# }

# Shell Integrations {

# iTerm2 {

if [[ -e "${HOME}/.iterm2_shell_integration.bash" ]]; then
	source "${HOME}/.iterm2_shell_integration.bash"
	enable_iterm_integration=1
fi

# }

# NVM {

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# }

# }

# Bash Completion {

type brew > /dev/null 2>&1
if [[ $? -eq 0 && -f `brew --prefix`/etc/bash_completion ]]; then
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

if [[ $enable_iterm_integration -eq 1 ]]; then
	prompt_prefix='\[$(iterm2_prompt_mark)\] '
fi

export PS1="\n${prompt_prefix}\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]] [\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]] [$pink\w\[$black\]]\[\033[0;33m\]${prompt_extras} \[\033[00m\]\[$reset\]\n\[$reset\]\$ "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
# }

# Misc {

set -o vi

# }

# Local additions/overrides {
if [[ -r $HOME/.bash_profile.local ]]; then
	source $HOME/.bash_profile.local
fi
# }
