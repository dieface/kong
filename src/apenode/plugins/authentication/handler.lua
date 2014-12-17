-- Copyright (C) Mashape, Inc.

local BasePlugin = require "apenode.base_plugin"
local access = require "apenode.plugins.authentication.access"

local AuthenticationHandler = {}
AuthenticationHandler.__index = AuthenticationHandler

setmetatable(AuthenticationHandler, {
  __index = BasePlugin, -- this is what makes the inheritance work
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:_init(...)
    return self
  end,
})

function AuthenticationHandler:_init(name)
  BasePlugin._init(self, name) -- call the base class constructor
end

function AuthenticationHandler:access()
  BasePlugin.access(self)
  access.execute()
end

return AuthenticationHandler