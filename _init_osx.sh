#!/bin/bash

# Install OSX Command Line Tools
if ! xcode-select -v > /dev/null 2>&1; then
  echo "Installing xcode-select..."
  xcode-select --install
fi


# Check to see if brew is installed, and install it if it isn't
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


echo "Installing brew packages..."
# Install brew packages
brew bundle


echo "Updating hammerspoon default config location..."
# Update Hammerspoon default config location
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"