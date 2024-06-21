#!/bin/bash

dotFilesDir="$1"
winAppDataDir="$2"

# Todo:
# Issue: $HOME not working on `[[ -d "dirname"]]` ???

# echo "dotFilesDir: $dotFilesDir"
# echo "winAppDataDir: $winAppDataDir"

# if [[ -d "$dotFilesDir" ]]; then
# 	echo "$dotFilesDir is not valid directory"
# 	exit 1
# fi

# if [[ -d "$winAppDataDir" ]]; then
# 	echo "$winAppDataDir is not valid directory"
# 	exit 1
# fi
# ######################################################################################
# settings.json
# ######################################################################################
filename="settings.json";
wslVscodeSettingsJsonFile="$HOME/.vscode-server/data/Machine/$filename"
dotFileVscodeSettingsJsonFile="$dotFilesDir/.vscode/config/$filename"
winVscodeSettingsJsonFile="$winAppDataDir/Roaming/Code/User/$filename"
symlinkVscodeSettingsJsonFile="$dotFilesDir/.vscode/.symlinks/$filename"

if [ -f $winVscodeSettingsJsonFile ]; then
    echo "Deleting vscode $filename"
    rm "$winVscodeSettingsJsonFile"
fi

cp "$dotFileVscodeSettingsJsonFile" "$winVscodeSettingsJsonFile"
echo "Copying: from '$dotFileVscodeSettingsJsonFile' to '$winVscodeSettingsJsonFile'"

ln -sf "$winVscodeSettingsJsonFile" "$symlinkVscodeSettingsJsonFile"
echo "Create Symlink: from '$winVscodeSettingsJsonFile' to '$symlinkVscodeSettingsJsonFile'"
# ######################################################################################
# keybindings.json
# ######################################################################################
filename="keybindings.json";
wslVscodeKeybindingsJsonFile="$HOME/.vscode-server/data/Machine/$filename"
dotFileVscodeKeybindingsJsonFile="$dotFilesDir/.vscode/config/$filename"
winVscodeKeybindingsJsonFile="$winAppDataDir/Roaming/Code/User/$filename"
symlinkVscodeKeybindingsJsonFile="$dotFilesDir/.vscode/.symlinks/$filename"

if [ -f $winVscodeKeybindingsJsonFile ]; then
    echo "Deleting vscode $filename"
    rm "$winVscodeKeybindingsJsonFile"
fi

cp "$dotFileVscodeKeybindingsJsonFile" "$winVscodeKeybindingsJsonFile"
echo "Copying: from '$dotFileVscodeKeybindingsJsonFile' to '$winVscodeKeybindingsJsonFile'"

ln -sf "$winVscodeKeybindingsJsonFile" "$symlinkVscodeKeybindingsJsonFile"
echo "Create Symlink: from '$winVscodeKeybindingsJsonFile' to '$symlinkVscodeKeybindingsJsonFile'"
# ######################################################################################
# Todo: @snippets?
# ######################################################################################
# ln -sf ~/dotfiles/vscode/config/snippets ~/.config/Code/User/snippets