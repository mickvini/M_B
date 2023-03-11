
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
        BuildRate = {Add = 0, Mult = 1 + (0.10 / 3)},
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
    BuffType = 'StructureHealthBuff', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},        
    },
}

BuffBlueprint {
    Name = 'ConstrctionBotMod' .. i, DisplayName = 'ConstrctionBotMod' .. i,
    BuffType = 'ConstrctionBuildRateAndHealthMod', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},
        BuildRate = {Add = 0, Mult = 1.10 + i/10},        
    },
}
BuffBlueprint {
    Name = 'EngineerStationMod' .. i, DisplayName = 'EngineerStationMod' .. i,
    BuffType = 'EngineerStationMod', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},
        BuildRate = {Add = 0, Mult = 1.10 + i/10},        
    },
}
BuffBlueprint {
    Name = 'MobileBuffLand' .. i, DisplayName = 'MobileBuffLand' .. i,
    BuffType = 'MobileBuffLand' , Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.10 + i/10},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffLand' .. i, DisplayName = 'HealthBuffLand' .. i,
    BuffType = 'HealthBuffLand', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},  
        Regen = {Add = 1, Mult = 1.10 + i/10},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffLand' .. i, DisplayName = 'WeaponBuffLand' .. i,
    BuffType = 'WeaponBuffLand', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.10 + i/10},  
        DamageRadius = {Add = 0, Mult = 1.10 + i/10},  
        MaxRadius = {Add = 0, Mult = 1.10 + i/10},
        RateOfFire = {Add = 0, Mult = 1 - i/10},            
    },
}
BuffBlueprint {
    Name = 'MobileBuffAir' .. i, DisplayName = 'MobileBuffAir' .. i,
    BuffType = 'MobileBuffAir', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.10 + i/10},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffAir' .. i, DisplayName = 'HealthBuffAir' .. i,
    BuffType = 'HealthBuffAir', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},  
        Regen = {Add = 1, Mult = 1.10 + i/10},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffAir' .. i, DisplayName = 'WeaponBuffAir' .. i,
    BuffType = 'WeaponBuffAir', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.10 + i/10},  
        DamageRadius = {Add = 0, Mult = 1.10 + i/10},  
        MaxRadius = {Add = 0, Mult = 1.10 + i/10},
        RateOfFire = {Add = 0, Mult = 1 - i/10},            
    },
}
BuffBlueprint {
    Name = 'MobileBuffNaval' .. i, DisplayName = 'MobileBuffNaval' .. i,
    BuffType = 'MobileBuffNaval', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MoveMult = {Add = 0, Mult = 1.10 + i/10},                
    },
}
BuffBlueprint {
    Name = 'HealthBuffNaval' .. i, DisplayName = 'HealthBuffNaval' .. i,
    BuffType = 'HealthBuffNaval', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},  
        Regen = {Add = 1, Mult = 1.10 + i/10},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffNaval' .. i, DisplayName = 'WeaponBuffNaval' .. i,
    BuffType = 'WeaponBuffNaval', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.10 + i/10},  
        DamageRadius = {Add = 0, Mult = 1.10 + i/10},  
        MaxRadius = {Add = 0, Mult = 1.10 + i/10},
        RateOfFire = {Add = 0, Mult = 1 - i/10},            
    },
}

BuffBlueprint {
    Name = 'HealthBuffTurret'.. i, DisplayName = 'HealthBuffTurret'.. i,
    BuffType = 'HealthBuffTurret', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        MaxHealth = {Add = 0, Mult = 1.10 + i/10},  
        Regen = {Add = 1 + i/10, Mult = 1.10 + i/10},              
    },
}

BuffBlueprint {
    Name = 'WeaponBuffTurret' .. i, DisplayName = 'WeaponBuffTurret' .. i,
    BuffType = 'WeaponBuffTurret', Stacks = 'REPLACE', Duration = -1,
    Affects = {        
        Damage = {Add = 0, Mult = 1.10 + i/10},  
        DamageRadius = {Add = 0, Mult = 1.10 + i/10},  
        MaxRadius = {Add = 0, Mult = 1.10 + i/10},
        RateOfFire = {Add = 0, Mult = 1.10 + i/10},            
    },
}

    
    end
end