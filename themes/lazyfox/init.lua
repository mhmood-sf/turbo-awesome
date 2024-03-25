local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

local THEME_DIR = THEMES .. "/lazyfox"

local theme = {}

theme.palette = {
    shade0  = "#F6F2EE",
    shade1  = "#EBE5DF",
    shade2  = "#E5DBD1",
    shade3  = "#BBAFB5",
    shade4  = "#8B8FA2",
    shade5  = "#625C87",
    shade6  = "#4D4872",
    shade7  = "#393263",
    accent0 = "#E9214F",
    accent1 = "#E79925",
    accent2 = "#DDC805",
    accent3 = "#07B34C",
    accent4 = "#16A0BE",
    accent5 = "#0C67A8",
    accent6 = "#EC3484",
    accent7 = "#9335C6",
    aux0    = "#BEDEDE",
    aux1    = "#E5D3DB",
}

theme.color = {
    black  = theme.palette.shade7,
    dark   = theme.palette.shade6,
    light  = theme.palette.shade1,
    white  = theme.palette.shade0,
    red    = theme.palette.accent0,
    orange = theme.palette.accent1,
    yellow = theme.palette.accent2,
    green  = theme.palette.accent3,
    cyan   = theme.palette.accent4,
    blue   = theme.palette.accent5,
    pink   = theme.palette.accent6,
    purple = theme.palette.accent7,
}

theme.color.accent = theme.color.cyan
theme.color.prominent = theme.color.cyan

local color = theme.color

theme.font          = "Google Sans Medium 12"

theme.bg_systray           = color.light
theme.systray_icon_spacing = dpi(2)

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(0)
theme.border_normal = color.light
theme.border_focus  = color.accent
theme.border_marked = color.prominent

-- Defaults
theme.bg_normal = color.light
theme.fg_normal = color.dark

-- Wibar
theme.wibar_bg = color.light
theme.wibar_fg = color.black

-- Taglist
theme.taglist_font = "Google Sans Medium 10"

theme.taglist_fg_focus = color.accent
theme.taglist_bg_focus = gears.color.transparent

theme.taglist_fg_occupied = theme.palette.shade4
theme.taglist_bg_occupied = gears.color.transparent

theme.taglist_fg_empty = color.dark
theme.taglist_bg_empty = gears.color.transparent

theme.taglist_fg_urgent = color.red
theme.taglist_bg_urgent = gears.color.transparent

theme.taglist_fg_volatile = color.red
theme.taglist_bg_volatile = gears.color.transparent

-- Titlebar
theme.titlebar_bg_normal = color.light
theme.titlebar_fg_normal = color.black

theme.titlebar_close_button_focus = color.red
theme.titlebar_close_button_normal = theme.palette.shade3

theme.titlebar_maximized_button_focus = color.green
theme.titlebar_maximized_button_normal = theme.palette.shade3

theme.titlebar_minimize_button_focus = color.orange
theme.titlebar_minimize_button_normal = theme.palette.shade3

theme.titlebar_drag_button_focus = color.accent
theme.titlebar_drag_button_normal = theme.palette.shade3

-- Tooltips
theme.tooltip_bg = color.dark
theme.tooltip_fg = color.white
theme.tooltip_shape = function(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, 3)
end

-- Menu
theme.menu_bg_normal = color.white
theme.menu_fg_normal = color.black
theme.menu_bg_focus = color.accent
theme.menu_fg_focus = color.black

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

theme.notification_bg = color.white
theme.notification_fg = color.dark
theme.notification_border_color = color.accent

theme.notification_error_bg = color.red
theme.notification_error_fg = color.white
theme.notification_error_border_color = color.red

-- Infocus
theme.infocus_bg = color.accent
theme.infocus_fg = color.black
theme.infocus_font = "Google Sans Medium 10"

theme.wallpaper = THEME_DIR .. "/wallpaper.png"

-- TODO: Rename ALL icons to follow the following format:
-- TODO: <namespace>-<modifiers>-<"fill"|"no-fill">-<"light"-"dark"-"color">.<"png"|"svg">
theme.icons = require "themes.icons"

theme.layout_floating = theme.icons.layout.floating_dark
theme.layout_spiral   = theme.icons.layout.spiral_dark

-- theme.rofi = THEME_DIR .. "/rofi.rasi"

return theme
