#!/bin/sh -ex

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install nvm \
  ruby-install \
  chruby \
  bash-completion \
  direnv

# developer font for vscode
brew tap caskroom/fonts
brew cask install font-fira-code