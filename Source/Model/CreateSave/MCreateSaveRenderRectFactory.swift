import Foundation

extension MCreateSaveRenderRect
{
    private static let kMaxSize:Double = 2560
    
    //MARK: internal
    
    static func factoryRects(
        tileRange:MCreateSaveTileRange) -> [MCreateSaveRenderRect]
    {
        var rects:[MCreateSaveRenderRect] = []
        var y:Double = tileRange.minY
        
        while y < tileRange.maxY
        {
            var x:Double = tileRange.minX
            var deltaY:Double = tileRange.maxY - y
            
            if deltaY > kMaxSize
            {
                deltaY = kMaxSize
            }
            
            while x < tileRange.maxX
            {
                var deltaX:Double = tileRange.maxX - x
                
                if deltaX > kMaxSize
                {
                    deltaX = kMaxSize
                }
                
                let rect:MCreateSaveRenderRect = MCreateSaveRenderRect(
                    x:x,
                    y:y,
                    width:deltaX,
                    height:deltaY)
                
                rects.append(rect)
                
                x += deltaX
            }
            
            y += deltaY
        }
        
        return rects
    }
}
