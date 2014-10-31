# Modeline and Notes {
# vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
# }

# Source .profile so we can have the same setup for login & other interactive shells {
if [[ -r $HOME/.profile ]]; then
	source $HOME/.profile
fi
# }

# Local additions/overrides {
if [[ -r $HOME/.bash_profile.local ]]; then
	source $HOME/.bash_profile.local
fi
# }
