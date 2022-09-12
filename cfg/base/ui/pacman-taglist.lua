local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"

local beautiful = require "beautiful"

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
-- gives a taglist widget attached to the screen.
return function(s)

    local ghost_blue = beautiful.icons.ui.ghost_blue
    local ghost_light = beautiful.icons.ui.ghost_light
    local pacman = beautiful.icons.ui.pacman

    -- Create the tags with icons.
    -- TODO: I've removed the names entirely to
    -- TODO: hide them for now but there must be
    -- TODO: a nicer way of doing this, surely?!
    for i, name in ipairs({ "", "", "", "", "" }) do
       local t = awful.tag.add(name, {
            icon = i == 1 and pacman or ghost_light,
            layouts = awful.layout.layouts,
            screen = s,
            selected = i == 1 and true or false
        })
    end

    -- Update tag names when tags are selected.
    awful.tag.attached_connect_signal(
        s,
        "property::selected",
        function(t)
            local clients = t:clients()
            if t.selected then
                t.icon = pacman
            elseif #clients > 0 then
                t.icon = ghost_blue
            else
                t.icon = ghost_light
            end
        end
    )

    -- Create the taglist widget.
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
            top = 4,
            bottom = 4,
            taglist_widget
        }
    }

    return container
end

