local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

local THEME_DIR = THEMES .. "/aks"

local theme = {}

theme.color = {
    -- For light, the "black" is actually "white" and vice versa.
    black  = "#F2F4F7",
    dark   = "#E2E6F7",
    light  = "#ABB3CA",
    white  = "#17171C",
    red    = "#FF1D4E",
    orange = "#FC8E4E",
    yellow = "#E1B900",
    green  = "#00D948",
    cyan   = "#00C2C2",
    blue   = "#0066FF",
    pink   = "#FF0099",
    purple = "#8F00FF",
}

theme.color.accent = theme.color.blue
theme.color.prominent = theme.color.green

local color = theme.color

theme.font          = "Google Sans Medium 12"

theme.fg_normal     = color.white
theme.bg_normal     = color.black

theme.bg_systray    = color.black

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(0)
theme.border_normal = color.dark
theme.border_focus  = color.accent
theme.border_marked = color.prominent

-- Taglist
theme.taglist_font = "Google Sans Medium 10"

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
theme.menu_bg_normal = color.black
theme.menu_fg_normal = color.white
theme.menu_bg_focus = color.black
theme.menu_fg_focus = color.accent

-- Clock
theme.clock_font = "Google Sans Medium 12"

-- Minilist
theme.minilist_font = "Google Sans Medium 10"

-- Notifications
theme.notification_font = "Google Sans Medium 12"
theme.notification_margin = 10
theme.notification_border_width = 0

theme.notification_shape = function(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, 5)
end

theme.notification_bg = color.accent
theme.notification_fg = color.black
theme.notification_border_color = color.accent

theme.notification_error_bg = color.dark
theme.notification_error_fg = color.white
theme.notification_error_border_color = color.red

-- Infocus
theme.infocus_bg = color.accent
theme.infocus_fg = color.black
theme.infocus_font = "Google Sans Medium 10"

theme.wallpaper = THEME_DIR .. "/wallpaper.png"

theme.icons = require "themes.icons"

theme.layout_floating = theme.icons.layout.floating_light
theme.layout_spiral   = theme.icons.layout.spiral_light

theme.rofi = THEME_DIR .. "/rofi.rasi"

return theme
