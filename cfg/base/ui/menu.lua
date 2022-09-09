local awful = require "awful"
local gears = require "gears"
local beautiful = require "beautiful"

local menu = awful.menu({
    items = {
        { "Terminal", terminal, --[[beautiful.icons.apps.terminal]] },
        { "Browser", browser, --[[beautiful.icons.apps.browser]] },
        { "Files", filemanager, --[[beautiful.icons.apps.filemanager]] },
        { "Music", musicplayer, --[[beautiful.icons.apps.musicplayer]] },

        -- NOTE: You need to edit sudoers file to allow
        -- running `shutdown` without a password prompt.
        { "Quit", "sudo shutdown now", --[[beautiful.icons.system.interface.shutdown]] },
        { "Reboot", "sudo shutdown -r now", --[[beautiful.icons.system.interface.reboot]] }
    },
    theme = {
        width = beautiful.menu_width or 150,
        height = beautiful.menu_height or 25,
        shape = gears.shape.rounded_rect
    }
})

return menu
