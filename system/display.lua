local naughty = require "naughty"
local awful = require "awful"
local shell = require"utils".shell

local GAMMA = "1.0:0.8:0.7"
local BRIGHTNESS = 1.0
local OUTPUT = "LVDS-1"

local brightness_id = nil
local function brightness_up()
    BRIGHTNESS = BRIGHTNESS + 0.05
    awful.spawn("xrandr --output " .. OUTPUT .. " --brightness " .. BRIGHTNESS .. " --gamma " .. GAMMA)

    -- Convert to percentage and then ceil to get
    -- rid of .0 at the end (ceil returns an int).
    local percent = math.ceil(BRIGHTNESS * 100)
    local notif_text = "Brightness: " .. percent .. "%"
    if brightness_id == nil then
        local notif = naughty.notify({text=notif_text})
        brightness_id = notif.id
    else
        naughty.notify({text=notif_text, replaces_id=brightness_id})
    end
end

local function brightness_down()
    BRIGHTNESS = BRIGHTNESS - 0.05
    awful.spawn("xrandr --output " .. OUTPUT .. " --brightness " .. BRIGHTNESS .. " --gamma " .. GAMMA)

    local percent = math.ceil(BRIGHTNESS * 100)
    local notif_text = "Brightness: " .. percent .. "%"
    if brightness_id == nil then
        local notif = naughty.notify({text=notif_text})
        brightness_id = notif.id
    else
        naughty.notify({text=notif_text, replaces_id=brightness_id})
    end
end

return {
    brightness_up = brightness_up,
    brightness_down = brightness_down
}

