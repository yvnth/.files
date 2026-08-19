import os
import subprocess

from libqtile import hook


@hook.subscribe.startup_once
def autostart():
    os.environ["XDG_CURRENT_DESKTOP"] = "qtile"
    os.environ["XDG_SESSION_TYPE"] = "wayland"

    subprocess.run(
        [
            "dbus-update-activation-environment",
            "--systemd",
            "WAYLAND_DISPLAY",
            "XDG_CURRENT_DESKTOP",
            "XDG_SESSION_TYPE",
        ],
        check=False,
    )

    subprocess.run(
        [
            "systemctl",
            "--user",
            "import-environment",
            "WAYLAND_DISPLAY",
            "XDG_CURRENT_DESKTOP",
            "XDG_SESSION_TYPE",
        ],
        check=False,
    )

    autostart_cmds = [
        "mako",
        "wl-paste --type text --watch cliphist store",
        "wl-paste --type image --watch cliphist store",
        "waytrogen --restore",
        os.path.expanduser(
            "~/.config/qtile/scripts/battery-warning.sh"
        ),
    ]

    for cmd in autostart_cmds:
        subprocess.Popen(cmd, shell=True)
