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


-- Set up screens and layouts
require "cfg.gamma.screens"

-- Apply rules to new clients
require "cfg.gamma.rules"

-- Set up extra signals and stuff
require "cfg.gamma.signals"
