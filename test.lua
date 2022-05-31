local r = require "lib.rubato"
local constrain = require"utils.misc".constrainNum

local bar = r.timed {
    intro = 0.2,
    outro = 0.1,
    duration = 0.35,
    rate = 100,
    easing = r.quadratic,
    subscribed = function(pos)
        if mouse.screen.elements and mouse.screen.elements.bar then
            local b = mouse.screen.elements.bar
            b.y = 744 * pos
        end
    end
}

local max = r.timed {
    intro = 0.1,
    outro = 0.1,
    duration = 0.5,
    rate = 100,
    subscribed = function(pos)
        if client.focus == nil then return end
        local c = client.focus
--        c.height = c.height + ((700 - c.height) * pos)
        c.height = constrain(600 * pos, 300, 600)
--[[
        if pos >= 1 then
            c.maximized = true
        elseif pos <= 0 then
            c.maximized = false
        end
--]]
    end
}

return {
    bar = bar,
    max = max
}
