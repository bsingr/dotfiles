#!/bin/bash

MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$MY_PATH/lib/_install_plugin.sh"

PACKAGES="$HOME/Library/Application Support/Chocolat/TextmateBundles"

# plugins
install_plugin "git://github.com/slim-template/ruby-slim.tmbundle.git" "ruby-slim.tmbundle"
install_plugin "git@github.com:textmate/ini.tmbundle.git" "ini.tmbundle"
