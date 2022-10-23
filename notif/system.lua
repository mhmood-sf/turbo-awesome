-- Trying to make "mac-like" notifications for audio/brightness.
-- Dunno how to get background blur with just awesome.
-- Dunno how to increase spacing without affecting other notifications.
-- WIP.

local notif = require "notif"
local gears = require "gears"
local naughty = require "naughty"
local beautiful = require "beautiful"

local xresources = require "beautiful.xresources"
local dpi = xresources.apply_dpi

local merge = require"utils.misc".mergeTables

local round_rect = function(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, 5)
end

local opts = merge(notif.defaults, {
    bg = beautiful.notification_system_bg or beautiful.color.white or "#dedede",
    fg = beautiful.notification_system_fg or beautiful.color.black or "#222430",
    shape = beautiful.notification_system_shape or beautiful.notification_shape or round_rect,
    opacity = 0.9,
    position = "bottom_middle",
})

return function(title, text, overrides)
    args = overrides or {}
    args.preset = opts
    args.title = title
    args.text = text
    return naughty.notify(args)
end
