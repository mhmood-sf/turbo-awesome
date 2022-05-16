-- A wrapper over naughty for nicer notifications.
local naughty = require "naughty"
local beautiful = require "beautiful"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

-- List of all notifs.
local all = {}

-- Why doesn't this work?
naughty.config = {
    padding = dpi(5),
    spacing = dpi(3),
    presets = {
        critical = {
            bg = beautiful.colors.red,
            fg = beautiful.colors.black
        }
    },
    defaults = {
        border_width = dpi(2),
        position = "bottom_right"
    }
}
