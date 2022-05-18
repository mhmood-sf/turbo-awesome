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

-- Sets upper/lower limits for a given number
local function constrainNum(n, lower, upper)
    if n > upper then
        return upper
    elseif n < lower then
        return lower
    else
        return n
    end
end

-- Returns a string constrained to specified length.
-- align controls where to cut off the string (
-- left-aligned cuts off at the end, right-align
-- at the start, the default is the center.)
local function constrainStr(str, size, align)
    if string.len(str) < size then
        return str
    end

    if align == "left" then
        local substr = string.sub(str, 1, size - 3)
        return strip(substr) .. "..."
    elseif align == "right" then
        local len = string.len(str)
        local substr = string.sub (str, len - size + 3, len)
        return "..." .. strip(substr)
    else
        local len = string.len(str)
        local lsize = math.ceil(size / 2)
        local rsize = math.floor(size / 2)
        local left = string.sub(str, 1, lsize)
        local right = string.sub(str, len - rsize + 3, len)
        return strip(left) .. "..." .. strip(right)
    end
end

-- Creates a new table (values are copied over shallowly)
-- that includes key/values from both tables A and B.
-- If they have the same keys, then B overwrites A.
local function mergeTables(A, B)
    local tmp = {}
    for k, v in pairs(A) do tmp[k] = v end
    for k, v in pairs(B) do tmp[k] = v end
    return tmp
end

return {
    split = split,
    strip = strip,
    constrainStr = constrainStr,
    constrainNum = constrainNum,
    mergeTables = mergeTables
}

