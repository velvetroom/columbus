import MapKit

extension MCreateSaveRenderSliceRect
{
    //MARK: internal
    
    static func factoryRects(
        tileRange:MCreateSaveTileRange) -> [MCreateSaveRenderSliceRect]
    {
        var rects:[MCreateSaveRenderSliceRect] = []
        var tileY:Double = tileRange.minY
        let maxX:Double = tileRange.maxX + 1
        let maxY:Double = tileRange.maxY + 1
        
        while tileY < maxY
        {
            var tileX:Double = tileRange.minX
            var deltaY:Double = maxY - tileY
            
            if deltaY > kMaxSize
            {
                deltaY = kMaxSize
            }
            
            while tileX < maxX
            {
                var deltaX:Double = maxX - tileX
                
                if deltaX > kMaxSize
                {
                    deltaX = kMaxSize
                }
                
                let rect:MCreateSaveRenderSliceRect = MCreateSaveRenderSliceRect(
                    tileX:tileX,
                    tileY:tileY,
                    tileWidth:deltaX,
                    tileHeight:deltaY)
                
                rects.append(rect)
                
                tileX += deltaX
            }
            
            tileY += deltaY
        }
        
        return rects
    }
}
