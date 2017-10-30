import MapKit

extension MCreateSaveTileRange
{
    //MARK: private
    
    private func factoryOptions() -> MKMapSnapshotOptions
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
        let options:MKMapSnapshotOptions = factoryOptions()
        
        let render:MCreateSaveRender = MCreateSaveRender(
            zoom:zoom,
            tiles:tiles)
        
        return render
    }
}
