local wibox = require "wibox"
local gears = require "gears"
local awful = require "awful"

return function(icon_path, on_click)
    return wibox.widget {
        image = icon_path,
        resize = true,
        widget = wibox.widget.imagebox,
        buttons = gears.table.join(awful.button({ }, 1, on_click)),
    }
end
