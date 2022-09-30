local gears = require "gears"
local awful = require "awful"
local notif = require "notif"

local audio = require "system.audio"
local brightness = require "system.brightness"

-- Key bindings
globalkeys = gears.table.join(
    -- Volum up/down/mute using amixer
    awful.key({ }, "F2", audio.toggle_mute,
              {description = "Toggle Mute", group = "Fn Controls"}),
    awful.key({ }, "F3", audio.volume_down,
              {description = "Decrease volume by 5%", group = "Fn Controls"}),
    awful.key({ }, "F4", audio.volume_up,
              {description = "Increase volume by 5%", group = "Fn Controls"}),

    -- Brightness up/down using xrandr
    awful.key({ }, "F5", brightness.down,
              {description = "Decrease brightness by 5%", group = "Fn Controls"}),
    awful.key({ }, "F6", brightness.up,
              {description = "Increase brightness by 5%", group = "Fn Controls"}),

    -- Open terminal
    awful.key({ modkey }, "t", function() awful.spawn(terminal) end,
              {description = "Open a terminal", group = "launcher"}),

    -- Open music player
    awful.key({ modkey }, "m", function() awful.spawn(musicplayer) end,
              {description = "Open music player", group = "launcher"}),

    -- Open rofi
    awful.key({ modkey }, "r", function() awful.spawn(launcher) end,
              {description = "Open launcher", group = "launcher"}),

    -- Open file manager
    awful.key({ modkey }, "o", function() awful.spawn(filemanager) end,
              {description = "Open file manager", group = "launcher"}),

    -- Open browser
    awful.key({ modkey }, "b", function () awful.spawn(browser) end,
              {description = "Open browser", group = "launcher"}),

    -- Switch layout
    awful.key({ modkey }, "Tab", function () awful.layout.inc(1) end,
              {description = "Select next layout", group = "layout"}),

    -- Navigating tags
    awful.key({ modkey }, "a", awful.tag.viewprev,
              {description = "View previous tag", group = "tag"}),
    awful.key({ modkey }, "d", awful.tag.viewnext,
              {description = "View next tag", group = "tag"}),

    -- Switching through clients
    awful.key({ modkey }, "w", function() awful.client.focus.byidx(1) end,
        {description = "Focus next by index", group = "client"}),
    awful.key({ modkey }, "s", function() awful.client.focus.byidx(-1) end,
        {description = "Focus previous by index", group = "client"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "w", function () awful.client.swap.byidx(1) end,
              {description = "Swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift" }, "s", function () awful.client.swap.byidx(-1) end,
              {description = "Swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Shift"}, "a", function() notif.error({text="Unimplemented!"}) end,
              {description = "Move focused client to previous tag", group = "client"}),

    awful.key({ modkey, "Shift"}, "d", function() notif.error({text="Unimplemented!"}) end,
              {description = "Move focused client to next tag", group = "client"}),

    -- Restore minimzed clients
    awful.key({ modkey, "Shift" }, "q",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "Restore minimized client", group = "client"}),

    -- Controls
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "Reload awesome", group = "Controls"}),
    awful.key({ modkey, "Control" }, "s", function() awful.spawn(screenshot) end,
              {description = "Screenshot", group = "Controls"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 5 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "View tag #"..i, group = "tag"}),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "Move focused client to tag #"..i, group = "tag"})
    )
end

-- Set keys
root.keys(globalkeys)
