#!/bin/bash

# This script installs base software I use on a new OSX machine

set -e

# Change into the directory this script is in
cd "$(dirname "$0")"

# Default stow packages (sourced subscripts can add items to this array)
STOW_PACKAGES=(
  lsd
  nvim
  scripts
  zsh
)


case $(uname) in
  # Mac OSX
  Darwin)
    source _init_osx.sh
    ;;

  Linux)
    osID=$(grep -Po '(?<=^ID=).*' /etc/os-release)
    initFile="_init_linux_$osID.sh"
    if [ -f "$initFile" ]; then
      echo "Running init file for $osID linux..."
      # shellcheck disable=SC1090
      source "$initFile"
    else
      echo "Linux '$osID' is not supported!"
    fi
    ;;
esac



# Use stow to create symlinks for config files
echo "Deploying stow packages (${STOW_PACKAGES[@]})..."
stow "${STOW_PACKAGES[@]}"


# Replace with new zsh process to apply changes
# source ~/.config/zsh/.zshrc
exec zsh
