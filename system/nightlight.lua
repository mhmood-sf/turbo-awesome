local awful = require "awful"
local constrain = require"utils.misc".constrainNum

-- Default nightlight setting, a number
-- from 1 (warmest) to 10 (coldest).
local DEFAULT_GAMMA = 5
local DISPLAY_OUTPUT = "LVDS-1"

-- Taken from: https://askubuntu.com/a/1061304
local gammas = {
    "1.00:0.71:0.42",  -- Warmest, index 1
    "1.00:0.77:0.54",
    "1.00:0.82:0.64",
    "1.00:0.86:0.73",
    "1.00:0.90:0.81",
    "1.00:0.93:0.88",
    "1.00:0.97:0.94",
    "1.00:1.00:1.00",  -- Default, index 8
    "0.95:0.96:1.00",
    "0.91:0.94:1.00"   -- Coldest, index 10
}

-- val is from 1 to 10
local function set_gamma(val)
    local cmd = ""
    cmd = cmd .. "xrandr --output " .. DISPLAY_OUTPUT
    cmd = cmd .. " --gamma " .. gammas[constrain(val, 1, 10)]
    awful.spawn(cmd)
end

local function increase_warmth()
    set_gamma(DEFAULT_GAMMA + 1)
end

local function decrease_warmth()
    set_gamma(DEFAULT_GAMMA - 1)
end

set_gamma(DEFAULT_GAMMA)

return {
    set_gamma,
    increase_warmth,
    decrease_warmth
}
