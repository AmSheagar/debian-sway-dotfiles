#!/bin/sh

direction="$1"

current="$(swaymsg -t get_workspaces -r | python3 -c '
import json, sys
workspaces = json.load(sys.stdin)
focused = next((w for w in workspaces if w.get("focused")), {})
print("{}|{}".format(focused.get("output", ""), focused.get("num", 0)))
')"

output="${current%%|*}"
workspace="${current##*|}"

case "$output" in
    DP-1)
        case "$direction" in
            right) target=$((workspace + 2)) ;;
            left)  target=$((workspace - 2)) ;;
            *) exit 1 ;;
        esac
        [ "$target" -ge 1 ] || target=1
        ;;
    DP-2)
        case "$direction" in
            right) target=$((workspace + 2)) ;;
            left)  target=$((workspace - 2)) ;;
            *) exit 1 ;;
        esac
        [ "$target" -ge 2 ] || target=2
        ;;
    *)
        exit 0
        ;;
esac

swaymsg "workspace number $target"
