#!/usr/bin/env sh

# shellcheck disable=SC2012,SC2162,SC2196,SC2126

append_text() {
    ## Only append the text once
    if [ "$(grep -s "$1" "$2" | wc -l | tr -d " ")" = "0" ];
    then
        echo "$1" >> "$2"
    fi
}

# giving the rights to the custom scripts
chmod 744 ~/dotfiles/bin/*

# adding the source to the .vimrc and the .bashrc
append_text "source ~/dotfiles/vimrc.vim" "$HOME/.vimrc"
append_text "source ~/dotfiles/zshrc.zsh" "$HOME/.zshrc"
append_text "source ~/dotfiles/bashrc.sh" "$HOME/.bashrc"
append_text "source ~/dotfiles/bashrc.sh" "$HOME/.bash_profile"


copy_and_backup() {
    # Note: to copy all files with the posibility of doing a backup
    # of the previous one, I'm using GNU's cp command which is not
    # present on macOS, that is why I include a binary for the command
    # in the bin/ folder.

    if [ "$(uname)" = 'Darwin' ]; then
        ~/dotfiles/bin/gcp -R --backup=numbered "$1" "$2"
    else
        cp -R --backup=numbered "$1" "$2"
    fi
}

# copying all the generic files to home
ls -1pa "generic/" | grep -vE '/' | while read filename
do
    copy_and_backup "generic/$filename" ~
done

# copy all the files under generic/config to ~/.config
ls -1pa "generic/config" | grep -vE '\./$' | while read filename
do
    copy_and_backup "generic/config/$filename" ~/.config
done

