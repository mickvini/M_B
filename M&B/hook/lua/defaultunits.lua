local Game = import('/lua/game.lua')
--local Buff = import('/mods/M&B/hook/lua/sim/Buff.lua')
--------------------------------------------------------------------------------
local MK = {  }
do
    for i = 1, 8 do
        table.insert(MK,
        {{Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0},
         {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0},
         {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0},
         {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0},
         {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0},
         {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0},
         {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}, {Aeon =0, UEF = 0, Cybran = 0, Seraphim = 0}})
    end
end 


countingResearchsToUnlockTECH = function(unit, army, tech)        
    local unitBp = unit:GetBlueprint()   
    MK[army][tonumber(string.sub(tech, 4 , 6))][unitBp.General.FactionName] = MK[army][tonumber(string.sub(tech, 4 , 6))][unitBp.General.FactionName] + 1    
    LOG(MK[army][tonumber(string.sub(tech, 4 , 6))][unitBp.General.FactionName])
     
    local factions = { Aeon = 'sar9', UEF = 'ser9', Cybran = 'srr9', Seraphim = 'ssr9' }   
    if (tonumber(string.sub(tech, 3)) + 100) < 515 then
        RemoveBuildRestriction(army, categories[factions[unitBp.General.FactionName].. (tonumber(string.sub(tech, 3)) + 100) .. '00'])
    end              
end

SetMarkLevel = function(self,army, buffName)       
    local bp = self:GetBlueprint()       
    if bp then        
        Buff.ApplyBuff(self ,  buffName)                       
    end      
end


--Update existing defaultunits classes   


local oldStructureUint = StructureUnit
local oldConstructionUnit = ConstructionUnit
local oldWalkingLandUnit = WalkingLandUnit
local oldSubUnit = SubUnit
local oldAirUnit = AirUnit
local oldSeaUnit = SeaUnit
StructureUnit = Class(oldStructureUint) {

    OnStopBeingBuilt = function(self, builder, layer)
        oldStructureUint.OnStopBeingBuilt(self,builder,layer)
        local army = self:GetArmy() 
        local unitBp = self:GetBlueprint()
        local factionCat = unitBp.General.FactionName        
        if MK[army][1][factionCat] > 0 and not table.find(unitBp.Categories, 'DEFENSE') and not table.find(unitBp.Categories, 'ENGINEERSTATION') then
            SetMarkLevel(self, army, 'StructureHealthMod' .. MK[army][1][factionCat])
        end
        if MK[army][3][factionCat] > 0 and table.find(unitBp.Categories, 'ENGINEERSTATION') then
            SetMarkLevel(self, army, 'EngineerStationMod' .. MK[army][3][factionCat])
        end
        if MK[army][13][factionCat] > 0 and table.find(unitBp.Categories, 'DEFENSE') then
            SetMarkLevel(self, army, 'WeaponBuffTurret' .. MK[army][13][factionCat])
        end
        if MK[army][14][factionCat] > 0 and table.find(unitBp.Categories, 'DEFENSE') then
            SetMarkLevel(self, army, 'HealthBuffTurret' .. MK[army][14][factionCat])
        end
    end,

}
ConstructionUnit = Class(oldConstructionUnit){
    OnStopBeingBuilt = function(self, builder, layer)
        oldConstructionUnit.OnStopBeingBuilt(self,builder,layer)
        local army = self:GetArmy()    
        local unitBp = self:GetBlueprint()
        local factionCat = unitBp.General.FactionName
        if MK[army][2][factionCat] > 0 then
            SetMarkLevel(self, army, 'ConstrctionBotMod' .. MK[army][2][factionCat])
        end
    end,
    OnCreate = function(self)
        oldConstructionUnit.OnCreate(self)
        local army = self:GetArmy()    
        local unitBp = self:GetBlueprint()
        local factionCat = unitBp.General.FactionName
        if MK[army][3][factionCat] > 0  and table.find(unitBp.Categories, 'STATIONASSISTPOD') then
            SetMarkLevel(self, army, 'EngineerStationMod' .. MK[army][3][factionCat])
        end
    end,
}
-- Attack units
WalkingLandUnit = Class(oldWalkingLandUnit) {
    OnStopBeingBuilt = function(self, builder, layer)
        oldWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        local army = self:GetArmy()   
        local factionCat = self:GetBlueprint().General.FactionName
        if MK[army][4][factionCat] > 0 then
            SetMarkLevel(self, army, 'MobileBuffLand' .. MK[army][4][factionCat])
        end
        if MK[army][5][factionCat] > 0 then
            SetMarkLevel(self, army, 'HealthBuffLand' .. MK[army][5][factionCat])
        end        
        if MK[army][6][factionCat] > 0 then
            SetMarkLevel(self, army, 'WeaponBuffLand' .. MK[army][6][factionCat])
        end
    end,
}

LandUnit = Class(MobileUnit) {
    OnStopBeingBuilt = function(self, builder, layer)
        MobileUnit.OnStopBeingBuilt(self, builder, layer)
        local army = self:GetArmy()    
        local factionCat = self:GetBlueprint().General.FactionName
        if MK[army][4][factionCat] > 0 then
            SetMarkLevel(self, army, 'MobileBuffLand' .. MK[army][4][factionCat])
        end
        if MK[army][5][factionCat] > 0 then
            SetMarkLevel(self, army, 'HealthBuffLand' .. MK[army][5][factionCat])
        end        
        if MK[army][6][factionCat] > 0 then
            SetMarkLevel(self, army, 'WeaponBuffLand' .. MK[army][6][factionCat])
        end
    end,
}

HoverLandUnit = Class(MobileUnit) {
    OnStopBeingBuilt = function(self, builder, layer)
        MobileUnit.OnStopBeingBuilt(self, builder, layer)
        local army = self:GetArmy()    
        local factionCat = self:GetBlueprint().General.FactionName
        if MK[army][4][factionCat] > 0 then
            SetMarkLevel(self, army, 'MobileBuffLand' .. MK[army][4][factionCat])
        end
        if MK[army][5][factionCat] > 0 then
            SetMarkLevel(self, army, 'HealthBuffLand' .. MK[army][5][factionCat])
        end        
        if MK[army][6][factionCat] > 0 then
            SetMarkLevel(self, army, 'WeaponBuffLand' .. MK[army][6][factionCat])
        end
    end,
}

AirUnit = Class(oldAirUnit) {
    OnStopBeingBuilt = function(self, builder, layer)
        oldAirUnit.OnStopBeingBuilt(self, builder, layer)
        local army = self:GetArmy() 
        local factionCat = self:GetBlueprint().General.FactionName
        if MK[army][7][factionCat] > 0 then
            SetMarkLevel(self, army, 'MobileBuffAir' .. MK[army][7][factionCat])
        end
        if MK[army][8][factionCat] > 0 then
            SetMarkLevel(self, army, 'HealthBuffAir' .. MK[army][8][factionCat])
        end        
        if MK[army][9][factionCat] > 0 then
            SetMarkLevel(self, army, 'WeaponBuffAir' .. MK[army][9][factionCat])
        end
    end,
}

SeaUnit = Class(oldSeaUnit) {
    OnStopBeingBuilt = function(self, builder, layer)
        oldSeaUnit.OnStopBeingBuilt(self, builder, layer)
        local army = self:GetArmy()    
        local factionCat = self:GetBlueprint().General.FactionName
        if MK[army][10][factionCat] > 0 then
            SetMarkLevel(self, army, 'MobileBuffNaval' .. MK[army][10][factionCat])
        end
        if MK[army][11][factionCat] > 0 then
            SetMarkLevel(self, army, 'HealthBuffNaval' .. MK[army][11][factionCat])
        end        
        if MK[army][12][factionCat] > 0 then
            SetMarkLevel(self, army, 'WeaponBuffNaval' .. MK[army][12][factionCat])
        end
    end,
}

SubUnit = Class(oldSubUnit) {
    OnStopBeingBuilt = function(self, builder, layer)
        oldSubUnit.OnStopBeingBuilt(self, builder, layer)
        local army = self:GetArmy() 
        local factionCat = self:GetBlueprint().General.FactionName
        if MK[army][10][factionCat] > 0 then
            SetMarkLevel(self, army, 'MobileBuffNaval' .. MK[army][10][factionCat])
        end
        if MK[army][11][factionCat] > 0 then
            SetMarkLevel(self, army, 'HealthBuffNaval' .. MK[army][11][factionCat])
        end        
        if MK[army][12][factionCat] > 0 then
            SetMarkLevel(self, army, 'WeaponBuffNaval' .. MK[army][12][factionCat])
        end
    end,
}
    

ResearchItem = Class(DummyUnit) {
    OnCreate = function(self)
        local bp = self.BpId and __blueprints[self.BpId] or self:GetBlueprint()
        DummyUnit.OnCreate(self)
        --Restrict me, the RND item, to one being built at a time.        
        AddBuildRestriction(self:GetArmy(), categories[bp.BlueprintId] )                               
    end,

    OnStopBeingBuilt = function(self, builder, layer)
        local bp = self:GetBlueprint()
        local army = self:GetArmy()
        factionCat = categories[string.upper(bp.General.FactionName or 'SELECTABLE')]
        -- Enable what we were supposed to allow.
        if bp.ResearchId == string.lower(bp.ResearchId) then --This wont work for any units without letters in the ID.
            if self:CheckBuildRestrictionsAllow(bp.ResearchId) then
                RemoveBuildRestriction(army, categories[bp.ResearchId] - categories.MOD)
            else
                WARN("Research item for " .. bp.ResearchId .. " was just completed, however lobby restrictions forbid it. Item shouldn't have been researchable.")
            end
        elseif bp.ResearchId == 'RESEARCHLOCKEDTECH1' then
            RemoveBuildRestriction(army, categories.TECH2 * factionCat * categories.CONSTRUCTIONSORTDOWN - categories.MOD - (self:BuildRestrictionCategories()) )
        elseif bp.ResearchId == 'TECH2' then
            RemoveBuildRestriction(army, categories.TECH3 * factionCat * categories.CONSTRUCTIONSORTDOWN - categories.MOD - (self:BuildRestrictionCategories()) )
        elseif bp.ResearchId == 'TECH3' then
            RemoveBuildRestriction(army, categories.EXPERIMENTAL * factionCat * categories.CONSTRUCTIONSORTDOWN - categories.BUILTBYRESEARCH * categories.MOD - (self:BuildRestrictionCategories()) )
        elseif string.find(bp.ResearchId, 'MK') then
            countingResearchsToUnlockTECH(self, army, bp.ResearchId)            
        end
        if not string.find(bp.ResearchId, 'MK') then
            RemoveBuildRestriction(army, categories[bp.ResearchId] * factionCat - categories.BUILTBYRESEARCH - categories.CONSTRUCTIONSORTDOWN - categories.RESEARCHLOCKED - categories.MOD - categories[bp.BlueprintId] - (self:BuildRestrictionCategories()) )
        end
            --Unlock the next tech research as well.
        

        -- Tell the manager this is done if we're an AI and presumably have a manager.
       

        -- Before the rest, because the rest is Destroy(self)
        DummyUnit.OnStopBeingBuilt(self, builder, layer)
    end,

    CheckBuildRestrictionsAllow = function(self, WorkID)
        local Restrictions = ScenarioInfo.Options.RestrictedCategories
        if not Restrictions or not next(Restrictions) then
            return true        
        else
            local restrictedData = import('/lua/ui/lobby/restrictedunitsdata.lua').restrictedUnits
            for i, group in Restrictions do
                local tablefind = table.find
                for j, cat in restrictedData[group].categories do --
                    if WorkID == cat or tablefind(__blueprints[WorkID].Categories, cat) then
                        return false
                    end
                end
            end
        end
        return true
    end,

    BuildRestrictionCategories = function(self)
        local Restrictions = ScenarioInfo.Options.RestrictedCategories
        if not Restrictions or table.getn(Restrictions) == 0 then
            --No restrictions
            return categories.NOTHINGIMPORTANT -- DE NADA
        elseif VersionIsFAF then
            --FAF restrictions
            local restrictedCategories = categories.NOTHINGIMPORTANT
            for id, bool in Game.GetRestrictions().Global do
                restrictedCategories = restrictedCategories + categories[id]
                --Also restrict research items of blocked things.
                --The there is no easy way to do this the other ways.
                --So FAF actually functions better here.
                if __blueprints[id .. 'rnd'] then
                    restrictedCategories = restrictedCategories + categories[id .. 'rnd']
                end
            end
            return restrictedCategories
        else
            local restrictedData = import('/lua/ui/lobby/restrictedunitsdata.lua').restrictedUnits
            local restrictedCategories = categories.NOTHINGIMPORTANT
            for i, group in Restrictions do
                for j, cat in restrictedData[group].categories do
                    restrictedCategories = restrictedCategories + categories[cat]
                end
            end
            return restrictedCategories
        end
    end,

    OnKilled = function(self, instigator, type, overKillRatio)
        local bp = self.BpId and __blueprints[self.BpId] or self:GetBlueprint()
        --Allow restarting of me, the RND item, if I was never finished.
        if self:GetFractionComplete() < 1 then
            RemoveBuildRestriction(self:GetArmy(), categories[bp.BlueprintId] )
        end
        DummyUnit.OnKilled(self, instigator, type, overKillRatio)
    end,

    OnDestroy = function(self)
        local bp = self.BpId and __blueprints[self.BpId] or self:GetBlueprint()
        --Allow restarting of me, the RND item, if I was never finished. In case of reclaim.
        if self:GetFractionComplete() < 1 then
            RemoveBuildRestriction(self:GetArmy(), categories[bp.BlueprintId] )
        end
        DummyUnit.OnDestroy(self)
    end,
}

--------------------------------------------------------------------------------
-- Research Center AI
--------------------------------------------------------------------------------
local Buff = {}
--Wizardry to make FA buff scripts not break the game on original SupCom.
if not string.sub(GetVersion(),1,3) == '1.1' or string.sub(GetVersion(),1,3) == '1.0' then Buff = import('/lua/sim/Buff.lua') else Buff.ApplyBuff = function() end end
--------------------------------------------------------------------------------

ResearchFactoryUnit = Class(FactoryUnit) {	
	
    -- Prevents LOUD factory manager errors.
	
    SetupComplete = true,

    OnPreCreate = function(self)
        FactoryUnit.OnPreCreate(self)
        if not self.BpId then
            self.BpId = self:GetBlueprint().BlueprintId
        end        
    end,

    OnStartBeingBuilt = function(self, creator, layer)
        local AIBrain = self:GetAIBrain()
        if AIBrain.BrainType ~= 'Human' and AIBrain:GetListOfUnits(categories[self.BpId], false)[1] then
            self:Destroy()
        end
        FactoryUnit.OnStartBeingBuilt(self, creator, layer)
    end,

    OnStartBuild = function(self, unitBeingBuilt, order)
     	self:ChangeBlinkingLights('Yellow')
     	local bp = unitBeingBuilt:GetBlueprint()   		
        	StructureUnit.OnStartBuild(self, unitBeingBuilt, order )
        	self.BuildingUnit = true        
        self.FactoryBuildFailed = false
    end,
   		
    OnStopBeingBuilt = function(self, builder, layer)
        --If we're an AI
        local AIBrain = self:GetAIBrain()
        if AIBrain.BrainType ~= 'Human' then
            self.ResearchThread = self:ForkThread(self.ResearchThread) --Create the research thread
            self:AICheatsBuffs()                 --CHEAT!
        end
        FactoryUnit.OnStopBeingBuilt(self, builder, layer)

    end,

    OnStopBuild = function(self, unitbuilding, order)
        --Give buff based on what we researched        
        if unitbuilding.GetFractionComplete and unitbuilding:GetFractionComplete() == 1 then
            local n = EntityCategoryContains(categories.EXPERIMENTAL, unitbuilding) and 5 or
                      EntityCategoryContains(categories.TECH3, unitbuilding) and 3 or
                      EntityCategoryContains(categories.TECH2, unitbuilding) and 2 or 1
            Buff.ApplyBuff(self, 'ResearchItemBuff'..n)
        end
        FactoryUnit.OnStopBuild(self, unitbuilding, order)               
    end,

    UpgradingState = State(FactoryUnit.UpgradingState) {
        OnStopBuild = function(self, unitbuilding, order)
            --Pass on buffs to the replacement
            if unitbuilding.GetFractionComplete and unitbuilding:GetFractionComplete() == 1 and order == 'Upgrade' then
                if self.Buffs.BuffTable.RESEARCH then
                    for buff, data in self.Buffs.BuffTable.RESEARCH do
                        if Buffs[buff] then --Ensure that the data structure is the same as we are expecting.
                            for i = 1, (data.Count or 1) do
                                Buff.ApplyBuff(unitbuilding, buff)
                            end
                        end
                    end
                end
            end
            FactoryUnit.UpgradingState.OnStopBuild(self, unitbuilding, order)
        end,
    },

    ----------------------------------------------------------------------------
    -- AI research control
    ----------------------------------------------------------------------------

    -- Persistent research thread
    -- "Decides" when to do research
        -- Checks every 5 seconds if we are idle
        -- Checks with the AI brain if we're allowed to research
        -- then research
    ResearchThread = function(self)
        local AIBrain = self:GetAIBrain()
        while not self.Dead and not AIBrain.BrewResearchIsComplete and AIBrain.BrewRND and AIBrain.BrewRND.IsResearchRemaining(AIBrain) do
            if self:IsIdleState() and AIBrain.BrewRND.IsAbleToResearch(AIBrain) then
                self:Research()
                coroutine.yield(10)
            else
                coroutine.yield(100)
            end
        end
        WARN("An AI has finished researching.")
    end,

    -- Ran every time "ResearchThread" decides we need to research
        -- Prioritises upgrading if it's available
        -- else calls GetResearchItem to decide what to research
    Research = function(self)
        local AIBrain = self:GetAIBrain()
        local bp = self.BpId and __blueprints[self.BpId] or self:GetBlueprint()
        --Upgrade if we can first
        if bp.General.UpgradesTo and __blueprints[bp.General.UpgradesTo] and self:CanBuild(bp.General.UpgradesTo) then
            IssueUpgrade({self}, bp.General.UpgradesTo)
        elseif AIBrain.BrewRND then
            AIBrain:BuildUnit(self, AIBrain.BrewRND.GetResearchItem(AIBrain, self), 1)
        end
    end,

    --Applied OnStopBeingBuilt.
    --Passed on with the other buffs on upgrade.
    AICheatsBuffs = function(self)
        local AIBrain = self:GetAIBrain()
        if AIBrain.CheatEnabled then
            Buff.ApplyBuff(self, 'ResearchAIxBuff')
        else
            Buff.ApplyBuff(self, 'ResearchAIBuff')
        end
    end
}

