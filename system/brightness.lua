local awful = require "awful"
local notif = require "notif"

local backlight = "/sys/class/backlight/amdgpu_bl0/brightness"
local notif_id

-- TODO: Doesn't work, need to manually read brightness from file.
local function send_notif(brightness)
    local text = "Brightness: " .. brightness

    -- Send notification and update notif_id
    notif_id = notif.info("Display", text, {
        replaces_id = notif_id
    }).id
end

local function set_brightness(val)
    -- Update current's value
    if val < 0 then
        current = 0
    elseif val > 25 then
        current = 25
    else
        current = val
    end

    local cmd = "$(($(cat " .. backlight .. ") " .. val .. ")) > " .. backlight
    awful.spawn.with_shell(cmd)
end

local function down()
    set_brightness("+ 2")
    -- send_notif()
end

local function up()
    set_brightness(" - 2")
    -- send_notif()
end

return {
    up = up,
    down = down,
    set_brightness = set_brightness
}
