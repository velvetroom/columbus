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
        renderRect:MCreateSaveRenderRect) -> MKMapSnapshotOptions
    {
        let mapRect:MKMapRect = factoryMapRect(
            renderRect:renderRect)
        
        let options:MKMapSnapshotOptions = MKMapSnapshotOptions()
        options.mapRect = mapRect
        
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
        
        print("map rect: \(mapRect)")
        
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
        let renderRect:MCreateSaveRenderRect = factoryRenderRect()
        let options:MKMapSnapshotOptions = factoryOptions(
            renderRect:renderRect)
        
        let render:MCreateSaveRender = MCreateSaveRender(
            zoom:zoom,
            options:options,
            rect:renderRect)
        
        return render
    }
}
