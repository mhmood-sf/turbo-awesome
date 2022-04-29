local naughty = require "naughty"
local awful = require "awful"
local shell = require"utils".shell

local VOLUME = tonumber(string.match(shell("amixer get Master"), "(%d+)%%") or "20")

local volume_id = nil
local function volume_up()
    VOLUME = VOLUME + 5
    awful.spawn("amixer set Master " .. VOLUME .. "%")

    local notif_text = "Volume: " .. VOLUME .. "%"
    if volume_id == nil then
        local notif = naughty.notify({text=notif_text})
        volume_id = notif.id
    else
        naughty.notify({text=notif_text, replaces_id=volume_id})
    end
end

local function volume_down()
    VOLUME = VOLUME - 5
    awful.spawn("amixer set Master " .. VOLUME .. "%")

    local notif_text = "Volume: " .. VOLUME .. "%"
    if volume_id == nil then
        local notif = naughty.notify({text=notif_text})
        volume_id = notif.id
    else
        naughty.notify({text=notif_text, replaces_id=volume_id})
    end
end

return {
    volume_up = volume_up,
    volume_down = volume_down
}

