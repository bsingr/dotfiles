#!/bin/bash

# binary
if test ! -s ~/bin/subl
then
  mkdir -p ~/bin
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
fi

SUBL_PACKAGES="$HOME/Library/Application Support/Sublime Text 2/Packages"

# settings installer
function install_settings() {
  settings_file=$1
  echo "Installing $settings_file"
  rm -f "$SUBL_PACKAGES/User/$settings_file"
  ln -s "$HOME/Development/dotfiles/install_scripts/resources/$settings_file" "$SUBL_PACKAGES/User/$settings_file"
}

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

# install settings
install_settings "Preferences.sublime-settings"

# themes
install_plugin "git://github.com/dpree/alien-autopsy.git" "Alien Autopsy"

# plugins
install_plugin "git://github.com/facelessuser/ApplySyntax.git" "ApplySyntax"
install_plugin "git://github.com/sindresorhus/editorconfig-sublime.git" "editorconfig"
install_plugin "git://github.com/liamr/Zurb-Foundation-Textmate-Bundle.git" "Zurb-Foundation"
install_plugin "git://github.com/SublimeText/RSpec.git" "RSpec"
install_plugin "git://github.com/SublimeText/Rake.git" "Rake"
install_plugin "git://github.com/noklesta/SublimeRailsNav.git" "RailsNav"
install_plugin "git://github.com/aponxi/sublime-better-coffeescript.git" "CoffeeScript"
install_plugin "git://github.com/fredwu/ruby-slim-tmbundle.git" "Ruby-Slim"
install_plugin "git://github.com/handcrafted/handcrafted-haml-textmate-bundle.git" "Ruby-Haml"
install_plugin "git://github.com/kuroir/SCSS.tmbundle.git" "SCSS"
install_plugin "git://github.com/danro/LESS-sublime.git" "LESS"
install_plugin "git://github.com/lunixbochs/SublimeXiki.git" "Xiki"

# special plugin with customization
install_plugin "git://github.com/maltize/sublime-text-2-ruby-tests.git" "RubyTest"
install_settings "RubyTest.sublime-settings"
