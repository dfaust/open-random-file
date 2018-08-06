#!/bin/bash

desktop_file='open-random-file.desktop'
script_file='open-random-file.sh'

if [ `which kf5-config` ]; then
    kde_config_services=`kf5-config --path services`

    IFS=":"

    for p in $kde_config_services; do
        desktop_file_path="$p/$desktop_file"
        script_file_path="$p/$script_file"

        if [ -f "$desktop_file_path" ]; then
            echo "removing file: $desktop_file_path"
            rm "$desktop_file_path"
        fi

        if [ -f "$script_file_path" ]; then
            echo "removing file: $script_file_path"
            rm "$script_file_path"
        fi
    done
fi
