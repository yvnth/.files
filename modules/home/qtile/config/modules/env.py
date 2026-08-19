import os

from libqtile.backend.wayland import InputConfig

os.environ["XCURSOR_THEME"] = "Bibata-Modern-Classic"
os.environ["XCURSOR_SIZE"] = "32"

mod = "mod4"
terminal = "kitty"

widget_defaults = {
    "font": "sans",
    "fontsize": 12,
    "padding": 3,
}

extension_defaults = widget_defaults.copy()

follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True

auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True
auto_minimize = True

wl_xcursor_theme = "Bibata-Modern-Classic"
wl_xcursor_size = 32

wl_input_rules = {
    "type:keyboard": InputConfig(
        kb_layout="us",
        kb_repeat_delay=300,
        kb_repeat_rate=50,
    ),
    "type:touchpad": InputConfig(
        tap=True,
        drag=True,
        drag_lock=True,
        natural_scroll=True,
    ),
    "type:mouse": InputConfig(
        natural_scroll=True,
    ),
}

idle_timers = []
idle_inhibitors = []

wmname = "Qtile"
