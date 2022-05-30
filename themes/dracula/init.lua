local theme_assets = require "beautiful.theme_assets"
local gears = require "gears"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

--[[

local dracula = {
    background = "#282a36",
    current_line = "#44475a",
    selection = "#44475a",
    foreground = "#f8f8f2",
    comment = "#6272a4",
    cyan = "#8be9fd",
    green = "#50fa7b",
    orange = "#ffb86c",
    pink = "#ff79c6",
    purple = "#bd93f9",
    red = "#ff5555",
    yellow = "#f1fa8c"
}

--]]

local theme = {}

theme.colors = {
    red    = "#ff5555",
    cyan   = "#8be9fd",
    grey   = "#44475a",
    purple = "#bd93f9",
    pink   = "#ff79c6",
    black  = "#282a36",
    green  = "#50fa7b",
    white  = "#f8f8f2",
    yellow = "#f1fa8c",
    orange = "#ffb86c",
    blue   = "#6272a4",
    alt_black = "#6272a4"
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
theme.colors.prominent = theme.colors.orange

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
theme.border_normal = color.black
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
theme.notification_fg = color.alt_black
theme.notification_error_bg = color.red
theme.notification_error_fg = color.alt_black
theme.notification_border_width = 0
theme.notification_margin = 10

-- Infocus
theme.infocus_bg = gears.color.transparent
theme.infocus_fg = color.fg_normal
theme.infocus_font = "Cascadia Code PL Semibold 9.5"

-- Source: https://github.com/catppuccin/wallpapers/blob/main/mandelbrot/mandelbrot_full_magenta.png
--theme.wallpaper = THEMES .. "/catppuccin/cat_pacman.png"

-- TODO: Rename ALL icons to follow the following format:
-- TODO: <namespace>-<modifiers>-<"fill"|"no-fill">-<"light"-"dark"-"color">.<"png"|"svg">
theme.icons = {

    layout = {
        spiral   = THEMES .. "/dracula/icons/layout/spiralw.png",
        floating = THEMES .. "/dracula/icons/layout/floatingw.png",
    },

    apps = {
        browser = THEMES .. "/dracula/icons/apps/firefox-fill-light.png",
        obsidian = THEMES .. "/dracula/icons/apps/obsidian.png",
        terminal = THEMES .. "/dracula/icons/apps/terminal-window-fill-light.png",
        filemanager = THEMES .. "/dracula/icons/system/folders-fill-light.png",
        musicplayer = THEMES .. "/dracula/icons/apps/headphones-fill-light.png",
        office = THEMES .. "/dracula/icons/apps/stack-fill-light.png"
    },

    system = {
        cpu  = THEMES .. "/dracula/icons/system/gauge.png",
        mem  = THEMES .. "/dracula/icons/system/cpu.png",
        temp = THEMES .. "/dracula/icons/system/thermometer-simple.png",

        audio = {
            mute   = THEMES .. "/dracula/icons/system/speaker-x.png",
            high   = THEMES .. "/dracula/icons/system/speaker-high.png",
            medium = THEMES .. "/dracula/icons/system/speaker-low.png",
            low    = THEMES .. "/dracula/icons/system/speaker-none.png",
        },

        brightness = {
            high   = THEMES .. "/dracula/icons/system/sun.png",
            low    = THEMES .. "/dracula/icons/system/sun-dim.png",
        },

        battery = {
            low      = THEMES .. "/dracula/icons/system/battery-low.png",
            high     = THEMES .. "/dracula/icons/system/battery-high.png",
            charging = THEMES .. "/dracula/icons/system/battery-charging.png",
        },

        interface = {
            shutdown = THEMES .. "/dracula/icons/system/power-fill-light.png",
            reboot = THEMES .. "/dracula/icons/system/arrow-clockwise-fill-light.png"
        }
    },

}

theme.layout_floating = theme.icons.layout.floating
theme.layout_spiral   = theme.icons.layout.spiral

theme.rofi = THEMES .. "/dracula/dracula.rasi"

return theme
