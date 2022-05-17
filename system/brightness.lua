local naughty = require "naughty"
local awful = require "awful"

local DEFAULT = 200

-- Change this to wherever the backlight file is.
local backlight = "/sys/class/backlight/intel_backlight/brightness"

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

-- Current brightness
local current = DEFAULT

-- Runs the brightness.sh script to set brightness given by val
local function set_brightness(val)
    -- Update current's value
    current = val
    local cmd = "sudo " .. sh_script .. " " .. val .. " " .. backlight
    awful.spawn.with_shell(cmd)
end

local notif_id
local function down()
    set_brightness(current - 50)
    local notif_text = "Brightness: " .. (tonumber(current) / 10) .. "%"
    if notif_id == nil then
        local notif = naughty.notify({title="Display",text=notif_text})
        notif_id = notif.id
    else
        naughty.notify({title="Display",text=notif_text, replaces_id=notif_id})
    end
end

local function up()
    set_brightness(current + 50)
    local notif_text = "Brightness: " .. (tonumber(current) / 10) .. "%"
    if notif_id == nil then
        local notif = naughty.notify({title="Display",text=notif_text})
        notif_id = notif.id
    else
        naughty.notify({title="Display",text=notif_text, replaces_id=notif_id})
    end
end

-- Set to default on startup.
set_brightness(DEFAULT)

return {
    up = up,
    down = down,
    set_brightness = set_brightness
}

