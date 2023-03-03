#****************************************************************************
#**
#**  File     :  /cdimage/lua/formations.lua
#**  Author(s): Mickvini
#**
#**  Summary  :
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
#
# Basic create formation scripts
#

SurfaceFormations = {
    'AttackFormation',
    'GrowthFormation',
    'ScatterFormation',
    'ClusterFormation',
    'DMSCircleFormation',
}

AirFormations = {
    'AttackFormation',
    'GrowthFormation',
    'ScatterFormation',
    'ClusterFormation',
    'DMSCircleFormation',
}

ComboFormations = {
    'AttackFormation',
    'GrowthFormation',
    'ScatterFormation',
    'ClusterFormation',
    'DMSCircleFormation',
}
function ScatterFormation( formationUnits )

    --LOG("*AI DEBUG Creating Scatter Formation")

    local rotate = false
    
    local FormationPos = {}
    
    local numUnits = table.getn(formationUnits)

    local naval = false
    local sizeMult = 3
    
    for k,v in formationUnits do
    
        if not v.Dead and EntityCategoryContains( categories.NAVAL * categories.MOBILE, v ) then
            naval = true
            sizeMult = 8
            break
            
        elseif v.Dead then
            formationUnits[v] = nil
        end

    end

    local ringChange = 5
    local unitCount = 1

    -- make circle around center point
    
    for i in formationUnits do
    
        if unitCount == ringChange then
        
            ringChange = ringChange + 5
            
            if naval then
                sizeMult = sizeMult + 8
            else
                sizeMult = sizeMult + 3
            end
            unitCount = 1
        end
        
        offsetX = sizeMult * math.sin( lerp( unitCount/ringChange, 0.0, math.pi * 2.0 ))
        offsetY = sizeMult * math.cos( lerp( unitCount/ringChange, 0.0, math.pi * 2.0 ))
        
        --LOG('*FORMATION DEBUG: X=' .. offsetX .. ', Y=' .. offsetY )
        
        table.insert(FormationPos, { offsetX, offsetY, categories.ALLUNITS, 0, rotate })
        unitCount = unitCount + 1
        
    end

    return FormationPos
end
function ClusterFormation( formationUnits )
	
    local rotate = false
	
    local FormationPos = {}
	local counter = 0
	
    local numUnits = table.getn(formationUnits)
    
    local ring = 0
    local ringChange = 1
    local unitCount = 0
    local sizeMult = 0 --LOUDMAX(1.0, ringChange * 0.2)
    
    #-- make rings around center point
    for i in formationUnits do
       
		
        offsetX = sizeMult * math.sin( lerp( unitCount/ringChange, 0.0, math.pi * 2.0 ) )
        offsetY = sizeMult * math.cos( lerp( unitCount/ringChange, 0.0, math.pi * 2.0 ) )
		
		counter = counter + 1
        FormationPos[counter] = { offsetX, offsetY, categories.ALLUNITS, 0, rotate }
		
        unitCount = unitCount + 1
		
		if unitCount == ringChange then
            numUnits = numUnits - ringChange
            
            ring = ring + 1
            ringChange = (ring * 5) + ring
            sizeMult = math.max(0, ringChange * 0.14)
			
            if ringChange > numUnits then
                ringChange = numUnits
            end
            unitCount = 0
        end
    end

    return FormationPos
end
function DMSCircleFormation( formationUnits )

    local rotate = false
	
    local FormationPos = {}
	local counter = 0
	
    local numUnits = table.getn(formationUnits)

	local sizeMult = math.max(1.0, numUnits * 0.2)

    #-- make circle around center point
    for i in formationUnits do
	
        offsetX = sizeMult * math.sin( lerp( i/numUnits, 0.0, math.pi * 2.0 ) )
        offsetY = sizeMult * math.cos( lerp( i/numUnits, 0.0, math.pi * 2.0 ) )
		
		counter = counter + 1
        FormationPos[counter] = { offsetX, offsetY, categories.ALLUNITS, 0, rotate }
		
    end

    return FormationPos
end