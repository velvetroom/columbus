import Foundation

extension MCreateSave
{
    //MARK: private
    
    private func factoryMaxTile(
        zoom:Double) -> Double
    {
        let timesZoom:Double = Double(2) * zoom
        let totalTiles:Double = pow(2, timesZoom)
        let maxTile:Double = totalTiles / 4
        
        return maxTile
    }
    
    private func factoryBoundingMin(
        min:Double) -> Double
    {
        var min:Double = min - kPaddingTile
        
        if min < 0
        {
            min = 0
        }
        
        return min
    }
    
    private func factoryBoundingMax(
        max:Double,
        maxTile:Double) -> Double
    {
        var max:Double = max + kPaddingTile
        
        if max > maxTile
        {
            max = maxTile
        }
        
        return max
    }
    
    //MARK: internal
    
    func factoryBoundingTileRange(
        tileRange:MCreateSaveTileRange) -> MCreateSaveTileRange
    {
        let maxTile:Double = factoryMaxTile(
            zoom:tileRange.zoom)
        
        let minX:Double = factoryBoundingMin(
            min:tileRange.minX)
        let maxX:Double = factoryBoundingMax(
            max:tileRange.minX,
            maxTile:maxTile)
        let minY:Double = factoryBoundingMin(
            min:tileRange.minX)
        let maxY:Double = factoryBoundingMax(
            max:tileRange.minX,
            maxTile:maxTile)
        
        let boundingTileRange:MCreateSaveTileRange = MCreateSaveTileRange(
            tileSize:tileRange.tileSize,
            tileSizeInMap:tileRange.tileSizeInMap,
            zoom:tileRange.zoom,
            minX:minX,
            maxX:maxX,
            minY:minY,
            maxY:maxY)
        
        return boundingTileRange
    }
}
