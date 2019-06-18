local switch = require 'switch'

local value = 'hello world'

local v = switch.Switch(value)

v:Case('hello world', function(tx)
    print('Switch:', tx)
    v:Break()
end, value)

v:Case('test', function(tx)
    print('Switch:', tx)
    v:Break()
end, value)

v:Default(function()
    print('Switch:', 'default')
    v:Break()
end)
