local wibox = require "wibox"
local beautiful = require "beautiful"

local shell = require"utils".shell

local bg_color = beautiful.bg_normal
local fg_color = beautiful.fg_normal

local tb = wibox.widget.textbox("", "center", "center")

local bg = wibox.container.background(tb)
bg.bg = bg_color
bg.fg = fg_color

bg.update = function()
    local temp = shell("acpi -t")
    tb:set_markup_silently(temp)
end

return bg

