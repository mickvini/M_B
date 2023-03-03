local CIridiumRocketProjectile = import('/lua/cybranprojectiles.lua').CIridiumRocketProjectile
CDFRocketIridium03 = Class(CIridiumRocketProjectile) {
    OnCreate = function(self)
        CIridiumRocketProjectile.OnCreate(self)
        self:SetCollisionShape('Sphere', 0, 0, 0, 2.0)
    end,

    OnImpact = function(self, targetType, targetEntity)
        CIridiumRocketProjectile.OnImpact(self, targetType, targetEntity)
        local army = self:GetArmy()
        CreateLightParticle( self, -1, army, 2, 1, 'glow_03', 'ramp_red_06' )
        CreateLightParticle( self, -1, army, 1, 3, 'glow_03', 'ramp_antimatter_02' )
        if targetType == 'Terrain' or targetType == 'Prop' then
            CreateDecal( self:GetPosition(), import('/lua/utilities.lua').GetRandomFloat(0.0,6.28), 'scorch_011_albedo', '', 'Albedo', 2, 2, 350, 200, army )
        end
    end,

    SetNewTarget = function(self, target)
        if target ~= self:GetLauncher() then
            CIridiumRocketProjectile.SetNewTarget(self, target)
        else
            local x,y,z = self:GetPositionXYZ()
            local newy = GetTerrainHeight(x,z)
            local arc = (y-newy)/2
            x = x+Random(-arc,arc)
            z = z+Random(-arc,arc)
            CIridiumRocketProjectile.SetNewTargetGround(self, {x, newy, z})

            self.SetNewTarget = function(self, target)
                if target ~= self:GetLauncher() then
                    CIridiumRocketProjectile.SetNewTarget(self, target)
                end
            end
        end
    end,
}

TypeClass = CDFRocketIridium03
