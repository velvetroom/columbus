import MapKit

extension MCreateSaveRenderSliceRect
{
    private static let kMaxSize:Double = 2560
    
    //MARK: private
    
    private static func factoryRect(
        tileX:Double,
        tileY:Double,
        tileWidth:Double,
        tileHeight:Double,
        tileMapSize:Double) -> MCreateSaveRenderRect
    {
        let mapX:Double = tileX * tileMapSize
        let mapY:Double = tileY * tileMapSize
        let mapWidth:Double = tileWidth * tileMapSize
        let mapHeight:Double = tileHeight * tileMapSize
        
        let mapRect:MKMapRect = MKMapRectMake(
            mapX,
            mapY,
            mapWidth,
            mapHeight)
        
        return rect
    }
    
    private func factoryOptions(
        renderRects:MCreateSaveRenderRects) -> [MKMapSnapshotOptions]
    {
        let mapRect:MKMapRect = factoryMapRect(
            renderRect:renderRect)
        let size:CGSize = factoryOptionsSize(
            renderRect:renderRect)
        
        let options:MKMapSnapshotOptions = MKMapSnapshotOptions()
        options.mapRect = mapRect
        options.size = size
        
        print("map size: \(size)")
        
        return options
    }
    
    private func factoryMapRect(
        renderRect:MCreateSaveRenderRect) -> MKMapRect
    {
        let mapX:Double = tileToMapPoint(
            tilePoint:renderRect.x)
        let mapY:Double = tileToMapPoint(
            tilePoint:renderRect.y)
        let mapWidth:Double = tileToMapPoint(
            tilePoint:renderRect.width)
        let mapHeight:Double = tileToMapPoint(
            tilePoint:renderRect.height)
        
        let mapRect:MKMapRect = MKMapRectMake(
            mapX,
            mapY,
            mapWidth,
            mapHeight)
        
        return mapRect
    }
    
    private func factoryOptionsSize(
        renderRect:MCreateSaveRenderRect) -> CGSize
    {
        let width:Double = renderRect.width * MCreateSave.kTileSize
        let height:Double = renderRect.height * MCreateSave.kTileSize
        let size:CGSize = CGSize(
            width:width,
            height:height)
        
        return size
    }
    
    //MARK: internal
    
    static func factoryRects(
        tileRange:MCreateSaveTileRange) -> [MCreateSaveRenderRect]
    {
        var rects:[MCreateSaveRenderRect] = []
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
                
                let rect:MCreateSaveRenderRect = factoryRect(
                    tileX:tileX,
                    tileY:tileY,
                    tileWidth:deltaX,
                    tileHeight:deltaY,
                    tileMapSize:tileRange.tileMapSize)
                
                rects.append(rect)
                
                tileX += deltaX
            }
            
            tileY += deltaY
        }
        
        return rects
    }
}
