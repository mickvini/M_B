--------------------------------------------------------------------------------
-- Research item stuff
--------------------------------------------------------------------------------
local Game = import('/lua/game.lua')
--------------------------------------------------------------------------------
local counters = {
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
}
local flags = {
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
	{ 0, 0, 0, 0, 0, },
}

countingResearchsToUnlockTECH = function(unit, army)
	local tier1Generators = {'ueb1101', 'uab1101', 'urb1101', 'xsb1101'}
	local tier2Generators = {'ueb1201', 'uab1201', 'urb1201', 'xsb1201'}
    local tier12Generators = {'seb1201', 'sab1201', 'srb1201', 'ssb1201'}
    local tier3Generators = {'ueb1301', 'uab1301', 'urb1301', 'xsb1301'}
    local tier1LandFactory = {'urb0101', 'ueb0101', 'uab0101', 'xsb0101'}   	
    local unitBp = unit:GetBlueprint()
    if counters[army][1] >=  0 and table.find(unitBp.Categories, 'TECH1') then
		for id = 1,4 do
			if tier1Generators[id] == unitBp.ResearchId then
				counters[army][1] = counters[army][1] + 1				 
                break
            elseif unitBp.ResearchId == tier1LandFactory[id] then
                counters[army][1] = counters[army][1] + 1     
                break            
            end			
		end
        if counters[army][1] > 0 and flags[army][1] == 0 then
            LOG("MK0"..unit.MK)
            RemoveBuildRestriction(army, categories[string.upper(unitBp.General.FactionName or 'SELECTABLE')] * categories.CONSTRUCTIONSORTDOWN * categories.TECH1)
            unit.MK = unit.MK + 1 --up mark of unit initialize Unit check and update his blueprint
            LOG("MK1"..unit.MK)
            unit:SetMarkLevel()
            flags[army][1] = 1
            return        
        end
    end
    if counters[army][2] >= 0 and table.find(unitBp.Categories, 'TECH1') then
        for id = 1,4 do
            if tier12Generators[id] == unitBp.ResearchId then
                counters[army][2] = counters[army][2] + 1 
                break            
            end
        end
        if counters[army][2] > 0 and flags[army][2] == 0 then
            RemoveBuildRestriction(army, categories[string.upper(unitBp.General.FactionName or 'SELECTABLE')] * categories.CONSTRUCTIONSORTDOWN * categories.TECH2 - categories.TECH1)
            flags[army][2] = 1
            return        
        end   
    end                                               
	if counters[army][3] >= 0 and table.find(unitBp.Categories, 'TECH2') then
        for id = 1,4 do
            if tier2Generators[id] == unitBp.ResearchId then
                counters[army][3] = counters[army][3] + 1 
                break            
            end
        end
        if counters[army][3] > 0 and flags[army][3] == 0 then
            RemoveBuildRestriction(army, categories[string.upper(unitBp.General.FactionName or 'SELECTABLE')] * categories.CONSTRUCTIONSORTDOWN * categories.TECH3 - categories.TECH2)
            flags[army][3] = 1
            return        
        end   
    end 
    if counters[army][4] >= 0 and table.find(unitBp.Categories, 'TECH3') then
        for id = 1,4 do
            if tier3Generators[id] == unitBp.ResearchId then
                counters[army][4] = counters[army][4] + 1
                break             
            end
        end
        if counters[army][4] > 0 and flags[army][4] == 0 then
            RemoveBuildRestriction(army, categories[string.upper(unitBp.General.FactionName or 'SELECTABLE')] * categories.CONSTRUCTIONSORTDOWN * categories.EXPERIMENTAL)
            flags[army][4] = 1
            return         
        end      
    end			
end

ResearchItem = Class(DummyUnit) {
    OnCreate = function(self)
        local bp = self.BpId and __blueprints[self.BpId] or self:GetBlueprint()
        DummyUnit.OnCreate(self)
        --Restrict me, the RND item, to one being built at a time.        
        AddBuildRestriction(self:GetArmy(), categories[bp.BlueprintId] )                               
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        local bp = self.BpId and __blueprints[self.BpId] or self:GetBlueprint()
        local army = self:GetArmy()
        local factionCat = categories[string.upper(bp.General.FactionName or 'SELECTABLE')]
        --Enable what we were supposed to allow.        
        if bp.ResearchId == string.lower(bp.ResearchId) then --This wont work for any units without letters in the ID.\          
            if self:CheckBuildRestrictionsAllow(bp.ResearchId) then            	
                RemoveBuildRestriction(army, categories[bp.ResearchId] ) 
                countingResearchsToUnlockTECH(self, army)             
            else
                WARN("Research item for " .. bp.ResearchId .. " was just completed, however lobby restrictions forbid it. Item shouldn't have been researchable.")
            end         
                --RemoveBuildRestriction(army, categories[bp.ResearchId] * factionCat - categories.RESEARCHLOCKED - categories[bp.BlueprintId] - (self:BuildRestrictionCategories()) )                  
        elseif bp.ResearchId == 'RESEARCHLOCKEDTECH1' then
                    RemoveBuildRestriction(army, categories[bp.ResearchId] * factionCat - categories.TECH2 - categories.RESEARCHLOCKED - categories[bp.BlueprintId] )
        elseif bp.ResearchId == 'TECH2' then
                    RemoveBuildRestriction(army, categories[bp.ResearchId] * factionCat - categories.TECH1 - categories.RESEARCHLOCKED - categories[bp.BlueprintId] )
        elseif bp.ResearchId == 'TECH3' then
                    RemoveBuildRestriction(army, categories.TECH3 * factionCat - categories.RESEARCHLOCKED - categories[bp.BlueprintId])
        elseif bp.ResearchId == 'TECH4' then
                    RemoveBuildRestriction(army, categories.TECH4 * factionCat + categories.EXPERIMENTAL * factionCat  - categories.RESEARCHLOCKED - categories[bp.BlueprintId])
        elseif bp.ResearchId == 'EXPERIMENTAL' then
                    RemoveBuildRestriction(army, categories.TECH4 * factionCat + categories.EXPERIMENTAL * factionCat - categories.EXPERIMENTAL * categories.CONSTRUCTIONSORTDOWN - categories.RESEARCHLOCKED - categories[bp.BlueprintId] )
        end
    

        --Tell the manager this is done if we'reё an AI and presumably have a manager.
        local AIBrain = self:GetAIBrain()
        if AIBrain.BrainType ~= 'Human' and AIBrain.BrewRND then
            AIBrain.BrewRND.MarkResearchComplete(AIBrain, bp.BlueprintId)
        end

        --Before the rest, because the rest is Destroy(self)
        DummyUnit.OnStopBeingBuilt(self,builder,layer)
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
