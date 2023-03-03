#****************************************************************************
#**
#**  File     :  /data/lua/EffectTemplates.lua
#**  Author(s):  Gordon Duclos, Greg Kohne, Matt Vainio, Aaron Lundquist
#**
#**  Summary  :  Generic templates for commonly used effects
#**
#**  Copyright � 2006 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
TableCat = import('/lua/utilities.lua').TableCat
EmtBpPath = '/effects/emitters/'
EmtBpPathAlt = '/mods/M&B/effects/emitters/'
EmitterTempEmtBpPath = '/effects/emitters/temp/'


WeaponSteam02 = {
    EmtBpPathAlt .. 'weapon_mist_02_emit.bp',
}

#---------------------------------------------------------------

UnitHitShrapnel01 = { EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',}
Aeon_MirvHit = {
	#EmtBpPathAlt .. 'aeon_mirv_hit_01_emit.bp',	# initial flash
	#EmtBpPathAlt .. 'aeon_mirv_hit_02_emit.bp',	# glow
	EmtBpPathAlt .. 'aeon_mirv_hit_03_emit.bp',	# fast ring
	EmtBpPathAlt .. 'aeon_mirv_hit_04_emit.bp',	# plasma
	EmtBpPathAlt .. 'aeon_mirv_hit_05_emit.bp',	# flash lines
	EmtBpPathAlt .. 'aeon_mirv_hit_06_emit.bp',	# darkening molecular
	EmtBpPathAlt .. 'aeon_mirv_hit_07_emit.bp',	# little dot glows
	EmtBpPathAlt .. 'aeon_mirv_hit_08_emit.bp',	# slow ring
	EmtBpPathAlt .. 'aeon_mirv_hit_09_emit.bp',	# darkening
	EmtBpPathAlt .. 'aeon_mirv_hit_10_emit.bp',	# radial rays
	EmtBpPathAlt .. 'aeon_mirv_cloud_01_emit.bp',
}

XCannonPolyTrail =  EmtBpPathAlt .. 'xcannon_polytrail_01_emit.bp'
XCannonFXTrail01 =  { EmtBpPathAlt .. 'xcannon_fxtrail_01_emit.bp' }
XCannonHitUnit = {
	EmtBpPathAlt .. 'xcannon_hitunit_01_emit.bp',
	EmtBpPathAlt .. 'xcannon_hit_02_emit.bp', 
	EmtBpPathAlt .. 'xcannon_hit_03_emit.bp',  
	EmtBpPathAlt .. 'xcannon_hitunit_04_emit.bp', #shockj effect
	EmtBpPathAlt .. 'xcannon_hitunit_05_emit.bp',  #shock effect
	EmtBpPathAlt .. 'xcannon_hitunit_06_emit.bp', 
	EmtBpPathAlt .. 'xcannon_hitunit_07_emit.bp',
	EmtBpPathAlt .. 'xcannon_hit_08_emit.bp',
	EmtBpPathAlt .. 'xcannon_hit_09_emit.bp',
	EmtBpPathAlt .. 'xcannon_hit_10_emit.bp',
	EmtBpPathAlt .. 'xcannon_hit_distort_emit.bp',
}
ZCannonPolytrail01 = { 
    #EmtBpPathAlt .. 'ZCannon_polytrail_01_emit.bp',
    #EmtBpPathAlt .. 'ZCannon_polytrail_02_emit.bp',
    EmtBpPath .. 'default_polytrail_01_emit.bp',
#	EmtBpPathAlt .. 'ZCannon_projectile_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_01_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_02_emit.bp',#spinny Trails
}
ZCannonFxtrail01 = {
	 EmtBpPathAlt .. 'ZCannon_fxtrail_01_emit.bp',
	 EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_01_emit.bp',#loop trail
     EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_02_emit.bp',#loop trail
     #EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_03_emit.bp',
     --EmtBpPathAlt .. 'z_cannon_exhaust_01_emit.bp',--distort
     --EmtBpPathAlt .. 'z_cannon_exhaust_02_emit.bp',--smoke
}

ZCannonPolytrail02 = { 
    EmtBpPathAlt .. 'ZCannon_polytrail_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_polytrail_02_emit.bp',
    EmtBpPath .. 'default_polytrail_01_emit.bp',
#	EmtBpPathAlt .. 'ZCannon_projectile_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_01_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_02_emit.bp',#spinny Trails
}
ZCannonFxtrail02 = {
	 EmtBpPathAlt .. 'ZCannon_fxtrail_01_emit.bp',
	 EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_04_emit.bp',#loop trail
     EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_05_emit.bp',#loop trail
     #EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_03_emit.bp',
     --EmtBpPathAlt .. 'z_cannon_exhaust_01_emit.bp',--distort
     --EmtBpPathAlt .. 'z_cannon_exhaust_02_emit.bp',--smoke
}
ZCannonMuzzleFlash = {
	EmtBpPath .. 'cannon_muzzle_fire_01_emit.bp',
    EmtBpPath .. 'cannon_artillery_muzzle_flash_01_emit.bp',
    #EmtBpPath .. 'cannon_muzzle_smoke_06_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_07_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_10_emit.bp',
    EmtBpPath .. 'cannon_muzzle_flash_03_emit.bp',
    EmtBpPath .. 'cannon_muzzle_flash_06_emit.bp',    
    EmtBpPath .. 'cannon_muzzle_flash_07_emit.bp', 
}
ZCannonHit02 = {
    EmtBpPathAlt .. 'ZCannon_hit_12_emit.bp',	##White Lightning
	EmtBpPathAlt .. 'ZCannon_hit_13_emit.bp',	  ##   dark glow effect
	EmtBpPathAlt .. 'ZCannon_hit_14_emit.bp',  ## Dark cloud effect
	EmtBpPathAlt .. 'ZCannon_hit_15_emit.bp',  ## blue/white flash
	EmtBpPathAlt .. 'ZCannon_hit_16_emit.bp',##  Black Lightning
	EmtBpPathAlt .. 'ZCannon_ring_03_emit.bp',##	ring03-white
	EmtBpPathAlt .. 'ZCannon_ring_04_emit.bp',## ring04-dark
}
ZCannonHit03 = {
    EmtBpPathAlt .. 'ZCannon_hit_01_emit.bp',	##	glow	
    EmtBpPathAlt .. 'ZCannon_hit_02_emit.bp',	##	flash	     
    EmtBpPathAlt .. 'ZCannon_hit_03_emit.bp', 	##	sparks
    EmtBpPathAlt .. 'ZCannon_hit_04_emit.bp',	##	plume fire
    EmtBpPathAlt .. 'ZCannon_hit_05_emit.bp',	##	plume dark 
    EmtBpPathAlt .. 'ZCannon_hit_06_emit.bp',	##	base fire
    EmtBpPathAlt .. 'ZCannon_hit_07_emit.bp',	##	base dark 
    EmtBpPathAlt .. 'ZCannon_hit_08_emit.bp',	##	plume smoke
    EmtBpPathAlt .. 'ZCannon_hit_09_emit.bp',	##	base smoke
    EmtBpPathAlt .. 'ZCannon_hit_10_emit.bp',	##	plume highlights
    EmtBpPathAlt .. 'ZCannon_hit_11_emit.bp',	##	base highlights
    EmtBpPathAlt .. 'ZCannon_ring_01_emit.bp',	##	ring14
    EmtBpPathAlt .. 'ZCannon_ring_02_emit.bp',	##	ring11	     
}
ZCannonHit01 = TableCat( ZCannonHit02, ZCannonHit03 ) 
ZCannonChargeMuzzleFlash = { 
    EmtBpPathAlt .. 'ZCannon_flash_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_flash_02_emit.bp', 
    EmtBpPathAlt .. 'ZCannon_flash_03_emit.bp', 
    EmtBpPathAlt .. 'ZCannon_flash_04_emit.bp',
    EmtBpPathAlt .. 'ZCannon_flash_05_emit.bp',
}

WaveCannonFxtrail01 = {
     EmtBpPath .. 'seraphim_chronotron_cannon_projectile_fxtrail_03_emit.bp',
}
WaveCannonPolytrail01 = { 
#	EmtBpPathAlt .. 'ZCannon_projectile_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_01_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_02_emit.bp',#spinny Trails
}

SDFExperimentalPhasonProjHit01 = {
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_01_emit.bp',#small blue flash
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_02_emit.bp', #flash
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_03_emit.bp',  #shockwave
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_04_emit.bp',#dark glow
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_05_emit.bp',#blue glow
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_06_emit.bp',#blue shockwave
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_07_emit.bp',#blue Spikes
	EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_08_emit.bp',#dark mist
	EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_09_emit.bp',#blue sparks
	EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_10_emit.bp',#lightning
}

SDFExperimentalPhasonProjHit02 = {
    EmtBpPath .. 'seraphim_experimental_phasonproj_hitunit_01_emit.bp',
	EmtBpPath .. 'seraphim_experimental_phasonproj_hitunit_08_emit.bp',
}

SDFExperimentalPhasonProjHitUnit = TableCat( SDFExperimentalPhasonProjHit01, SDFExperimentalPhasonProjHit02, UnitHitShrapnel01 )

ShadowCannonPolyTrail = { 
    EmtBpPath .. 'electron_bolter_trail_01_emit.bp',
    EmtBpPathAlt .. 'shadowcannon_polytrail_01_emit.bp'

}
ShadowCannonFXTrail01 = {
	 --EmtBpPathAlt .. 'shadow_bolter_munition_02_emit.bp',
	 EmtBpPathAlt .. 'shadowcannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'shadow_bolter_munition_01_emit.bp',
	 
	EmtBpPathAlt .. 'mgqai_cannon_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'mgqai_cannon_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'mgqai_cannon_fxtrail_03_emit.bp',	##after cloud
	}
ShadowCannonFXTrail02 = {
	 #EmtBpPathAlt .. 'shadow_bolter_munition_02_emit.bp',
	 #EmtBpPathAlt .. 'shadowcannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'shadow_bolter_munition_01_emit.bp',
}
BassieCannonPolyTrail =  EmtBpPathAlt .. 'bassie_cannon_polytrail_01_emit.bp'

BassieCannonFxTrail = {
	 #EmtBpPathAlt .. 'shadow_bolter_munition_02_emit.bp',
	 #EmtBpPathAlt .. 'shadowcannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'bassie_cannon_munition_01_emit.bp',
}
BassieCannonHit01 = {
	EmtBpPath .. 'hvyproton_cannon_hit_01_emit.bp', --flash
	EmtBpPathAlt .. 'bassie_cannon_hit_02_emit.bp', --embers
	EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp', --white spikes
    EmtBpPath .. 'hvyproton_cannon_hit_04_emit.bp', --lightning
    EmtBpPathAlt .. 'bassie_cannon_hit_05_emit.bp', --red lightning
    EmtBpPath .. 'hvyproton_cannon_hit_07_emit.bp', --shockwave ring
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp', --risgin cloud
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp', --flash
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',--distort
}
BassieCannonHit02 = {
    EmtBpPath .. 'hvyproton_cannon_hit_06_emit.bp',--black skrinking glow
    EmtBpPath .. 'hvyproton_cannon_hit_08_emit.bp',--black sparkle
}
BassieCannonHitLand = TableCat( BassieCannonHit01, BassieCannonHit02 )
BassieCannonHitUnit01 = {
	EmtBpPath .. 'hvyproton_cannon_hitunit_01_emit.bp',
	EmtBpPathAlt .. 'bassie_cannon_hit_02_emit.bp', --embers
	EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',  
	EmtBpPath .. 'hvyproton_cannon_hitunit_04_emit.bp', 
	EmtBpPathAlt .. 'bassie_cannon_hitunit_05_emit.bp',  
	EmtBpPath .. 'hvyproton_cannon_hitunit_06_emit.bp', 
	EmtBpPath .. 'hvyproton_cannon_hitunit_07_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_08_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
}
BassieCannonHitUnit = TableCat( BassieCannonHitUnit01, UnitHitShrapnel01 )

ACUShadowCannonHit01 = {
    EmtBpPath .. 'proton_bomb_hit_02_emit.bp',#sparks
    EmtBpPath .. 'cybran_light_artillery_hit_02_emit.bp',#t2 arty sparks
}

WraithPolytrail01 = EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp'


WraithMunition01 = { 
    EmtBpPath .. 'disruptor_cannon_munition_01_emit.bp',#blue cloud
    EmtBpPath .. 'disruptor_cannon_munition_02_emit.bp',#white cloud
    EmtBpPath .. 'disruptor_cannon_munition_03_emit.bp',
    EmtBpPath .. 'disruptor_cannon_munition_04_emit.bp',
}
WraithCannonHit01 = {
    EmtBpPath .. 'quantum_hit_flash_04_emit.bp',#small flash
    EmtBpPath .. 'quantum_hit_flash_05_emit.bp',#smal Flash
    EmtBpPathAlt .. 'quantum_hit_flash_06_emit.bp',#black lighning
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',#sparks
    EmtBpPathAlt .. 'quantum_hit_flash_08_emit.bp',#white lightning
    EmtBpPath .. 'quantum_hit_flash_09_emit.bp',#flash spikes
#    EmtBpPath .. 'aeon_sonance_hit_01_emit.bp',#black SPikes
    EmtBpPath .. 'aeon_sonance_hit_02_emit.bp',#shock wave
#    EmtBpPath .. 'aeon_sonance_hit_03_emit.bp',#white spikes
    EmtBpPath .. 'aeon_sonance_hit_04_emit.bp',#flash
}
HGaussCannonPolyTrail =  {
    EmtBpPath .. 'gauss_cannon_polytrail_01_emit.bp',
    EmtBpPath .. 'gauss_cannon_polytrail_02_emit.bp',    
}

ArtemisMuzzleFlash = {
	--EmtBpPathAlt .. 'artemis_muzzle_flash_01_emit.bp',	## Yellow glow
	EmtBpPathAlt .. 'artemis_muzzle_flash_02_emit.bp',	## Yellow pulse
	EmtBpPathAlt .. 'artemis_muzzle_flash_04_emit.bp',	## Inward dark lines
}
ArtemisMuzzleChargeFlash =  {
    #EmtBpPathAlt .. 'artemis_charge_01_emit.bp',	## glow
    EmtBpPathAlt .. 'artemis_charge_02_emit.bp',	## plasma down
    EmtBpPathAlt .. 'artemis_charge_03_emit.bp',	## flash
    EmtBpPathAlt .. 'artemis_charge_04_emit.bp',	## plasma out
    EmtBpPathAlt .. 'artemis_charge_05_emit.bp',	## rings
    EmtBpPathAlt .. 'artemis_charge_06_emit.bp',	## plasma rings
    EmtBpPathAlt .. 'artemis_charge_07_emit.bp',	## fast ring
    --EmtBpPathAlt .. 'artemis_charge_08_emit.bp',	## glowy ball
    --EmtBpPathAlt .. 'artemis_charge_09_emit.bp',	## glowy ball 
    --EmtBpPathAlt .. 'artemis_charge_10_emit.bp',	## spinny shit
    --EmtBpPathAlt .. 'artemis_charge_11_emit.bp',	## spinny crap  
    --EmtBpPathAlt .. 'artemis_charge_12_emit.bp',	## spinny crap
    --EmtBpPathAlt .. 'artemis_charge_13_emit.bp',	## glowy ball
    EmtBpPathAlt .. 'artemis_charge_14_emit.bp',	## delayed plasma   
}
ArtemisMuzzleChargeeffect01 =  {
    --EmtBpPathAlt .. 'artemis_charge_08_emit.bp',	## glowy ball
    EmtBpPathAlt .. 'artemis_charge_15_emit.bp',	## glowy ball 
    EmtBpPathAlt .. 'artemis_charge_16_emit.bp',	## spinny shit
    --EmtBpPathAlt .. 'artemis_charge_11_emit.bp',	## spinny crap  
    --EmtBpPathAlt .. 'artemis_charge_12_emit.bp',	## spinny crap
    --EmtBpPathAlt .. 'artemis_charge_13_emit.bp',	## glowy ball
}
ArtemisMuzzleChargeeffect02 =  {
    EmtBpPathAlt .. 'artemis_charge_aura_01_emit.bp',	## charge aura
    EmtBpPathAlt .. 'artemis_charge_aura_02_emit.bp',	## charge aura
}
ArtemisPolytrail01 = EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp'

ArtemisBombHit01 = {
    EmtBpPathAlt .. 'artemis_hit_01_emit.bp',			## plasma outward
    EmtBpPathAlt .. 'artemis_hit_02_emit.bp',			## spiky lines
    EmtBpPathAlt .. 'artemis_hit_03_emit.bp',			## plasma darkening outward
    EmtBpPathAlt .. 'artemis_hit_04_emit.bp',			## twirling line buildup
    EmtBpPathAlt .. 'artemis_detonate_03_emit.bp',	## non oriented glow
    EmtBpPath .. 'seraphim_expnuke_concussion_01_emit.bp',	## ring fast
    EmtBpPath .. 'seraphim_expnuke_concussion_02_emit.bp',	## ring slow
}
ArtemisBombPlumeFxTrails03 = {
    EmtBpPathAlt .. 'artemis_plume_fxtrails_05_emit.bp',		## plasma trail 
    EmtBpPathAlt .. 'artemis_plume_fxtrails_06_emit.bp',		## plasma trail darkening  
    EmtBpPathAlt .. 'artemis_plume_fxtrails_10_emit.bp',		## bright tip
    #EmtBpPath .. '_align_x_emit.bp',
	#EmtBpPath .. '_align_y_emit.bp',
	#EmtBpPath .. '_align_z_emit.bp',   
}
ArtemisBombPlumeFxTrails05 = {
    EmtBpPathAlt .. 'artemis_plume_fxtrails_07_emit.bp',	## plasma cloud 
    EmtBpPathAlt .. 'artemis_plume_fxtrails_08_emit.bp',	## plasma cloud 2, ser 07    
}
ArtemisBombPlumeFxTrails06 = {
    EmtBpPathAlt .. 'artemis_plume_fxtrails_09_emit.bp',	## line detail in explosion, fingers.
}

ArtemisFXTrail =  {
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_01_emit.bp',	##
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_02_emit.bp',	##
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_03_emit.bp',	##
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_04_emit.bp',#blue cloud
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_05_emit.bp',#white cloud
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_06_emit.bp',#white cloud Or spinny trials
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_07_emit.bp', #white cloud Or spinny trials
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_08_emit.bp',
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_09_emit.bp',
}
DummyArtemisPolytrail01 ={
	 #EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp'
}
DummyArtemisFXTrail =  {
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_01_emit.bp',	##
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_02_emit.bp',	##
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_03_emit.bp',	##
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_04_emit.bp',#blue cloud
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_05_emit.bp',#white cloud
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_06_emit.bp',#white cloud Or spinny trials
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_07_emit.bp', #white cloud Or spinny trials
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_08_emit.bp',
    #EmtBpPathAlt .. 'artemis_cannon_fxtrail_09_emit.bp',
}

ArtemisCloudFlareEffects01 = {
    '/mods/M&B/effects/emitters/artemis_warhead_02_emit.bp',
    '/mods/M&B/effects/emitters/artemis_warhead_04_emit.bp',
}

ArtemisDamageSmoke01 = { EmtBpPathAlt .. 'artemis_destruction_damaged_smoke_01_emit.bp',}
DamageFire01 = {
	EmtBpPath .. 'destruction_damaged_fire_01_emit.bp',
	EmtBpPath .. 'destruction_damaged_fire_distort_01_emit.bp',
}
ArtemisDamageFireSmoke01 = TableCat( ArtemisDamageSmoke01, DamageFire01 )


NavalMineWaterImpact = {
    EmtBpPathAlt .. 'naval_mine_water_splash_ripples_01_emit.bp',
    EmtBpPathAlt .. 'naval_mine_water_splash_wash_01_emit.bp',
    EmtBpPathAlt .. 'naval_mine_water_splash_plume_01_emit.bp',
}
NavalMineUnderWaterImpact = {
    EmtBpPathAlt .. 'naval_mine_underwater_explosion_flash_01_emit.bp',
    EmtBpPathAlt .. 'naval_mine_underwater_explosion_flash_02_emit.bp',
    EmtBpPathAlt .. 'naval_mine_underwater_explosion_splash_01_emit.bp',
}

NavalMineHit01 = TableCat( NavalMineWaterImpact, NavalMineUnderWaterImpact )

GoldAAFxTrails = {
    EmtBpPathAlt .. 'gold_aa_fxtrail_01_emit.bp',
}

GoldAAPolyTrail = EmtBpPathAlt .. 'gold_aa_polytrail_01_emit.bp'


####Omega OverCharge projectiles and impacts
OmegaOverChargeProjectileTrails = {
	EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_emit.bp',#swigly#
	EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_01_emit.bp',# other swigly
	EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_02_emit.bp',#main Swigly
}
OmegaOverChargeProjectileFxTrails = {
    EmtBpPathAlt .. 'omega_overcharge_projectile_fxtrail_01_emit.bp',#twisty
    EmtBpPathAlt .. 'omega_overcharge_projectile_fxtrail_02_emit.bp',# other twisty
    EmtBpPathAlt .. 'omega_overcharge_projectile_fxtrail_03_emit.bp',
}
OmegaOverChargeLandHit = {
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_03_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_05_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_06_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_01_emit.bp',                  
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_03_emit.bp',
}
OmegaOverChargeUnitHit = {
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_01_emit.bp',#swigly flash
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_02_emit.bp',#dot
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_05_emit.bp',
    EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_01_emit.bp',                  
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_03_emit.bp',
}

#MGQAI stuff

MGHeadshotFxtrail01 = {
     #EmtBpPath .. 'seraphim_chronotron_cannon_projectile_fxtrail_03_emit.bp',
}
MGHeadshotPolytrail01 = { 
#	EmtBpPathAlt .. 'ZCannon_projectile_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_01_emit.bp',#spinny trails
#	EmtBpPathAlt .. 'ZCannon_projectile_02_emit.bp',#spinny Trails
}

MGHeadshotHit01 = {
    #EmtBpPath .. 'quantum_hit_flash_04_emit.bp',
}
MissileHit01 = {
    EmtBpPathAlt .. 'cybran_corsair_missile_hit_01_emit.bp',
}
MissileLandHit01 = {

    EmtBpPathAlt .. 'quark_bomb_explosion_07_emit.bp',
    EmtBpPathAlt .. 'quark_bomb_explosion_08_emit.bp', --sparks

	EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',  --flash
	EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp', --sparks
	EmtBpPath .. 'cybran_kamibomb_hit_03_emit.bp', -- flare
	EmtBpPath .. 'cybran_kamibomb_hit_04_emit.bp', --quick fire
	EmtBpPath .. 'cybran_kamibomb_hit_05_emit.bp', --black fire
	EmtBpPath .. 'cybran_kamibomb_hit_06_emit.bp', --orange to red glow
	EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp', --white shockwave
	--EmtBpPath .. 'cybran_kamibomb_hit_08_emit.bp', --delayed orange plasma
	EmtBpPath .. 'cybran_kamibomb_hit_09_emit.bp', -- large orange "lightning"
	--EmtBpPath .. 'cybran_kamibomb_hit_10_emit.bp', -- slow shockwave
	--EmtBpPath .. 'cybran_kamibomb_hit_11_emit.bp', --smoke
    
}
MissileUnitHit01 = {
   EmtBpPathAlt .. 'quark_bomb_explosion_07_emit.bp',
    EmtBpPathAlt .. 'quark_bomb_explosion_08_emit.bp', --sparks

	EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',  --flash
	EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp', --sparks
	EmtBpPath .. 'cybran_kamibomb_hit_03_emit.bp', -- flare
	EmtBpPath .. 'cybran_kamibomb_hit_04_emit.bp', --quick fire
	EmtBpPath .. 'cybran_kamibomb_hit_05_emit.bp', --black fire
	EmtBpPath .. 'cybran_kamibomb_hit_06_emit.bp', --orange to red glow
	EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp', --white shockwave
	--EmtBpPath .. 'cybran_kamibomb_hit_08_emit.bp', --delayed orange plasma
	EmtBpPath .. 'cybran_kamibomb_hit_09_emit.bp', -- large orange "lightning"
	--EmtBpPath .. 'cybran_kamibomb_hit_10_emit.bp', -- slow shockwave
	--EmtBpPath .. 'cybran_kamibomb_hit_11_emit.bp', --smoke
}

MGQAIPlasmaArtyPolytrail01 = EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp'
MGQAIPlasmaArtyFxtrail01 = {
	EmtBpPathAlt .. 'plasma_arty_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrail_03_emit.bp',	##after cloud
    EmtBpPathAlt .. 'plasma_arty_fxtrail_06_emit.bp',#air ripple
    EmtBpPathAlt .. 'plasma_arty_fxtrail_08_emit.bp',#ripple
    EmtBpPathAlt .. 'plasma_arty_fxtrail_09_emit.bp',#ripple

}
MGQAIPlasmaArtyChildFxtrail01 = {
	EmtBpPathAlt .. 'plasma_arty_child_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_child_fxtrails_02_emit.bp',
}
MGQAIPlasmaArtyHitLand01 = {
    EmtBpPath .. 'napalm_hvy_flash_emit.bp',
    EmtBpPath .. 'napalm_hvy_thin_smoke_emit.bp',
    EmtBpPathAlt .. 'blue_napalm_hvy_01_emit.bp',
    EmtBpPathAlt .. 'blue_napalm_hvy_02_emit.bp',
    EmtBpPathAlt .. 'blue_napalm_hvy_03_emit.bp',
}
MGQAICannonHitUnit = {
	--EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',  --flash
	--EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp', --sparks
	EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp', --white shockwave
	--EmtBpPath .. 'cybran_kamibomb_hit_10_emit.bp', -- slow shockwave
	--EmtBpPathAlt .. 'xcannon_hit_distort_emit.bp',
	--EmtBpPath .. 'proton_bomb_hit_02_emit.bp',#sparks
	--EmtBpPathAlt .. 'xcannon_hit_distort_emit.bp',
	--EmtBpPathAlt .. 'mgqai_cannon_cloud_01_emit.bp',
    EmtBpPath .. 'cybran_light_artillery_hit_02_emit.bp',#t2 arty sparks
	EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_03_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_04_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_05_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_06_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_08_emit.bp',
	EmtBpPath .. 'cybran_kamibomb_hit_09_emit.bp',
	--EmtBpPath .. 'cybran_kamibomb_hit_10_emit.bp',

}

THeavyFragmentationShell01 = {
	EmtBpPath .. 'fragmentation_shell_phosphor_01_emit.bp',#Sparks
    EmtBpPath .. 'fragmentation_shell_hit_flash_01_emit.bp',
    EmtBpPath .. 'fragmentation_shell_shrapnel_01_emit.bp',#small particle spread
    EmtBpPathAlt .. 'heavy_fragmentation_shell_smoke_01_emit.bp',#grey smoke
    EmtBpPathAlt .. 'heavy_fragmentation_shell_smoke_02_emit.bp',#black Smoke
}

FlameThrowerHitLand01 = {
    EmtBpPathAlt .. 'exflamer_flash_emit.bp',
    EmtBpPathAlt .. 'exflamer_thick_smoke_emit.bp',
    EmtBpPathAlt .. 'exflamer_thin_smoke_emit.bp',
    EmtBpPathAlt .. 'exflamer_01_emit.bp',
    EmtBpPathAlt .. 'exflamer_02_emit.bp',
    EmtBpPathAlt .. 'exflamer_03_emit.bp',
}
FlameThrowerHitWater01 = {
    EmtBpPathAlt .. 'exflamer_waterflash_emit.bp',
    EmtBpPathAlt .. 'exflamer_water_smoke_emit.bp',
    EmtBpPathAlt .. 'exflamer_oilslick_emit.bp',
    EmtBpPathAlt .. 'exflamer_lines_emit.bp',
    EmtBpPathAlt .. 'exflamer_water_ripples_emit.bp',
    EmtBpPathAlt .. 'exflamer_water_dots_emit.bp',    
}

ADisk01 = {
    EmtBpPath .. 'quark_bomb_01_emit.bp',
    EmtBpPath .. 'quark_bomb_02_emit.bp',
    EmtBpPath .. 'sparks_06_emit.bp',
}

# FF weapon
#------------------------------------------------------------------------
#  UEF ACU Anti Matter Cannon
#------------------------------------------------------------------------
ACUAntiMatterPoly = {
    EmtBpPathAlt .. 'examc_polytrail_01_emit.bp',

}
ACUAntiMatterFx = {
    EmtBpPathAlt .. 'examc_fxtrail_01_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_02_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_03_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_04_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_05_emit.bp',
}
ACUAntiMatterMuzzle = {
    EmtBpPathAlt .. 'examc_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_06_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_07_emit.bp',
}
ACUAntiMatter01 = {
    EmtBpPathAlt .. 'examc_flash_01_emit.bp',
    EmtBpPathAlt .. 'examc_hit_01_emit.bp',
    EmtBpPathAlt .. 'examc_hit_02_emit.bp',
    EmtBpPathAlt .. 'examc_hit_03_emit.bp',
    EmtBpPathAlt .. 'examc_hit_04_emit.bp',
    EmtBpPathAlt .. 'examc_hit_05_emit.bp',
    EmtBpPathAlt .. 'examc_hit_07_emit.bp',
    EmtBpPathAlt .. 'examc_hit_08_emit.bp',
    EmtBpPathAlt .. 'examc_ring_01_emit.bp',
    EmtBpPathAlt .. 'examc_ring_02_emit.bp',
    EmtBpPathAlt .. 'examc_ring_03_emit.bp',
    EmtBpPathAlt .. 'examc_ring_04_emit.bp',
    EmtBpPathAlt .. 'examc_shoackwave_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_01_emit.bp',	##	glow	
    EmtBpPathAlt .. 'ZCannon_hit_02_emit.bp',	##	flash	     
    EmtBpPathAlt .. 'ZCannon_hit_03_emit.bp', 	##	sparks
    EmtBpPathAlt .. 'ZCannon_hit_06_emit.bp',	##	base fire
    EmtBpPathAlt .. 'ZCannon_hit_07_emit.bp',	##	base dark 
    EmtBpPathAlt .. 'ZCannon_hit_09_emit.bp',	##	base smoke
    EmtBpPathAlt .. 'ZCannon_hit_11_emit.bp',	##	base highlights
    EmtBpPathAlt .. 'ZCannon_ring_01_emit.bp',	##	ring14
    EmtBpPathAlt .. 'ZCannon_ring_02_emit.bp',	##	ring11	
    EmtBpPathAlt .. 'ZCannon_hit_12_emit.bp',	##White Lightning
	EmtBpPathAlt .. 'ZCannon_hit_13_emit.bp',	  ##   dark glow effect
	EmtBpPathAlt .. 'ZCannon_hit_14_emit.bp',  ## Dark cloud effect
	EmtBpPathAlt .. 'ZCannon_hit_15_emit.bp',  ## blue/white flash
	EmtBpPathAlt .. 'ZCannon_hit_16_emit.bp',##  Black Lightning
	EmtBpPathAlt .. 'ZCannon_ring_03_emit.bp',##	ring03-white
	EmtBpPathAlt .. 'ZCannon_ring_04_emit.bp',## ring04-dark

}
YCannonMuzzleFlash = {
	EmtBpPathAlt .. 'examc_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_06_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_07_emit.bp',
}
YCannonMuzzleChargeFlash =  {
    EmtBpPathAlt .. 'ycannon_charge_04_emit.bp',	## plasma out
    EmtBpPathAlt .. 'ycannon_charge_14_emit.bp',	## delayed plasma   
}

GLaserMuzzle01 = { 
    EmtBpPathAlt .. 'g_laser_flash_01_emit.bp',
    EmtBpPathAlt .. 'g_laser_muzzle_01_emit.bp',
}

#CMicrowaveLaserCharge01 = { 
#    EmtBpPath .. 'microwave_laser_charge_01_emit.bp',
#    EmtBpPath .. 'microwave_laser_charge_02_emit.bp',
#}
GLaserEndPoint01 = {
    EmtBpPathAlt .. 'g_laser_end_01_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_02_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_03_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_04_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_05_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_06_emit.bp',
}
GoldenTurboLaserShot01 = {
    EmtBpPathAlt .. 'Turbogoldbeam_polytrail_04_emit.bp',
	#EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp',
}
GoldenTurboLaserShot01FXTrail =  {
    EmtBpPathAlt .. 'inqu_cannon_fxtrail_01_emit.bp',	##golden line
    EmtBpPathAlt .. 'inqu_cannon_fxtrail_02_emit.bp',	###glow ball
    --EmtBpPathAlt .. 'artemis_cannon_fxtrail_03_emit.bp',	##golden fuzzy
   -- EmtBpPathAlt .. 'artemis_cannon_fxtrail_04_emit.bp',#blue cloud
    EmtBpPathAlt .. 'inqu_cannon_fxtrail_05_emit.bp',#small yellow line
    EmtBpPathAlt .. 'inqu_cannon_fxtrail_06_emit.bp',#yellowish white distortion
    EmtBpPathAlt .. 'artemis_cannon_fxtrail_07_emit.bp', #yellow core
    --EmtBpPathAlt .. 'artemis_cannon_fxtrail_09_emit.bp',--spinny cloud core
}
# Nova weapon
NovaCannonHitUnit = {

	EmtBpPathAlt .. 'nova_bomb_hit_02_emit.bp',#sparks
    EmtBpPathAlt .. 'nova_light_artillery_hit_02_emit.bp',#t2 arty sparks

}


#------------------------------------------------------------------------
#  SERAPHIM OHWALLI BOMB EMITTERS
#------------------------------------------------------------------------


GoldLaserBombDetonate01 = {
    EmtBpPathAlt .. 'gold_laser_bomb_explode_01_emit.bp',		## glow
    EmtBpPathAlt .. 'gold_laser_bomb_explode_02_emit.bp',		## upwards plasma tall    
    EmtBpPathAlt .. 'gold_laser_bomb_explode_03_emit.bp',		## upwards plasma short/wide    
    EmtBpPathAlt .. 'gold_laser_bomb_explode_04_emit.bp',		## upwards plasma top column, thin/tall
    EmtBpPathAlt .. 'gold_laser_bomb_explode_05_emit.bp',		## upwards lines
    EmtBpPathAlt .. 'gold_laser_bomb_concussion_01_emit.bp',	## ring
    EmtBpPathAlt .. 'gold_laser_bomb_concussion_02_emit.bp',	## smaller/slower ring bursts
    EmtBpPathAlt .. 'gold_laser_bomb_hit_03_emit.bp',		## fast flash
    EmtBpPathAlt .. 'gold_laser_bomb_hit_14_emit.bp',		## long glow
    EmtBpPathAlt .. 'gold_laser_bomb_hit_13_emit.bp',		## faint plasma, ser7    
}

GoldLaserBombHitRingProjectileFxTrails03 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01_emit.bp',	# Rift Trail head
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01a_emit.bp',	# Center darkening
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01b_emit.bp',   # Right rift edge
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01c_emit.bp',	# Left rift edge
}
GoldLaserBombHitRingProjectileFxTrails04 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02_emit.bp',    # Rift Trail head
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02a_emit.bp',	# Center darkening
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02b_emit.bp',   # Right rift edge   
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02c_emit.bp',   # Left rift edge   
}
GoldLaserBombHitRingProjectileFxTrails05 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03_emit.bp',    # Rift Trail head
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03a_emit.bp',   # Center darkening  
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03b_emit.bp',	# Right rift edge
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03c_emit.bp',   # Left rift edge      
}
GoldLaserBombHitRingProjectileFxTrails06 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_04_emit.bp',   
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_06_emit.bp',
}
GoldLaserBombPlumeFxTrails01 = {
    EmtBpPathAlt .. 'gold_laser_bomb_plume_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_plume_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_plume_fxtrails_03_emit.bp',    
}


#------------------------------------------------------------------------
#  Lambda Effects
#------------------------------------------------------------------------
EXLambdaRedirector = {
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_01.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_01.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_02.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_02.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_03.bp',
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
}

EXLambdaDestoyer = {
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_01.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_02.bp',
    #EmtBpPathAlt .. 'lambda_destroy_dark_03a.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_03b.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_04.bp',
    EmtBpPathAlt .. 'lambda_destroy_bright_01.bp',
    EmtBpPathAlt .. 'lambda_destroy_bright_01.bp',
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
}
#------------------------------------------------------------------------
#  Garg Weapons
#------------------------------------------------------------------------
RedTurboLaser01 = {
    EmtBpPathAlt .. 'Turboredbeam_polytrail_04_emit.bp',
}
RedTurboLaser02 = {
    EmtBpPathAlt .. 'Turboredbeam_polytrail_04_emit.bp',
}


RedLaserMuzzleFlash01 = {
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_06_emit.bp',
}

GargWarheadHitUnit = {

	EmtBpPathAlt .. 'garg_warhead_hit_01_emit.bp',#sparks
    EmtBpPathAlt .. 'garg_warhead_hit_02_emit.bp',#t2 arty sparks

}

#------------------------------------------------------------------
#    EMP effects
#--------------------------------------------------------------------

EMPEffect = {
    EmtBpPathAlt .. 'emp_effect_01_emit.bp',
    EmtBpPathAlt .. 'emp_effect_02_emit.bp',    
}



#-----------------------------
#   Cybran Hailfire Projectiles
#-----------------------------
CybranHailfire01Hit01 = {
    EmtBpPath .. 'neutron_cluster_bomb_hit_01_emit.bp',
    EmtBpPath .. 'neutron_cluster_bomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_01_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_02_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_03_emit.bp',    
}
CybranHailfire01FXTrails = {
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
    #EmtBpPathAlt .. 'exhailfire_exhaust_01_emit.bp',
    EmtBpPathAlt .. 'exhailfire_exhaust_02_emit.bp',
}
CybranHailfire02FXTrails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
}
CybranHailfire03FXTrails = {
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
    EmtBpPathAlt .. 'exhailfire_exhaust_01_emit.bp',
}
CybranHailfire01HitUnit01 = CybranHailfire01Hit01
CybranHailfire01HitLand01 = CybranHailfire01Hit01
CybranHailfire01HitWater01 = CybranHailfire01Hit01
HailfireLauncherExhaust = {
    #EmtBpPath .. 'terran_cruise_missile_launch_01_emit.bp',
    #EmtBpPathAlt .. 'terran_cruise_missile_launch_02_emit.bp',
    EmtBpPath .. 'cannon_muzzle_flash_04_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_11_emit.bp',
    #EmtBpPath .. 'terran_sam_launch_smoke_emit.bp',
    EmtBpPathAlt .. 'terran_sam_launch_smoke2_emit.bp',
}

HellStormGunShells = {
    EmtBpPathAlt .. 'hellstorm_shells_01_emit.bp',
}

MineExplosion01 = {
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_03_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_03_flat_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_05_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_06_emit.bp',    
	--EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_01_emit.bp',
    --EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_02_emit.bp',
    --EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_03_emit.bp',
    --EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_05_emit.bp',--shockwave
    --EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_06_emit.bp',--cloud
    --EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_07_emit.bp',
}
ArchAngelMissileHit = {
    EmtBpPath ..'aeon_mercy_missile_hit_01_emit.bp',
	EmtBpPathAlt .. 'aeon_mirv_cloud_01_emit.bp',
}
SerMineRiftIn_Small = {
    EmtBpPath .. 'seraphim_rift_in_small_01_emit.bp', 
    EmtBpPath .. 'seraphim_rift_in_small_02_emit.bp', 
	EmtBpPath .. 'seraphim_rift_in_small_03_emit.bp', 
    EmtBpPath .. 'seraphim_rift_in_small_04_emit.bp', 
}
SExperimentalChargePhasonLaserBeam = {
	EmtBpPathAlt .. 'seraphim_expirimental_laser_charge_beam_emit.bp',
	#EmtBpPath .. 'seraphim_expirimental_laser_beam_02_emit.bp',
}
SExperimentalDronePhasonLaserBeam = {
	EmtBpPathAlt .. 'seraphim_expirimental_laser_drone_beam_emit.bp',
	#EmtBpPath .. 'seraphim_expirimental_laser_beam_02_emit.bp',
}
GoliathTMD01 = {
    EmtBpPathAlt .. 'goliath_tmd_polytrail_01_emit.bp',
}
JuggPlasmaGatlingCannonMuzzleFlash = {
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_01_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_02_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_03_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_05_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_06_emit.bp',
}
JuggPlasmaGatlingCannonShells = {
    EmtBpPathAlt .. 'jugg_gattler_shells_01_emit.bp',
}
#---------------------------------------------------------
#				BASILISK NUKE EFFECTS
#---------------------------------------------------------
BasiliskNukePlumeFxTrails01 = {
    EmtBpPathAlt .. 'basilisk_nuke_plume_fxtrails_07_emit.bp',	## plasma cloud 
    EmtBpPathAlt .. 'basilisk_nuke_plume_fxtrails_08_emit.bp',	## plasma cloud 2, ser 07    
}

BasiliskNukeHeadEffects02 = { 
	EmtBpPathAlt .. 'basilisk_nuke_head_smoke_03_emit.bp',
	EmtBpPathAlt .. 'basilisk_nuke_head_smoke_04_emit.bp',
		
}
BasiliskNukeHeadEffects03 = { EmtBpPathAlt .. 'basilisk_nuke_head_fire_01_emit.bp', }

DamageBlueFire = {
	EmtBpPathAlt .. 'destruction_damaged_blue_fire_01_emit.bp',
	EmtBpPathAlt .. 'destruction_damaged_blue_fire_02_emit.bp',
	EmtBpPath .. 'destruction_damaged_fire_distort_01_emit.bp',
}

RailGunCannonHit01 = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_02_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_04_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_05_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_06_emit.bp',
	EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_01_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_02_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_03_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_04_emit.bp',
}
RailGunCannonHit02 = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_land_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_land_hit_02_emit.bp',
}
RailGunCannonHit03 = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_06_emit.bp',
}
RailGunCannonUnitHit = TableCat( RailGunCannonHit01, RailGunCannonHit03, UnitHitShrapnel01 )
RailGunCannonHit = TableCat( RailGunCannonHit01, RailGunCannonHit02 )

RailGunFxTrails = {
   EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_fxtrail_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_fxtrail_02_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_fxtrail_03_emit.bp',-- need to increase
	#EmtBpPath .. 'plasma_cannon_trail_02_emit.bp',
	EmtBpPath .. 'terran_commander_overcharge_trail_01_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_trail_02_emit.bp',
	EmtBpPath .. 'terran_commander_cannon_fxtrail_01_emit.bp',
}
RailGunPolyTrails = {
	EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_polytrail_01_emit.bp',

}
#-----------------------------
#   UEF Hyper Velocity Missile
#-----------------------------
CitadelHVM01Trails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
}
