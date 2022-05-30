local latte = {
    rosewater = "#dc8a78",
    flamingo = "#dd7878",
    pink = "#ea76cb",
    mauve = "#8839ef",
    red = "#d20f39",
    maroon = "#e64553",
    peach = "#fe640b",
    yellow = "#df8e1d",
    green = "#40a02b",
    teal = "#179299",
    sky = "#04a5e5",
    sapphire = "#209fb5",
    blue = "#1e66f5",
    lavender = "#7287fd",
    text = "#4c4f69",
    subtext1 = "#5c5f77",
    subtext0 = "#6c6f85",
    overlay2 = "#7c7f93",
    overlay1 = "#8c8fa1",
    overlay0 = "#9ca0b0",
    surface2 = "#acb0be",
    surface1 = "#bcc0cc",
    surface0 = "#ccd0da",
    base = "#eff1f5",
    mantle = "#e6e9ef",
    crust = "#dce0e8",
}

-- Standard colors
latte.yellow = latte.yellow
latte.orange = latte.peach
latte.purple = latte.mauve
latte.green = latte.green
latte.black = latte.text
latte.white = latte.base
latte.pink = latte.pink
latte.blue = latte.blue
latte.grey = latte.surface0
latte.red = latte.red
latte.fg = latte.black
latte.bg = latte.white

local set_variant = require "themes.catppuccin"
return set_variant(latte)
