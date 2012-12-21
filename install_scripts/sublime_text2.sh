#!/bin/bash

# binary
if test ! -s ~/bin/subl
then
  mkdir -p ~/bin
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
fi

SUBL_PACKAGES="$HOME/Library/Application Support/Sublime Text 2/Packages"

# install settings
rm -f "$SUBL_PACKAGES/User/Preferences.sublime-settings"
ln -s ~/Development/dotfiles/install_scripts/resources/Preferences.sublime-settings "$SUBL_PACKAGES/User/Preferences.sublime-settings"

# plugin installer
function install_plugin() {
    plugin_url=$1
    plugin_name=$2

    if test ! -s "$SUBL_PACKAGES/$plugin_name"
    then
      echo "Installing $plugin_name..."
      git clone $plugin_url "$SUBL_PACKAGES/$plugin_name"
    else
      echo "Updating $plugin_name..."
      git pull
    fi
}

# themes
install_plugin "git://github.com/dpree/alien-autopsy.git" "Alien Autopsy"

# plugins
install_plugin "git://github.com/SublimeText/RSpec.git" "RSpec"
install_plugin "git://github.com/SublimeText/Rake.git" "Rake"
install_plugin "git://github.com/noklesta/SublimeRailsNav.git" "RailsNav"
install_plugin "git://github.com/Xavura/CoffeeScript-Sublime-Plugin.git" "CoffeeScript"
install_plugin "git://github.com/fredwu/ruby-slim-tmbundle.git" "Ruby-Slim"
install_plugin "git://github.com/handcrafted/handcrafted-haml-textmate-bundle.git" "Ruby-Haml"
install_plugin "git://github.com/kuroir/SCSS.tmbundle.git" "SCSS"
