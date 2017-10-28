import MapKit

extension MCreateSave
{
    //MARK: private
    
    private class func snapshots(
        directory:URL,
        renders:[MCreateSaveRender],
        completion:@escaping(([URL]) -> ()))
    {
        var urls:[URL] = []
        let dispatchGroup:DispatchGroup = MCreateSave.factoryDispatchGroup()
        
        for render:MCreateSaveRender in renders
        {
            snapshots(
                dispatchGroup:dispatchGroup,
                directory:directory,
                render:render)
            { (url:URL?) in
                
                if let url:URL = url
                {
                    urls.append(url)
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
    
    private class func snapshots(
        dispatchGroup:DispatchGroup,
        directory:URL,
        render:MCreateSaveRender,
        completion:@escaping((URL?) -> ()))
    {
        for tile:MCreateSaveRenderTile in render.tiles
        {
            dispatchGroup.enter()
            
            snapshot(
                directory:directory,
                tile:tile,
                completion:completion)
        }
    }
    
    private class func snapshot(
        directory:URL,
        tile:MCreateSaveRenderTile,
        completion:@escaping((URL?) -> ()))
    {
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(
            options:tile.options)
        
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
        plan:DPlan,
        mapRange:MCreateSaveMapRange,
        settings:DSettings,
        completion:@escaping(([URL]) -> ()))
    {
        guard
            
            let directory:URL = factoryDirectory(
                plan:plan)
        
        else
        {
            return
        }
        
        let renders:[MCreateSaveRender] = factorySnapshotRender(
            mapRange:mapRange,
            settings:settings)
        
        snapshots(
            directory:directory,
            renders:renders,
            completion:completion)
    }
}
