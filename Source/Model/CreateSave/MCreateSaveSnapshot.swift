import MapKit

extension MCreateSave
{
    private static let kSnapshotTimeout:TimeInterval = 300
    
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
            dispatchGroup.enter()
            
            snapshots(
                directory:directory,
                render:render)
            { (newUrls:[URL]?) in
                
                if let newUrls:[URL] = newUrls
                {
                    urls.append(contentsOf:newUrls)
                }
                
                print("save 2 8")
                
                dispatchGroup.leave()
            }
        }
        
        print("save 2 4")
        
        let timeout:DispatchTime = DispatchTime.now() + kSnapshotTimeout
        let _:DispatchTimeoutResult = dispatchGroup.wait(
            timeout:timeout)
        
        print("save 2 5")
        completion(urls)
    }
    
    private class func snapshots(
        directory:URL,
        render:MCreateSaveRender,
        completion:@escaping(([URL]?) -> ()))
    {
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(
            options:render.options)
        
        snapshotter.start
        { (snapshot:MKMapSnapshot?, error:Error?) in
            
            guard
                
                error == nil,
                let image:UIImage = snapshot?.image,
                let url:URL = fileSave(
                    directory:directory,
                    name:"test_snap",
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
