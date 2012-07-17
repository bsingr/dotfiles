# binary
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# rbenv plugin
cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
git clone git://github.com/felipeelias/sublime-text-2-rbenv.git rbenv

# install theme
cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
git clone git://github.com/dpree/alien-autopsy.git Alien\ Autopsy

# install settings
cp ./resources/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/
