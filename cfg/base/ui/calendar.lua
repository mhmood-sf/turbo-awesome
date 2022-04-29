local wibox = require "wibox"
local beautiful = require "beautiful"

local cal = wibox.widget {
    {
        date         = os.date('*t'),
        font         = 'Monospace 10',
        spacing      = 2,
        week_numbers = false,
        start_sunday = false,
        widget       = wibox.widget.calendar.month
    },
    fg = beautiful.fg_normal,
    bg = beautiful.bg_normal,
    widget = wibox.container.background
}

return cal
