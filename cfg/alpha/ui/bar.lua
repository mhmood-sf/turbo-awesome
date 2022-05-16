local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"

local infocus  = require "cfg.base.ui.infocus"
local taglist  = require "cfg.base.ui.taglist"
local basetray = require "cfg.base.ui.tray"
local minilist = require "cfg.base.ui.minilist"

local layoutbox = awful.widget.layoutbox()
layoutbox.forced_height = 20
layoutbox.forced_width = 20

local layout = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.colors.alt_black,
    forced_height = 30,
    forced_width = 30,
    {
        widget = wibox.container.place,
        halign = "center",
        valign = "center",
        layoutbox
    }
}

local tray = wibox.widget {
    widget = wibox.container.background,
    forced_width = 50,
    basetray
}

return function(s)
    awful.wibar({ position = "top", screen = s }):setup {
        layout = wibox.layout.flex.horizontal,
        taglist(s),
        minilist(s),
        {
            widget = wibox.container.place,
            halign = "right",
            {
                layout = wibox.layout.fixed.horizontal,
                tray,
                infocus(s),
                layout
            },
        }
    }
end
