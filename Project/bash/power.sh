#!/bin/bash

task=$(rofi -sep "|" -dmenu<<< "Power off|Restart|Suspend|Cancel")
choice="Cancel"
if [ "$task" != "Cancel" ]; then
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
