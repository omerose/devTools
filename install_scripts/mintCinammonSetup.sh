#!/bin/sh

# this file installs a bunch of useful stuff for mint cinammo 
# to install run from your "~" directory "sudo ~/devTools/install_scripts/mintCinammonSetup.sh"
# Also make sure this is installed in ~/devTools
# Don't forget to run bashNDotfiles.sh as well from home directory

# variable used to store actions to take after install script is done
remindVar="reminders:"
apt-get update  # To get the latest package lists

# install trash-cli to allow rebind of rm
sudo apt-get install trash-cli

# git version control
# probably have this already if you got this directory
# apt-get install git -y

# vlc media player
apt-get install vlc-nox -y

# GIF creator
add-apt-repository ppa:fossfreedom/byzanz
apt-get update
apt-get install byzanz
mkdir ~/.gifs #directory for gifs storage

# snipping tool
add-apt-repository ppa:shutter/ppa
apt-get update
apt-get install shutter

# compiz config, custom configuration of buttons and other
apt-get install compizconfig-settings-manager -y
apt-get update && sudo apt-get install compiz-plugins -y
# Didn't really need compiz modifications, did most modifications through settings menu on mint
remindVar="$remindVar\n launch compiz, and got to themes or modify put key"

# puush, create and send screenshots quickly, install xclip dependency
apt-get install xclip -y
mkdir ~/puush; cd ~/puush
git clone https://github.com/sunmockyang/puush-linux.git
cd -
cd ~/puush/puush-linux/src
cp config.py.dist config.py
cd -
remindVar="$remindVar\n puush: setup API in PUUSH file inside ~/puush/puush-linux/PUUSH, chmod permission on PUUSH, and create shortcut for 'puush -b to $ and puush -d U' in compiz keboard config"

# htop, monitoring tool for system resources, useful for servers and desktop
apt-get install htop -y

# redshift (alternative to flux), turns screen to reddish at night (eases strain on eyes)
# tried flux, will see if it works on restart

#apt-get install redshift redshift-gtk -y
# disable for now
#gtk-redshift -l 43:-79 & # setup for toronto, autorun in background using nohup, for new lat:long http://itouchmap.com/latlong.html
remindVar="$remindVar\n click redshift and add autostart functionality"

# notepad++, text editor for notes (good autosave on crash feature)
add-apt-repository ppa:notepadqq-team/notepadqq -y
apt-get update
apt-get install notepadqq -y

# gimp, paint/photoshop for ubuntu
apt-get gimp

# vim file editor, grabbing gnome version that is has xterm (for copy paste functionality)_and auto-completion plugin works
# need to install vim-nox for lua support and neocomplete plugin
apt-get install vim-gnome
apt-get install vim-nox
remindVar="$remindVar\n open vim and type :PluginInstall to install the bundles"

# node version manager (nvm), npm. Used to develop node apps. Also setting node to version using at the moment 6.7.0
remindVar="$remindVar\n Use nvm, test it's working. Currently using version 6.7.0 in projects"
apt-get install npm -y

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
nvm install 6.7.0


# Installing yarn, faster version of npm to install packages
#ORIGINAL COMMAND: I removed sudo, let's see if this works still
#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn -y




# reminders for actions to take after install script is done
remindVar="$remindVar\n setup launcher-panel: notepad++, chrome, cmd/terminal, devtool (webstorm), filesystem, gitter, anki, other "

remindVar="$remindVar\n google chrome, login for extensions"

remindVar="$remindVar\n check if python is installed (was pre-installed on cinammon)"

# password management system
remindVar="$remindVar\n install lastpass"

# javascript IDE
remindVar="$remindVar\n get webstorm (see this shellscript file for instruction on JDK installation first, install vim plugin"

remindVar="$remindVar\n setup terminal look. I have under General Custom font Monospace Regular. at Colours:  build-in scheme: Gray on black, palette Linux console."

remindVar="$remindVar\n Disable system sounds in 'sound' menu, disalbed all but pluggin unplugging device"

remindVar="$remindVar\n Rebind lock-screen to Super+L (will remove looking glass <- seems useless)"
remindVar="$remindVar\n Rebind inter-monitor left and right to alt+super L and R arrows"
remindVar="$remindVar\n Disable middle click to close window inside 'right click on taskbar and configure windows'"
remindVar="$remindVar\n Switch all fonts to monospace, and antialiasing to grayscale or else titles won't display properly"
remindVar="$remindVar\n shortcut to terminal super 3, super 2 browser, super 1 notepad"
remindVar="$remindVar\n go into bash file and fix bash completion script"
remindVar="$remindVar\n '%b %d %l:%M %p' change calander date format"
remindVar="$remindVar\n Check if when battery is critical, laptop goes to hibernate, this was not on by default, also option was missing from power menu. Read this post, has commands to view your current settings, and set them to an appropriate level https://github.com/linuxmint/Cinnamon/issues/4367"


# install JDK for webstorm to work
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo mkdir -p /usr/lib/mozilla/plugins #just in case, this will be added to the package in the next version
#sudo apt-get install oracle-jdk7-installer 
# also get webstorm, unpack, extract to a folder, then link webstorm/bin/webstorm.sh to bin

printf "$remindVar\n"
