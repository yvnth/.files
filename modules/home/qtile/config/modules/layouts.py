from libqtile import layout
from libqtile.config import Match

BORDER_FOCUS = "#f4b8e4"
BORDER_NORMAL = "#000000"
BORDER_WIDTH = 3
MARGIN = 3

layout_defaults = {
    "border_focus": BORDER_FOCUS,
    "border_normal": BORDER_NORMAL,
    "border_width": BORDER_WIDTH,
    "border_on_single": True,
    "margin": MARGIN,
}

plasma_defaults = {
    "border_focus": BORDER_FOCUS,
    "border_normal": BORDER_NORMAL,
    "border_focus_fixed": BORDER_FOCUS,
    "border_normal_fixed": BORDER_NORMAL,
    "border_width": BORDER_WIDTH,
    "border_width_single": BORDER_WIDTH,
    "margin": MARGIN,
}

layouts = [
    layout.MonadTall(
        **layout_defaults,
    ),
    layout.Plasma(
        **plasma_defaults,
    ),
    layout.Bsp(
        **layout_defaults,
        ratio=0.5,
        grow_amount=5,
    ),
    layout.Columns(
        **layout_defaults,
    ),
    layout.Floating(
        **layout_defaults,
    ),
    layout.Matrix(
        **layout_defaults,
        columns=2,
    ),
    layout.Max(
        **layout_defaults,
    ),
    layout.MonadThreeCol(
        **layout_defaults,
    ),
    layout.MonadWide(
        **layout_defaults,
    ),
    layout.RatioTile(
        **layout_defaults,
    ),
    layout.ScreenSplit(
        **layout_defaults,
    ),
    layout.Slice(
        **layout_defaults,
    ),
    layout.Spiral(
        **layout_defaults,
    ),
    layout.Stack(
        **layout_defaults,
        num_stacks=2,
    ),
    layout.Tile(
        **layout_defaults,
    ),
    layout.TreeTab(
        **layout_defaults,
    ),
    layout.VerticalTile(
        **layout_defaults,
    ),
    layout.Zoomy(
        **layout_defaults,
    ),
]

floating_layout = layout.Floating(
    border_focus=BORDER_FOCUS,
    border_normal=BORDER_NORMAL,
    border_width=BORDER_WIDTH,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
)
