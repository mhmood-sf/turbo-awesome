local wibox = require "wibox"
local beautiful = require "beautiful"
local gears = require "gears"

local systray = wibox.widget.systray()
systray:set_base_size(18)

-- So we can give it a background color/shape
local bg_color = beautiful.bg_systray or beautiful.wibar_bg or beautiful.bg_normal or "#000000"
local bg = wibox.container.background(systray, bg_color)

-- Place in container to properly center them.
local container = wibox.container.place(bg)

return container
