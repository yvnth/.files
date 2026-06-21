#!/usr/bin/env bash
set -euo pipefail

layouts=(
  center_tile
  deck
  dwindle
  fair
  grid
  monocle
  right_tile
  scroller
  tile
  vertical_deck
  vertical_fair
  vertical_grid
  vertical_scroller
  vertical_tile
)

selected="$(
  printf '%s\n' "${layouts[@]}" |
  rofi -dmenu -i -p "Layout:"
)"

[[ -z "$selected" ]] && exit 0

mmsg dispatch setlayout,"$selected"

notify-send \
  -a "MangoWM Layout Changed" \
  -u low \
  -t 3000 \
  -h string:x-canonical-private-synchronous:mango-layout \
  -i "$HOME/.config/mango/assets/nixgo.svg" \
  " Layout Changed" \
  "$selected"
