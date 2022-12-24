local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"
local gears = require "gears"

local set_titlebar = require "cfg.gamma.ui.titlebar"

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Copied from the default awesome config.
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    -- Set titlebar for client.
    set_titlebar(c)

    -- Set a comfy height/width for floating terminal windows.
    if c.class == "kitty" then
        c.height = 500
        c.width = 600
    end

    -- Center all windows (only applies to floating windows)
    local w = c.screen.geometry.width
    local h = c.screen.geometry.height
    c.x = (w / 2) - (c.width / 2)
    c.y = (h / 2) - (c.height / 2)
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
