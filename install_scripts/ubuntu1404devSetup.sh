#!/bin/sh

# this file installs a bunch of useful stuff on ubuntu 14.04
# to install run from your "~" directory "sudo <location of this file>"

# variable used to store actions to take after install script is done
remindVar="reminders:"
apt-get update  # To get the latest package lists

# git version control
apt-get install git -y

# download sites for offline viewing
apt-get install httrack

# launching icons not always gives focus, temp fix
dconf write /org/compiz/profiles/unity/plugins/core/focus-prevention-level 0

# vlc media player
apt-get install vlc-nox -y

# GIF creator
add-apt-repository ppa:fossfreedom/byzanz
apt-get update
apt-get install byzanz
mkdir ~/.gifs #directory for gifs storage

# compiz config, allows moving windows from screen to screen with "super key" + z
apt-get install compizconfig-settings-manager -y
apt-get update && sudo apt-get install compiz-plugins -y
remindVar="$remindVar\n launch compiz, and got to themes or modify put key"

# GNOME, GUI for 
apt-get install ubuntu-gnome-desktop -y
remindVar="$remindVar\n gnome: log-out and back in, install a theme. or see compiz to change to dark theme"

# puush, create and send screenshots quickly, install xclip dependency
apt-get install xclip -y
mkdir ~/puush; cd ~/puush
git clone https://github.com/sunmockyang/puush-linux.git
cd -
cd ~/puush/puush-linux/src
cp config.py.dist config.py
cd -
remindVar="$remindVar\n puush: setup API in PUUSH file inside ~/puush/puush-linux/PUUSH, chmod permission on PUUSH, and create shortcut for 'puush -b to $ and puush -d U' in compiz keboard config"

# gdm, display manager works well with GNOME, allows to set default gnome as GUI shell
apt-get install gdm -y
remindVar="$remindVar\n gdm: run command 'sudo dpkg-reconfigure gdm' and select gnome as default after installing gnome"

# htop, monitoring tool for system resources, useful for servers and desktop
apt-get install htop -y

# un-rar files
apt-get install unrar -y

# redshift (alternative to flux), turns screen to reddish at night (eases strain on eyes)
#apt-get install redshift redshift-gtk -y
# disable for now
#gtk-redshift -l 43:-79 & # setup for toronto, autorun in background using nohup, for new lat:long http://itouchmap.com/latlong.html
remindVar="$remindVar\n click redshift and add autostart functionality"

# notepad++, text editor for notes (good autosave on crash feature)
add-apt-repository ppa:notepadqq-team/notepadqq -y
apt-get update
apt-get install notepadqq -y

# tmux, splitting terminal horizontally/vertically
apt-get install tmux -y

# add slack
remindVar="$remindVar\n slack for messaging"

# anki, memorization cards
remindVar="$remindVar\n install anki for memorization"

# gimp, paint/photoshop for ubuntu
apt-get gimp

# vim file editor, grabbing gnome version that is has xterm (for copy paste functionality)_and auto-completion plugin works
apt-get install vim-gnome
remindVar="$remindVar\n open vim and type :PluginInstall to install the bundles"

# nodejs, npm, and then link them to bin. Used to develop node apps
apt-get install nodejs -y
remindVar="$remindVar\n node may be old, try downloading from node website, at least v5.2 at this moment 2015-dec-16"
apt-get install npm -y
ln -s /usr/bin/nodejs /usr/bin/node

# reminders for actions to take after install script is done
remindVar="$remindVar\n setup launcher-panel: notepad++, chrome, cmd/terminal, devtool (webstorm), filesystem, gitter, anki, other "

remindVar="$remindVar\n google chrome, login for extensions"

remindVar="$remindVar\n check if python is installed (was pre-installed on ubuntu 14.4)"

# password management system
remindVar="$remindVar\n install lastpass"

# javascript IDE
remindVar="$remindVar\n get webstorm (see this shellscript file for instruction on JDK installation first, install vim plugin"

# get anki, powerful memorization software
remindVar="$remindVar\n download and install anki"

remindVar="$remindVar\n setup terminal default colors, maybe GNOME does this by default, bash can also fix this"


# install JDK for webstorm to work
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo mkdir -p /usr/lib/mozilla/plugins #just in case, this will be added to the package in the next version
#sudo apt-get install oracle-jdk7-installer 
# also get webstorm, unpack, extract to a folder, then link webstorm/bin/webstorm.sh to bin

printf "$remindVar\n"
