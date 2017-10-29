import Foundation

extension MCreateSavePixelRange
{
    private static let kMapSizeMultiplier:Double = 1000000
    
    //MARK: private
    
    private func factoryTileToMap(
        tileSize:Double) -> Double
    {
        let sizeInMap:Double = pixelZoom / tileSize
        let tileToMap:Double = 1 / sizeInMap
        
        return tileToMap
    }
    
    private func factoryMapSize(
        tileToMap:Double) -> Double
    {
        let mapSize:Double = tileToMap * MCreateSavePixelRange.kMapSizeMultiplier
        
        return mapSize
    }
    
    //MARK: internal
    
    func factoryTileRange(
        tileSize:Double) -> MCreateSaveTileRange
    {
        let tileToMap:Double = factoryTileToMap(
            tileSize:tileSize)
        let mapSize:Double = factoryMapSize(
            tileToMap:tileToMap)
        
        let minX:Double = floor(self.minX / tileSize)
        let maxX:Double = floor(self.maxX / tileSize)
        let minY:Double = floor(self.minY / tileSize)
        let maxY:Double = floor(self.maxY / tileSize)
        
        let tileRange:MCreateSaveTileRange = MCreateSaveTileRange(
            tileSize:tileSize,
            tileToMap:tileToMap,
            mapSize:mapSize,
            zoom:zoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return tileRange
    }
}
