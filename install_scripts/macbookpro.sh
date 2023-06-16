#!/bin/sh
xargs brew install < brew.install


# Don't forget to install rescuetime, chrome & firefox, webstorm, and ohmyzsh?, iterm2, install new version of vim (maybe also create alias vim to point to new version)

# After installing firefox, install 'search bar' similar to chrome with these instructions
# 1. settings->troubleshooting information (find path profile folder) -> 'open folder'
# 2. create directory "chrome" and copy userContent.css and userChrome.css into folder

# if moving computers you can copy robo3t connections config: ~/.3T/robo-3t/1.2.1/robo3t.json or copy just key 'connections'
# in gitignore, put name and email

# install fonts for iterm2:
#git clone https://github.com/powerline/fonts.git --depth=1
#cd fonts
#./install.sh
#cd ..
#trash fonts

# when installing iterm2:
# on iterm2, go to profile, settings, colors, put solarized dark, change background to black, and Profile>Text set font as 'Meslo LG S Regular for Powerline'
# or copy settings file from computer to computer into Library/Application Support/iTerm2/DynamicProfiles

# on iterm2 change keymapping to Natural Text Editing:
  # Go to iTerm2 (in the menu bar) > Settings... > Profiles > Keys (not Preferences... > Keys)
  # On current versions (3.14+) you then switch to the Key Mappings tab
  # Press Presets... dropdown button.
  # Select Natural Text Editing

# disable CAPSLOCK key, switch it to esc
