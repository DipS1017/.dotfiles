
#!/usr/bin/env bash
layout_file="$HOME/.cache/kb_layout"
settings_file="$HOME/.config/hypr/conf/input.conf"
notif_icon="$HOME/.config/swaync/icons/keyboard.png"

if [ ! -f "$settings_file" ]; then
    notify-send -u low -i "$notif_icon" "Keyboard Layout" "Missing config: $settings_file"
    exit 1
fi

# Extract layouts and variants from input.conf
layout_line=$(grep 'kb_layout' "$settings_file" | cut -d '=' -f2 | tr -d '[:space:]')
variant_line=$(grep 'kb_variant' "$settings_file" | cut -d '=' -f2 | tr -d '[:space:]')

IFS=',' read -r -a layouts <<< "$layout_line"
IFS=',' read -r -a variants <<< "$variant_line"

layout_count=${#layouts[@]}

# Guard against empty config
if [ "$layout_count" -eq 0 ]; then
    notify-send -u low -i "$notif_icon" "Keyboard Layout" "No kb_layout found in $settings_file"
    exit 1
fi

# Read current index (default = 0)
if [ -f "$layout_file" ]; then
    current_index=$(cat "$layout_file")
else
    current_index=0
fi

# Compute next index
next_index=$(( (current_index + 1) % layout_count ))
new_layout="${layouts[$next_index]}"
new_variant="${variants[$next_index]}"

# Apply layout to all keyboards
keyboards=$(hyprctl devices -j | jq -r '.keyboards[].name')
for kb in $keyboards; do
    hyprctl switchxkblayout "$kb" "$next_index"
done

# Notify
notify-send -u low -i "$notif_icon" \
    "Keyboard Layout: $new_layout${new_variant:+ ($new_variant)}"

# Save state
echo "$next_index" > "$layout_file"

