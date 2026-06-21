#!/usr/bin/env bash

xdg-desktop-portal-wlr >/dev/null 2>&1 &
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
