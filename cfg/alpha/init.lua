-- Standard awesome library
require("awful.autofocus")

-- Notification library
local notif = require "notif"

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    notif.error(
        "Oops, there were errors during startup!",
        awesome.startup_errors
    )
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        notif.error(
            "Oops, an error happened!",
            tostring(err)
        )

        in_error = false
    end)
end

-- Theme overrides (should find a better awy of handling this tbh)
local beautiful = require "beautiful"
local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

beautiful.border_width = dpi(2)
beautiful.border_normal = beautiful.color.dark
beautiful.border_focus  = beautiful.color.accent
beautiful.border_marked = beautiful.color.prominent

-- Set up screens and layouts
require "cfg.alpha.screens"

-- Apply rules to new clients
require "cfg.alpha.rules"

-- Set up extra signals and stuff
require "cfg.alpha.signals"
