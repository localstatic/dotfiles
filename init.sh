#!/bin/bash
# Dotfiles setup
# Morgan Terry <localstatic@localstatic.com>

# BEGIN configuration values

DOTFILES_DIR=~/Dropbox/Projects/dotfiles
DESTINATION_DIR=~

# END configuration

if [[ ! -d $DOTFILES_DIR ]]; then
	echo "DOTFILES_DIR not found."
	exit 1
fi

if [[ ! -d $DESTINATION_DIR ]]; then
	echo "DESTINATION_DIR not found."
	exit 1
fi

#

for entry in `ls -dA $DOTFILES_DIR/.*`; do
	basename=`basename $entry`
	if [[ '.' != $basename && '..' != $basename ]]; then
		cmd="ln -s $entry ${DESTINATION_DIR}/${basename}"
		$cmd
	fi
done

