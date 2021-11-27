#!/bin/bash
readarray file_list < <(find ~/Pictures/wallpaper -type f)
file_list=( $(shuf -e "${file_list[@]}") )
while true
do
    for file in "${file_list[@]}"
    do
        feh --bg-fill "$file"
        sleep 1800
    done
done
