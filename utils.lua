-- Useful lua functions

-- Remove leading/trailing whitespace
local function strip(str)
    return string.match(str, "^%s*(.-)%s*$")
end

-- Split strings by separator
local function split(str, sep)
    local iterator = string.gmatch(str, "[^" .. sep .."]+")
    local lst = {}
    for i in iterator do
        table.insert(lst, i)
    end
    return lst
end

-- Returns shell command output, or fallback if
-- command fails.
local function shell(cmd, fallback)
    local handle = io.popen(cmd)
    local output = handle:read("*a")
    handle:close()

    if output == nil then
        return fallback
    else
        return strip(output)
    end
end

return {
    shell = shell,
    split = split,
    strip = strip
}

