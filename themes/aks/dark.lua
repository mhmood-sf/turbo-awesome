local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

local THEME_DIR = THEMES .. "/aks"

local theme = {}

theme.color = {
    black  = "#17171C",
    dark   = "#222430",
    grey   = "#5B697B",
    light  = "#DADEF1",
    white  = "#ECEFF4",
    red    = "#EF476F",
    orange = "#FE995E",
    yellow = "#FADD5C",
    green  = "#66DB8D",
    cyan   = "#4ECDC4",
    blue   = "#5596F7",
    pink   = "#FC56B1",
    purple = "#A972FF",
}

theme.color.accent = theme.color.blue
theme.color.prominent = theme.color.green

local color = theme.color

theme.font          = "Google Sans Medium 12"

theme.bg_systray    = color.black

-- Clients
theme.useless_gap   = dpi(10)
theme.border_width  = dpi(0)
theme.border_normal = color.dark
theme.border_focus  = color.accent
theme.border_marked = color.prominent

-- Wibar
theme.wibar_bg = color.dark
theme.wibar_fg = color.white

-- Taglist
theme.taglist_font = "Google Sans Medium 10"

theme.taglist_fg_focus = color.accent
theme.taglist_bg_focus = gears.color.transparent

theme.taglist_fg_occupied = color.white
theme.taglist_bg_occupied = gears.color.transparent

theme.taglist_fg_empty = color.grey
theme.taglist_bg_empty = gears.color.transparent

theme.taglist_fg_urgent = color.red
theme.taglist_bg_urgent = gears.color.transparent

theme.taglist_fg_volatile = color.red
theme.taglist_bg_volatile = gears.color.transparent

-- Titlebar
theme.titlebar_bg_normal = color.dark
theme.titlebar_fg_normal = color.white

theme.titlebar_close_button_focus = color.red
theme.titlebar_close_button_normal = color.grey

theme.titlebar_maximized_button_focus = color.green
theme.titlebar_maximized_button_normal = color.grey

theme.titlebar_minimize_button_focus = color.orange
theme.titlebar_minimize_button_normal = color.grey

theme.titlebar_drag_button_focus = color.accent
theme.titlebar_drag_button_normal = color.grey

-- Tooltips
theme.tooltip_bg = color.light
theme.tooltip_fg = color.black
theme.tooltip_shape = function(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, 3)
end

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

theme.notification_bg = color.light
theme.notification_fg = color.black
theme.notification_border_color = color.accent

theme.notification_error_bg = color.red
theme.notification_error_fg = color.black
theme.notification_error_border_color = color.red

-- Infocus
theme.infocus_bg = color.accent
theme.infocus_fg = color.black
theme.infocus_font = "Google Sans Medium 10"

--theme.wallpaper = THEME_DIR .. "/wallpaper.png"
theme.wallpaper = THEME_DIR .. "/wallpaper2.jpg"

theme.icons = require "themes.icons"

theme.layout_floating = theme.icons.layout.floating_light
theme.layout_spiral   = theme.icons.layout.spiral_light

theme.rofi = THEME_DIR .. "/rofi.rasi"

return theme
