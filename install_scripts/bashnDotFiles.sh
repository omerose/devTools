#!/bin/sh 

# create directories for vim
mkdir ~/.vim
mkdir ~/.vim/backup
mkdir ~/.vim/swp
mkdir ~/.vim/undo


# grab .files and link them
ln -s ~/devTools/symlinks/dotfiles/.aliases ~
ln -s ~/devTools/symlinks/dotfiles/.bashrc ~
ln -s ~/devTools/symlinks/dotfiles/.gitconfig ~
ln -s ~/devTools/symlinks/dotfiles/.gitignore_global ~
ln -s ~/devTools/symlinks/dotfiles/.gitmessage.txt ~
ln -s ~/devTools/symlinks/dotfiles/.ideavimrc ~
ln -s ~/devTools/symlinks/dotfiles/.tmux.conf ~
ln -s ~/devTools/symlinks/dotfiles/.vimrc ~
ln -s ~/devTools/symlinks/dotfiles/.vimrc.bundles ~
ln -s ~/devTools/symlinks/dotfiles/.createGif.sh ~


bash
