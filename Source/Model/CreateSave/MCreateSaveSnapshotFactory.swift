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
        directory:URL,
        snapshot:MKMapSnapshot?,
        error:Error?,
        slice:MCreateSaveRenderSlice,
        completion:@escaping(([URL]?) -> ()))
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncFactorySnapshot(
                directory:directory,
                snapshot:snapshot,
                error:error,
                slice:slice,
                completion:completion)
        }
    }
    
    private class func asyncFactorySnapshot(
        directory:URL,
        snapshot:MKMapSnapshot?,
        error:Error?,
        slice:MCreateSaveRenderSlice,
        completion:@escaping(([URL]?) -> ()))
    {
        guard
            
            error == nil,
            let image:UIImage = snapshot?.image,
            let url:URL = fileSave(
                directory:directory,
                name:"test_snap_\(slice.rect.tileX)_\(slice.rect.tileY).png",
                image:image)
            
        else
        {
            print("save 2 7")
            
            completion(nil)
            
            return
        }
        
        print("save 2 6")
        
        completion([url])
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
        directory:URL,
        slice:MCreateSaveRenderSlice,
        completion:@escaping(([URL]?) -> ()))
    {
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(
            options:slice.options)
        
        snapshotter.start
        { (snapshot:MKMapSnapshot?, error:Error?) in
            
            factorySnapshot(
                directory:directory,
                snapshot:snapshot,
                error:error,
                slice:slice,
                completion:completion)
        }
    }
}
