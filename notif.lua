-- A wrapper over naughty for nicer notifications.
local gears = require "gears"
local naughty = require "naughty"
local beautiful = require "beautiful"
local xresources = require "beautiful.xresources"

local merge = require"utils".mergeTables
local dpi = xresources.apply_dpi

-- Defaults for notification opts. Note that some
-- fields (like text/title/screen) are commented
-- out but still kept for completeness.
local default_opts = {
--  text           = "",
--  title          = "",
    timeout        = 5,
--  hover_timeout  = 0,
--  screen         = 0,
    position       = "bottom_right",
    ontop          = true,
--  height         = "auto" -- Is "auto" a valid value?
--  width          = "auto" -- Is "auto" a valid value?
--  max_height     = "auto" -- Is "auto" a valid value?
--  max_width      = "auto" -- Is "auto" a valid value?
--  font           = beautiful.notification_font or "monospace 10",
--  icon           = "",
--  icon_size      = "",
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
    bg      = beautiful.notification_error_bg or beautiful.colors.red or "#ff0000",
    fg      = beautiful.notification_error_fg or beautiful.colors.black or "#ffffff",
    border_color = beautiful.notification_error_border_color or beautiful.colors.alt_black or "#ffffff",
    timeout = 0
})

-- Fires a "normal" notification, opts is optional,
-- returns the resulting notification table.
function info(title, text, overrides)
    -- Set args to overrides or empty table if there
    -- are no overrides.
    args = overrides or {}
    -- Add default preset to args.
    args.preset = default_opts
    -- Now add title.text to args (overriding previous values)
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
    error = error
}
