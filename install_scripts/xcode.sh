#!/bin/bash

XCODE_THEME_PATH=$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/

mkdir -p $XCODE_THEME_PATH
ln -s "$HOME/dev/dotfiles/install_scripts/resources/dpree.dvtcolortheme" $XCODE_THEME_PATH
