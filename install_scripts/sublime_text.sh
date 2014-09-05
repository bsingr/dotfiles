#!/bin/bash

MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$MY_PATH/lib/_install_plugin.sh"

# binary
mkdir -p ~/bin
rm -rf ~/bin/subl
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

PACKAGES="$HOME/Library/Application Support/Sublime Text 3/Packages"

# settings installer
function install_settings() {
  settings_file=$1
  echo "Installing $settings_file"
  rm -f "$PACKAGES/User/$settings_file"
  ln -s "$HOME/Development/dotfiles/install_scripts/resources/$settings_file" "$PACKAGES/User/$settings_file"
}

# install settings
install_settings "Preferences.sublime-settings"

# themes
install_plugin "git://github.com/bsingr/alien-autopsy.git" "Alien Autopsy"
install_plugin "git://github.com/bsingr/red-cross.git" "Red Cross"

# plugins
install_plugin "git://github.com/clintberry/sublime-text-2-ini.git" "INI"
install_plugin "git://github.com/ttscoff/MarkdownEditing.git" "MarkdownEditing"
install_plugin "git://github.com/facelessuser/ApplySyntax.git" "ApplySyntax"
install_plugin "git://github.com/sindresorhus/editorconfig-sublime.git" "editorconfig"
install_plugin "git://github.com/pderichs/sublime_rubocop.git" "RuboCop"
install_plugin "git://github.com/miksago/jade-tmbundle.git" "Jade"
install_plugin "git://github.com/liamr/Zurb-Foundation-Textmate-Bundle.git" "Zurb-Foundation"
install_plugin "git://github.com/SublimeText/RSpec.git" "RSpec"
install_plugin "git://github.com/SublimeText/Rake.git" "Rake"
install_plugin "git://github.com/noklesta/SublimeRailsNav.git" "RailsNav"
install_plugin "git://github.com/aponxi/sublime-better-coffeescript.git" "CoffeeScript"
install_plugin "git://github.com/slim-template/ruby-slim.tmbundle.git" "Ruby-Slim"
install_plugin "git://github.com/handcrafted/handcrafted-haml-textmate-bundle.git" "Ruby-Haml"
install_plugin "git://github.com/kuroir/SCSS.tmbundle.git" "SCSS"
install_plugin "git://github.com/danro/LESS-sublime.git" "LESS"
install_plugin "git://github.com/rmaksim/Sublime-Text-2-Inc-Dec-Value.git" "Inc-Dec-Value"
