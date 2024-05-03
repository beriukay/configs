#!/bin/bash

# Set variables
home_dir="$HOME"
config_dir="$PWD"
backup_dir="$config_dir/backup"

mkdir -p "$backup_dir"

backup_and_link() {
	local file="$1"
	local target_dir="$2"

	# Back up existing version of the file
	if [ -f "$target_dir/$file" ]; then
		mv "$target_dir/$file" "$backup_dir/$file"
		echo "Backed up $file"
	fi

	# Create symlinks
	ln -s  "$target_dir/$file" "$home_dir/$file"
	echo "Linked: $home_dir/$file -> $target_dir/$file"
}

files=(.bashrc .bash_aliases .gitignore .inputrc .tmux.conf .vimrc)
for file in "${files[@]}"; do
	backup_and_link "$file" "$config_dir"
done
# git clone https://github.com/tomasr/molokai.git
# ln -s ~/.vim/colors/molokai.vim molokai/molokai.vim
