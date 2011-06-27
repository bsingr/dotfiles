#
# PATH
#

export PATH="/opt/godi/bin:/opt/godi/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/usr/local/narwhal/bin:$PATH"
export PATH="$HOME/bin:$PATH"

CDPATH=$HOME:$HOME/dev; export CDPATH

#
# Ruby RVM
#

# rvm-with-zsh fix
# see http://beginrescueend.com/integration/zsh/
unsetopt auto_name_dirs

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session

# original ruby with:
# rvm system
# set default
# rvm --default use ruby-1.9.2
rvm ruby-1.9.2

#
# Cappuccino
#

export CAPP_BUILD="$HOME/dev/forks/cappuccino/build"

#
# SVN
#

export SVN_EDITOR=/usr/bin/vim

#
# Textmate
#

export TM_SOFT_TABS=YES

#
# NodeJS
#

NODE_PATH=$HOME/.node_libraries; export NODE_PATH