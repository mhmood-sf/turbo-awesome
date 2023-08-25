local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

local color = {
    drag_focus = beautiful.titlebar_drag_button_focus or "#0000ff",
    drag_normal = beautiful.titlebar_drag_button_normal or "#999999",
    close_focus = beautiful.titlebar_close_button_focus or "#ff0000",
    close_normal = beautiful.titlebar_close_button_normal or "#999999",
    max_focus = beautiful.titlebar_maximized_button_focus or "#00ff00",
    max_normal = beautiful.titlebar_maximized_button_normal or "#999999",
    min_focus = beautiful.titlebar_minimize_button_focus or "#ffff00",
    min_normal = beautiful.titlebar_minimize_button_normal or "#999999"
}

-- Fns for left/right side rounded titlebars.
local tb_left_shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, false, false, true, 10)
end
local tb_right_shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, false, true, true, false, 10)
end

-- Function to generate a circle shape as a surface.
local button_surface = function(shape_color)
    return gears.surface.load_from_shape(
        20,
        20,
        gears.shape.circle,
        shape_color
    )
end

-- Attach the right-side titlebar to provided client.
local set_right_titlebar = function(c)
    local right_titlebar = awful.titlebar(c, {
        position = "right",
        size = 25,
        bg_focus = gears.color.transparent,
        bg_normal = gears.color.transparent
    })

    right_titlebar:setup {
        widget = wibox.container.background,
        bg = beautiful.titlebar_bg_normal,
        shape = tb_right_shape,
        {
            widget = wibox.widget.base.empty_widget
        }
    }
end

-- Signals to change drag button color on focus/unfocus.
client.connect_signal("focus", function(c)
    -- When the first "focus" signal is emitted after the client
    -- is created, the titlebars may not be initialized properly,
    -- which would give us an error because `c` does not yet
    -- have any `update_focus` property. Thus we need a nil-check
    -- before calling it.
    if c.update_focus then c.update_focus(true) end
end)

client.connect_signal("unfocus", function(c)
    -- Same as above.
    if c.update_focus then c.update_focus(false) end
end)

-- Main function that takes a client obj and sets up the titlebars.
return function(c)
    -- Close button
    local close_button = awful.button({}, 1, function()
        client.focus = c
        c:kill()
    end)

    -- Maximize button
    local max_button = awful.button({}, 1, function()
        client.focus = c
        if c.maximized then
            c.maximized = false
        else
            c.maximized = true
        end
    end)

    -- Minimize button
    -- TODO: Doesn't work for some reason.
    local min_button = awful.button({}, 1, function()
        client.focus = c
        c.minimized = true
    end)

    -- The focus button can be used to resize and move clients as well.
    local focus_button = gears.table.join(
        -- Pressing and dragging the button resizes the client.
        awful.button({}, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )

    local focus_button_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        image = button_surface(color.drag_normal),
        resize = true,
        buttons = focus_button
    }

    local close_button_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        image = button_surface(color.close_normal),
        resize = true,
        buttons = close_button
    }

    local max_button_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        image = button_surface(color.max_normal),
        resize = true,
        buttons = max_button
    }

    local min_button_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        image = button_surface(color.min_normal),
        resize = true,
        buttons = min_button
    }

    local titlebar = awful.titlebar(c, {
        position = "left",
        size = 30,
        bg_focus = gears.color.transparent,
        bg_normal = gears.color.transparent
    })

    local move_button = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end)
    )

    titlebar:setup {
        widget = wibox.container.background,
        bg = beautiful.titlebar_bg_normal,
        shape = tb_left_shape,
        {
            layout = wibox.layout.align.vertical,
            {
                layout = wibox.layout.fixed.vertical,
                {
                    widget = wibox.container.margin,
                    top = 10,
                    bottom = 10,
                    left = 8,
                    right = 7,
                    close_button_widget
                },
                {
                    widget = wibox.container.margin,
                    bottom = 10,
                    left = 8,
                    right = 7,
                    max_button_widget
                },
                {
                    widget = wibox.container.margin,
                    bottom = 10,
                    left = 8,
                    right = 7,
                    min_button_widget
                },
            },
            {
                layout = wibox.layout.fixed.vertical,
                buttons = move_button
            },
            {
                widget = wibox.container.margin,
                bottom = 10,
                left = 8,
                right = 7,
                focus_button_widget
            }
        }
    }

    -- For kitty windows, we add another titlebar to
    -- the left to get smoother rounding lol.
    -- Otherwise set c.shape to round_rect
    --[[
    if c.class == "kitty" or c.name == "bash" then
        set_right_titlebar(c)
    else
        c.shape = tb_right_shape
    end
    --]]
    c.shape = tb_right_shape

    c.update_focus = function(focused)
        if focused then
            close_button_widget.image = button_surface(color.close_focus)
            max_button_widget.image = button_surface(color.max_focus)
            min_button_widget.image = button_surface(color.min_focus)
            focus_button_widget.image = button_surface(color.drag_focus)
        else
            close_button_widget.image = button_surface(color.close_normal)
            max_button_widget.image = button_surface(color.max_normal)
            min_button_widget.image = button_surface(color.min_normal)
            focus_button_widget.image = button_surface(color.drag_normal)
        end
    end

    -- NOTE sometimes when restarting awesome, the titlebar button
    -- colors are a bit out of sync (i.e unfocused clients may have
    -- focused button colors and vice versa), probably because of
    -- how signals are emitted and how clients are "created" (?) when
    -- restarting awesome (restarting doesn't actually close and then
    -- re-open clients, it does something else, I'm not sure). Anyways,
    -- that's why over here we explicitly focus the current client and
    -- set its titlebar colors to try and make sure everything is
    -- properly in order.
    client.focus = c
    c.update_focus(true)
end

-- TODO: Titlebars to move clients.
--        -- Pressing and dragging the button drags the client.
--        awful.button({}, 1, function()
--            client.focus = c
--            c:raise()
--            awful.mouse.client.move(c)
--        end),
