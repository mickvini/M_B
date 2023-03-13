do
-- local Mark = import('/mods/M&B/hook/lua/defaultunits.lua').Mark
local oldUnit = Unit

Unit = Class(oldUnit) { 
       
    OnCreate = function(self)
        oldUnit.OnCreate(self)
        self.MarkLevel = {0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    end,    
    -- OnMotionHorzEventChange = function( self, new, old )
    --     oldUnit.OnMotionHorzEventChange( self, new, old )
    --     local army = self:GetArmy()
         
    --     LOG(self.MK[army][1])
    --     if self.MK[army][1] >= 1 then
    --         self:SetMarkLevel(self, MK[army][1])
    --     end
    -- end,
    -- OnStopBeingBuilt = function(self, builder, layer)
    --     oldUnit.OnStopBeingBuilt(self, builder, layer)
    --     local army = self:GetArmy()
    --     LOG(army)
    --     LOG(MK[army][1])
    --     if MK[army][1] >= 1 then
    --         self:SetMarkLevel(self, MK[army][1])
    --     end
    -- end,
    -- -- SetVeterancy = function(self, veteranLevel)        
    -- --     local army = self:GetArmy()
    -- --     LOG(MK[army][1])
    -- --     if MK[army][1] >= 1 then
    -- --         self:SetMarkLevel(self, MK[army][1])
    -- --     end
    -- -- end,

    -- SetMarkLevel = function(self, zeroMK)       
             
    --     local bp = self:GetBlueprint()        
    --     --Check for unit buffs
        
    --             -- Generate a buff based on the data paseed in        
    --     local unitz = GetUnitById(bp.BlueprintId)
    --     LOG('Unit:'.. unitz:GetUnitId())
    --     LOG('Self:'..self:GetUnitId())
    --     if bp then
    --         Buff.ApplyBuff(self , 'VeterancyHealth5' )                       
    --     end
    --     LOG(self:GetBlueprint().Defense.Health)        
    -- end,

    -- CreateMarkBuff = function(self, levelName, levelValue, buffType)
    --     if buffType == 'Damage' then
    --         return false
    --     end
    
    --     -- Make sure there is an appropriate buff type for this unit
    --     if not self.BuffTypes[buffType] then
    --         WARN('*WARNING: Tried to generate a buff of unknown type to units: ' .. buffType .. ' - UnitId: ' .. self:GetUnitId() )
    --         return nil
    --     end
        
    --     --Generate a buff based on the unitId
    --     local buffName = self:GetUnitId() .. levelName .. buffType
        
    --     --Figure out what we want the Add and Mult values to be based on the BuffTypes table
    --     local addVal = 0
    --     local multVal = 1
    --     if self.BuffTypes[buffType].BuffValFunction == 'Add' then 
    --         addVal = levelValue
    --     else
    --         multVal = levelValue
    --     end
        
    --     -- Create the buff if needed
    --     if not Buffs[buffName] then
    --         BuffBlueprint {
    --             Name = buffName,
    --             DisplayName = buffName,
    --             BuffType = self.BuffTypes[buffType].BuffType,
    --             Stacks = self.BuffTypes[buffType].BuffStacks,
    --             Duration = self.BuffTypes[buffType].BuffDuration,
    --             Affects = {
    --                 Regen = {
    --                     Add = addVal,
    --                     Mult = multVal,
    --                 },
    --             },
    --         }
    --     end
        
    --     -- Return the buffname so the buff can be applied to the unit
    --     return buffName
    -- end,

 }

end