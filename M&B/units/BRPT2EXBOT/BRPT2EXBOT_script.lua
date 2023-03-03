#****************************************************************************
#**
#**  File     :  /units/XSLconcept/XSLconcept_script.lua
#**  Author(s):  Drew Staltman, Jessica St. Croix, Gordon Duclos
#**
#**  Summary  :  Seraphim Concept Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SIFSuthanusArtilleryCannon = SeraphimWeapons.SIFSuthanusMobileArtilleryCannon
local SDFOhCannon = SeraphimWeapons.SDFOhCannon
local EffectTemplate = import('/lua/EffectTemplates.lua')

BRPT2EXBOT = Class( SWalkingLandUnit ) {
    Weapons = {
        MainGun2 = Class(SDFOhCannon) {
			            FxMuzzleFlashScale = 3.6, 
	},
        MainGun = Class(SIFSuthanusArtilleryCannon) {
			            FxMuzzleFlashScale = 2.0, 
	},
    },

CreatTheEffects = function(self)
	local army =  self:GetArmy()
	for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
		CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(0.55)
	end
	for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
		CreateAttachedEmitter(self, 'eff02', army, v):ScaleEmitter(0.35)
	end
	for k, v in EffectTemplate['OthuyAmbientEmanation'] do
		CreateAttachedEmitter(self, 'eff03', army, v):ScaleEmitter(0.11)
	end
	for k, v in EffectTemplate['OthuyAmbientEmanation'] do
		CreateAttachedEmitter(self, 'eff04', army, v):ScaleEmitter(0.11)
	end
	for k, v in EffectTemplate['OthuyAmbientEmanation'] do
		CreateAttachedEmitter(self, 'eff05', army, v):ScaleEmitter(0.13)
	end
	for k, v in EffectTemplate['OthuyAmbientEmanation'] do
		CreateAttachedEmitter(self, 'eff06', army, v):ScaleEmitter(0.13)
	end
end,

OnKilled = function(self,builder,layer)
        SWalkingLandUnit.OnKilled(self,builder,layer)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in EffectTemplate['SDFExperimentalPhasonProjHit01'] do
		CreateAttachedEmitter(self, 'BRPT2EXBOT', army, v):ScaleEmitter(2.3)
	end
end,
}

TypeClass = BRPT2EXBOT