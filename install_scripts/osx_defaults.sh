# hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool YES

# safari debug menu
defaults write com.apple.safari IncludeDebugMenu -bool YES

# dock invisible icons
defaults write com.apple.Dock showhidden -boolean YES
killall Dock

# no report when app crashes
defaults write com.apple.CrashReporter DialogType none

# performance > security, don't verify DMG :)
defaults write com.apple.frameworks.diskimages skip-verify -bool YES

# save dialogs extended on default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool YES

# login screen
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo 