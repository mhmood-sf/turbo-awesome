local awful = require "awful"

local wallpaper = require "cfg.base.ui.wallpaper"
local bar = require "cfg.alpha.ui.bar"

awful.screen.connect_for_each_screen(function(s)
    -- Set wallpaper
    wallpaper(s)

    -- This will hold all our widgets and such,
    -- and let them share data if needed.
    s.elements = {}

    -- Sets up statusbar and everything.
    bar(s)
end)

