local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

local THEME_DIR = THEMES .. "/catppuccin"

return function(variant)

    local theme = {}

    theme.colors = variant

    -- ACCENT
    theme.colors.accent = theme.colors.purple
    theme.colors.prominent = theme.colors.orange

    theme.colors.bg_normal = theme.colors.bg
    theme.colors.fg_normal = theme.colors.fg
    theme.colors.bg_focus = theme.colors.bg
    theme.colors.fg_focus = theme.colors.accent
    theme.colors.bg_error = theme.colors.red
    theme.colors.fg_error = theme.colors.fg

    local color = theme.colors

    theme.font          = "Cascadia Code PL 9.5"

    theme.bg_normal     = color.bg_normal
    theme.fg_normal     = color.fg_normal

    theme.bg_focus      = color.bg_focus
    theme.fg_focus      = color.fg_focus

    theme.bg_urgent     = color.bg_error
    theme.fg_urgent     = color.fg_error

    theme.bg_systray    = color.bg_normal

    theme.useless_gap   = dpi(3)
    theme.border_width  = dpi(0)
    theme.border_normal = color.grey
    theme.border_focus  = color.accent
    theme.border_marked = color.prominent

    -- Wibar
    theme.wibar_bg_normal = color.bg_normal

    -- Taglist
    theme.taglist_font = "Cascadia Code PL 11"

    theme.taglist_bg_focus = color.bg_normal
    theme.taglist_fg_focus = color.accent

    theme.taglist_bg_occupied = color.bg_normal
    theme.taglist_fg_occupied = color.overlay1

    theme.taglist_bg_empty = color.bg_normal
    theme.taglist_fg_empty = color.surface0

    theme.taglist_bg_urgent = color.bg_normal
    theme.taglist_fg_urgent = color.fg_error
    theme.taglist_bg_volatile = color.bg_normal
    theme.taglist_fg_volatile = color.fg_error

    -- Menu
    theme.manu_bg_normal = color.bg_normal
    theme.menu_fg_normal = color.fg_normal
    theme.menu_bg_focus  = color.grey
    theme.menu_fg_focus  = color.fg_normal

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
end
