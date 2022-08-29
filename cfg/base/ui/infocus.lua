local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

local strip = require"utils.misc".strip
local constrain = require"utils.misc".constrainStr

-- Limit name length and check for empty names.
local function extract_name(str)
    if (str == nil) or (str == "") then return "[No Title]" end
    return constrain(str, 30, "right")
end

-- c: client
-- text: string
local function set_text(c, text)
    local infocus = c.screen.infocus
    -- The signal can sometimes run before the widget is ready?
    -- Something along those lines because without this nil check
    -- there can be errors sometimes on startup.
    if infocus == nil then return end
    infocus.widget.widget:set_markup_silently(text)
end

-- If I wanna have the bg rounded.
local function bg_rounded_shape(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, 2)
end

-- Update textbox when client's name changes.
client.connect_signal("property::name", function(c)
    -- In case the signal is fired for an unfocused client.
    if c ~= client.focus then return end
    local name = " " .. extract_name(c.name) .. " "
    set_text(c, name)
end)

-- Update textbox contents when client comes in focus.
client.connect_signal("focus", function(c)
    -- Add spaces as padding.
    local name = " " .. extract_name(c.name) .. " "
    set_text(c, name)
end)

-- Clear textbox contents on unfocus.
client.connect_signal("unfocus", function(c)
    set_text(c, "")
end)

return function(s)
    s.infocus = wibox.widget {
        widget = wibox.container.margin,
        top = 0,
        bottom = 0,
        right = 3,
        left = 3,
        {
            widget = wibox.container.background,
            bg = beautiful.infocus_bg or beautiful.bg_focus or "#ffffff",
            fg = beautiful.infocus_fg or beautiful.fg_focus or "#000000",
            {
                widget = wibox.widget.textbox,
                valign = "center",
                halign = "center",
                align  = "center",
                font   = beautiful.infocus_font or beautiful.font or "Noto Sans 10",
            }
        }
    }

    return s.infocus
end

