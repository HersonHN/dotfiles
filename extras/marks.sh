
# From the "Quickly navigate your filesystem from the command-line" post by Jeroen Janssens
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html

export MARKPATH=$HOME/.marks

function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {

    if [[ ! -d "$MARKPATH" ]]; then
        echo "There are no marks yet"
        return
    fi

    if [[ `uname` == 'Darwin' ]]; then
        ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
    else
        ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
    fi

}

