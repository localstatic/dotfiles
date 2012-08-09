Dotfiles
========

This project contains my personal dotfiles and associated management scripts. This makes it easier to keep these files up-to-date on each of the computers I use on a regular basis, and to set up my environment when I start using an new computer.

Scripts
-------

Scripts included in this project include:
* init.sh -- Create symlinks to each included dotfile in the home directory

Config Files
------------

Configuration files included in this repository are those for which there is not significant per-machine differences. All of these files have names that begin with a period, and are therefore hidden from display by default on UNIX-like systems. The init script above makes this naming assumption and only operates on these files.
