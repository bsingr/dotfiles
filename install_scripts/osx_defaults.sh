#!/bin/bash

# hidden files in finder
# 10.7
defaults write com.apple.finder AppleShowAllFiles -bool YES
# 10.8
defaults write com.apple.Finder AppleShowAllFiles YES

# safari debug menu
defaults write com.apple.safari IncludeDebugMenu -bool YES

# dock invisible icons
defaults write com.apple.Dock showhidden -boolean YES

# dock show itunes title when start playing them
defaults write com.apple.dock itunes=notifications -bool TRUE

# make dock really small
defaults write com.apple.dock tilesize -int 32

# dock restart
killall Dock

# no report when app crashes
defaults write com.apple.CrashReporter DialogType none

# performance > security, don't verify DMG :)
defaults write com.apple.frameworks.diskimages skip-verify -bool YES

# save dialogs extended on default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool YES

# login screen
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo

# show disks on desk
defaults write com.apple.finder ShowMountedServersOnDesktop 1

# enable retina support on non-retina mac
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool YES

# fast key repeat rates for keyboard
defaults write com.apple.universalaccess slowKey -int 0 # Disable Slow Keys.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE # Disable Press-And-Hold for keys.
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Set key repeat triggering delay to even shorter.
defaults write NSGlobalDomain KeyRepeat -int 3 # Set key repeat rate to even faster.
echo "This changes are only available after `reboot`"

# enable CUPS on http://localhost:631
sudo cupsctl WebInterface=yes

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true
