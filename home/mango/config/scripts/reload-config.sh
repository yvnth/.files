#!/usr/bin/env bash

mmsg dispatch reload_config

notify-send \
  -a "MangoWM" \
  -u low \
  -t 3000 \
  -h string:x-canonical-private-synchronous:mango-reload \
  -i "$HOME/.config/mango/assets/nixgo.svg" \
  "󱁽 Config Reloaded" \
  "Mango configuration reloaded"
