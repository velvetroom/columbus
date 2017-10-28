import Foundation

extension MCreateSavePixelRange
{
    //MARK: private
    
    private func factoryTileSizeInMap(
        tileSize:Double) -> Double
    {
        let sizeInMap:Double = pixelZoom * tileSize
        
        return sizeInMap
    }
    
    //MARK: internal
    
    func factoryTileRange(
        tileSize:Double) -> MCreateSaveTileRange
    {
        let tileSizeInMap:Double = factoryTileSizeInMap(
            tileSize:tileSize)
        
        let minX:Double = floor(self.minX / tileSize)
        let maxX:Double = floor(self.maxX / tileSize)
        let minY:Double = floor(self.minY / tileSize)
        let maxY:Double = floor(self.maxY / tileSize)
        
        let tileRange:MCreateSaveTileRange = MCreateSaveTileRange(
            tileSize:tileSize,
            tileSizeInMap:tileSizeInMap,
            zoom:zoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return tileRange
    }
}
