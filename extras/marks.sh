#!/bin/bash

# Inspired by "Quickly navigate your filesystem from the command-line" post by Jeroen Janssens
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html

export MARKPATH=$HOME/.marks

function jump {
    cd "$(cat "$MARKPATH/$1.mark")" 2>/dev/null || echo "No such mark: $1"
}

function mark {
    local MARK="$1"
    local DIR="$(pwd)"
    echo $DIR > "$MARKPATH/$MARK.mark"
}

function unmark { 
    rm -i "$MARKPATH/$1.mark"
}

function marks {
    if [[ ! -d "$MARKPATH" ]]; then
        echo "There are no marks yet"
        return
    fi

    cd "$MARKPATH"

    for file in *.mark; do
    if [ -f "$file" ]; then
        echo "${file/\.mark/}   ->   $(cat "$file")"
    fi
    done
}

