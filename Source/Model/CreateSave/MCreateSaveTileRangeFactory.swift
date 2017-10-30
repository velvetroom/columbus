import MapKit

extension MCreateSaveTileRange
{
    //MARK: private
    
    private func factoryRenderRect() -> MCreateSaveRenderRect
    {
        let deltaX:Double = maxX - minX
        let deltaY:Double = maxY - minY
        let width:Double = deltaX + 1
        let height:Double = deltaY + 1
        
        let rect:MCreateSaveRenderRect = MCreateSaveRenderRect(
            x:minX,
            y:minY,
            width:width,
            height:height)
        
        return rect
    }
    
    private func factoryOptions(
        rect:MCreateSaveRenderRect) -> MKMapSnapshotOptions
    {
        let mapRect:MKMapRect = factoryMapRect()
        
        let options:MKMapSnapshotOptions = MKMapSnapshotOptions()
        options.mapRect = mapRect
        
        return options
    }
    
    private func factoryMapRect() -> MKMapRect
    {
        let mapX:Double = tileToMapPoint(
            tilePoint:self.minX)
        let mapY:Double = tileToMapPoint(
            tilePoint:self.minY)
        let lastTileX:Double = tileToMapPoint(
            tilePoint:self.maxX)
        let lastTileY:Double = tileToMapPoint(
            tilePoint:self.maxY)
        let maxX:Double = lastTileX + tileMapSize
        let maxY:Double = lastTileY + tileMapSize
        
        let mapRect:MKMapRect = MKMapRectMake(
            mapX,
            mapY,
            tileMapSize,
            tileMapSize)
        
        return mapRect
    }
    
    private func tileToMapPoint(
        tilePoint:Double) -> Double
    {
        let point:Double = tilePoint * tileMapSize
        
        return point
    }
    
    //MARK: internal
    
    func factoryRender() -> MCreateSaveRender
    {
        let rect:MCreateSaveRenderRect = factoryRenderRect()
        let options:MKMapSnapshotOptions = factoryOptions(
            rect:rect)
        
        let render:MCreateSaveRender = MCreateSaveRender(
            zoom:zoom,
            tiles:tiles)
        
        return render
    }
}
