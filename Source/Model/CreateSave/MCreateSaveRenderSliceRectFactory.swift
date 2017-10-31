import MapKit

extension MCreateSaveRenderSliceRect
{
    private static let kMaxSize:Double = 2560
    
    //MARK: internal
    
    static func factoryRects(
        tileRange:MCreateSaveTileRange) -> [MCreateSaveRenderSliceRect]
    {
        var rects:[MCreateSaveRenderSliceRect] = []
        var tileY:Double = tileRange.minY
        
        while tileY < tileRange.maxY
        {
            var tileX:Double = tileRange.minX
            var deltaY:Double = tileRange.maxY - tileY
            
            if deltaY > kMaxSize
            {
                deltaY = kMaxSize
            }
            
            while tileX < tileRange.maxX
            {
                var deltaX:Double = tileRange.maxX - tileX
                
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
