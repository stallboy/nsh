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

local Pursue = require('ALD/util/cast/move/Pursue')
local Escape = require('ALD/util/cast/move/Escape')

local Super = require('ALD/flowchart/Flowchart')
local Class = {}
rawset(_G, 'ALD/flowchart/KeepDist', Class)

function Class.Create(...)
    local self = setmetatable(Super.Create(...), { __index = setmetatable(Class, { __index = Super})})
    self.lower = self.fight:GetMinFarSkill().casting._far
    self.upper = self.fight:GetMaxFarSkill().casting._far
    return self
end

function Class:DecideMove()
    if self.role.dist_enemy < self.lower then
        return self.MoveEscape
    elseif self.role.dist_enemy > self.upper then
        return self.MovePursue
    end
end

function Class:OnTick()
    if math.random() < self.prob.fight then
        if self:Fight() then
            return true
        end
    end
    if math.random() < self.prob.run then
        local move = self:DecideMove()
        if move then
            move(self)
        end
    end
end

function Class:MovePursue()
    Pursue.Create(self.player, self.target):Move()
end

function Class:MoveEscape()
    Escape.Create(self.player, self.target):Move()
end

return Class
