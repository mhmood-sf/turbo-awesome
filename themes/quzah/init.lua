local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

local THEME_DIR = THEMES .. "/quzah"

--[[

"dark": {
    "shade0": "#17171C",
    "shade1": "#222430",
    "shade2": "#3E4856",
    "shade3": "#5B697B",
    "shade4": "#CBD1EC",
    "shade5": "#DADEF1",
    "shade6": "#E5E9F0",
    "shade7": "#ECEFF4",
    "accent0": "#EF476F",
    "accent1": "#F1A071",
    "accent2": "#FADD5C",
    "accent3": "#66DB8D",
    "accent4": "#4ECDC4",
    "accent5": "#669BD0",
    "accent6": "#F97FDD",
    "accent7": "#AE7BFF"
}

--]]

local theme = {}

theme.colors = {
    red    = "#EF476F",
    cyan   = "#4ECDC4",
    grey   = "#3E4856",
    purple = "#AE7BFF",
    pink   = "#F97FDD",
    black  = "#17171C",
    green  = "#66DB8D",
    white  = "#ECEFF4",
    yellow = "#FADD5C",
    orange = "#F1A071",
    blue   = "#669BD0",
    alt_black = "#222430"
}

theme.colors.accent = theme.colors.blue
theme.colors.bg_normal = theme.colors.black
theme.colors.fg_normal = theme.colors.white
theme.colors.bg_focus = theme.colors.black
theme.colors.fg_focus = theme.colors.accent
theme.colors.bg_error = theme.colors.red
theme.colors.fg_error = theme.colors.black
theme.colors.bg_empty = theme.colors.black
theme.colors.fg_empty = theme.colors.grey
theme.colors.prominent = theme.colors.green

local color = theme.colors

theme.font          = "Cascadia Code PL 9.5"

theme.bg_normal     = color.bg_normal
theme.fg_normal     = color.fg_normal

theme.bg_focus      = color.bg_focus
theme.fg_focus      = color.fg_focus

theme.bg_urgent     = color.bg_error
theme.fg_urgent     = color.fg_error

theme.bg_minimize   = color.alt_black
theme.fg_minimize   = color.white

theme.bg_systray    = color.bg_normal

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(2)
theme.border_normal = color.alt_black
theme.border_focus  = color.accent
theme.border_marked = color.prominent

-- Taglist
theme.taglist_font = "Cascadia Code PL 11"

theme.taglist_bg_focus = color.bg_normal
theme.taglist_fg_focus = color.fg_normal

theme.taglist_bg_urgent = color.bg_normal
theme.taglist_fg_urgent = color.fg_error

theme.taglist_bg_occupied = color.bg_normal
theme.taglist_fg_occupied = color.accent

theme.taglist_bg_empty = color.bg_normal
theme.taglist_fg_empty = color.fg_empty

theme.taglist_bg_volatile = color.bg_normal
theme.taglist_fg_volatile = color.fg_error

--[[
-- Taglist squares:
local taglist_square_size = dpi(7)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, color.alt_black
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, color.white
)
--]]

-- Tasklist
theme.tasklist_bg_focus = color.bg_focus
theme.tasklist_fg_focus = color.fg_focus

theme.tasklist_bg_urgent = color.bg_error
theme.tasklist_fg_urgent = color.fg_error

theme.tasklist_disable_icon = true

-- Titlebar
theme.titlebar_bg_normal = color.bg_normal
theme.titlebar_fg_normal = color.fg_normal

theme.titlebar_bg_focus = color.bg_focus
theme.titlebar_fg_focus = color.fg_focus

theme.titlebar_quit_color = color.red
theme.titlebar_maximize_color = color.blue
theme.titlebar_minimize_color = color.orange

-- Hotkeys
theme.hotkeys_bg = color.black
theme.hotkeys_fg = color.white
theme.hotkeys_font = "monospace 9"
theme.hotkeys_description_font = "monospace 8"
theme.hotkeys_border_width = 2
theme.hotkeys_border_color = color.accent
theme.hotkeys_shape = nil
theme.hotkeys_modifiers_fg = color.grey

-- Menu
theme.menu_bg_focus = color.blue
theme.menu_fg_focus = color.white

-- Notifications
theme.notification_font = "Cascadia Code PL 10"
theme.notification_bg = color.prominent
theme.notification_fg = color.black
theme.notification_error_bg = color.red
theme.notification_error_fg = color.alt_black
theme.notification_border_width = 0
theme.notification_margin = 10

-- Infocus
theme.infocus_bg = color.blue
theme.infocus_fg = color.black
theme.infocus_font = "Cascadia Code PL Semibold 9.5"

-- Source: https://github.com/catppuccin/wallpapers/blob/main/mandelbrot/mandelbrot_full_magenta.png
theme.wallpaper = THEME_DIR .. "/wallpaper.png"

-- TODO: Rename ALL icons to follow the following format:
-- TODO: <namespace>-<modifiers>-<"fill"|"no-fill">-<"light"-"dark"-"color">.<"png"|"svg">
theme.icons = require "themes.icons"

theme.layout_floating = theme.icons.layout.floating
theme.layout_spiral   = theme.icons.layout.spiral

theme.rofi = THEME_DIR .. "/rofi.rasi"

return theme
