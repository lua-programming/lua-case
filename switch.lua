local switch = {}
local methods = {}
function methods:case(value, _function_, ...)
    if self.value == value and not self.taken then
        self.taken = true
        return pcall(_function_, ...)
    end
    return false
end
function methods:default(_function_, ...)
    if not self.taken then
        return pcall(_function_, ...)
    end
    return false
end

function switch.switch(value)
    local tab = {__index = methods}
    local self = setmetatable({value = value}, tab)
    return self
end

return switch
