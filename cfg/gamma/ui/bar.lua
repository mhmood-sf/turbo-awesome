local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

--local infocus  = require "cfg.base.ui.infocus"
local basetray = require "cfg.base.ui.tray"
local minilist = require "cfg.base.ui.minilist"

local taglist  = require "cfg.gamma.ui.taglist"

local layoutbox = awful.widget.layoutbox()
layoutbox.forced_height = 20
layoutbox.forced_width = 20

local layout = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    forced_height = 30,
    forced_width = 30,
    {
        widget = wibox.container.margin,
        bottom = 3,
        top = 2,
        {
            widget = wibox.container.place,
            halign = "center",
            valign = "center",
            layoutbox
        }
    }
}

local tray = wibox.widget {
    widget = wibox.container.background,
    forced_width = 50,
    basetray
}

local clock = wibox.widget {
    widget = wibox.container.background,
    fg = beautiful.fg_normal,
    bg = beautiful.bg_normal,
    {
        widget = wibox.widget.textclock,
        format = "%H:%M",
        font = "sans-serif semibold 10",
        valign = "center"
    }
}

return function(s)
    s.elements.bar = awful.wibar({
        position = "top",
        screen = s,
        ontop = false,
        bg = (beautiful.wibar_bg_normal or beautiful.bg_normal or "#00000000")
    })

    s.elements.bar:setup {
        layout = wibox.layout.flex.horizontal,
        taglist(s),
        {
            widget = wibox.container.place,
            halign = "center",
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = 10,
                clock,
                minilist(s),
            }
        },
        {
            widget = wibox.container.place,
            halign = "right",
            {
                layout = wibox.layout.fixed.horizontal,
                tray,
                nil,
                --infocus(s),
                layout
            },
        }
    }
end
