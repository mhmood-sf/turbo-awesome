local awful = require "awful"

local wallpaper = require "ui.misc.wallpaper"
local statusbar = require "ui.bar.taskbar"

awful.screen.connect_for_each_screen(function(s)
    -- Set wallpaper
    wallpaper(s)

    -- This will hold all our widgets and such,
    -- and let them share data if needed.
    s.elements = {}

    -- Sets up statusbar and everything.
    statusbar(s)
end)

