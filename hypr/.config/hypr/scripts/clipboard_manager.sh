

#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */ ##
# Clipboard Manager (Text default, Image via side key)
# Hyprland / Wayland compatible

rofi_theme="$HOME/.config/rofi/config-clipboard.rasi"

msg_text='📋 | ALT+I = Images | CTRL+DEL = delete | ALT+DEL = wipe'
msg_image='🖼 | ALT+T = Text | CTRL+DEL = delete | ALT+DEL = wipe'

mode="text"

# Kill running rofi
pidof rofi >/dev/null && pkill rofi

while true; do
    if [ "$mode" = "text" ]; then
        list_cmd="cliphist list | grep -v '^image/'"
        msg="$msg_text"
    else
        list_cmd="cliphist list | grep '^image/'"
        msg="$msg_image"
    fi

    result=$(
        eval "$list_cmd" | rofi -i -dmenu \
            -kb-custom-1 "Control-Delete" \
            -kb-custom-2 "Alt-Delete" \
            -kb-custom-3 "Alt-i" \
            -kb-custom-4 "Alt-t" \
            -config "$rofi_theme" \
            -mesg "$msg"
    )

    case "$?" in
        1) exit ;; # ESC
        0) # ENTER
            [ -n "$result" ] && cliphist decode <<<"$result" | wl-copy && exit
            ;;
        10) # CTRL+DEL
            [ -n "$result" ] && cliphist delete <<<"$result"
            ;;
        11) # ALT+DEL
            cliphist wipe
            exit
            ;;
        12) # ALT+I → switch to images
            mode="image"
            ;;
        13) # ALT+T → switch to text
            mode="text"
            ;;
    esac
done

