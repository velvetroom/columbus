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
    
    private class func factorySnapshot(
        snapshot:MKMapSnapshot?,
        error:Error?,
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice,
        completion:@escaping(([URL]?) -> ()))
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncFactorySnapshot(
                snapshot:snapshot,
                error:error,
                zoom:zoom,
                directory:directory,
                slice:slice,
                completion:completion)
        }
    }
    
    private class func asyncFactorySnapshot(
        snapshot:MKMapSnapshot?,
        error:Error?,
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice,
        completion:@escaping(([URL]?) -> ()))
    {
        guard
            
            error == nil,
            let image:UIImage = snapshot?.image
            
        else
        {
            print("save 2 7")
            
            completion(nil)
            
            return
        }
        
        print("save 2 6")
        
        let urls:[URL] = factoryImages(
            snapshot:image,
            directory:directory,
            zoom:zoom,
            slice:slice)
        
        completion(urls)
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
    
    class func factorySnapshot(
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice,
        completion:@escaping(([URL]?) -> ()))
    {
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(
            options:slice.options)
        
        snapshotter.start
        { (snapshot:MKMapSnapshot?, error:Error?) in
            
            factorySnapshot(
                snapshot:snapshot,
                error:error,
                zoom:zoom,
                directory:directory,
                slice:slice,
                completion:completion)
        }
    }
}
