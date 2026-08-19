#!/usr/bin/env python3

import json
import subprocess

layouts = {
    "BSP": "bsp",
    "Columns": "columns",
    "Floating": "floating",
    "Matrix": "matrix",
    "Maximized": "max",
    "Monad Tall": "monadtall",
    "Monad Three Column": "monadthreecol",
    "Monad Wide": "monadwide",
    "Plasma": "plasma",
    "Ratio Tile": "ratiotile",
    "Screen Split": "screensplit",
    "Slice": "slice",
    "Spiral": "spiral",
    "Stack": "stack",
    "Tile": "tile",
    "Tree Tab": "treetab",
    "Vertical Tile": "verticaltile",
    "Zoomy": "zoomy",
}


def qtile(*args):
    result = subprocess.run(
        ["qtile", "cmd-obj", *args],
        capture_output=True,
        text=True,
        check=True,
    )
    return result.stdout.strip()


def get_current_layout():
    output = qtile(
        "-o",
        "layout",
        "-f",
        "info",
    )

    return json.loads(output)["name"]


def get_display_name(qtile_name):
    for display_name, internal_name in layouts.items():
        if internal_name == qtile_name:
            return display_name

    return qtile_name


def select_layout(current):
    current_display = get_display_name(current)

    options = []

    for name in layouts:
        if name == current_display:
            options.append(f"✓ {name}")
        else:
            options.append(name)

    result = subprocess.run(
        [
            "rofi",
            "-dmenu",
            "-i",
            "-p",
            f"Layout ({current_display}):",
        ],
        input="\n".join(options),
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        return None

    selected = result.stdout.strip()

    if not selected:
        return None

    if selected.startswith("✓ "):
        selected = selected[2:]

    return selected


def change_layout(display_name):
    internal_name = layouts[display_name]

    qtile(
        "-o",
        "group",
        "-f",
        "setlayout",
        "-a",
        internal_name,
    )


def notify(display_name):
    subprocess.Popen(
        [
            "notify-send",
            "-a",
            "Qtile Layout Changed",
            "-u",
            "low",
            "-t",
            "3000",
            "-h",
            "string:x-canonical-private-synchronous:qtile-layout",
            "Layout Changed",
            display_name,
        ]
    )


def main():
    current = get_current_layout()
    selected = select_layout(current)

    if selected is None:
        return

    if selected not in layouts:
        return

    if layouts[selected] == current:
        return

    change_layout(selected)
    notify(selected)


if __name__ == "__main__":
    main()
