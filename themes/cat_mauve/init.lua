local theme_assets = require "beautiful.theme_assets"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local gears = require "gears"
local gfs = require "gears.filesystem"
local themes_path = gfs.get_themes_dir()

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

--[[

local catppuccin = {
     FLAMINGO  = "#F2CDCD",  MAUVE     = "#DDB6F2",
     PINK      = "#F5C2E7",  MAROON    = "#E8A2AF",
     RED       = "#F28FAD",  PEACH     = "#F8BD96",
     YELLOW    = "#FAE3B0",  GREEN     = "#ABE9B3",
     TEAL      = "#B5E8E0",  BLUE      = "#96CDFB",
     SKY       = "#89DCEB",  ROSEWATER = "#F5E0DC",
     LAVENDAR  = "#C9CBFF",  WHITE     = "#D9E0EE",
     GRAY2     = "#C3BAC6",  GRAY1     = "#988BA2",
     GRAY0     = "#6E6C7E",  BLACK4    = "#575268",
     BLACK3    = "#302D41",  BLACK2    = "#1E1E2E",
     BLACK1    = "#1A1826",  BLACK0    = "#161320"
}

--]]

local theme = {}

theme.colors = {
    red       = "#F28FAD",
    blue      = "#96CDFB",
    grey      = "#6E6C7E",
    cyan      = "#89DCEB",
    pink      = "#F5C2E7",
    black     = "#161320",
    green     = "#ABE9B3",
    white     = "#D9E0EE",
    yellow    = "#FAE3B0",
    orange    = "#F8BD96",
    magenta   = "#DDB6F2",
    alt_black = "#302D41",
}

theme.colors.accent = theme.colors.magenta
theme.colors.bg_focus = theme.colors.magenta
theme.colors.fg_focus = theme.colors.black
theme.colors.bg_error = theme.colors.red
theme.colors.fg_error = theme.colors.black
theme.colors.bg_normal = theme.colors.black
theme.colors.fg_normal = theme.colors.white
theme.colors.prominent = theme.colors.orange

local color = theme.colors

theme.font          = "Cascadia Code PL 9.5"

theme.bg_normal     = color.black
theme.fg_normal     = color.white

theme.bg_focus      = color.bg_focus
theme.fg_focus      = color.fg_focus

theme.bg_urgent     = color.bg_error
theme.fg_urgent     = color.fg_error

theme.bg_minimize   = color.alt_black
theme.fg_minimize   = color.white

theme.bg_systray    = color.bg_normal

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(3)
theme.border_normal = color.alt_black
theme.border_focus  = color.accent
theme.border_marked = color.prominent

-- Taglist
theme.taglist_bg_focus = color.bg_focus
theme.taglist_fg_focus = color.fg_focus

theme.taglist_bg_urgent = color.bg_error
theme.taglist_fg_urgent = color.fg_error

theme.taglist_bg_occupied = color.bg_normal
theme.taglist_fg_occupied = color.fg_normal

theme.taglist_bg_empty = color.bg_normal
theme.taglist_fg_empty = color.fg_normal

theme.taglist_bg_volatile = color.bg_error
theme.taglist_fg_volatile = color.fg_error

-- Taglist squares:
local taglist_square_size = dpi(7)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, color.alt_black
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, color.white
)

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

-- Tooltip
theme.tooltip_font = "Cascadia Code PL 9"
theme.tooltip_opacity = 1.0
theme.tooltip_border_width = 0
theme.tooltip_border_color = color.black

-- Hotkeys
theme.hotkeys_bg = color.alt_black
theme.hotkeys_fg = color.white
theme.hotkeys_border_width = 3
theme.hotkeys_border_color = color.accent
theme.hotkeys_shape = nil
theme.hotkeys_modifiers_fg = color.grey

-- Notifications
theme.notification_font = "Cascadia Code PL 10"
theme.notification_bg = color.black
theme.notification_fg = color.accent

-- Infocus
theme.infocus_bg = color.bg_focus
theme.infocus_fg = color.fg_focus
theme.infocus_font = "Cascadia Code PL Semibold 9.5"

-- Source: https://github.com/catppuccin/wallpapers/blob/main/mandelbrot/mandelbrot_full_magenta.png
theme.wallpaper = THEMES .. "/cat_mauve/cat_pacman.png"

theme.icons = {
    layout = {
        spiral   = THEMES .. "/cat_mauve/icons/layout/spiralw.png",
        floating = THEMES .. "/cat_mauve/icons/layout/floatingw.png",
    },
    volume = {
        mute = THEMES .. "cat_mauve/icons/volume/mute.png",
        high = THEMES .. "cat_mauve/icons/volume/high.png",
        low  = THEMES .. "cat_mauve/icons/volume/low.png"
    },
    battery = {
        low      = THEMES .. "cat_mauve/icons/battery/low.png",
        high     = THEMES .. "cat_mauve/icons/battery/high.png",
        charging = THEMES .. "cat_mauve/icons/battery/charging.png",
    },
    system = {
        cpu  = THEMES .. "cat_mauve/icons/system/cpu.png",
        mem  = THEMES .. "cat_mauve/icons/system/mem.png",
        temp = THEMES .. "cat_mauve/icons/system/temp.png",
    }
}

theme.layout_floating = theme.icons.layout.floating
theme.layout_spiral   = theme.icons.layout.spiral

theme.rofi = THEMES .. "/cat_mauve/cat_mauve.rasi"

return theme

