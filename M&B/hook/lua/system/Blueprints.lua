--------------------------------------------------------------------------------
-- Hook File: /lua/system/blueprints.lua
--------------------------------------------------------------------------------
-- Modded By: Balthazar
--------------------------------------------------------------------------------
do

local OldModBlueprints = ModBlueprints

function ModBlueprints(all_blueprints)
    OldModBlueprints(all_blueprints)
    RNDPrepareScript(all_blueprints.Unit)
    -- RNDPrepareScriptFORTECH4(all_blueprints.Unit)
    -- RestrictExistingBlueprints(all_blueprints.Unit)
    RNDDefineNewFactoryBuildCategories(all_blueprints.Unit)
    GenerateResearchItemBPs(all_blueprints.Unit)
end

--function WikiBlueprints(all_blueprints)
  --  for id, bp in pairs(all_blueprints.Unit) do
   --     local t = table.find(bp.Categories, 'TECH4') and 4 or table.find(bp.Categories, 'TECH3') and 3 or table.find(bp.Categories, 'TECH2') and 2 or table.find(bp.Categories, 'TECH1') and 1
   --     if TableFindSubstrings(bp.Categories, 'BUILTBY', 'FACTORY') and bp.Physics then
   --         if bp.Physics.MotionType == 'RULEUMT_Hover' or bp.Physics.MotionType == 'RULEUMT_AmphibiousFloating' then
    --            for i = t, 3 do
   --                 table.insert(bp.Categories, 'BUILTBYTIER'..i..'SURFACEFACTORY')
   --             end
    --        elseif bp.Physics.MotionType == 'RULEUMT_Amphibious' then
    --            for i = t, 3 do
   --                 table.insert(bp.Categories, 'BUILTBYTIER'..i..'SEABEDFACTORY')
   --             end
   --         end
   --     end
   --     local catIndex = table.find(bp.Categories, 'BUILTBYENGINEER')
  --      if catIndex then
  --          bp.Categories[catIndex] = 'BUILTBYTIER1ENGINEER'
 --           table.insert(bp.Categories, 'BUILTBYTIER2ENGINEER')
  --          table.insert(bp.Categories, 'BUILTBYTIER3ENGINEER')
  --      end
  --  end
--end

--------------------------------------------------------------------------------
-- Things in preparation of RND
--------------------------------------------------------------------------------
function RNDPrepareScript(all_bps)
    for id, bp in all_bps do
        --Hard link upgrades, instead of soft-category linking, to prevent splurged links
        --If they don't have a buildable category, we probably don't want to mess with it, and the upgrade tag is probably a mistake. Also make sure the thing exists.
        if bp.General.UpgradesTo and bp.Economy.BuildableCategory and not table.find(bp.Economy.BuildableCategory, bp.General.UpgradesTo) and all_bps[bp.General.UpgradesTo] then
            table.insert(bp.Economy.BuildableCategory, bp.General.UpgradesTo)
            table.remove(all_bps[bp.General.UpgradesTo].Categories, TableFindSubstrings(all_bps[bp.General.UpgradesTo].Categories, 'BUILTBY', 'FACTORY'))
        end
        if bp.Categories and id ~= 'zzz6969' then -- zzz6969 is a cat dump unit for compatibility
            --Create extended tech 1 restriction and allow the ACU to build them after the research
            if table.find(bp.Categories, 'BUILTBYTIER1ENGINEER') and not table.find(bp.Categories, 'BUILTBYCOMMANDER') then
                table.insert(bp.Categories, 'RESEARCHLOCKEDTECH1')
                table.insert(bp.Categories, 'BUILTBYCOMMANDER')
            end
            CategoryArrayRemoveTierN(all_bps, bp.Economy.BuildableCategory)
            CategoryArrayRemoveTierN(all_bps, bp.Categories)
            if table.find(bp.Categories, 'CONSTRUCTIONSORTDOWN') then
                table.removeByValue(bp.Categories, 'CONSTRUCTIONSORTDOWN')
            end
            if table.find(bp.Categories, 'BUILTBYCOMMANDER') and not table.find(bp.Categories, 'BUILTBYENGINEER') then
                table.insert(bp.Categories, 'BUILTBYENGINEER')
            elseif not table.find(bp.Categories, 'BUILTBYCOMMANDER') and table.find(bp.Categories, 'BUILTBYENGINEER') then
                table.insert(bp.Categories, 'BUILTBYCOMMANDER')
            end
        end
        if bp.General.UpgradesTo and bp.Economy.BuildableCategory and not table.find(bp.Economy.BuildableCategory, bp.General.UpgradesTo) and all_bps[bp.General.UpgradesTo] then
            table.insert(bp.Economy.BuildableCategory, bp.General.UpgradesTo)
            table.remove(all_bps[bp.General.UpgradesTo].Categories, TableFindSubstrings(all_bps[bp.General.UpgradesTo].Categories, 'BUILTBY', 'FACTORY'))
        end
       
    end
end
-- function RNDPrepareScriptFORTECH4(all_bps)
--     for id, bp in all_bps do
--         --Hard link upgrades, instead of soft-category linking, to prevent splurged links
--         --If they don't have a buildable category, we probably don't want to mess with it, and the upgrade tag is probably a mistake. Also make sure the thing exists.
--         if bp.General.UpgradesTo and bp.Economy.BuildableCategory and not table.find(bp.Economy.BuildableCategory, bp.General.UpgradesTo) and all_bps[bp.General.UpgradesTo] then
--             table.insert(bp.Economy.BuildableCategory, bp.General.UpgradesTo)
--             table.remove(all_bps[bp.General.UpgradesTo].Categories, TableFindSubstrings(all_bps[bp.General.UpgradesTo].Categories, 'BUILTBY', 'FACTORY'))
--         end
--         if bp.Categories and id ~= 'zzz6969' then -- zzz6969 is a cat dump unit for compatibility
--             --Create extended tech 1 restriction and allow the ACU to build them after the research
--             if table.find(bp.Categories, 'EXPERIMENTAL') and not table.find(bp.Categories, 'NEEDMOBILEBUILD') then
--                 table.insert(bp.Categories, 'TECH4')             
--             end
--             CategoryArrayRemoveTierN(all_bps, bp.Economy.BuildableCategory)
--             CategoryArrayRemoveTierN(all_bps, bp.Categories)
--             if table.find(bp.Categories, 'CONSTRUCTIONSORTDOWN') then
--                 table.removeByValue(bp.Categories, 'CONSTRUCTIONSORTDOWN')
--             end           
--         end
--         if bp.General.UpgradesTo and bp.Economy.BuildableCategory and not table.find(bp.Economy.BuildableCategory, bp.General.UpgradesTo) and all_bps[bp.General.UpgradesTo] then
--             table.insert(bp.Economy.BuildableCategory, bp.General.UpgradesTo)
--             table.remove(all_bps[bp.General.UpgradesTo].Categories, TableFindSubstrings(all_bps[bp.General.UpgradesTo].Categories, 'BUILTBY', 'FACTORY'))
--         end
       
--     end
-- end

--------------------------------------------------------------------------------
-- Restrict a few vanilla units
--------------------------------------------------------------------------------
-- function RestrictExistingBlueprints(all_bps)
--     local restrict = {        
--         'zzz6969',-- 'uab1101', 'urb1101', 'xsb1101', --Tech 1 power generators.
--         --'ueb1106', 'uab1106', 'urb1106', 'xsb1106', -- tech 1 mass storage
--         --'ueb2106', 'uab2106', 'urb2106', 'xsb2106', -- tech 2 mass storage
--         --'ueb3106', 'uab3106', 'urb3106', 'xsb3106', -- tech 3 mass storage
--         --'urb0101', 'ueb0101', 'uab0101', 'xsb0101', -- tier 0 land factories  
--         --'uab1104', 'ueb1104', 'urb1104', 'xsb1104', -- T2 mass fabs
--         --'uab1304', 'ueb1304', 'urb1304', 'xsb1304', -- T3 mass fabs      
--         --'ueb1201', 'uab1201', 'urb1201', 'xsb1201',--Tech 2 power generators, slow down tech 2 with the half reactors.
--         --'ueb1301', 'uab1301', 'urb1301', 'xsb1301',--Tech 3 power generators, slow down tech 2 with the half reactors.
--         --'seb1201', 'sab1201', 'srb1201', 'ssb1201',
--         --uef vanilla air
--         --'uea0101', 'uea0102', 'uea0103', 'uea0204',
--         --'uea0203', 'uea0206', 'uea0302', 'uea0304',
-- 		--'uea0303',
-- 		--cybran vanilla air
--         --'ura0101', 'ura0102', 'ura0103', 'ura0204',
--         --'ura0203', 'ura0206', 'ura0302', 'ura0304',
-- 		--'ura0303', 'xra0105',
-- 		--aeon vanilla air
-- 		--'uaa0101', 'uaa0102', 'uaa0103', 'uaa0204',
--         --'uaa0203', 'uaa0206', 'uaa0302', 'uaa0304',
-- 		--'uaa0303', 'xaa0202', 'daa0206', 'xaa0306',
-- 		--'xaa0305',
--         --seraph vanilla air
--         --'xsa0101', 'xsa0102', 'xsa0103', 'xsa0204',
--         --'xsa0203', 'xsa0206', 'xsa0302', 'xsa0304',
-- 		--'xsa0303', 
-- 		--uef vanilla land
-- 		--'uel0104', 'uel0103',
-- 		--'uel0202', 'uel0107', 'uel0307', 'uel0111',
-- 		--'uel0203', 'uel0303', 'uel0305', 'uel0304', 
-- 		--'uel0308',
-- 		--cybran vanilla land
-- 		--'url0104', 'url0103',
-- 		--'drl0204', 'url0203', 'url0111', 'url0205', 
-- 		--'xrl0305', 'url0303', 'url0305', 'url0306', 
-- 		--'url0304',
-- 		--aeon vanilla land
-- 		--'ual0107', 'ual0103', 'ual0104', 
-- 		--'ual0201', 'ual0205', 'xal0203', 'ual0111', 
-- 		--'ual0204', 'ual0302', 'ual0304', 'ual0310',
-- 		--'dal0310',
-- 		-- serphim vanilla land
-- 		--'xsl0104', 'xsl0201', 'xsl0103',
-- 		--'xsl0202', 'xsl0203', 'xsl0205', 'xsl0111',
-- 		--'ssl0222', 'xsl0303', 'xsl0304', 'xsl0307', 
-- 		--'xsl0305', 'xsl0310a'        
--     }
--     for i, id in restrict do
--         if all_bps[id] then
--             table.insert(all_bps[id].Categories, 'RESEARCHLOCKED')
--         end
--     end
-- end

--------------------------------------------------------------------------------
-- Create build categories for the amphib/sub/seaplane factories
--------------------------------------------------------------------------------
function RNDDefineNewFactoryBuildCategories(all_bps)
    for id, bp in all_bps do
        if TableFindSubstrings(bp.Categories, 'BUILTBY', 'FACTORY') and bp.Physics then
            if bp.Physics.MotionType == 'RULEUMT_Hover' or bp.Physics.MotionType == 'RULEUMT_AmphibiousFloating' then
                table.insert(bp.Categories, 'BUILTBYSURFACEFACTORY')
            elseif bp.Physics.MotionType == 'RULEUMT_Amphibious' then
                table.insert(bp.Categories, 'BUILTBYSEABEDFACTORY')
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Make some research items
--------------------------------------------------------------------------------
function GenerateResearchItemBPs(all_bps)
    local tablesize = 0
    for id, bp in all_bps do
        tablesize = tablesize + 1
        if bp.Categories and table.find(bp.Categories, 'RESEARCHLOCKED') then
            local newid = id .. 'rnd'
            RNDGenerateBaseResearchItemBlueprint(all_bps, newid, id, bp)

            RNDGiveCategoriesAndDefineCosts(all_bps, newid, bp)
            RNDGiveIndicativeAbilities(all_bps, newid, bp)
            RNDGiveUniqueMeshBlueprints(all_bps, newid, bp)
        end
    end

    if tablesize > 10 then
        local techresearch = {
            RESEARCHLOCKEDTECH1 = {
                techid = 1,
                BuildIconSortPriority = 0,
                Economy = {
                    BuildCostEnergy = 130,
                    BuildCostMass = 26,
                    BuildTime = 26,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = '<LOC srnd9100_desc>Tech Level Research',
            },
            TECH2 = {
                techid = 2,
                BuildIconSortPriority = 0,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = '<LOC srnd9200_desc>Tech Level Research',
            },
            TECH3 = {
                techid = 3,
                BuildIconSortPriority = 0,
                Economy = {
                    BuildCostEnergy = 31500,
                    BuildCostMass = 3640,
                    BuildTime = 3640,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = '<LOC srnd9300_desc>Tech Level Research',
            },
            EXPERIMENTAL = {
                techid = 4,
                BuildIconSortPriority = 0,
                Economy = {
                    BuildCostEnergy = 123415,
                    BuildCostMass = 13800,
                    BuildTime = 13800,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = '<LOC srnd9400_desc>Experimental Tech Level Research',
            },

            MK101 = {
                techid = 101,
                BuildIconSortPriority = 1,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Structure Units Level 1 Research',
            },
            MK102 = {
                techid = 102,
                BuildIconSortPriority = 2,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Construction Units(engineers) Level 1 Research',
            },
            MK103 = {
                techid = 103,
                BuildIconSortPriority = 3,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Hive Units Level 1 Research',
            },
            MK104 = {
                techid = 104,
                BuildIconSortPriority = 4,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Mobile(Walking, Land, Hovers) Land Units Level 1 Research',
            },
            MK105 = {
                techid = 105,
                BuildIconSortPriority = 5,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Health and Regen(Walking, Land, Hovers) Land Units Level 1 Research',
            },
            MK106 = {
                techid = 106,
                BuildIconSortPriority = 6,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Weapon(Walking, Land, Hovers) Land UnitsUnits Level 1 Research',
            },
            MK107 = {
                techid = 107,
                BuildIconSortPriority = 7,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Mobile Air Units Level 1 Research',
            },
            MK108 = {
                techid = 108,
                BuildIconSortPriority = 8,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Health and Regen Air Units Level 1 Research',
            },
            MK109 = {
                techid = 109,
                BuildIconSortPriority = 9,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Weapon Air Units Level 1 Research',
            },
            MK110 = {
                techid = 110,
                BuildIconSortPriority = 10,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Mobile Naval Units Level 1 Research',
            },
            MK111 = {
                techid = 111,
                BuildIconSortPriority = 11,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Health and Regen Naval Units Level 1 Research',
            },
            MK112 = {
                techid = 112,
                BuildIconSortPriority = 12,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Weapon Naval Units Level 1 Research',
            },
            MK113 = {
                techid = 113,
                BuildIconSortPriority = 13,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Weapon Turret Units Level 1 Research',
            },
            MK114 = {
                techid = 114,
                BuildIconSortPriority = 14,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH1'},
                Description = 'Health Turret Units Level 1 Research',
            },                        
            MK201 = {
                techid = 201,
                BuildIconSortPriority = 1,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Structure Units Level 2 Research',
            },
            MK202 = {
                techid = 202,
                BuildIconSortPriority = 2,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Construction Units(engineers) Level 2 Research',
            },            
            MK203 = {
                techid = 203,
                BuildIconSortPriority = 3,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Hive Units Level 2 Research',
            },
            MK204 = {
                techid = 204,
                BuildIconSortPriority = 4,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Mobile(Walking, Land, Hovers) Land Units Level 2 Research',
            },
            MK205 = {
                techid = 205,
                BuildIconSortPriority = 5,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Health and Regen(Walking, Land, Hovers) Land Units Level 2 Research',
            },
            MK206 = {
                techid = 206,
                BuildIconSortPriority = 6,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Weapon(Walking, Land, Hovers) Land Units Level 2 Research',
            },
            MK207 = {
                techid = 207,
                BuildIconSortPriority = 7,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Mobile Air Units Level 2 Research',
            },
            MK208 = {
                techid = 208,
                BuildIconSortPriority = 8,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Health and Regen Air Units Level 2 Research',
            },
            MK209 = {
                techid = 209,
                BuildIconSortPriority = 9,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Weapon Air Units Level 2 Research',
            },
            MK210 = {
                techid = 210,
                BuildIconSortPriority = 10,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Mobile Naval Units Level 2 Research',
            },
            MK211 = {
                techid = 211,
                BuildIconSortPriority = 11,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Health and Regen Naval Units Level 2 Research',
            },
            MK212 = {
                techid = 212,
                BuildIconSortPriority = 12,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Weapon Naval Units Level 2 Research',
            },
            MK213 = {
                techid = 213,
                BuildIconSortPriority = 13,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Weapon Turret Units Level 2 Research',
            },
            MK214 = {
                techid = 214,
                BuildIconSortPriority = 14,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH2'},
                Description = 'Health Turret Units Level 2 Research',
            },
            MK301 = {
                techid = 301,
                BuildIconSortPriority = 1,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Structure Units Level 3 Research',
            },
            MK302 = {
                techid = 302,
                BuildIconSortPriority = 2,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Construction Units(engineers) Level 3 Research',
            },            
            MK303 = {
                techid = 303,
                BuildIconSortPriority = 3,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Hive Units Level 3 Research',
            },
            MK304 = {
                techid = 304,
                BuildIconSortPriority = 4,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Mobile(Walking, Land, Hovers) Land Units Level 3 Research',
            },
            MK305 = {
                techid = 305,
                BuildIconSortPriority = 5,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Health and Regen(Walking, Land, Hovers) Land Units Level 3 Research',
            },
            MK306 = {
                techid = 306,
                BuildIconSortPriority = 6,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Weapon(Walking, Land, Hovers) Land Units Level 3 Research',
            },
            MK307 = {
                techid = 307,
                BuildIconSortPriority = 7,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Mobile Air Units Level 3 Research',
            },
            MK308 = {
                techid = 308,
                BuildIconSortPriority = 8,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Health and Regen Air Units Level 3 Research',
            },
            MK309 = {
                techid = 309,
                BuildIconSortPriority = 9,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Weapon Air Units Level 3 Research',
            },
            MK310 = {
                techid = 310,
                BuildIconSortPriority = 10,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Mobile Naval Units Level 3 Research',
            },
            MK311 = {
                techid = 311,
                BuildIconSortPriority = 11,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Health and Regen Naval Units Level 3 Research',
            },
            MK312 = {
                techid = 312,
                BuildIconSortPriority = 12,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Weapon Naval Units Level 3 Research',
            },
            MK313 = {
                techid = 313,
                BuildIconSortPriority = 13,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Weapon Turret Units Level 3 Research',
            },
            MK314 = {
                techid = 314,
                BuildIconSortPriority = 14,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'TECH3'},
                Description = 'Health Turret Units Level 3 Research',
            },
            -- MK401 = {
            --     techid = 401,
            --     BuildIconSortPriority = 1,
            --     Economy = {
            --         BuildCostEnergy = 8040,
            --         BuildCostMass = 960,
            --         BuildTime = 960,
            --         ResearchMult = 1,
            --     },
            --     Categories = {'EXPERIMENTAL'},
            --     Description = 'Structure Units Level 4 Research',
            -- },
            MK402 = {
                techid = 402,
                BuildIconSortPriority = 2,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Construction Units(engineers) Level 4 Research',
            },            
            MK403 = {
                techid = 403,
                BuildIconSortPriority = 3,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Hive Units Level 4 Research',
            },
            MK404 = {
                techid = 404,
                BuildIconSortPriority = 4,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Mobile(Walking, Land, Hovers) Land Units Level 4 Research',
            },
            MK405 = {
                techid = 405,
                BuildIconSortPriority = 5,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health and Regen(Walking, Land, Hovers) Land Units Level 4 Research',
            },
            MK406 = {
                techid = 406,
                BuildIconSortPriority = 6,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon(Walking, Land, Hovers) Land Units Level 4 Research',
            },
            MK407 = {
                techid = 407,
                BuildIconSortPriority = 7,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Mobile Air Units Level 4 Research',
            },
            MK408 = {
                techid = 408,
                BuildIconSortPriority = 8,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health and Regen Air Units Level 4 Research',
            },
            MK409 = {
                techid = 409,
                BuildIconSortPriority = 9,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon Air Units Level 4 Research',
            },
            MK410 = {
                techid = 410,
                BuildIconSortPriority = 10,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Mobile Naval Units Level 4 Research',
            },
            MK411 = {
                techid = 411,
                BuildIconSortPriority = 11,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health and Regen Naval Units Level 4 Research',
            },
            MK412 = {
                techid = 412,
                BuildIconSortPriority = 12,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon Naval Units Level 4 Research',
            },
            MK413 = {
                techid = 413,
                BuildIconSortPriority = 13,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon Turret Units Level 4 Research',
            },
            MK414 = {
                techid = 414,
                BuildIconSortPriority = 14,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health Turret Units Level 4 Research',
            },
            MK501 = {
                techid = 501,
                BuildIconSortPriority = 1,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Structure Units Level 5 Research',
            },
            MK502 = {
                techid = 502,
                BuildIconSortPriority = 2,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Construction Units(engineers) Level 5 Research',
            },            
            MK503 = {
                techid = 503,
                BuildIconSortPriority = 3,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Hive Units Level 5 Research',
            },
            MK504 = {
                techid = 504,
                BuildIconSortPriority = 4,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Mobile(Walking, Land, Hovers) Land Units Level 5 Research',
            },
            MK505 = {
                techid = 505,
                BuildIconSortPriority = 5,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health and Regen(Walking, Land, Hovers) Land Units Level 5 Research',
            },
            MK506 = {
                techid = 506,
                BuildIconSortPriority = 6,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon(Walking, Land, Hovers) Land Units Level 5 Research',
            },
            MK507 = {
                techid = 507,
                BuildIconSortPriority = 7,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Mobile Air Units Level 5 Research',
            },
            MK508 = {
                techid = 508,
                BuildIconSortPriority = 8,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health and Regen Air Units Level 5 Research',
            },
            MK509 = {
                techid = 509,
                BuildIconSortPriority = 9,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon Air Units Level 5 Research',
            },
            MK510 = {
                techid = 410,
                BuildIconSortPriority = 10,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Mobile Naval Units Level 5 Research',
            },
            MK511 = {
                techid = 511,
                BuildIconSortPriority = 11,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health and Regen Naval Units Level 5 Research',
            },
            MK512 = {
                techid = 512,
                BuildIconSortPriority = 12,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon Naval Units Level 5 Research',
            },
            MK513 = {
                techid = 513,
                BuildIconSortPriority = 13,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Weapon Turret Units Level 5 Research',
            },
            MK514 = {
                techid = 514,
                BuildIconSortPriority = 14,
                Economy = {
                    BuildCostEnergy = 8040,
                    BuildCostMass = 960,
                    BuildTime = 960,
                    ResearchMult = 1,
                },
                Categories = {'EXPERIMENTAL'},
                Description = 'Health Turret Units Level 5 Research',
            },
        }
        for tech, bp in techresearch do
        	if bp.techid > 10 then
                table.insert(bp.Categories, 'MOD')
            end
            table.insert(bp.Categories, '')            
            table.insert(bp.Categories, 'SORTCONSTRUCTION')            
            if bp.BuildIconSortPriority >=1 and bp.BuildIconSortPriority <=3  then
            	bp.Categories[4] = 'SORTECONOMY'
            elseif bp.BuildIconSortPriority > 3 and bp.BuildIconSortPriority <=12 then
            	bp.Categories[4] = 'SORTSTRATEGIC'
            elseif bp.BuildIconSortPriority >= 13 and bp.BuildIconSortPriority <= 14 then
            	bp.Categories[4] = 'SORTDEFENSE'    
            end               
            if tech ~= 'RESEARCHLOCKEDTECH1' and bp.techid < 10  then
                table.insert(bp.Categories,'CONSTRUCTIONSORTDOWN')                                                     
            end

            for faction, uid in {Aeon = 'sar9', UEF = 'ser9', Cybran = 'srr9', Seraphim = 'ssr9'} do
                local newid = uid .. bp.techid .. '00'
                local id = tech
                bp.Categories[3] =  string.upper(faction)
                
                -- if string.find(tech, 'MK') then

                -- 	table.removeByValue(bp.Categories, 'CONSTRUCTIONSORTDOWN')
                -- end
                
                if not bp.General then
                    bp.General = {}
                end
                if not bp.Display then
                    bp.Display = {}
                end                
                
                bp.Display.IconName = newid
                bp.General.FactionName = faction
                RNDGenerateBaseResearchItemBlueprint(all_bps, newid, id, bp)
                RNDGiveCategoriesAndDefineCosts(all_bps, newid, bp)
                all_bps[newid].Display.BuildMeshBlueprint = '/mods/M&B/meshes/tech'..bp.techid..'_mesh'
                all_bps[newid].Display.MeshBlueprint = '/mods/M&B/meshes/tech'..bp.techid..'_mesh'
                if bp.tecid > 100  and bp.techid < 200 then
                    all_bps[newid].Display.BuildMeshBlueprint = '/mods/M&B/meshes/tech'.. 1 ..'_mesh'
                    all_bps[newid].Display.MeshBlueprint = '/mods/M&B/meshes/tech'.. 1 ..'_mesh'
                elseif bp.techid>200 and bp.techid < 300  then
                    all_bps[newid].Display.BuildMeshBlueprint = '/mods/M&B/meshes/tech'.. 2 ..'_mesh'
                    all_bps[newid].Display.MeshBlueprint = '/mods/M&B/meshes/tech'.. 2 ..'_mesh'
                elseif bp.techid>300 and bp.techid < 400  then
                    all_bps[newid].Display.BuildMeshBlueprint = '/mods/M&B/meshes/tech'.. 3 ..'_mesh'
                    all_bps[newid].Display.MeshBlueprint = '/mods/M&B/meshes/tech'.. 3 ..'_mesh'
                else
                    all_bps[newid].Display.BuildMeshBlueprint = '/mods/M&B/meshes/tech'.. 4 ..'_mesh'
                    all_bps[newid].Display.MeshBlueprint = '/mods/M&B/meshes/tech'.. 4 ..'_mesh'
                end
                -- LOG(repr(all_bps[newid]))
            end            
            
        end
    end
end

function RNDGenerateBaseResearchItemBlueprint(all_bps, newid, id, bp)
    local sizescale = math.max( ((bp.Physics.SkirtSizeX or bp.SizeX or 4) / 2), ((bp.Physics.SkirtSizeZ or bp.SizeZ or 4) / 2) )
    all_bps[newid] = {
        BlueprintId = newid,
        ResearchId = id,
        BuildIconSortPriority = bp.BuildIconSortPriority or 5,
        Categories = {
            'BUILTBYRESEARCH',
            -- Engine stuff?
            'VISIBLETORECON',
            'BENIGN',
            -- And now some lies.
            'SELECTABLE',
            --'MOBILE',
        },
        Defense = {
            ArmorType = 'Normal',
            Health = 5000,
            MaxHealth = 5000,
        },
        Description = bp.Description,
        Display = {
            Abilities = {
                '<LOC ability_rnd_unlock>Research Unlock',
            },
            --IconName = id,
            UniformScale = (bp.Display.UniformScale or 0.2) / sizescale, --calculate properly based on footprint size
        },
        Footprint = {
            SizeX = 2,
            SizeZ = 2,
        },
        Economy = {
            BuildCostEnergy = bp.Economy.BuildCostEnergy * (bp.Economy.ResearchMultEnergy or bp.Economy.ResearchMult or  1),
            BuildCostMass = bp.Economy.BuildCostMass * (bp.Economy.ResearchMultMass or bp.Economy.ResearchMult or  1),
            BuildTime = bp.Economy.BuildTime * 10 * (bp.Economy.ResearchMultTime or bp.Economy.ResearchMult or  1),
        },
        Interface = {
            HelpText = bp.Description,
        },
        LifeBarHeight = 0.075,
        LifeBarOffset = 1.25,
        LifeBarSize = 2.5,
        General = {
            CapCost = 0,
            FactionName = bp.General.FactionName,
            Icon = bp.General.Icon or 'air',
            TechLevel = 'RULEUTL_Advanced',
            UnitName = bp.General.UnitName,
            UnitWeight = 1,
        },
        Physics = {
            MeshExtentsX = (bp.Physics.MeshExtentsX or bp.SizeX or sizescale * 2) / sizescale,
            MeshExtentsY = (bp.Physics.MeshExtentsY or bp.SizeY or sizescale) / sizescale,
            MeshExtentsZ = (bp.Physics.MeshExtentsZ or bp.SizeZ or sizescale * 2) / sizescale,
            --And now some more lies.
            MaxSpeed = 1,
            MotionType = 'RULEUMT_Amphibious',
        },
        ScriptClass = 'ResearchItem',
        ScriptModule = '/lua/defaultunits.lua',
        SizeX = 2,
        SizeY = (bp.SizeY or sizescale) / sizescale,
        SizeZ = 2,
        Source = bp.Source or all_bps.seb9101.Source,
        StrategicIconName = bp.StrategicIconName,
    }
    if not all_bps[newid].Display.IconName then
        all_bps[newid].Display.IconName = id
    end
end

function RNDGiveCategoriesAndDefineCosts(all_bps, newid, ref)
    local bp = all_bps[newid]
    local cats = {
        'TECH1', 'TECH2', 'TECH3', 'EXPERIMENTAL', 'UEF', 'CYBRAN', 'SERAPHIM', 'AEON',
        'SORTSTRATEGIC', 'SORTCONSTRUCTION', 'SORTDEFENSE', 'SORTECONOMY', 'SORTINTEL',
        'CONSTRUCTIONSORTDOWN', 'RESEARCHLOCKEDTECH1', 'AIR', 'LAND', 'NAVAL'
    }
    for i, v in cats do
        if table.find(ref.Categories, v) then
            -- If the source has the cat, the research item also needs it.
            table.insert(bp.Categories, v)
            if i < 5 then -- if I is less than 5 we are dealing with T1, T2, T3, or Experimental
                local CostMults = {1, 1.25, 1.5, 1} -- Resource cost multiplier per tech level.
                local maxOutput = { -- Maximum research output of a tech 1
                    {5, 50},
                    {10, 100},
                    {15, 150},
                    {20, 200},
                }
                -- If we haven't got a pre-defined cost multiplier, then we use the defaults defined in CostMults.
                -- Units should only exist in one of the first four cats, so this shouldn't stack, except for mods that dont count Experimental as == Tech 4
                if not (ref.Economy.ResearchMultEnergy or ref.Economy.ResearchMult) then
                    bp.Economy.BuildCostEnergy = bp.Economy.BuildCostEnergy * CostMults[1]
                end
                if not (ref.Economy.ResearchMultMass or ref.Economy.ResearchMult) then
                    bp.Economy.BuildCostMass = bp.Economy.BuildCostMass * CostMults[1]
                end
                -- Research times based on max cost per second instead.
                bp.Economy.BuildTime = math.floor(math.max(bp.Economy.BuildCostMass / maxOutput[i][1] * 50, bp.Economy.BuildCostEnergy / maxOutput[i][2] * 50 ))
            end
        end
    end
end

function RNDGiveIndicativeAbilities(all_bps, newid, ref)
    local bp = all_bps[newid]
    local TFS = TableFindSubstrings
    local TF = table.find
    local CATs = ref.Categories
    if ref.General.UpgradesFrom then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_updade>Built as upgrade')
    end
    if TFS(CATs,'BUILTBY','ENGINEER') then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_engineer>Built by engineer')
    end
    if TFS(CATs,'BUILTBY','FIELD')
    or TFS(CATs,'BUILTBY','ENGINEER') and (TF(CATs, 'DEFENSE') or TF(CATs, 'INDIRECTFIRE'))
    then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_field>Built by field engineer')
    end
    if TFS(CATs,'BUILTBY','COMMANDER') then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_command>Built by command unit')
    end
    if TFS(CATs,'BUILTBY','FACTORY') then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_factory>Built by factory')
    end
    if TF(CATs, 'BUILTBYGANTRY') or TF(CATs, 'BUILTBYIENGINE') or TF(CATs, 'BUILTBYARTHROLAB') or TF(CATs, 'BUILTBYSOUIYA') then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_gantry>Built by experimental factory')
    end
    if TFS(CATs,'BUILTBY','WALL') then
        table.insert(bp.Display.Abilities,'<LOC ability_rnd_wall>Built on wall')
    end
end

function TableFindSubstrings(array, string1, string2)
    if array then
        for i, cat in ipairs(array) do
            if string.find(cat,string1) and string.find(cat,string2 or string1) then
                return i
            end
        end
    end
end

--Making unique mesh, so it can be a glowy hologram
function RNDGiveUniqueMeshBlueprints(all_bps, newid, ref)
    local bp = all_bps[newid]
    for i, mesh in {'BuildMeshBlueprint', 'MeshBlueprint'} do
        local refid = ref.Display[mesh]
        local meshbp = original_blueprints.Mesh[refid]
        if meshbp then
            local dupebp = table.deepcopy(meshbp)
            dupebp.BlueprintId = refid .. 'rnd'
            for i, lod in dupebp.LODs do
                dupebp.LODs[i].ShaderName = 'PhalanxEffect'
            end
            bp.Display[mesh] = dupebp.BlueprintId
            MeshBlueprint(dupebp)
        end
    end
    bp.Display.Mesh = {
        BlueprintId = bp.Display.MeshBlueprint,
        IconFadeInZoom = 130,
        Source = ref.Display.Mesh.Source,
    }    
end

--This isn't nessessary for its original purpose, but it doesn't hurt to keep it around
--It's also a mess for cleanup, since it leaves table floating nowhere. Possible memory leak?
function CleanupDuplicateArrayKeys(array)
    local original = array
    local new = {}
    for i, v in array do
        if v and not table.find(new, v) then
            table.insert(new, v)
        end
    end
    return new
end

function CategoryArrayRemoveTierN(all_bps, table)
    if type(table) == "table" and table[1] and TableFindSubstrings(table, 'BUILTBY', 'TIER') then
        for i, cat in table do
            if string.find(cat, 'BUILTBY') and string.find(cat, 'TIER') and string.find(cat, 'COMMANDER') then
                DumpOldBuiltByCategories(all_bps, cat)
                table[i] = string.gsub(cat, "TIER%d", "")
            end
        end
    end
end

function DumpOldBuiltByCategories(all_bps, cat)
    --This dumping of old categories is so that they remain valid categories, but categories that do nothing when other mods affect and reference them.
    if not all_bps.zzz6969 then all_bps.zzz6969 = {BlueprintId = 'zzz6969',Categories = {'NOTHINGIMPORTANT', 'UNSPAWNABLE'}} end
    if all_bps.zzz6969 and not table.find(all_bps.zzz6969.Categories, cat) then
        table.insert(all_bps.zzz6969.Categories, cat)
    end
end


end
