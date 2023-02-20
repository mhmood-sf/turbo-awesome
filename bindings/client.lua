local awful = require "awful"
local gears = require "gears"

clientkeys = gears.table.join(
    awful.key({ modkey, }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "Toggle fullscreen", group = "client" }),

    awful.key({ modkey, "Shift" }, "x", function (c) c:kill() end,
              {description = "Close client", group = "client"}),

    awful.key({ modkey }, "q",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "Minimize", group = "client"}),

    awful.key({ modkey }, "e",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(Un)maximize", group = "client"})
)

-- Mouse bindings
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end)

    --[[ No need for this since I already have the button for moving/resizing clients.

    -- Move client
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),

    -- Resize client
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)

    --]]
)
