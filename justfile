
# TODO: Add config
# - Add to the stow_package list in init.sh
# - Create the stow_package config dirs
# - Update config symlinks


update-config-symlinks:
	#!/usr/bin/env sh
	for dir in ./stow_packages/*/; do
		name=$(basename "$dir")
		config_dir="${dir}.config/$name"
		# If config_dir does not exists then skip
		if [ ! -d "$config_dir" ]; then
			echo "No .config dir for ${name}, skipping"
			continue
		fi
		link_dest=$(grealpath --relative-to=./configs "$config_dir")
		link_path="./configs/$name"
		# Check if link_path exists
		if [ -L "$link_path" ]; then
			echo "Link for $name already exists"
			continue
		fi
		echo "Creating link for $name"
		ln -s "$link_dest" "$link_path"
	done;

