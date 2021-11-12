#!/bin/bash
while true
do
    feh --bg-fill $(find ~/Pictures/wallpaper -type f | shuf -n 1)
    sleep 1800
done
