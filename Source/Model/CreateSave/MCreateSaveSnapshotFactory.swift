import MapKit

extension MCreateSave
{
    //MARK: private
    
    private class func factoryRender(
        mapRange:MCreateSaveMapRange,
        zoom:MCreateSaveZoomProtocol) -> [MCreateSaveRender]
    {
        var renders:[MCreateSaveRender] = []
        
        for zoomLevel:Double in zoom.zoom
        {
            let render:MCreateSaveRender = tiles(
                mapRange:mapRange,
                zoom:zoomLevel)
            
            renders.append(render)
        }
        
        return renders
    }
    
    //MARK: internal
    
    class func factorySnapshotRender(
        mapRange:MCreateSaveMapRange,
        settings:DSettings) -> [MCreateSaveRender]
    {
        let zoom:MCreateSaveZoomProtocol = MCreateSaveZoomDefault.factoryZoom(
            detailLevel:settings.detailLevel)
        
        let options:[MCreateSaveRender] = factoryRender(
            mapRange:mapRange,
            zoom:zoom)
        
        return options
    }
}
