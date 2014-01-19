# plugin installer
function install_plugin() {
    plugin_url=$1
    plugin_name=$2

    if test ! -s "$PACKAGES/$plugin_name"
    then
      echo "Installing $plugin_name..."
      git clone $plugin_url "$PACKAGES/$plugin_name"
    else
      echo "Updating $plugin_name..."
      git pull
    fi
}
