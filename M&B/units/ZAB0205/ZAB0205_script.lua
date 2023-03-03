#****************************************************************************
#**
#**  File     :  /ZAB0205_script.lua
#**  Author(s):  Packer
#**
#**  Summary  :  Reclaim Turret
#****************************************************************************
local AConstructionStructureUnit = import('/lua/aeonunits.lua').AConstructionUnit

ZAB0205 = Class(AConstructionStructureUnit) 
{
    
    OnCreate = function(self)
        local reclaimthread = ForkThread(self.ReclaimerThread, self)
        self.Trash:Add(reclaimthread)
        AConstructionStructureUnit.OnCreate(self)
    end,
    ReclaimCheck = function(self, unit)

        if(self["Blacklist"][unit] ~= nil) then
            return;
        else
            IssueReclaim({self}, unit)            
        end
    end,

    ReclaimerThread = function(self)

        local aiBrain = GetArmyBrain(self:GetArmy())
        local bp = self:GetBlueprint().Economy.MaxBuildDistance
        local pos = self:GetPosition()
        local curMass = 0
        local reclaimMass = false

        self["TimeOut"] = 0;
        self["Blacklist"] = {};


        while not self.Dead do

            curMass = aiBrain:GetEconomyStoredRatio('MASS')


            -- If Current Mass Greater than 95%
            if (reclaimMass and curMass > 0.95) then
                IssueClearCommands({self})
                self["Blacklist"] = {};
                reclaimMass = false
            elseif (not reclaimMass and curMass < 0.90) then
                reclaimMass = true
            end
            
            local reclaimTargets = GetReclaimablesInRect(pos[1] - bp, pos[3] - bp, pos[1] + bp, pos[3] + bp);

            -- Clear blacklist if finished reclaiming everything or if reclaim targets greater than blacklist
            if(table.getn(reclaimTargets) <= 0 or table.getn(reclaimTargets) > table.getn(self["Blacklist"])) then
                IssueClearCommands({self})
                self["Blacklist"] = {};
            end

            for i, unit in reclaimTargets do
                -- Check unit is properly defined
                if (unit) then
                    
                    -- Check range to target
                    targetpos = unit:GetPosition()

                    if (VDist2(pos[1], pos[3], targetpos[1], targetpos[3]) <= bp) then
                        if (IsUnit(unit)) then
                            if not IsAlly(self:GetArmy(), unit:GetArmy()) and not unit:IsCapturable() then
                                self.ReclaimCheck(self, unit);
                            end
                        elseif (reclaimMass) then
                            self.ReclaimCheck(self, unit);
                        end
                    end
                end

            end 
            WaitSeconds(self["TimeOut"]);
            self["TimeOut"] = (table.getn(reclaimTargets) * 0.05);                      
        end
    end,
}
TypeClass = ZAB0205