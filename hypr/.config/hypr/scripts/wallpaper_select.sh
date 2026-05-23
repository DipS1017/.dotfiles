#!/bin/bash

# Configuration
wallDIR="/home/dips/Pictures/wallpapers"
confFile="$HOME/.config/hypr/hyprpaper.conf"
swaylockConf="$HOME/.config/swaylock/config"

# Rofi Grid Style
rofi_style="element { orientation: vertical; padding: 20px; } element-icon { size: 150px; } element-text { horizontal-align: 0.5; } listview { columns: 4; lines: 2; }"

# 1. Get the list of images
menu_list() {
    for pic in "$wallDIR"/*.{jpg,jpeg,png,webp}; do
        [ -f "$pic" ] && printf "%s\x00icon\x1f%s\n" "$(basename "$pic")" "$pic"
    done
}

# 2. Selection
choice=$(menu_list | rofi -dmenu -i -show-icons -p "󰸉 Wallpapers" -theme-str "$rofi_style")
[[ -z "$choice" ]] && exit 0
full_path="$wallDIR/$choice"

# 3. Update the config file
# Update the preload line
sed -i "s|preload = .*|preload = $full_path|" "$confFile"

# Update all 'path =' lines inside the wallpaper blocks
sed -i "s|path = .*|path = $full_path|" "$confFile"

# Sync swaylock background
[ -f "$swaylockConf" ] && sed -i "s|^image=.*|image=$full_path|" "$swaylockConf"

# 4. Apply Changes Instantly
# Preload the new image
hyprctl hyprpaper preload "$full_path"

# Apply to each monitor specifically (matching your config)
hyprctl hyprpaper wallpaper "eDP-1,$full_path"
hyprctl hyprpaper wallpaper "HDMI-A-1,$full_path"

# Clean up memory
killall hyprpaper
hyprpaper &

notify-send "Wallpaper Changed" "$choice" -i "$full_path"
