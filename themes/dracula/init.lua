local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

local THEME_DIR = THEMES .. "/dracula"

local theme = {}

theme.color = {
    black  = "#282a36",
    dark   = "#6272a4",
    light  = "#44475a",
    white  = "#f8f8f2",
    red    = "#ff5555",
    orange = "#ffb86c",
    yellow = "#f1fa8c",
    green  = "#50fa7b",
    cyan   = "#8be9fd",
    blue   = "#6272a4",
    pink   = "#ff79c6",
    purple = "#bd93f9",
}

theme.color.accent = theme.color.blue
theme.color.prominent = theme.color.green

local color = theme.color

theme.font          = "Cascadia Code PL 9.5"

theme.bg_systray    = color.bg_normal

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(0)
theme.border_normal = color.dark
theme.border_focus  = color.accent
theme.border_marked = color.prominent

-- Taglist
theme.taglist_font = "Cascadia Code PL 11"

theme.taglist_fg_focus = color.accent
theme.taglist_bg_focus = gears.color.transparent

theme.taglist_fg_occupied = color.white
theme.taglist_bg_occupied = gears.color.transparent

theme.taglist_fg_empty = color.light
theme.taglist_bg_empty = gears.color.transparent

theme.taglist_fg_urgent = color.red
theme.taglist_bg_urgent = gears.color.transparent

theme.taglist_fg_volatile = color.red
theme.taglist_bg_volatile = gears.color.transparent

-- Titlebar
theme.titlebar_bg_normal = color.black
theme.titlebar_fg_normal = color.white

theme.titlebar_close_button_focus = color.red
theme.titlebar_close_button_normal = color.light

theme.titlebar_maximized_button_focus = color.green
theme.titlebar_maximized_button_normal = color.light

theme.titlebar_minimize_button_focus = color.orange
theme.titlebar_minimize_button_normal = color.light

theme.titlebar_drag_button_focus = color.accent
theme.titlebar_drag_button_normal = color.light

-- Menu
theme.menu_bg_focus = color.blue
theme.menu_fg_focus = color.white

-- Notifications
theme.notification_font = "Cascadia Code PL 10"
theme.notification_bg = color.accent
theme.notification_fg = color.black
theme.notification_error_bg = color.red
theme.notification_error_fg = color.dark
theme.notification_border_width = 0
theme.notification_margin = 10
theme.notification_shape = function(cr, x, y)
    return gears.shape.rounded_rect(cr, x, y, 4)
end

-- Infocus
theme.infocus_bg = color.accent
theme.infocus_fg = color.black
theme.infocus_font = "Cascadia Code PL Semibold 9.5"

theme.wallpaper = THEME_DIR .. "/wallpaper.png"

-- TODO: Rename ALL icons to follow the following format:
-- TODO: <namespace>-<modifiers>-<"fill"|"no-fill">-<"light"-"dark"-"color">.<"png"|"svg">
theme.icons = require "themes.icons"

theme.layout_floating = theme.icons.layout.floating
theme.layout_spiral   = theme.icons.layout.spiral

theme.rofi = THEME_DIR .. "/rofi.rasi"

return theme
