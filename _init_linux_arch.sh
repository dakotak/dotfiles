#!/bin/bash


echo "Installing packages via pacman..."
# Remove comments and blank lines from Pacfile pass the resulting list of packages to pacman
sed '/^[[:blank:]]*#/d;/^[[:blank:]]*$/d;s/[[:blank:]]*#.*//' Pacfile | sudo pacman -S --needed -


function install_yay {
  pushd "$(mktemp --directory)" &> /dev/null || return 1
  git clone https://aur.archlinux.org/yay.git .
  makepkg -si
  popd &> /dev/null || return 1
}

# YAY: Install yay to manage packages from Arch User Repository (AUR)
if ! type yay &> /dev/null; then
  echo "Installing yay..."
  install_yay || echo "Error installing yay!"
fi
