local wibox = require "wibox"
local beautiful = require "beautiful"

local strip = require"utils".strip
local constrain = require"utils".constrainStr

-- Client titles seem to be in the form
-- <window description> - <program name>
-- and this function takes that string
-- and does its best to return the
-- <program name> part.
function extract_name(str)
    if (str == nil) or (str == "") then return "[No Title]" end

    -- There's a lot of different types of hyphens
    -- and different programs seemed to be using
    -- different ones so I just threw all of them in.
    -- Seems to work fine, so far. ¯\_ (ツ)_/¯
    local iterator = string.gmatch(str, "[^-‐‒–—―−]+")

    -- Convert iterator to list
    if iterator then
        local lst = {}
        for s in iterator do
            table.insert(lst, s)
        end
        -- Return the LAST element, which would
        -- be the <program name> part.
        return constrain(strip(lst[#lst]), 30, "right")
    else
        -- If we couldn't parse properly, we just
        -- give up and return the whole title as is.
        return str
    end
end

-- Update textbox contents when client comes in focus.
client.connect_signal("focus", function(c)
    local infocus = c.screen.elements.infocus
    if infocus == nil then return end
    local prog_name = " " .. extract_name(c.name) .. " "
    infocus.widget:set_markup_silently(prog_name)
end)

-- Clear textbox contents on unfocus.
client.connect_signal("unfocus", function(c)
    local infocus = c.screen.elements.infocus
    if infocus == nil then return end
    infocus.widget:set_markup_silently("")
end)

return function(s)
    local tb = wibox.widget.textbox()
    tb.font = beautiful.infocus_font or beautiful.font
    tb.valign = "center"
    tb.align = "center"

    local bg_color = beautiful.infocus_bg or beautiful.bg_focus
    local fg_color = beautiful.infocus_fg or beautiful.fg_focus

    local bg = wibox.container.background(tb, bg_color)
    bg.fg = fg_color

    -- Attach to screen elements
    s.elements.infocus = bg
    return s.elements.infocus
end

