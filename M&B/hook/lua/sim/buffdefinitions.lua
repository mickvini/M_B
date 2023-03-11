
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
do
    for i = 1,5 do 
BuffBlueprint {
    Name = 'StructureHealthMod' .. i, DisplayName = 'StructureHealthMod' .. i,
    BuffType = 'StructureHealthBuff' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},        
    },
}

BuffBlueprint {
    Name = 'ConstrctionBotMod' .. i, DisplayName = 'ConstrctionBotMod' .. i,
    BuffType = 'ConstrctionBuildRateAndHealthMod'..i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},
        BuildRate = {Add = 0, Mult = 1.25 * i},        
    },
}
BuffBlueprint {
    Name = 'EngineerStationMod' .. i, DisplayName = 'EngineerStationMod' .. i,
    BuffType = 'EngineerStationMod'..i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},
        BuildRate = {Add = 0, Mult = 1.25 * i},        
    },
}
BuffBlueprint {
    Name = 'MobileBuffLand' .. i, DisplayName = 'MobileBuffLand' .. i,
    BuffType = 'MobileBuffLand' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.25 * i},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffLand' .. i, DisplayName = 'HealthBuffLand' .. i,
    BuffType = 'HealthBuffLand' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},  
        Regen = {Add = 1, Mult = 1.25 * i},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffLand' .. i, DisplayName = 'WeaponBuffLand' .. i,
    BuffType = 'WeaponBuffLand' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.25 * i},  
        DamageRadius = {Add = 0, Mult = 1.25 * i},  
        MaxRadius = {Add = 0, Mult = 1.25 * i},
        RateOfFire = {Add = 0, Mult = 1.25 * i},            
    },
}
BuffBlueprint {
    Name = 'MobileBuffAir' .. i, DisplayName = 'MobileBuffAir' .. i,
    BuffType = 'MobileBuffAir' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.25 * i},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffAir' .. i, DisplayName = 'HealthBuffAir' .. i,
    BuffType = 'HealthBuffAir' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},  
        Regen = {Add = 1, Mult = 1.25 * i},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffAir' .. i, DisplayName = 'WeaponBuffAir' .. i,
    BuffType = 'WeaponBuffAir' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.25 * i},  
        DamageRadius = {Add = 0, Mult = 1.25 * i},  
        MaxRadius = {Add = 0, Mult = 1.25 * i},
        RateOfFire = {Add = 0, Mult = 1.25 * i},            
    },
}
BuffBlueprint {
    Name = 'MobileBuffNaval' .. i, DisplayName = 'MobileBuffNaval' .. i,
    BuffType = 'MobileBuffNaval' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.25 * i},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffNaval' .. i, DisplayName = 'HealthBuffNaval' .. i,
    BuffType = 'HealthBuffNaval' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},  
        Regen = {Add = 1, Mult = 1.25 * i},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffNaval' .. i, DisplayName = 'WeaponBuffNaval' .. i,
    BuffType = 'WeaponBuffNaval' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.25 * i},  
        DamageRadius = {Add = 0, Mult = 1.25 * i},  
        MaxRadius = {Add = 0, Mult = 1.25 * i},
        RateOfFire = {Add = 0, Mult = 1.25 * i},            
    },
}

BuffBlueprint {
    Name = 'HealthBuffTurret'.. i, DisplayName = 'HealthBuffTurret'.. i,
    BuffType = 'HealthBuffTurret'.. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.25 * i},  
        Regen = {Add = 1 * i, Mult = 1.25 * i},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffTurret' .. i, DisplayName = 'WeaponBuffTurret' .. i,
    BuffType = 'WeaponBuffTurret' .. i, Stacks = 'ALWAYS', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.25 * i},  
        DamageRadius = {Add = 0, Mult = 1.25 * i},  
        MaxRadius = {Add = 0, Mult = 1.25 * i},
        RateOfFire = {Add = 0, Mult = 1.25 * i},            
    },
}

    
    end
end