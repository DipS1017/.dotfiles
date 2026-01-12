
#!/usr/bin/env bash
set -euo pipefail

ws="${1:-}"
[ -z "$ws" ] && exit 1

command -v hyprctl >/dev/null 2>&1 || exit 0

clients_json="$(hyprctl -j clients 2>/dev/null || true)"

for s in discord slack spotify; do
  if printf "%s\n" "$clients_json" | grep -q "\"workspace\":{[^}]*\"name\":\"special:$s\""; then
    hyprctl dispatch togglespecialworkspace "$s"
  fi
done

# NOW switch workspace
hyprctl dispatch workspace "$ws"

