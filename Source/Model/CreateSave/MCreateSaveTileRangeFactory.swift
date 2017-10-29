import MapKit

extension MCreateSaveTileRange
{
    private static let kNameSeparator:String = "."
    
    //MARK: private
    
    private func factoryTiles() -> [MCreateSaveRenderTile]
    {
        var tiles:[MCreateSaveRenderTile] = []
        
        let minX:Int = Int(self.minX)
        let maxX:Int = Int(self.maxX)
        let minY:Int = Int(self.minY)
        let maxY:Int = Int(self.maxY)
        
        for indexX:Int in minX ... maxX
        {
            for indexY:Int in minY ... maxY
            {
                let tile:MCreateSaveRenderTile = factoryTile(
                    indexX:indexX,
                    indexY:indexY)
                
                tiles.append(tile)
            }
        }
        
        return tiles
    }
    
    private func factoryTile(
        indexX:Int,
        indexY:Int) -> MCreateSaveRenderTile
    {
        
    }
    
    private func factoryName(
        indexX:Int,
        indexY:Int) -> String
    {
        let zoomInt:Int = Int(zoom)
        let stringX:String = String(indexX)
        let stringY:String = String(indexY)
        let stringZ:String = String(zoomInt)
        
        var string:String = String()
        string.append(stringX)
        string.append(MCreateSaveTileRange.kNameSeparator)
        string.append(stringY)
        string.append(MCreateSaveTileRange.kNameSeparator)
        string.append(stringZ)
        
        return string
    }
    
    //MARK: internal
    
    func factoryRender() -> MCreateSaveRender
    {
        
    }
}
