local awful = require "awful"
local gears = require "gears"

local bar = require "cfg.gamma.ui.bar"
local menu = require "cfg.gamma.ui.menu"
local wallpaper = require "cfg.base.ui.wallpaper"

-- Set up the right-click menu.
root.buttons(gears.table.join(
    awful.button({ }, 3, function() menu:toggle() end),
    awful.button({ }, 1, function() menu:hide() end)
))

awful.screen.connect_for_each_screen(function(s)
    -- Set wallpaper
    wallpaper(s)

    -- This will hold all our widgets and such,
    -- and let them share data if needed.
    s.elements = {}

    -- Sets up the wibar.
    bar(s)
end)
