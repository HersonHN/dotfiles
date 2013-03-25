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
mv ~/.vim ~/.vim-backup

# link the .vim folder
ln -s ~/dotfiles/VIM ~/.vim

# adding the source to the .vimrc and the .bashrc
echo "source ~/dotfiles/vimrc.vim" >> ~/.vimrc
echo "source ~/dotfiles/bashrc.sh" >> ~/.bashrc
