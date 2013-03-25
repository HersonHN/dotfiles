#!/usr/bin/env bash

chdirs() {
    for X in $( ls -p | grep / )
    do
        echo "chmod -R 755 $X" | sh
    done
}

chfiles() {
    for X in $( ls -p | grep -v / )
    do
        echo "chmod -R 644 $X" | sh
    done
}

BAR="$(pwd)"
echo $BAR

for FOO in $( ls -R | grep ":$" | sed -e 's/:$//' )
do
    BAZ="$BAR/$FOO"
    echo "Accesing: $BAZ"
    chfiles
    chdirs
done
