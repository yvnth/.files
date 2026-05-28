#!/usr/bin/env bash
set -euo pipefail

layouts=(
  "dwindle"
  "master"
  "scrolling"
  "monocle"
)

selected="$(
  printf '%s\n' "${layouts[@]}" | \
    fuzzel --dmenu --prompt="Layout > "
)"

[[ -z "$selected" ]] && exit 0

hyprctl eval "
  hl.config({
    general = {
      layout = '$selected'
    }
  })
"

notify-send \
  -e \
  -u low \
  "$selected layout enabled"
