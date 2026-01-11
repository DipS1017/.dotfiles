#!/usr/bin/env bash
set -euo pipefail

if ! command -v wpctl >/dev/null 2>&1; then
  exit 0
fi

if ! command -v rofi >/dev/null 2>&1; then
  exit 0
fi

menu="$(
  wpctl status | awk '
    function tighten(s) {
      gsub(/Tiger Lake-LP Smart Sound Technology Audio Controller/, "", s);
      gsub(/USB PnP Audio Device/, "USB Audio", s);
      gsub(/ +/, " ", s);
      sub(/^ /, "", s);
      sub(/ $/, "", s);
      if (length(s) > 26) { s = substr(s, 1, 25) "..."; }
      return s;
    }
    /^Audio$/ { in_audio = 1; next; }
    in_audio && /^ ├─ Sinks:/ { in_sinks = 1; next; }
    in_audio && in_sinks && /^ ├─ Sources:/ { in_sinks = 0; next; }
    in_audio && in_sinks {
      if (match($0, /^[^0-9]*([0-9]+)\.\s+(.*)$/, m)) {
        label = m[2];
        sub(/\s*\[vol:.*$/, "", label);
        sub(/^\*\s+/, "", label);
        print tighten(label) "|" m[1];
      }
    }
  '
)"

choice="$(printf "%s\n" "$menu" | rofi -dmenu -i -p "Output")"
choice="${choice##*|}"

if [ -n "${choice:-}" ]; then
  wpctl set-default "$choice"
fi
