import os

from libqtile import qtile
from libqtile.config import Key
from libqtile.lazy import lazy

from .env import mod, terminal

keys = [
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),

    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
    ),

    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
    ),

    Key(
        [mod],
        "Return",
        lazy.spawn(terminal),
    ),

    Key(
        [mod],
        "q",
        lazy.window.kill(),
    ),

    Key(
        [mod, "shift"],
        "q",
        lazy.shutdown(),
    ),

    Key(
        [mod],
        "b",
        lazy.spawn("firefox-devedition"),
    ),

    Key(
        [mod],
        "e",
        lazy.spawn("emacs"),
    ),

    Key(
        [mod],
        "p",
        lazy.spawn("rofi-pass"),
    ),

    Key(
        [mod],
        "space",
        lazy.spawn("rofi -show drun"),
    ),

    Key(
        [mod, "control"],
        "space",
        lazy.spawn(
            "sh -c 'cliphist list | "
            "rofi -dmenu | "
            "cliphist decode | "
            "wl-copy'"
        ),
    ),

    Key(
        [mod, "mod1"],
        "space",
        lazy.spawn(
            "rofimoji --selector rofi --action copy"
        ),
    ),

    Key(
        [mod, "shift"],
        "r",
        lazy.reload_config(),
    ),

    Key(
        [mod, "mod1"],
        "l",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/layout-select.py"
            )
        ),
    ),

    Key(
        [mod, "shift"],
        "Escape",
        lazy.spawn("swaylock -f"),
    ),

    Key(
        [],
        "Print",
        lazy.spawn(
            "sh -c 'grim -t ppm -g \"$(slurp)\" - | "
            "satty --filename - --fullscreen "
            "--copy-command wl-copy "
            "--output-filename ~/Pictures/screenshots/"
            "$(date +%Y-%m-%d_%H-%M-%S).png'"
        ),
    ),

    Key(
        ["shift"],
        "Print",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/screen-record.sh"
            )
        ),
    ),

    Key(
        [mod],
        "f",
        lazy.window.toggle_maximize(),
    ),

    Key(
        [mod, "shift"],
        "f",
        lazy.window.toggle_fullscreen(),
    ),

    Key(
        [mod, "shift"],
        "space",
        lazy.window.toggle_floating(),
    ),

    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/media-keys.sh vol-up"
            )
        ),
    ),

    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/media-keys.sh vol-down"
            )
        ),
    ),

    Key(
        [],
        "XF86AudioMute",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/media-keys.sh vol-mute"
            )
        ),
    ),

    Key(
        [],
        "XF86AudioMicMute",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/media-keys.sh mic-mute"
            )
        ),
    ),

    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/media-keys.sh bright-up"
            )
        ),
    ),

    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn(
            os.path.expanduser(
                "~/.config/qtile/scripts/media-keys.sh bright-down"
            )
        ),
    ),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(
                func=lambda: qtile.core.name == "wayland"
            ),
        )
    )

from libqtile.config import Key

from .env import mod

from .rules import groups

for group in groups:
    keys.extend(
        [
            Key(
                [mod],
                group.name,
                lazy.group[group.name].toscreen(),
            ),
            Key(
                [mod, "shift"],
                group.name,
                lazy.window.togroup(
                    group.name,
                    switch_group=True,
                ),
            ),
        ]
    )
