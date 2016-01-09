# homebrew
# determined using (the slowish): brew --prefix
BREW_PATH=/usr/local
PATH=$BREW_PATH/bin:$PATH

# home
PATH=$HOME/bin:$PATH

# system
PATH="/usr/local/sbin:$PATH"

# projects
PATH=./bin:$PATH

# php56
# determined using (the slowish): brew --prefix homebrew/php/php56
PATH="$BREW_PATH/Cellar/php56/5.6.8/bin:$PATH"
PATH="./vendor/bin:$PATH"

# node / npm
export NODE_PATH=/usr/local/lib/node
PATH=$PATH:./node_modules/.bin
PATH=$PATH:/usr/local/share/npm/bin

# heroku
PATH=/usr/local/heroku/bin:$PATH

# go
PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/Development/go
PATH=$PATH:$GOPATH/bin

# java
# speedup jvm boot and jruby
export JAVA_OPTS="-d64 -client"
export JRUBY_OPTS="-X-C"

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

export PATH

source ~/.fzf.bash
