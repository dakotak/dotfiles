# dotfiles #
This is a collection of files that will make my *nix envirmont the way I like it.

## Features ##
Colorfull bash prompt including git information.
Custom VIM envirmonment.

### Bash Aliases ###
* cls -> clear
* c   -> clear
* gc -> git commit

## Install ##
1. git clone git@github.com:dakotak/dotfiles.git
2. ./dotfiles/make.sh

## TODO ##
### bashrc ###
* Set the prompt path color based on permissions.
* Add more git infromation (symbol and color representations
  * Is my branch ahead of the remote?
  * Does my brantch match the remote?

### make.sh ###
* Check to see if file exits in home directoy before attempting to move it
* Add argument switches
  * --force -f Overwrite any existing files in the home directory.
