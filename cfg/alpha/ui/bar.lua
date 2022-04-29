local awful = require "awful"
local wibox = require "wibox"

local tray     = require "cfg.base.ui.tray"
local infocus  = require "cfg.base.ui.infocus"
local taglist  = require "cfg.base.ui.taglist"
local minilist = require "cfg.base.ui.minilist"

return function(s)
    s.elements.statusbar = awful.wibar({ position = "top", screen = s })

    s.elements.statusbar:setup {
        layout = wibox.layout.flex.horizontal,
        taglist(s),
        minilist(s),
--        {
--            widget = wibox.container.place,
--            align = "left",
--            fill_horizontal = true,
--            {
--                layout = wibox.layout.fixed.horizontal,
--                spacing = 10,
--                tray,
--                infocus(s)
--            }
--        }
        {
            -- TODO: this is an antipattern
            layout = wibox.layout.align.horizontal,
            nil,
            nil,
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = 10,
                tray,
                infocus(s)
            }
        }
    }
end

