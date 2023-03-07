
do
    for i = 1, 5 do
        if i ~= 4 then
            BuffBlueprint {
                Name = 'ResearchItemBuff' .. i, DisplayName = 'ResearchItemBuff' .. i,
                BuffType = 'RESEARCH', Stacks = 'ALWAYS', Duration = -1,
                Affects = {
                    BuildRate    = {Add = (i/100), Mult = 1},
                    EnergyActive = {Add = 0, Mult = 1-(i/100)},
                    MassActive   = {Add = 0, Mult = 1-(i/100)},
                },
            }
        end
    end
end

BuffBlueprint {
    Name = 'ResearchAIxBuff', DisplayName = 'ResearchAIxBuff',
    BuffType = 'RESEARCH', Stacks = 'ALWAYS', Duration = -1,
    Affects = {
        --Research buffs are passed on as upgrades, so the final upgrade gets 3 instances of these.
        BuildRate = {Add = 0, Mult = 1 + (0.25 / 3)},
        EnergyActive = {Add = -0.2, Mult = 1},
        MassActive = {Add = -0.2, Mult = 1},
    },
}

BuffBlueprint {
    Name = 'ResearchAIBuff', DisplayName = 'ResearchAIBuff',
    BuffType = 'RESEARCH', Stacks = 'ALWAYS', Duration = -1,
    Affects = {
        --Research buffs are passed on as upgrades, so the final upgrade gets 3 instances of these.
        EnergyActive = {Add = -0.1, Mult = 1},
        MassActive = {Add = -0.1, Mult = 1},
    },
}

BuffBlueprint {
    Name = 'StructureHealthMod', DisplayName = 'StructureHealthMod',
    BuffType = 'StructureHealthBuff', Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25},        
    },
}
BuffBlueprint {
    Name = 'ConstrctionBotMod', DisplayName = 'ConstrctionBotMod',
    BuffType = 'ConstrctionBuildRateAndHealthMod', Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25},
        BuildRate = {Add = 0, Mult = 1.25},        
    },
}
BuffBlueprint {
    Name = 'MobileBuffLand', DisplayName = 'MobileBuffLand',
    BuffType = 'MobileBuffLand', Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.25},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffLand', DisplayName = 'HealthBuffLand',
    BuffType = 'HealthBuffLand', Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25},  
        Regen = {Add = 1, Mult = 1.25},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffLand', DisplayName = 'WeaponBuffLand',
    BuffType = 'WeaponBuffLand', Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.25},  
        DamageRadius = {Add = 0, Mult = 1.25},  
        MaxRadius = {Add = 0, Mult = 1.25},
        RateOfFire = {Add = 0, Mult = 1.25},            
    },
}
