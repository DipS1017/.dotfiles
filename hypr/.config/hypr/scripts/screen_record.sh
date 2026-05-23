#!/usr/bin/env bash
# Toggle wf-recorder: region select with slurp on start, SIGINT to stop cleanly.

OUTPUT_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}/Recordings"
mkdir -p "$OUTPUT_DIR"

if pgrep -x wf-recorder >/dev/null; then
    pkill -INT -x wf-recorder
    notify-send "Screen Recording" "Stopped — saved to $OUTPUT_DIR"
    exit 0
fi

GEOMETRY=$(slurp) || exit 0

FILE="$OUTPUT_DIR/recording-$(date +%Y%m%d-%H%M%S).mp4"
notify-send "Screen Recording" "Started — press the same keybind to stop"
wf-recorder -g "$GEOMETRY" -f "$FILE"
