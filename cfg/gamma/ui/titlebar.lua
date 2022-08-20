local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"
local beautiful = require "beautiful"

local drag_normal_color = beautiful.titlebar_drag_button_normal or beautiful.colors.grey or "#999999"
local drag_focus_color = beautiful.titlebar_drag_button_focus or beautiful.colors.accent or "#0000ff"
local quit_color = beautiful.titlebar_close_button_normal or beautiful.colors.red or "#ff0000"
local max_color = beautiful.titlebar_maximized_button_normal or beautiful.colors.green or "#00ff00"
local min_color = beautiful.titlebar_minimize_button_normal or beautiful.colors.yellow or "#ffff00"

local tb_left_shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, false, false, true, 10)
end

local tb_right_shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, false, true, true, false, 10)
end

local button_surface = function(color)
    return gears.surface.load_from_shape(
        25,
        25,
        gears.shape.circle,
        color
    )
end

-- Signals to change drag button color on focus/unfocus.
client.connect_signal("focus", function(c)
--    local tb = awful.titlebar(c, { position = "left" })
--    tb.widget.third.widget.image = button_surface(drag_focus_color)
    if c.update_focus then c.update_focus(true) end
end)

client.connect_signal("unfocus", function(c)
--    local tb = awful.titlebar(c, { position = "left" })
--    tb.widget.third.widget.image = button_surface(drag_normal_color)
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

    local focus_widget = wibox.widget {
        widget = wibox.widget.imagebox,
        image = button_surface(drag_normal_color),
        resize = true,
        buttons = focus_button
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
                    {
                        widget = wibox.widget.imagebox,
                        image = button_surface(quit_color),
                        resize = true,
                        buttons = quit_button
                    }
                },
                {
                    widget = wibox.container.margin,
                    bottom = 10,
                    left = 7,
                    right = 7,
                    {
                        widget = wibox.widget.imagebox,
                        image = button_surface(max_color),
                        resize = true,
                        buttons = max_button
                    }
                },
                {
                    widget = wibox.container.margin,
                    bottom = 10,
                    left = 7,
                    right = 7,
                    {
                        widget = wibox.widget.imagebox,
                        image = button_surface(min_color),
                        resize = true,
                        buttons = min_button
                    }
                },
            },
            nil,
            {
                widget = wibox.container.margin,
                bottom = 10,
                left = 7,
                right = 7,
                focus_widget--[[
                {
                    widget = wibox.widget.imagebox,
                    image = button_surface(drag_normal_color),
                    resize = true,
                    buttons = focus_button
                }]]
            }
        }
    }

    -- For kitty windows, we add another titlebar to the left
    -- to get proper rounding lol.
    if c.class == "kitty" or c.name == "bash" then
        local right_titlebar = awful.titlebar(c, {
            position = "right",
            size = 25,
            bg_focus = gears.color.transparent,
            bg_normal = gears.color.transparent
        })

        right_titlebar:setup {
            widget = wibox.container.background,
            bg = beautiful.colors.black,
            shape = tb_right_shape,
            {
                widget = wibox.widget.base.empty_widget
            }
        }
    else
        -- Otherwise set c.shape to round the other side
        c.shape = tb_right_shape
    end

    c.update_focus = function(focused)
        focus_widget.image = button_surface(focused and drag_focus_color or drag_normal_color)
    end
end
