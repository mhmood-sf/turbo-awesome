local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"

-- Creates a titlebar buttons widget.
local function get_titlebar_button(color, action)
    local widget = wibox.widget {
        widget = wibox.container.margin,
        right = 3,
        {
            widget = wibox.container.background,
            bg = color,
            {
                widget = wibox.widget.base.empty_widget
            }
        }
    }

    widget:connect_signal("mouse::enter", function(w)
        w.right = 0
    end)

    widget:connect_signal("mouse::leave", function(w)
        w.right = 3
    end)

    widget:connect_signal("button::release", action)

    return widget
end

--[[
-- Causes too many errors for some reason.
client.connect_signal("focus", function(c)
    awful.titlebar:show(c)
end)

client.connect_signal("unfocus", function(c)
    awful.titlebar:hide(c)
end)
--]]

return function(c)
    local titlebar = awful.titlebar(c, {
        position = "left",
        size = 12,
        bg_focus = beautiful.colors.alt_black,
        bg_normal = beautiful.colors.alt_black
    })

    titlebar:setup {
        layout = wibox.layout.flex.vertical,
        get_titlebar_button(
            beautiful.titlebar_quit_color or beautiful.colors.red or "#ff0000",
            function() c:kill() end
        ),
        get_titlebar_button(
            beautiful.titlebar_maximize_color or beautiful.colors.green or "#00ff00",
            function() if c.maximized then c.maximized = false else c.maximized = true end end
        ),
        get_titlebar_button(
            beautiful.titlebar_minimize_color or beautiful.colors.yellow or "#ffff00",
            function() c.minimized = true end
        )
    }
end
