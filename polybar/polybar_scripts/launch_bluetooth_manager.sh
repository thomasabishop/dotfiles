#!/bin/bash
#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
    echo "%{F#66ffffff}"
else
    if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
    then
        echo ""
    fi
    echo "%{F#73fa91}"
fi



# if [ "$player_status" = "Playing" ]; then
#     echo " $(playerctl metadata artist) | $(playerctl metadata title) | $(playerctl metadata album)"
# elif [ "$player_status" = "Paused" ]; then
#     echo " $(playerctl metadata artist) | $(playerctl metadata title) | $(playerctl metadata album)"
# elif [ "$player_status" = "Stopped" ]; then
#     echo " $(playerctl metadata artist) | $(playerctl metadata title) | $(playerctl metadata album)"
# else
#     echo " Disconnected"
# fi
