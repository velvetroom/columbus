import Foundation

extension MCreateSave
{
    //MARK: private
    
    private class func factoryBoundingMin(
        min:Double) -> Double
    {
        var min:Double = min - kPaddingTile
        
        if min < 0
        {
            min = 0
        }
        
        return min
    }
    
    private class func factoryBoundingMax(
        max:Double) -> Double
    {
        let max:Double = max + kPaddingTile
        
        return max
    }
    
    //MARK: internal
    
    class func factoryBoundingTileRange(
        tileRange:MCreateSaveTileRange) -> MCreateSaveTileRange
    {
        let minX:Double = factoryBoundingMin(
            min:tileRange.minX)
        let maxX:Double = factoryBoundingMax(
            max:tileRange.maxX)
        let minY:Double = factoryBoundingMin(
            min:tileRange.minY)
        let maxY:Double = factoryBoundingMax(
            max:tileRange.maxY)
        
        let boundingTileRange:MCreateSaveTileRange = MCreateSaveTileRange(
            tileSize:tileRange.tileSize,
            tileToMap:tileRange.tileToMap,
            mapSize:tileRange.mapSize,
            zoom:tileRange.zoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return boundingTileRange
    }
}
