
#!/bin/bash

while true; do
    BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [[ "$BATTERY" -le 20 && "$STATUS" != "Charging" ]]; then
hyprctl notify 0 10000 "rgb(ff0000)" "fontsize:60 Battery LOW" 
    fi

    sleep 60
done
