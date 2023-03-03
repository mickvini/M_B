do

local oldUnit=import('/lua/sim/Unit.lua').Unit
Unit = Class(oldUnit) {
    OnCreate = function(self)
        oldUnit.OnCreate(self)
        self.MK = 0
    end,

    
    SetMarkLevel = function(self)
        if self.MK == 0 then
            return 0
        end
        
        local bp = self:GetBlueprint()
        --Check for unit buffs
        if bp.Buffs then
            for bType,bData in bp do
                
                -- Generate a buff based on the data paseed in
                local buffName = self:CreateMarkBuff( 'MK1', self.MK, bType )
                if buffName then
                    Buff.ApplyBuff( __blueprints[bp.BlueprintId], buffName )                       
                end
            end
        end
    end,

    CreateMarkBuff = function(self, levelName, levelValue, buffType)
        if buffType == 'Damage' then
            return false
        end
    
        # Make sure there is an appropriate buff type for this unit
        if not self.BuffTypes[buffType] then
            WARN('*WARNING: Tried to generate a buff of unknown type to units: ' .. buffType .. ' - UnitId: ' .. self:GetUnitId() )
            return nil
        end
        
        --Generate a buff based on the unitId
        local buffName = self:GetUnitId() .. levelName .. buffType
        
        --Figure out what we want the Add and Mult values to be based on the BuffTypes table
        local addVal = 0
        local multVal = 1
        if self.BuffTypes[buffType].BuffValFunction == 'Add' then 
            addVal = levelValue
        else
            multVal = levelValue
        end
        
        # Create the buff if needed
        if not Buffs[buffName] then
            BuffBlueprint {
                Name = buffName,
                DisplayName = buffName,
                BuffType = self.BuffTypes[buffType].BuffType,
                Stacks = self.BuffTypes[buffType].BuffStacks,
                Duration = self.BuffTypes[buffType].BuffDuration,
                Affects = {
                    Regen = {
                        Add = addVal,
                        Mult = multVal,
                    },
                },
            }
        end
        
        -- Return the buffname so the buff can be applied to the unit
        return buffName
    end,

 }

end