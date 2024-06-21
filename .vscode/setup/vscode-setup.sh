#!/bin/bash

dotFilesDir="$1"
winAppDataDir="$2"
symlinkDir="$dotFilesDir/.vscode/.symlinks"

# Check if two parameters are passed
if [ $# -ne 2 ]; then
    echo "Error: Two parameters are required."
    echo "Usage: $0 <param1> <param2>"
    exit 1
fi

if ! [ -d "$(realpath "$dotFilesDir")" ]; then
	echo "$dotFilesDir is not valid directory"
	exit 1
fi

if ! [ -d "$(realpath "$winAppDataDir")" ]; then
	echo "$winAppDataDir is not valid directory"
	exit 1
fi

# Check if the directory exists
if ! [ -d "$(realpath "$symlinkDir")" ]; then
    mkdir "$symlinkDir"
fi

# ######################################################################################
# settings.json
# ######################################################################################
filename="settings.json";
wslVscodeSettingsJsonFile="$HOME/.vscode-server/data/Machine/$filename"
dotFileVscodeSettingsJsonFile="$dotFilesDir/.vscode/config/$filename"
winVscodeSettingsJsonFile="$winAppDataDir/Roaming/Code/User/$filename"
symlinkVscodeSettingsJsonFile="$symlinkDir/$filename"

if [ -f $winVscodeSettingsJsonFile ]; then
    echo "Deleting vscode $filename"
    rm "$winVscodeSettingsJsonFile"
fi

dotFileVscodeSettingsJsonFile="$(realpath "$dotFileVscodeSettingsJsonFile")"
if [ -f "$dotFileVscodeSettingsJsonFile" ]; then
    cp "$dotFileVscodeSettingsJsonFile" "$winVscodeSettingsJsonFile"
    echo "Copying: from '$dotFileVscodeSettingsJsonFile' to '$winVscodeSettingsJsonFile'"

    ln -sf "$winVscodeSettingsJsonFile" "$symlinkVscodeSettingsJsonFile"
    echo "Create Symlink: from '$winVscodeSettingsJsonFile' to '$symlinkVscodeSettingsJsonFile'"
fi


# ######################################################################################
# keybindings.json
# ######################################################################################
filename="keybindings.json";
wslVscodeKeybindingsJsonFile="$HOME/.vscode-server/data/Machine/$filename"
dotFileVscodeKeybindingsJsonFile="$dotFilesDir/.vscode/config/$filename"
winVscodeKeybindingsJsonFile="$winAppDataDir/Roaming/Code/User/$filename"
symlinkVscodeKeybindingsJsonFile="$symlinkDir/$filename"

if [ -f $winVscodeKeybindingsJsonFile ]; then
    echo "Deleting vscode $filename"
    rm "$winVscodeKeybindingsJsonFile"
fi

if [ -f "$(realpath "$dotFileVscodeKeybindingsJsonFile")" ]; then
    cp "$dotFileVscodeKeybindingsJsonFile" "$winVscodeKeybindingsJsonFile"
    echo "Copying: from '$dotFileVscodeKeybindingsJsonFile' to '$winVscodeKeybindingsJsonFile'"

    ln -sf "$winVscodeKeybindingsJsonFile" "$symlinkVscodeKeybindingsJsonFile"
    echo "Create Symlink: from '$winVscodeKeybindingsJsonFile' to '$symlinkVscodeKeybindingsJsonFile'"
fi
# ######################################################################################
# Todo: @snippets?
# ######################################################################################
# ln -sf ~/dotfiles/vscode/config/snippets ~/.config/Code/User/snippets
