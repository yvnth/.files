import subprocess

from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy

BG = "#303446"
PINK = "#f4b8e4"
TEXT = "#c6d0f5"
FONT = "JetBrainsMono Nerd Font Propo Bold"

widget_defaults = dict(
    font=FONT,
    fontsize=17,
    foreground=PINK,
    background=BG,
    padding=6,
)

def audio_status():
    try:
        output = subprocess.check_output(
            ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"],
            text=True,
        ).strip()

        parts = output.split()
        volume = round(float(parts[1]) * 100)

        if "[MUTED]" in output:
            return f" {volume}%"

        if volume < 50:
            return f" {volume}%"

        return f" {volume}%"
    except (subprocess.SubprocessError, IndexError, ValueError):
        return ""

def brightness_status():
    try:
        output = subprocess.check_output(
            ["brightnessctl", "-m"],
            text=True,
        ).strip()

        parts = output.split(",")

        if len(parts) >= 4:
            return f"󰃠 {parts[3]}"

        return "󰃠"
    except (subprocess.SubprocessError, IndexError):
        return "󰃠"

def network_status():
    try:
        output = subprocess.check_output(
            [
                "nmcli",
                "-t",
                "-f",
                "TYPE,STATE,CONNECTION",
                "device",
            ],
            text=True,
        )

        for line in output.splitlines():
            parts = line.split(":", 2)

            if len(parts) == 3 and parts[0] == "wifi" and parts[1] == "connected":
                return f" {parts[2]}"

        for line in output.splitlines():
            parts = line.split(":", 2)

            if len(parts) == 3 and parts[0] == "ethernet" and parts[1] == "connected":
                return f" {parts[2]}"

        return "󰖪"
    except subprocess.SubprocessError:
        return "󰖪"

def make_workspaces():
    return widget.GroupBox(
        name="workspaces",
        highlight_method="block",
        block_highlight_text_color=BG,
        active=PINK,
        inactive=PINK,
        urgent=PINK,
        this_current_screen_border=PINK,
        this_screen_border=PINK,
        other_current_screen_border=BG,
        other_screen_border=BG,
        disable_drag=True,
        hide_unused=True,
        rounded=False,
        borderwidth=0,
        padding=7,
        margin_x=0,
        margin_y=0,
    )

def make_layout():
    return widget.CurrentLayout(
        name="layout",
        mode="text",
        foreground=PINK,
        background=BG,
        padding=7,
    )

def make_audio():
    return widget.GenPollText(
        name="audio",
        func=audio_status,
        update_interval=1,
        foreground=PINK,
        background=BG,
        padding=6,
        mouse_callbacks={
            "Button1": lazy.spawn("pavucontrol"),
        },
    )

def make_brightness():
    return widget.GenPollText(
        name="brightness",
        func=brightness_status,
        update_interval=2,
        foreground=PINK,
        background=BG,
        padding=6,
    )

def make_network():
    return widget.GenPollText(
        name="network",
        func=network_status,
        update_interval=5,
        foreground=PINK,
        background=BG,
        padding=6,
    )

def make_systray():
    return widget.StatusNotifier(
        name="systray",
        icon_size=18,
        padding=5,
        background=BG,
    )

def make_bar():
    return bar.Bar(
        [
            widget.Clock(
                name="time",
                format="%H:%M:%S",
            ),
            widget.Clock(
                name="date",
                format="%d/%m/%Y",
            ),
            widget.Memory(
                name="memory",
                format=" {MemPercent:2.0f}%",
                update_interval=2,
            ),
            widget.CPU(
                name="cpu",
                format="󰾆 {load_percent:2.0f}%",
                update_interval=2,
            ),
            widget.Spacer(),
            make_workspaces(),
            make_layout(),
            widget.Spacer(),
            make_systray(),
            widget.Battery(
                name="battery",
                format="{char} {percent:2.0%}",
                charge_char="󰂄",
                discharge_char="󰁾",
                full_char="󰁹",
                empty_char="󰁺",
                update_interval=3,
                foreground=PINK,
                background=BG,
            ),
            make_audio(),
            make_brightness(),
            make_network(),
        ],
        28,
        background=BG,
        margin=0,
        border_width=0,
    )

screens = [
    Screen(
        top=make_bar(),
    ),
]
