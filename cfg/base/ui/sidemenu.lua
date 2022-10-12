local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

local r = require "lib.rubato"

return function(s)
    sidemenu_widget = wibox.widget {
        layout = wibox.layout.flex.vertical,
        {
            widget = wibox.container.margin,
            top = 10,
            {
                widget = wibox.widget.textbox,
                text = "Hello, World!",
                valign = "center",
                align = "center"
            }
        }
    }

    s.elements.sidemenu = wibox {
        width = 300,
        height = 700,
        visible = true,
        y = 40,
        x = -300,
        screen = s,
        widget = sidemenu_widget,
        bg = beautiful.color.black or "#000",
        fg = beautiful.color.white or "#fff",
    }

    local hide = r.timed {
        intro = 0.2,
        outro = 0.1,
        duration = 0.35,
        rate = 100,
        easing = r.quadratic,
        subscribed = function(pos)
            if mouse.screen.elements and mouse.screen.elements.sidemenu then
                local s = mouse.screen.elements.sidemenu
                s.x = -300 * pos
            end
        end
    }
    s.elements.show_sidemenu = function()
        hide = 0
    end

    s.elements.hide_sidemenu = function()
        hide = 1
    end
end
