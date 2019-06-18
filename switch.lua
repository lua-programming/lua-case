local switch = {}
local methods = {}
function methods:Case(value, _function_, ...)
    if self.value == value and not self.taken then
        return pcall(_function_, ...)
    end
    return false
end
function methods:Default(_function_, ...)
    if not self.taken then
        return pcall(_function_, ...)
    end
    return false
end
function methods:Break()
    if self.taken == true then
        return false
    end
    self.taken = true
    return true
end
function switch.Switch(value)
    local tab = {__index = methods}
    local self = setmetatable({value = value}, tab)
    return self
end
return switch
