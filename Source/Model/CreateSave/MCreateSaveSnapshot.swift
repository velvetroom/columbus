import MapKit

extension MCreateSave
{
    //MARK: private
    
    private class func snapshots(
        renders:[MCreateSaveRender],
        completion:@escaping(([URL]) -> ()))
    {
        var allUrls:[URL] = []
        let dispatchGroup:DispatchGroup = MCreateSave.factoryDispatchGroup()
        
        for render:MCreateSaveRender in renders
        {
            dispatchGroup.enter()
            
            snapshots(render:render)
            { (urls:[URL]) in
                
                allUrls.append(contentsOf:urls)
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        {
            completion(allUrls)
        }
    }
    
    private class func snapshots(
        render:MCreateSaveRender,
        completion:@escaping(([URL]) -> ()))
    {
        var urls:[URL] = []
        let dispatchGroup:DispatchGroup = MCreateSave.factoryDispatchGroup()
        
        for tile:MCreateSaveRenderTile in render.tiles
        {
            dispatchGroup.enter()
            
            snapshot(option:tile.options)
            { (image:UIImage?) in
                
                if let image:UIImage = image
                {
                    images.append(image)
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        {
            completion(urls)
        }
    }
    
    private class func snapshot(
        option:MKMapSnapshotOptions,
        completion:@escaping((UIImage?) -> ()))
    {
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(
            options:option)
        
        snapshotter.start
        { (snapshot:MKMapSnapshot?, error:Error?) in
            
            guard
            
                error == nil,
                let image:UIImage = snapshot?.image
            
            else
            {
                completion(nil)
                
                return
            }
            
            completion(image)
        }
    }
    
    //MARK: internal
    
    class func snapshots(
        mapRange:MCreateSaveMapRange,
        settings:DSettings,
        completion:@escaping(([URL]) -> ()))
    {
        let renders:[MCreateSaveRender] = factorySnapshotRender(
            mapRange:mapRange,
            settings:settings)
        
        snapshots(
            renders:renders,
            completion:completion)
    }
}
