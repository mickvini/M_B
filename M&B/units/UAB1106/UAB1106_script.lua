local AMassStorageUnit = import('/lua/defaultunits.lua').StructureUnit

UAB1106 = Class(AMassStorageUnit) {

    OnStopBeingBuilt = function(self,builder,layer)
        AMassStorageUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateStorageManip(self, 'B01', 'MASS', 0, 0, 0, 0, 0, .41))
    end,

    AnimThread = function(self)
        
    end,
}

TypeClass = UAB1106