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

local Bullet = require('ALD/fake/skill/casting/Bullet')

local Super = require('ALD/fake/skill/casting/Fight')
local Class = {cls=915280}
Class.id = Class.cls * 100 + 1
rawset(_G, 'ALD/fake/skill/casting/神像/御风', Class)

function Class.Create(...)
    local self = setmetatable(Super.Create(...), { __index = setmetatable(Class, { __index = Super})})
    local player = self.player
    local data = Bullet_Bullet[800111]
    local bullet = player.event:Add(Bullet.Create({
        player=player, context=self.context,
        speed=data.Speed * g_ALDMgr.time_per_frame / 1000,
        radius=tonumber(data.MultiEyeSight) * 64,
        life=tonumber(data.LifeTime),
        code="ax.plot([x0, x1], [y0, y1], 'g')",
    }))
    bullet.Hurt = function(self)
        local player = self.player
        local target = player.target
        FightActions.mIceAtt.Formula(player, target, {}, self.context, {0.8 * FA5a, FA5b, 1, 0})
        target:RmBuff({BuffId=(640357 * 100 + Lv)})
        target:AddBuff({BuffId=(640357 * 100 + Lv)})
        target:AddBuff({BuffId=64266205, BuffTime=6})
    end
    player:AddTone('Wind')
    player:Status(EPropStatus['HitRecover']):Reset(Skill_ext_AllSkills[Class.id].Recover * 1000 - g_ALDMgr.time_per_frame)
    return self
end

return Class
