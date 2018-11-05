#!/bin/sh -ex

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install nvm \
  ruby-install \
  chruby \
  bash-completion \
  direnv

# developer font for vscode
brew tap caskroom/fonts
brew cask install font-fira-code