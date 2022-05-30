local frappe = {
    rosewater = "#f2d5cf",
    flamingo = "#eebebe",
    pink = "#f4b8e4",
    mauve = "#ca9ee6",
    red = "#e78284",
    maroon = "#ea999c",
    peach = "#ef9f76",
    yellow = "#e5c890",
    green = "#a6d189",
    teal = "#81c8be",
    sky = "#99d1db",
    sapphire = "#85c1dc",
    blue = "#8caaee",
    lavender = "#babbf1",
    text = "#c6d0f5",
    subtext1 = "#b5bfe2",
    subtext0 = "#a5adce",
    overlay2 = "#949cbb",
    overlay1 = "#838ba7",
    overlay0 = "#737994",
    surface2 = "#626880",
    surface1 = "#51576d",
    surface0 = "#414559",
    base = "#303446",
    mantle = "#292c3c",
    crust = "#232634",

}

-- Standard colors
frappe.yellow = frappe.yellow
frappe.orange = frappe.peach
frappe.purple = frappe.mauve
frappe.green = frappe.green
frappe.black = frappe.base
frappe.white = frappe.text
frappe.pink = frappe.pink
frappe.blue = frappe.blue
frappe.grey = frappe.surface0
frappe.red = frappe.red
frappe.fg = frappe.white
frappe.bg = frappe.black

local set_variant = require "themes.catppuccin"
return set_variant(frappe)
