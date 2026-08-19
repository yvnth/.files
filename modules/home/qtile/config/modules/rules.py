from libqtile.config import Click, Drag, Group, Match, Rule
from libqtile.lazy import lazy

from .env import mod

groups = [Group(i) for i in "123456789"]

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click(
        [mod],
        "Button2",
        lazy.window.bring_to_front(),
    ),
]

dgroups_key_binder = None

dgroups_app_rules = [
    Rule(
        Match(wm_class="firefox-devedition"),
        group="2",
    ),
    Rule(
        Match(wm_class="jetbrains-idea"),
        group="3",
    ),
    Rule(
        Match(wm_class="emacs"),
        group="4",
    ),
    Rule(
        Match(wm_class="code"),
        group="5",
    ),
    Rule(
        Match(wm_class="vesktop"),
        group="8",
    ),
    Rule(
        Match(wm_class="spotify"),
        group="9",
    ),
]
