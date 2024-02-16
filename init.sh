#!/bin/bash

# This script installs base software I use on a new OSX machine

set -e


# Change into the directory this script is in
cd "$(dirname "$0")"


if [[ `uname` == 'Darwin' ]]; then
  echo "Running OSX init..."
  source _init_osx.sh
fi


STOW_PACKAGES=(
  hammerspoon
  lsd
  nvim
  scripts
  zsh
)

echo "Deploying stow packages..."
# Use stow to create symlinks for config files
stow ${STOW_PACKAGES[@]}





# Replace with new zsh process to apply changes
# source ~/.config/zsh/.zshrc
exec zsh
