local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

local basetray = require "cfg.base.ui.tray"
local minilist = require "cfg.base.ui.minilist"

local taglist  = require "cfg.gamma.ui.taglist"

-- Layout box
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

-- System Tray
local tray = wibox.widget {
    widget = wibox.container.background,
    forced_width = 50,
    basetray
}

-- Clock
local clock = wibox.widget {
    widget = wibox.container.background,
    fg = beautiful.fg_normal,
    bg = beautiful.bg_normal,
    {
        widget = wibox.widget.textclock,
        format = "%H:%M",
        font = beautiful.clock_font or beautiful.font or "sans-serif semibold 10",
        valign = "center"
    }
}

local clock_tooltip = awful.tooltip {
    objects = { clock },
    delay_show = 0.5
}

clock:connect_signal("mouse::enter", function()
    awful.spawn.easy_async_with_shell("date", function(out)
        clock_tooltip.text = out:match("(.-)%s*$")
    end)
end)

local battery = awful.widget.watch("acpi", 60, function(widget, stdout)
    local pct = stdout:match("(%d+)%%")

    local color = beautiful.color.white
    if not stdout:match("Discharging") then
        color = beautiful.color.yellow
    end

    widget:set_markup("<span foreground='" .. color .. "'>" .. tostring(pct) .. "%</span> ")
end)

local battery_tooltip = awful.tooltip {
    objects = { battery },
    delay_show = 0.5
}

battery:connect_signal("mouse::enter", function()
    awful.spawn.easy_async_with_shell("acpi", function(out)
        battery_tooltip.text = out:match("(.-)%s*$")
    end)
end)

return function(s)
    s.elements.bar = awful.wibar({
        position = "top",
        screen = s,
        height = 30,
        ontop = false,
        bg = (beautiful.wibar_bg_normal or beautiful.color.black or "#00000000")
    })

    s.elements.bar:setup {
        layout = wibox.layout.flex.horizontal,
        -- Left: Taglist
        {
            widget = wibox.container.place,
            halign = "left",
            taglist(s)
        },
        -- Center: Clock, Minilist
        {
            widget = wibox.container.place,
            halign = "center",
            {
                layout = wibox.layout.fixed.horizontal,
                spacing = 10,
                clock,
                minilist(s)
            }
        },
        -- Right: System Tray, Layoutbox
        {
            widget = wibox.container.place,
            halign = "right",
            {
                layout = wibox.layout.fixed.horizontal,
                --tray,
                battery,
                --infocus(s),
                layout
            },
        }
    }
end
