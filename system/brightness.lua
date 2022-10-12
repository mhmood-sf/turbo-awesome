local awful = require "awful"
local notif = require "notif"

local beautiful = require "beautiful"

-- This script is run with sudo since it edits the file
-- above. So, this needs to be executable WITHOUT
-- requiring the sudo password. One way to do this
-- without compromising security too much is to change
-- ownership to root and permissions of this brightness.sh
-- file to only be readable (everyone) and executable (user):
-- `chown root:root brightness.sh`
-- `chmod u-w brightness.sh`
-- `chmod u+x brightness.sh`
-- The permissions should be something like:
-- `-r-xr--r-- 1 root root 22 May  6 13:43 brightness.sh`
-- And then edit the /etc/sudoers.d/<user> file (or just
-- /etc/sudoers directly) to be able to run this file without
-- requiring password:
-- `<user> ALL=(root) NOPASSWD: /home/<user>/.config/awesome/system/brightness.sh`
local sh_script = "~/.config/awesome/system/brightness.sh"

local DEFAULT = 300
local current = DEFAULT
local backlight = "/sys/class/backlight/intel_backlight/brightness"
local notif_id

local function send_notif()
    local text = "Brightness: " .. (tonumber(current) / 10) .. "%"

    local icon

    --[[
    if current > 500 then
        icon = beautiful.icons.system.brightness.high
    else
        icon = beautiful.icons.system.brightness.low
    end
    --]]

    -- Send notification and update notif_id
    notif_id = notif.info("Display", text, {
        icon = icon,
        icon_size = 35,
        replaces_id = notif_id
    }).id
end

-- Runs the brightness.sh script to set brightness given by val
local function set_brightness(val)
    -- Update current's value
    if val < 0 then
        current = 0
    elseif val > 1000 then
        current = 1000
    else
        current = val
    end

    local cmd = "sudo " .. sh_script .. " " .. val .. " " .. backlight
    awful.spawn.with_shell(cmd)
end

local function down()
    set_brightness(current - 50)
    send_notif()
end

local function up()
    set_brightness(current + 50)
    send_notif()
end

-- Set to default on startup.
set_brightness(DEFAULT)

return {
    up = up,
    down = down,
    set_brightness = set_brightness
}

