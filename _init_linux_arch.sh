#!/bin/bash


echo "Installing packages via pacman..."
# Remove comments and blank lines from Pacfile pass the resulting list of packages to pacman
sed '/^[[:blank:]]*#/d;/^[[:blank:]]*$/d;s/[[:blank:]]*#.*//' Pacfile | sudo pacman -S --needed -

