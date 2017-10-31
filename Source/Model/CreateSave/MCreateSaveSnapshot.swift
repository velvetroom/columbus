import Foundation

extension MCreateSave
{
    private static let kSnapshotTimeout:TimeInterval = 180
    
    //MARK: private
    
    private func snapshots(
        directory:URL,
        renders:[MCreateSaveRender])
    {
        var urls:[URL] = []
        
        for render:MCreateSaveRender in renders
        {
            snapshots(
                directory:directory,
                render:render)
            { [weak self] (newUrls:[URL]?) in
                
                if let newUrls:[URL] = newUrls
                {
                    urls.append(contentsOf:newUrls)
                }
                
                print("save 2 8")
                
                self?.dispatchGroup.leave()
            }
        }
        
        print("save 2 4")
        
        let timeout:DispatchTime = DispatchTime.now() + MCreateSave.kSnapshotTimeout
        let _:DispatchTimeoutResult = dispatchGroup.wait(
            timeout:timeout)
        
        print("save 2 5")
        completion(urls)
    }
    
    private func snapshots(
        directory:URL,
        render:MCreateSaveRender,
        completion:@escaping(([URL]?) -> ()))
    {
        for slice:MCreateSaveRenderSlice in render.slices
        {
            dispatchGroup.enter()
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.factorySnapshot(
                    zoom:render.zoom,
                    directory:directory,
                    slice:slice,
                    completion:completion)
            }
        }
    }
    
    //MARK: internal
    
    func snapshots(mapRange:MCreateSaveMapRange)
    {
        print("save 2 2")
        
        guard
            
            let plan:DPlan = self.plan,
            let settings:DSettings = self.settings,
            let directory:URL = MCreateSave.factoryDirectory(
                plan:plan)
        
        else
        {
            return
        }
        
        print("save 2 3")
        
        let renders:[MCreateSaveRender] = MCreateSave.factorySnapshotRender(
            mapRange:mapRange,
            settings:settings)
        
        snapshots(
            directory:directory,
            renders:renders)
    }
}
