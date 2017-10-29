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
        
        print("save 2 4")
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        {
            print("save 2 5")
            
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
            
            print("enter dispatch \(dispatchGroup)")
            
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
                let image:UIImage = snapshot?.image,
                let url:URL = fileSave(
                    directory:directory,
                    name:tile.name,
                    image:image)
            
            else
            {
                completion(nil)
                
                return
            }
            
            completion(url)
        }
    }
    
    //MARK: internal
    
    class func snapshots(
        plan:DPlan,
        mapRange:MCreateSaveMapRange,
        settings:DSettings,
        completion:@escaping(([URL]) -> ()))
    {
        print("save 2 2")
        
        guard
            
            let directory:URL = factoryDirectory(
                plan:plan)
        
        else
        {
            return
        }
        
        print("save 2 3")
        
        let renders:[MCreateSaveRender] = factorySnapshotRender(
            mapRange:mapRange,
            settings:settings)
        
        snapshots(
            directory:directory,
            renders:renders,
            completion:completion)
    }
}
