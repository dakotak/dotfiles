#!/bin/bash


ANTIDOTE_FILE=/usr/share/zsh-antidote/antidote.zsh


# Remove comments and blank lines from Pacfile pass the resulting list of packages to pacman
# Compair what is already installed to what is in the pacfile to determin what is missing
MISSING_PACKAGES=( $(\
  comm -13 \
    <(pacman -Qq | sort) \
    <(sed '/^[[:blank:]]*#/d;/^[[:blank:]]*$/d;s/[[:blank:]]*#.*//' Pacfile | sort)
) )
# NOTE: List packages installed from non official repos: `pacman -Qm`

if [ ${#MISSING_PACKAGES[@]} -gt 0 ]; then
  echo "Installing missing packages via pacman..."
  sudo pacman -S --needed "$MISSING_PACKAGES"
else
  echo "No new pacman packages to install!"
fi


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


if [ ! -f "$ANTIDOTE_FILE" ] &> /dev/null; then
  echo "Installing antidote..."
  yay -S zsh-antidote
fi
