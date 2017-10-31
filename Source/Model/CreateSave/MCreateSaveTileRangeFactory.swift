import MapKit

extension MCreateSaveTileRange
{
    //MARK: private
    
    private func factoryOptions(
        renderRect:MCreateSaveRenderRect) -> MKMapSnapshotOptions
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
    
    private func tileToMapPoint(
        tilePoint:Double) -> Double
    {
        let point:Double = tilePoint * tileMapSize
        
        return point
    }
    
    //MARK: internal
    
    func factoryRender() -> MCreateSaveRender
    {
        // limit render to 2560.0
        
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
