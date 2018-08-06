#!/bin/bash
#
# Copyright (C) 2018 Daniel Faust <hessijames@gmail.com>
# Liscense: MIT
#
# Opens a random file from a directory.
# The directory is searched recursively if the "-r" argument is set.
#
# Dependencies:
# kde-open
# find
# shuf
#
# Usage:
# open-random-file <directory> [-r]

directory=$1
recursive=$2

files=()
if [[ "$recursive" == "-r" ]]; then
    while IFS= read -d $'\0' -r file ; do
        files=("${files[@]}" "$file")
    done < <(find "$directory" -type f -print0)
else
    while IFS= read -d $'\0' -r file ; do
        files=("${files[@]}" "$file")
    done < <(find "$directory" -maxdepth 1 -type f -print0)
fi

index=$(shuf -i0-$((${#files[@]}-1)) -n1)

kde-open "${files[$index]}"
