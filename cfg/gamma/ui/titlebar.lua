local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

local color = {
    drag_focus = beautiful.titlebar_drag_button_focus or "#0000ff",
    drag_normal = beautiful.titlebar_drag_button_normal or "#999999",
    quit_focus = beautiful.titlebar_close_button_focus or "#ff0000",
    quit_normal = beautiful.titlebar_close_button_normal or "#999999",
    max_focus = beautiful.titlebar_maximized_button_focus or "#00ff00",
    max_normal = beautiful.titlebar_maximized_button_normal or "#999999",
    min_focus = beautiful.titlebar_minimize_button_focus or "#ffff00",
    min_normal = beautiful.titlebar_minimize_button_normal or "#999999"
}

local tb_left_shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, false, false, true, 10)
end

local tb_right_shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, false, true, true, false, 10)
end

local button_surface = function(shape_color)
    return gears.surface.load_from_shape(
        25,
        25,
        gears.shape.circle,
        shape_color
    )
end

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

return function(c)
    -- Close button
    local quit_button = awful.button({}, 1, function()
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
    local min_button = awful.button({}, 1, function()
        c.minimized = true
    end)

    -- The focus button can be used to resize and move clients as well.
    local focus_button = gears.table.join(
        awful.button({}, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
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

    local quit_button_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        image = button_surface(color.quit_normal),
        resize = true,
        buttons = quit_button
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
        size = 25,
        bg_focus = gears.color.transparent,
        bg_normal = gears.color.transparent
    })

    titlebar:setup {
        widget = wibox.container.background,
        bg = beautiful.colors.black,
        shape = tb_left_shape,
        {
            layout = wibox.layout.align.vertical,
            {
                layout = wibox.layout.fixed.vertical,
                {
                    widget = wibox.container.margin,
                    top = 10,
                    bottom = 10,
                    left = 7,
                    right = 7,
                    quit_button_widget
                },
                {
                    widget = wibox.container.margin,
                    bottom = 10,
                    left = 7,
                    right = 7,
                    max_button_widget
                },
                {
                    widget = wibox.container.margin,
                    bottom = 10,
                    left = 7,
                    right = 7,
                    min_button_widget
                },
            },
            nil,
            {
                widget = wibox.container.margin,
                bottom = 10,
                left = 7,
                right = 7,
                focus_button_widget
            }
        }
    }

    -- For kitty windows, we add another titlebar to
    -- the left to get smoother rounding lol.
    -- Otherwise set c.shape to round_rect
    if c.class == "kitty" or c.name == "bash" then
        set_right_titlebar(c)
    else
        c.shape = tb_right_shape
    end

    c.update_focus = function(focused)
        if focused then
            quit_button_widget.image = button_surface(color.quit_focus)
            max_button_widget.image = button_surface(color.max_focus)
            min_button_widget.image = button_surface(color.min_focus)
            focus_button_widget.image = button_surface(color.drag_focus)
        else
            quit_button_widget.image = button_surface(color.quit_normal)
            max_button_widget.image = button_surface(color.max_normal)
            min_button_widget.image = button_surface(color.min_normal)
            focus_button_widget.image = button_surface(color.drag_normal)
        end
    end

    -- It seems like the INITIAL "focus" signal is emitted before
    -- the titlebars are initialized properly, which means when new
    -- windows are created, their buttons aren't colored properly
    -- even if the client is focused. Which is why after initializing
    -- the titlebars, we run the update_focus function once to make
    -- sure the buttons are colored properly nicely.
    c.update_focus(true)
end
