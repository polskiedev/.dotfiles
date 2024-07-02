#!/bin/bash

source .env/vars.sh
source "$HOME/.devenv/common/sources.sh" #temp

# Define the help function
help() {
    echo "Usage: ./setup.sh [command]"
    echo
    echo "Commands:"
    echo "  initialize     Run the initialize function"
    echo "  update         Run the update function"
    echo "  help           Display this help message"
    echo
    echo "If no command is provided, 'initialize' will be run by default."
}

# Define the initialize function
initialize() {
    echo "Running initialize function..."
}

# Define the update function
update() {
    echo "Running update function..."
}

make_file_nvim() {
    mkdir -p ~/.config/nvim
    touch ~/.config/nvim/init.vim
}

make_file() {
    make_file_nvim
}

make_symlinks_nvim() {
    local source_path="$PATH_DOTFILES/nvim/.config/nvim"
    local destination_path="$HOME/.config/nvim"
    local file_name="init.vim"

    if ! [[ -f "$source_path/$file_name" ]]; then
        echo "Source: '$source_path/$file_name' not found"
        return 1
    fi

    if [[ -f "$destination_path/$file_name" ]]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local original_file="$destination_path/$file_name"
        # Create the backup filename
        local backup_file="${original_file}_backup_${timestamp}"

        echo "Destination: '$destination_path/$file_name' already exists"
        mv "$original_file" "$backup_file"

        if [ $? -eq 0 ]; then
            echo "File renamed to $backup_file"
        else
            echo "Failed to rename the file"
            return 1
        fi
    fi

    create_symlink "$source_path/$file_name" "$destination_path/$file_name"
}

make_symlinks_gitignore_global() {
    local file_path="$PATH_DOTFILES/git"
    local file_name=".gitignore_global"

    if [[ -f "$file_path/$file_name" ]]; then
        create_symlink "$file_path/$file_name" "$HOME/$file_name"
    fi
}

make_symlinks() {
    echo "Creating symlinks..."
	# local script_dir=$(dirname "$(readlink -f "$0")")
	# local list=(".dotfiles")
	
	# # list+=(package2)
	# # Loop through each element in the array
	# for element in "${list[@]}"; do
	# 	local target_dir="$HOME/$element"
	# 	local symlink_target="$script_dir/packages/$element"
		
	# 	__create_symlink "$target_dir" "$symlink_target"
	# done
    make_symlinks_gitignore_global
    make_symlinks_nvim
}

# Define the function to check and create a symlink
__create_symlink() {
    local target_dir="$1"
    local symlink_target="$2"

    if [ -e "$target_dir" ]; then
        if [ -L "$target_dir" ]; then
            echo "$target_dir is already a symlink."
        else
            echo "Error: $target_dir already exists as a directory."
        fi
    else
        echo "$target_dir is not a symlink. Creating a symlink..."
        ln -s "$symlink_target" "$target_dir"
        echo "Symlink created from $target_dir to $symlink_target."
    fi
}

# Check the parameter and call the corresponding function
if [ -z "$1" ]; then
    # No parameter passed, default to initialize
    initialize
else
    # Parameter passed, execute the corresponding function
    case "$1" in
		help)
			help
			;;
        init)
            initialize
            ;;
        "make:links")
            make_symlinks
            ;;
        "make:file")
            make_file
            ;;
        update)
            update
            ;;
        *)
            echo "Invalid parameter. Usage: ./setup.sh [init|update|"make:links"|"make:file"]"
            exit 1
            ;;
    esac
fi