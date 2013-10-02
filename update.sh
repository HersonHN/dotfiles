#!/bin/bash

function append_text() {
    ## Only append the text once
    if [[ $(grep -s "$1" "$2" | wc -l | tr -d " ") == "0" ]];
    then
        echo $1 >> $2
    fi
}

# giving the rights to the custom scripts
chmod 744 ~/dotfiles/bin/*

# adding the source to the .vimrc and the .bashrc
append_text "source ~/dotfiles/vimrc.vim" "$HOME/.vimrc"
append_text "source ~/dotfiles/bashrc.sh" "$HOME/.bashrc"
append_text "source ~/dotfiles/bashrc.sh" "$HOME/.bash_profile"

# copying all the generic files to home

ls -1a "generic/" | rgrep -v '\.$' | while read filename
do
    cp -R "generic/$filename" ~
done

