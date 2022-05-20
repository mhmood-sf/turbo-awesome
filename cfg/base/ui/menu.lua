local awful = require "awful"
local beautiful = require "beautiful"

local menu = awful.menu({
    items = {
        -- NOTE:
        -- Need to edit sudoers file to allow
        -- user to run `shutdown` without a
        -- password prompt.
        { "Terminal", terminal, beautiful.icons.apps.terminal },
        { "Browser", browser, beautiful.icons.apps.browser },
        { "Office", office, beautiful.icons.apps.office },
        { "Obsidian", obsidian, beautiful.icons.apps.obsidian },
        { "Files", filemanager, beautiful.icons.apps.filemanager },
        { "Music", musicplayer, beautiful.icons.apps.musicplayer},
        -- Shutdown in about 5 seconds.
        { "Quit", "sudo shutdown now", beautiful.icons.system.interface.shutdown },
        -- Reboot
        { "Reboot", "sudo shutdown -r", beautiful.icons.system.interface.reboot }
    },
    theme = {
        width = beautiful.menu_width or 150,
        height = beautiful.menu_height or 25
    }
})

return menu
