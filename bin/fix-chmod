#!/usr/bin/env bash


main() {
    basedir="$(pwd)"
    echo $basedir

    ls -R | grep ":$" | while read dir
    do
        dir="${dir:2:${#dir} - 3}"
        dir="$basedir/$dir/"

        if [ -d "$dir" ] && [ ! -L "$dir" ] 
        then
            echo $dir
            echo "chmod -R 755 \"$dir\"" | sh
            chfiles "$dir"
        fi
    done
}



chfiles() {
    ls -p "$1" | grep -v "/" | while read filename
    do
        filename="$1$filename"
        if [ -f "$filename"  ] && [ ! -L "$filename" ] 
        then
            echo $filename
            echo "chmod -R 644 \"$filename\"" | sh
        fi
    done
}

main
