#!/bin/bash

THEME_FILE="dpree.dvtcolortheme"
SOURCE_PATH="$HOME/dev/dotfiles/install_scripts/resources/"
XCODE_THEME_PATH="$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/"

if [ -z "$1" ]; then
   mkdir -p $XCODE_THEME_PATH
   cp "$SOURCE_PATH/dpree.dvtcolortheme" $XCODE_THEME_PATH
else
   cp "$XCODE_THEME_PATH/dpree.dvtcolortheme" $SOURCE_PATH
fi
