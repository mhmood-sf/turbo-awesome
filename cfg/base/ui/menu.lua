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
        { "Files", filemanager, beautiful.icons.apps.filemanager },
        { "Music", musicplayer, beautiful.icons.apps.musicplayer},
        { "Quit", "sudo shutdown 5s", beautiful.icons.interface.shutdown },
    },
    theme = {
        width = 125,
        height = 20
    }
})

return menu
