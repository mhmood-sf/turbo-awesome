local theme_assets = require "beautiful.theme_assets"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local gears = require "gears"
local gfs = require "gears.filesystem"
local themes_path = gfs.get_themes_dir()

local HOME = os.getenv("HOME")
local THEMES = HOME .. "/.config/awesome/themes"

--[[ Catppuccin

Styling:
    MAUVE  for primary colours
    RED    for errors/urgent
    PEACH    for things that need to stand out
    BLACK0 for backgrounds and stuff
    GRAY0  for inactive stuff

--]]

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

local color = catppuccin

local theme = {}
theme.color = color

theme.font          = "Cascadia Code PL 9.5"

theme.bg_normal     = color.BLACK0
theme.fg_normal     = color.WHITE

theme.bg_focus      = color.MAUVE
theme.fg_focus      = color.BLACK0

theme.bg_urgent     = color.RED
theme.fg_urgent     = color.BLACK0

theme.bg_minimize   = color.BLACK3
theme.fg_minimize   = color.WHITE

theme.bg_systray    = theme.bg_normal

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(3)
theme.border_normal = color.GRAY0
theme.border_focus  = color.MAUVE
theme.border_marked = color.PEACH

-- Taglist
theme.taglist_bg_focus = color.MAUVE
theme.taglist_fg_focus = color.BLACK0

theme.taglist_bg_urgent = color.RED
theme.taglist_fg_urgent = color.BLACK0

theme.taglist_bg_occupied = color.BLACK0
theme.taglist_fg_occupied = color.WHITE

theme.taglist_bg_empty = color.BLACK0
theme.taglist_fg_empty = color.WHITE

theme.taglist_bg_volatile = color.RED
theme.taglist_fg_volatile = color.BLACK0

-- Taglist squares:
local taglist_square_size = dpi(7)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, color.BLACK4
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Tasklist
theme.tasklist_bg_focus = color.MAUVE
theme.tasklist_fg_focus = color.BLACK0

theme.tasklist_bg_urgent = color.RED
theme.tasklist_fg_urgent = color.BLACK0

theme.tasklist_disable_icon = true

-- Titlebar
theme.titlebar_bg_normal = color.GRAY0
theme.titlebar_fg_normal = color.WHITE

theme.titlebar_bg_focus = color.MAUVE
theme.titlebar_fg_focus = color.BLACK0

-- Tooltip
theme.tooltip_font = "Cascadia Code PL 9"
theme.tooltip_opacity = 1.0
theme.tooltip_border_width = 0
theme.tooltip_border_color = color.BLACK0

-- Hotkeys
theme.hotkeys_bg = color.BLACK0
theme.hotkeys_fg = color.WHITE
theme.hotkeys_border_width = 3
theme.hotkeys_border_color = color.MAUVE
theme.hotkeys_shape = nil
theme.hotkeys_modifiers_fg = color.GRAY0

-- Notifications
theme.notification_font = "Cascadia Code PL 10"
theme.notification_bg = color.MAUVE
theme.notification_fg = color.BLACK0

-- Infocus
theme.infocus_bg = color.MAUVE
theme.infocus_fg = color.BLACK0
theme.infocus_font = "Cascadia Code PL Semibold 9.5"

-- Source: https://github.com/catppuccin/wallpapers/blob/main/mandelbrot/mandelbrot_full_magenta.png
theme.wallpaper = THEMES .. "/mauve/cat_pacman.png"

theme.icons = {
    layout = {
        spiral   = THEMES .. "/mauve/icons/layout/spiralw.png",
        floating = THEMES .. "/mauve/icons/layout/floatingw.png",
    },
    volume = {
        mute = THEMES .. "mauve/icons/volume/mute.png",
        high = THEMES .. "mauve/icons/volume/high.png",
        low  = THEMES .. "mauve/icons/volume/low.png"
    },
    battery = {
        low      = THEMES .. "mauve/icons/battery/low.png",
        high     = THEMES .. "mauve/icons/battery/high.png",
        charging = THEMES .. "mauve/icons/battery/charging.png",
    },
    system = {
        cpu  = THEMES .. "mauve/icons/system/cpu.png",
        mem  = THEMES .. "mauve/icons/system/mem.png",
        temp = THEMES .. "mauve/icons/system/temp.png",
    }
}

theme.layout_floating = theme.icons.layout.floating
theme.layout_spiral   = theme.icons.layout.spiral

theme.rofi = THEMES .. "/mauve/mauve.rasi"

return theme

