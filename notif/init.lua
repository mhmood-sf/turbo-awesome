-- A wrapper over naughty for nicer notifications.
local gears = require "gears"
local naughty = require "naughty"
local beautiful = require "beautiful"
local xresources = require "beautiful.xresources"

local merge = require"utils.misc".mergeTables
local dpi = xresources.apply_dpi

local default_opts = {
--  text           = "",
--  title          = "",
    timeout        = beautiful.notification_timeout or 3,
--  hover_timeout  = 0,
--  screen         = 0,
    position       = beautiful.notification_position or "top_right",
    ontop          = true,
--  height         = 100, -- Is "auto" a valid value?
--  width          = 200, -- Is "auto" a valid value?
--  max_height     = "auto", -- Is "auto" a valid value?
--  max_width      = "auto", -- Is "auto" a valid value?
--  font           = beautiful.notification_font or "monospace 10",
--  icon           = "",
    icon_size      = 50,
    fg             = beautiful.notification_fg or "#e1e1e1",
    bg             = beautiful.notification_bg or "#dfdfdf",
    border_width   = beautiful.notification_border_width or dpi(2),
    border_color   = beautiful.notification_border_color or "#e1e1e1",
    shape          = beautiful.notification_shape or gears.shape.rectangle,
    opacity        = beautiful.notification_opacity or 1,
    margin         = beautiful.notification_margin or 5,
--  run            = function(n) n.die(naughty.notificationClosedReason.dismissedByUser) end,
--  destroy        = function() print("Notification destroyed") end,
--  preset         = {},
--  replaces_id    = 0,
--  callback       = function() return true end,
--  actions        = {},
--  ignore_suspend = false
}

local error_opts = merge(default_opts, {
    timeout = 0,
    bg      = beautiful.notification_error_bg or "#ff0000",
    fg      = beautiful.notification_error_fg or "#ffffff",
    border_color = beautiful.notification_error_border_color or "#ffffff"
})

-- Default naughty configuration.
naughty.config = {
    padding = beautiful.notification_padding or dpi(10),
    spacing = beautiful.notification_spacing or dpi(10),
    defaults = default_opts,
    presets = {
        low = default_opts,
        normal = default_opts,
        critical = error_opts
    }
}

function info(title, text, overrides)
    args = overrides or {}
    args.title = title
    args.text = text
    return naughty.notify(args)
end

function error(title, text, overrides)
    args = overrides or {}
    args.preset = error_opts
    args.title = title
    args.text = text
    return naughty.notify(args)
end

return {
    info = info,
    error = error,
    defaults = default_opts
}
