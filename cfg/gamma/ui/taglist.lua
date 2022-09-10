local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"

local beautiful = require "beautiful"

-- Tag names
local names = {
    "●", "●", "●", "●", "●"
}

-- Layouts available for each tag
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.spiral,
}

-- Actions for when taglist buttons are clicked
local buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end)
)

-- Return a function that takes a screen and
-- gives a taglist attached to it.
return function(s)
    awful.tag(names, s, awful.layout.layouts)

    local taglist_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = buttons,
    }

    local container = {
        layout = wibox.layout.fixed.horizontal,
        {
            widget = wibox.container.margin,
            left = 5,
            taglist_widget
        }
    }

    return container
end

