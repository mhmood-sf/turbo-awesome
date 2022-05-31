local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

return function(variant)

    local theme = {}

    theme.colors = variant

    -- ACCENT
    theme.colors.accent = theme.colors.blue
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

    theme.useless_gap   = dpi(5)
    theme.border_width  = dpi(2)
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
    theme.taglist_fg_occupied = color.fg_normal

    theme.taglist_bg_empty = color.bg_normal
    theme.taglist_fg_empty = color.grey

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
    theme.notification_bg = color.prominent
    theme.notification_fg = color.bg
    theme.notification_error_bg = color.red
    theme.notification_error_fg = color.fg_normal
    theme.notification_border_width = 0
    theme.notification_margin = 10

    -- Infocus
    theme.infocus_bg = color.grey
    theme.infocus_fg = color.fg_normal
    theme.infocus_font = "Cascadia Code PL Semibold 9.5"

    -- Source: https://github.com/catppuccin/wallpapers/blob/main/mandelbrot/mandelbrot_full_magenta.png
    theme.wallpaper = THEMES .. "/catppuccin/cat_pacman.png"

    -- TODO: Rename ALL icons to follow the following format:
    -- TODO: <namespace>-<modifiers>-<"fill"|"no-fill">-<"light"-"dark"-"color">.<"png"|"svg">
    theme.icons = {

        layout = {
            spiral   = THEMES .. "/catppuccin/icons/layout/spiralw.png",
            floating = THEMES .. "/catppuccin/icons/layout/floatingw.png",
        },

        apps = {
            browser = THEMES .. "/catppuccin/icons/apps/firefox-fill-light.png",
            obsidian = THEMES .. "/catppuccin/icons/apps/obsidian.png",
            terminal = THEMES .. "/catppuccin/icons/apps/terminal-window-fill-light.png",
            filemanager = THEMES .. "/catppuccin/icons/system/folders-fill-light.png",
            musicplayer = THEMES .. "/catppuccin/icons/apps/headphones-fill-light.png",
            office = THEMES .. "/catppuccin/icons/apps/stack-fill-light.png"
        },

        system = {
            cpu  = THEMES .. "/catppuccin/icons/system/gauge.png",
            mem  = THEMES .. "/catppuccin/icons/system/cpu.png",
            temp = THEMES .. "/catppuccin/icons/system/thermometer-simple.png",

            audio = {
                mute   = THEMES .. "/catppuccin/icons/system/speaker-x.png",
                high   = THEMES .. "/catppuccin/icons/system/speaker-high.png",
                medium = THEMES .. "/catppuccin/icons/system/speaker-low.png",
                low    = THEMES .. "/catppuccin/icons/system/speaker-none.png",
            },

            brightness = {
                high   = THEMES .. "/catppuccin/icons/system/sun.png",
                low    = THEMES .. "/catppuccin/icons/system/sun-dim.png",
            },

            battery = {
                low      = THEMES .. "/catppuccin/icons/system/battery-low.png",
                high     = THEMES .. "/catppuccin/icons/system/battery-high.png",
                charging = THEMES .. "/catppuccin/icons/system/battery-charging.png",
            },

            interface = {
                shutdown = THEMES .. "/catppuccin/icons/system/power-fill-light.png",
                reboot = THEMES .. "/catppuccin/icons/system/arrow-clockwise-fill-light.png"
            }
        },

    }

    theme.layout_floating = theme.icons.layout.floating
    theme.layout_spiral   = theme.icons.layout.spiral

    theme.rofi = THEMES .. "/catppuccin/misc/rofi.rasi"

    return theme
end
