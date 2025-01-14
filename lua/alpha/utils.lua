-- utility functions

local utils = {}

-- usage:
-- loadstring = memoize(loadstring)
function utils.memoize (f)
    local mem = {} -- memoizing table
    setmetatable(mem, {__mode = "kv"}) -- make it weak
    return function (x) -- new version of ’f’, with memoizing
        local r = mem[x]
        if r == nil then -- no previous result?
            r = f(x) -- calls original function
            mem[x] = r -- store result for reuse
        end
        return r
    end
end

function utils.from_nil(x, nil_case)
    if x == nil
        then return nil_case
        else return x
    end
end



return utils
