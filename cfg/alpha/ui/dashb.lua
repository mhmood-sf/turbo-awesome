local wibox = require "wibox"
local awful = require "awful"
local naughty = require "naughty"
local gears = require "gears"

local beautiful = require "beautiful"

local clock = require "cfg.base.ui.digitalclock"
local calendar = require "cfg.base.ui.calendar"

-- Layoutbox
local layout = awful.widget.layoutbox()
layout.forced_height = 50
layout.forced_width = 50
local layoutbox = wibox.container.place(layout)

-- Create the popup, setting its visibility to false
-- so it doesn't show on startup.
local grid = wibox.widget {
    layout        = wibox.layout.grid,
    spacing       = 10,
}

-- TODO: use theme variables for these hardcoded values.
local popup = awful.popup {
    widget    = {
        widget = wibox.container.background,
        bg = beautiful.bg_normal,
        {
            widget = wibox.container.margin,
            margins = 25,
            {
                widget = grid
            }
        }
    },
    border_width = 3,
    border_color = beautiful.bg_focus,
    placement = awful.placement.centered,
    visible   = false,
    ontop     = true,
}

-- (Widget, Row, Col, Row_Span, Col_Span)
grid:add_widget_at(layoutbox, 1, 1, 1, 1)
grid:add_widget_at(clock, 1, 2, 1, 1)
grid:add_widget_at(calendar, 2, 1, 2, 2)

popup.update = function()
    clock.update()
    calendar.update()
end

-- Toggle popup visibility to show/close it
local function toggle_dashb()
    if popup.visible then
        popup.visible = false
        --month_calendar:toggle()
    else
        -- Update transparent background
        popup.update()
        --month_calendar:toggle()
        popup.visible = true
    end
end

return toggle_dashb

