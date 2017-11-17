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
    
    private func factorySnapshot(
        image:UIImage,
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice)
    {
        builder?.timer?.invalidate()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + MCreateSave.Constants.TimeIntervals.snapshotWait)
        { [weak self] in
            
            self?.asyncFactorySnapshot(
                image:image,
                zoom:zoom,
                directory:directory,
                slice:slice)
        }
    }
    
    private func asyncFactorySnapshot(
        image:UIImage,
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice)
    {
        let urls:[URL] = MCreateSave.factoryImages(
            snapshot:image,
            directory:directory,
            zoom:zoom,
            slice:slice)
        
        snapshotUrls(urls:urls)
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
    
    func factorySnapshot(
        zoom:Double,
        directory:URL,
        slice:MCreateSaveRenderSlice)
    {
        self.snapshotter?.cancel()
        
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(options:slice.options)
        self.snapshotter = snapshotter
        
        snapshotter.start
        { [weak self] (snapshot:MKMapSnapshot?, error:Error?) in
            
            guard
                
                error == nil,
                let image:UIImage = snapshot?.image
                
            else
            {
                self?.buildingError()
                
                return
            }
            
            self?.factorySnapshot(
                image:image,
                zoom:zoom,
                directory:directory,
                slice:slice)
        }
    }
}
