#!/bin/bash

echo "Running OSX init..."

# Include hammerspoon config for OSX
STOW_PACKAGES+=(hammerspoon)

# Install OSX Command Line Tools
if ! xcode-select -v > /dev/null 2>&1; then
  echo "Installing xcode-select..."
  xcode-select --install
fi


# Check to see if brew is installed, and install it if it isn't
if ! type brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if nix is installed, and install it if it isn't
if ! type nix &> /dev/null; then
  echo "Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install)
fi


# Install brew packages
# if type gum &> /dev/null; then
#   gum spin --spinner=line --title="Installing brew packages..." -- brew bundle
# else
  echo "Installing brew packages..."
  brew bundle
# fi



echo "Updating hammerspoon default config location..."
# Update Hammerspoon default config location
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"
