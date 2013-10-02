#!/usr/bin/env bash

if [ ! -d ~/dotfiles ]
then
    echo "Dotfiles instalation must be on $HOME"
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

# running the installation via update.sh
bash "~/dotfiles/update.sh"

echo "dotfiles installed"

