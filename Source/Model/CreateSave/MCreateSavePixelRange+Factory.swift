import Foundation

extension MCreateSavePixelRange
{
    //MARK: private
    
    private func factoryTileMapSize(
        tileSize:Double) -> Double
    {
        let sizeInMap:Double = pixelZoom / tileSize
        let tileMapSize:Double = MCreateSave.Constants.Map.appleToGoogle / sizeInMap
        
        return tileMapSize
    }
    
    //MARK: internal
    
    func factoryTileRange(
        tileSize:Double) -> MCreateSaveTileRange
    {
        let tileMapSize:Double = factoryTileMapSize(
            tileSize:tileSize)
        
        let minX:Double = floor(self.minX / tileSize)
        let maxX:Double = floor(self.maxX / tileSize)
        let minY:Double = floor(self.minY / tileSize)
        let maxY:Double = floor(self.maxY / tileSize)
        
        let tileRange:MCreateSaveTileRange = MCreateSaveTileRange(
            tileSize:tileSize,
            tileMapSize:tileMapSize,
            zoom:zoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return tileRange
    }
}
