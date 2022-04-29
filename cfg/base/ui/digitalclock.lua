local beautiful = require "beautiful"
local wibox = require "wibox"

local shell = require"utils".shell

local bg_color = beautiful.bg_normal
local fg_color = beautiful.fg_normal

local tb = wibox.widget.textbox("", "center", "center")
tb.font = "Cascadia Code PL 24"

local bg = wibox.container.background(tb)
bg.bg = bg_color
bg.fg = fg_color

bg.update = function()
    local date = shell("date +%H:%M")
    tb:set_markup_silently(date)
end

return bg

