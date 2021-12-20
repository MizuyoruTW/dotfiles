#!/bin/bash

task=$(rofi -sep "|" -dmenu<<< "Power off|Restart|Suspend|Cancel")
choice="Cancel"
if [ "$task" = "Power off" -o "$task" = "Restart" -o "$task" = "Suspend" ]; then
    choice=$(rofi -dmenu -sep "|" <<< "$task|Cancel")
fi

case "$choice" in
    "Power off") systemctl poweroff 
    ;;

    "Restart") systemctl reboot
    ;;

    "Suspend") systemctl suspend
    ;;

esac
