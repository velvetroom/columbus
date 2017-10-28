import Foundation

extension MCreateSavePixelRange
{
    //MARK: internal
    
    func factoryTileRange(
        tileSize:Double) -> MCreateSaveTileRange
    {
        let minX:Double = floor(self.minX / tileSize)
        let maxX:Double = floor(self.maxX / tileSize)
        let minY:Double = floor(self.minY / tileSize)
        let maxY:Double = floor(self.maxY / tileSize)
        
        let tileRange:MCreateSaveTileRange = MCreateSaveTileRange(
            tileSize:tileSize,
            zoom:zoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return tileRange
    }
}
