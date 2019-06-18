local switch = require 'switch'

local value = 'hello world'

local val = switch.switch(value)

val:case('hello world', function(v)
    print('Switch:', v)
end, value)

val:case('test', function(v)
    print('Switch:', v)
end, value)

val:default(function()
    print('Switch:', 'default')
end)
