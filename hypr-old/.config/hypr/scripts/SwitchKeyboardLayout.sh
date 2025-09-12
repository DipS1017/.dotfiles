
#!/bin/bash

layout_file="$HOME/.cache/kb_layout"
settings_file="$HOME/.config/hypr/UserConfigs/UserSettings.conf"
notif_icon="$HOME/.config/swaync/images/ja.png"

# Get layouts and variants
layout_line=$(grep 'kb_layout' "$settings_file" | cut -d '=' -f2 | tr -d '[:space:]')
variant_line=$(grep 'kb_variant' "$settings_file" | cut -d '=' -f2 | tr -d '[:space:]')
IFS=',' read -r -a layouts <<< "$layout_line"
IFS=',' read -r -a variants <<< "$variant_line"

layout_count=${#layouts[@]}

# Read current index
if [ -f "$layout_file" ]; then
    current_index=$(cat "$layout_file")
else
    current_index=0
fi

next_index=$(( (current_index + 1) % layout_count ))
new_layout="${layouts[$next_index]}"
new_variant="${variants[$next_index]}"

# Apply layout to all non-ignored keyboards
keyboards=$(hyprctl devices -j | jq -r '.keyboards[].name')
for kb in $keyboards; do
    hyprctl switchxkblayout "$kb" "$next_index"
done

# Notify
notify-send -u low -i "$notif_icon" "Keyboard Layout: $new_layout${new_variant:+ ($new_variant)}"

# Save new index
echo "$next_index" > "$layout_file"

