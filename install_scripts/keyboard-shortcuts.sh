#!/bin/bash

karabiner=/Applications/Karabiner.app/Contents/Library/bin/karabiner
seil=/Applications/Seil.app/Contents/Library/bin/seil

echo 'Enabling caps_lock to f16'
$seil set keycode_capslock 106
$seil export > /dev/null

echo 'Linking karabiner config'
karabiner_dst="$HOME/Library/Application Support/Karabiner/private.xml"
rm "$karabiner_dst"
ln -s ~/Development/dotfiles/install_scripts/resources/karabiner.xml "$karabiner_dst"

echo 'Enabling f16 to hyper in karabiner'
$karabiner reloadxml
$karabiner enable caps_lock_to_hyper

echo '---'
echo 'TODO 1: Go to seil and enable caps lock mapping'
echo 'TODO 2: Go to system preferences > keyboad and map caps lock to "No Action"'
