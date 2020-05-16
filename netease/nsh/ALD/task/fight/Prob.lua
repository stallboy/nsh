--[=====[
Copyright (C) 2018--2020, 申瑞珉 (Ruimin Shen)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]=====]

local python = g_ALDMgr.python
local builtins = python.builtins()
local config = g_ALDMgr.config

local Super = require('ALD/task/fight/Fight')
local Class = {}
rawset(_G, 'ALD/task/fight/Prob', Class)

function Class.Create(...)
    local self = setmetatable(Super.Create(...), { __index = setmetatable(Class, { __index = Super})})
    self.name, self.enable = {}, {}
    for _, item in ipairs(python:Iter2Table(builtins.iter(builtins.str.split(config.get('nsh_' .. string.lower(self.role.talent.alias) .. '_fight', 'prob'))))) do
        local name, enable = unpack(python:Iter2Table(builtins.iter(builtins.str.split(item, '='))))
        if enable then
            table.insert(self.name, name)
            table.insert(self.enable, tonumber(enable))
        end
    end
    return self
end

function Class:Get()
    return self.name
end

function Class:Set()
    for i, name in ipairs(self.name) do
        local skill = self.role._skill[name]
        assert(skill, name)
        if math.random() < self.enable[i] then
            skill:Enable()
        else
            skill:Disable()
        end
    end
end

return Class
