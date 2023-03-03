--------------------------------------------------------------------------------
-- Hook File: /lua/game.lua
--------------------------------------------------------------------------------
-- Modded By: Balthazar
--------------------------------------------------------------------------------
do
    local OldGetConstructEconomyModel = GetConstructEconomyModel

    function GetConstructEconomyModel(builder, targetData, ...)
        local builder_bp = builder:GetBlueprint()

        if builder_bp.BlueprintId == targetData.HalfPriceUpgradeFromID
        or builder_bp.General.UpgradesTo == targetData.HalfPriceUpgradeFromID
        or builder_bp.Economy.BuilderDiscountMult
        then
            local build, energy, mass = OldGetConstructEconomyModel(builder, targetData, unpack(arg))
            local discount = targetData.UpgradeFromCostDiscount or builder_bp.Economy.BuilderDiscountMult or 0.5

            return build, energy * discount, mass * discount
        else
            return OldGetConstructEconomyModel(builder, targetData, unpack(arg))
        end
    end

    --------------------------------------------------------------------------------
    -- Adapted from Manimal's mod locator script.
    -- Because I'm sick of people moaning when they put it in the wrong hole.
    --------------------------------------------------------------------------------
    BrewLANPath = function()
        for i, mod in __active_mods do
            if mod.uid == "62e2j64a-53a1-y6sl-32h5-146as576a18u4" then
                return mod.location
            end
        end
    end
end
