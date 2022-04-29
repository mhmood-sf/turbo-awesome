local wibox = require "wibox"

-- Returns brightness and gamma widget
-- TODO: Need to clean this up and integrate with dashboard.
local function display()
    local brightness = shell("xrandr --verbose | grep 'Brightness'")
    local gamma = shell("xrandr --verbose | grep 'Gamma'")

    local status = (brightness or "") .. " | " .. (gamma or "")
--[[
    -- Output is on two lines, split them up
    local lst = split(output, "\n")
    local str = lst[1] .. ", " .. lst[2]
--]]

    local tb = wibox.widget.textbox(status, "center", "center")
    return tb
end

