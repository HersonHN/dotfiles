#!/usr/bin/env bash

if [ ! -d ~/dotfiles ]
then
    echo "Dotfiles instalation must be on the user's home folder"
    exit 1
fi

# Install it only once.
if grep -Fxq "source ~/dotfiles/vimrc.vim" ~/.vimrc
then
    echo "Already Installed!"
    exit 1
fi

# Making backups
if [ -d ~/.vim ]
then
    echo "Backup of .vim directory created at .vim-backup"
    mv ~/.vim ~/.vim-backup
fi

# link the .vim folder
ln -s ~/dotfiles/VIM ~/.vim

# adding the source to the .vimrc and the .bashrc
echo "source ~/dotfiles/vimrc.vim" >> ~/.vimrc
echo "source ~/dotfiles/bashrc.sh" >> ~/.bashrc
echo "source ~/dotfiles/bashrc.sh" >> ~/.bash_profile

# giving the rights to the custom scripts
chmod 744 ~/dotfiles/bin/*

echo "dotfiles installed"
