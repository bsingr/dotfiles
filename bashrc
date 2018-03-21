# homebrew
# determined using (the slowish): brew --prefix
export BREW_PATH=/usr/local
PATH=$BREW_PATH/bin:$PATH

# home
PATH=$HOME/bin:$PATH

# coliquio deploy tools
PATH=$HOME/Development/deploy-tools:$PATH

# visual studio code https://code.visualstudio.com/docs/setup/mac
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# system
PATH="/usr/local/sbin:$PATH"

# projects
PATH=./bin:$PATH

# php56
# determined using (the slowish): $(brew --prefix homebrew/php/php56)
PATH="/usr/local/opt/php56/bin:$PATH"
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
PATH="/usr/local/sbin:$PATH"

# homebrew path
export PATH="/usr/local/opt/php56/bin:$PATH" # instead of slow $(brew --prefix homebrew/php/php56)

# aws cli
export PATH="$HOME/.local/lib/aws/bin:$PATH"

export PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
