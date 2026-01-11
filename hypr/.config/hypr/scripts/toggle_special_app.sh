#!/usr/bin/env bash
set -euo pipefail

workspace="${1:-}"
launch_cmd="${2:-}"
proc_regex="${3:-}"
debounce_file="${XDG_RUNTIME_DIR:-/tmp}/hypr_toggle_special_${workspace}.ts"

if [ -z "$workspace" ] || [ -z "$launch_cmd" ] || [ -z "$proc_regex" ]; then
  echo "Usage: $0 <workspace> <launch_cmd> <proc_regex>" >&2
  exit 1
fi

now_ms=$(date +%s%3N 2>/dev/null || date +%s000)
if [ -f "$debounce_file" ]; then
  last_ms=$(cat "$debounce_file" 2>/dev/null || echo 0)
  if [ $((now_ms - last_ms)) -lt 800 ]; then
    exit 0
  fi
fi
echo "$now_ms" > "$debounce_file"

visible=$(hyprctl workspaces -j | jq -r --arg name "special:$workspace" '.[] | select(.name==$name) | .visible' | head -n 1)
if [ "$visible" = "true" ]; then
  hyprctl dispatch togglespecialworkspace "$workspace"
  exit 0
fi

if ! pgrep -f "$proc_regex" >/dev/null 2>&1; then
  setsid sh -c "$launch_cmd" >/dev/null 2>&1 &
  sleep 0.2
fi

read -r addr wsname <<<"$(hyprctl clients -j | jq -r --arg re "$proc_regex" 'map(select(.class | test($re;"i"))) | .[0] | (.address // "") + " " + (.workspace.name // "")')"

if [ -n "$addr" ]; then
  if [ "$visible" = "true" ]; then
    hyprctl dispatch focuswindow "address:$addr" >/dev/null 2>&1 || true
    exit 0
  fi
  hyprctl dispatch focuswindow "address:$addr" >/dev/null 2>&1 || true
  active_addr=$(hyprctl activewindow -j | jq -r '.address // empty')
  if [ "$active_addr" = "$addr" ]; then
    hyprctl dispatch movetoworkspacesilent "special:$workspace" >/dev/null 2>&1 || true
  fi
fi

hyprctl dispatch togglespecialworkspace "$workspace"
