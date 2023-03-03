--------------------------------------------------------------------------------
-- Unused science and manufacturing center buffs.
--------------------------------------------------------------------------------
ScienceCentreResearchBuff = {
    'ResearchMassBuildBonus',
    'ResearchEnergyBuildNerf',
}

ManufacturingCentreResearchBuff = {
    'ResearchEnergyBuildBonus',
    'ResearchMassBuildBonusNerf',
}

BuffBlueprint {Name = 'Tier2ResearchEnergyBuildBonus',
    DisplayName = 'Tier2ResearchEnergyBuildBonus',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE',
    ParsedEntityCategory = categories.STRUCTURE,
    BuffCheckFunction = AdjBuffFuncs.EnergyBuildBuffCheck,
    OnBuffAffect = AdjBuffFuncs.EnergyBuildBuffAffect,
    OnBuffRemove = AdjBuffFuncs.EnergyBuildBuffRemove,
    Affects = {
        EnergyActive = {
            Add = -0.375/8,
            Mult = 1.0,
        },
    },
}

BuffBlueprint {Name = 'ResearchEnergyBuildNerf',
    DisplayName = 'ResearchEnergyBuildNerf',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE',
    ParsedEntityCategory = categories.STRUCTURE,
    BuffCheckFunction = AdjBuffFuncs.EnergyBuildBuffCheck,
    OnBuffAffect = AdjBuffFuncs.EnergyBuildBuffAffect,
    OnBuffRemove = AdjBuffFuncs.EnergyBuildBuffRemove,
    Affects = {
        EnergyActive = {
            Add = 0.125/8,
            Mult = 1.0,
        },
    },
}

BuffBlueprint {Name = 'Tier2ResearchMassBuildBonus',
    DisplayName = 'Tier2ResearchMassBuildBonus',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE',
    ParsedEntityCategory = categories.STRUCTURE,
    BuffCheckFunction = AdjBuffFuncs.MassBuildBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassBuildBuffAffect,
    OnBuffRemove = AdjBuffFuncs.MassBuildBuffRemove,
    Affects = {
        MassActive = {
            Add = -0.375/8,
            Mult = 1.0,
        },
    },
}

BuffBlueprint {Name = 'ResearchMassBuildBonusNerf',
    DisplayName = 'ResearchMassBuildBonusNerf',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE',
    ParsedEntityCategory = categories.STRUCTURE,
    BuffCheckFunction = AdjBuffFuncs.MassBuildBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassBuildBuffAffect,
    OnBuffRemove = AdjBuffFuncs.MassBuildBuffRemove,
    Affects = {
        MassActive = {
            Add = 0.125/8,
            Mult = 1.0,
        },
    },
}

T1EnergyStorageAdjacencyBuffs = {
    'T1EnergyStorageEnergyProductionBonusSize4',
    'T1EnergyStorageEnergyProductionBonusSize8',
    'T1EnergyStorageEnergyProductionBonusSize12',
    'T1EnergyStorageEnergyProductionBonusSize16',
    'T1EnergyStorageEnergyProductionBonusSize20',
    'T1EnergyStorageShieldRegenBonusSize4',
    'T1EnergyStorageShieldRegenBonusSize12',
    'T1EnergyStorageShieldRegenBonusSize16',
    'T1EnergyStorageShieldSizeBonusSize4',
    'T1EnergyStorageShieldSizeBonusSize12',
    'T1EnergyStorageShieldHealthBonusSize4',
    'T1EnergyStorageShieldHealthBonusSize12',
    'T1EnergyStorageShieldHealthBonusSize16',                   
}

BuffBlueprint { Name = 'T1EnergyStorageShieldRegenBonusSize4',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.08,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldRegenBonusSize12',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.0266,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldRegenBonusSize16',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.02,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldSizeBonusSize4',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE 4',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.04,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldSizeBonusSize12',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.0133,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldHealthBonusSize4',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.025,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldHealthBonusSize12',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.008,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T1EnergyStorageShieldHealthBonusSize16',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.0065,
            Mult = 1.0,
        },
    },
}
T2EnergyStorageAdjacencyBuffs = {
    'T2EnergyStorageEnergyProductionBonusSize4',
    'T2EnergyStorageEnergyProductionBonusSize8',
    'T2EnergyStorageEnergyProductionBonusSize12',
    'T2EnergyStorageEnergyProductionBonusSize16',
    'T2EnergyStorageEnergyProductionBonusSize20',
    'T2EnergyStorageShieldRegenBonusSize4',
    'T2EnergyStorageShieldRegenBonusSize8',
    'T2EnergyStorageShieldRegenBonusSize12',
    'T2EnergyStorageShieldRegenBonusSize16',
    'T2EnergyStorageShieldSizeBonusSize4',
    'T2EnergyStorageShieldSizeBonusSize8',
    'T2EnergyStorageShieldSizeBonusSize12',
    'T2EnergyStorageShieldHealthBonusSize4',
    'T2EnergyStorageShieldHealthBonusSize8',
    'T2EnergyStorageShieldHealthBonusSize12',
    'T2EnergyStorageShieldHealthBonusSize16',
}

-- Combo building gets T3 Shield Effects but only T2 Resource Adjacency and T2 Energy Weapon Bonus


BuffBlueprint { Name = 'T2EnergyStorageEnergyProductionBonusSize4',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.175,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T2EnergyStorageEnergyProductionBonusSize8',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.09,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageEnergyProductionBonusSize12',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.0583,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageEnergyProductionBonusSize16',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.04375,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageEnergyProductionBonusSize20',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE20',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.035,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldRegenBonusSize4',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.11,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T2EnergyStorageShieldRegenBonusSize8',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.65,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldRegenBonusSize12',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.0366,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldRegenBonusSize16',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.0275,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldSizeBonusSize4',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.0675,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T2EnergyStorageShieldSizeBonusSize8',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.0375,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldSizeBonusSize12',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.0225,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldHealthBonusSize4',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.0608,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T2EnergyStorageShieldHealthBonusSize8',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.0408,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldHealthBonusSize12',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.0203,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2EnergyStorageShieldHealthBonusSize16',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.0152,
            Mult = 1.0,
        },
    },
}


-- TIER 3 ENERGY STORAGE
T3EnergyStorageAdjacencyBuffs = {
    'T3EnergyStorageEnergyProductionBonusSize4',
    'T3EnergyStorageEnergyProductionBonusSize8',
    'T3EnergyStorageEnergyProductionBonusSize12',
    'T3EnergyStorageEnergyProductionBonusSize16',
    'T3EnergyStorageEnergyProductionBonusSize20',
    'T3EnergyStorageShieldRegenBonusSize4',
    'T3EnergyStorageShieldRegenBonusSize8',
    'T3EnergyStorageShieldRegenBonusSize12',
    'T3EnergyStorageShieldRegenBonusSize16',
    'T3EnergyStorageShieldSizeBonusSize4',
    'T3EnergyStorageShieldSizeBonusSize8',
    'T3EnergyStorageShieldSizeBonusSize12',
    'T3EnergyStorageShieldHealthBonusSize4',
    'T3EnergyStorageShieldHealthBonusSize8',
    'T3EnergyStorageShieldHealthBonusSize12',
    'T3EnergyStorageShieldHealthBonusSize16',
}

BuffBlueprint { Name = 'T3EnergyStorageEnergyProductionBonusSize4',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.215,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageEnergyProductionBonusSize8',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.15,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3EnergyStorageEnergyProductionBonusSize12',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.07167,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageEnergyProductionBonusSize16',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.05375,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageEnergyProductionBonusSize20',
    BuffType = 'ENERGYBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE20',
    BuffCheckFunction = AdjBuffFuncs.EnergyProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        EnergyProduction = {
            Add = 0.043,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldRegenBonusSize4',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.12,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3EnergyStorageShieldRegenBonusSize8',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.8,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3EnergyStorageShieldRegenBonusSize12',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.04,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldRegenBonusSize16',
    BuffType = 'SHIELDREGENBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.ShieldRegenBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldRegeneration = {
            Add = 0.03,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldSizeBonusSize4',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.08,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3EnergyStorageShieldSizeBonusSize8',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.05,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldSizeBonusSize12',
    BuffType = 'SHIELDSIZEBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldSizeBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldSize = {
            Add = 0.02666,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldHealthBonusSize4',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.064,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldHealthBonusSize8',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.08,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3EnergyStorageShieldHealthBonusSize12',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.0214,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T3EnergyStorageShieldHealthBonusSize16',
    BuffType = 'SHIELDHEALTHBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.ShieldHealthBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        ShieldHealth = {
            Add = 0.016,
            Mult = 1.0,
        },
    },
}

T2MassStorageAdjacencyBuffs = {
    'T2MassStorageMassProductionBonusSize4',
    'T2MassStorageMassProductionBonusSize8',
    'T2MassStorageMassProductionBonusSize12',
    'T2MassStorageMassProductionBonusSize16',
    'T2MassStorageMassProductionBonusSize20',
}

BuffBlueprint { Name = 'T2MassStorageMassProductionBonusSize4',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.15,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T2MassStorageMassProductionBonusSize8',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.075,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2MassStorageMassProductionBonusSize12',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.045,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T2MassStorageMassProductionBonusSize16',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.035,
            Mult = 1.0,
        },
    },
}

BuffBlueprint { Name = 'T2MassStorageMassProductionBonusSize20',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE20',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.0225,
            Mult = 1.0,
        },
    },
}

T3MassStorageAdjacencyBuffs = {
    'T3MassStorageMassProductionBonusSize4',
    'T3MassStorageMassProductionBonusSize8',
    'T3MassStorageMassProductionBonusSize12',
    'T3MassStorageMassProductionBonusSize16',
    'T3MassStorageMassProductionBonusSize20',
}

BuffBlueprint { Name = 'T3MassStorageMassProductionBonusSize4',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE4',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.175,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3MassStorageMassProductionBonusSize8',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE8',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.085,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3MassStorageMassProductionBonusSize12',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE12',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.0525,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3MassStorageMassProductionBonusSize16',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE16',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.0325,
            Mult = 1.0,
        },
    },
}
BuffBlueprint { Name = 'T3MassStorageMassProductionBonusSize20',
    BuffType = 'MASSBUILDBONUS',
    Stacks = 'ALWAYS',
    Duration = -1,
    EntityCategory = 'STRUCTURE SIZE20',
    BuffCheckFunction = AdjBuffFuncs.MassProductionBuffCheck,
    OnBuffAffect = AdjBuffFuncs.MassProductionBuffAffect,
    OnBuffRemove = AdjBuffFuncs.DefaultBuffRemove,
    Affects = {
        MassProduction = {
            Add = 0.0265,
            Mult = 1.0,
        },
    },
}
