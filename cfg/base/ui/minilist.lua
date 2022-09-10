local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"

function update_minilist(c)
    local minilist = c.screen.minilist
    if minilist == nil then return end

    -- Sum minimized clients for selected tags.
    local n = 0
    for _, tag in ipairs(c.screen.selected_tags) do
        -- In some weird situations it can return nil
        -- so we add `or 0` as a fallback just in case.
        n = n + (minilist.per_tag[tag.index] or 0)
    end

    -- Show them on minilist.
    minilist:set_markup_silently(string.rep("● ", n))
end

-- Update when a client is minimized
client.connect_signal("property::minimized", function(c)
    local minilist = c.screen.minilist
    if minilist == nil then return end

    -- We need to do it for each tag that the client
    -- is attached to (can be multiple!)
    for _, tag in ipairs(c:tags()) do
        local n = minilist.per_tag[tag.index]
        if c.minimized then
            minilist.per_tag[tag.index] = n + 1
        else
            minilist.per_tag[tag.index] = n - 1
        end
    end

    update_minilist(c)
end)

-- Update when tag is switched
tag.connect_signal("property::selected", update_minilist)

return function(s)
    -- The main textbox
    local tb = wibox.widget.textbox("")
    tb.font = beautiful.minilist_font or beautiful.font or "sans-serif 8.5"
    tb.align = "center"
    -- Track list of minimized clients per tag.
    tb.per_tag = {}

    -- Start with 0 for each tag.
    for _, tag in ipairs(s.tags) do
        tb.per_tag[tag.index] = 0
    end

    tb:connect_signal(
        "button::press",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
            end
        end
    )

    -- Attach to screen and return it.
    s.minilist = tb
    return s.minilist
end

