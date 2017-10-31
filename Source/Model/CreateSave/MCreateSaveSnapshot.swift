import Foundation

extension MCreateSave
{
    //MARK: private
    
    private func snapshots(
        directory:URL,
        renders:[MCreateSaveRender])
    {
        startTimer()
        
        for render:MCreateSaveRender in renders
        {
            snapshots(
                directory:directory,
                render:render)
            { [weak self] (urls:[URL]?) in
                
                if let urls:[URL] = urls
                {
                    self?.urls.append(
                        contentsOf:urls)
                }
                
                print("save 2 8")
                
                self?.dispatchGroup?.leave()
            }
        }
        
        print("save 2 5")
        dispatchGroup?.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        { [weak self] in
            
            self?.savedSnapshots()
        }
    }
    
    private func snapshots(
        directory:URL,
        render:MCreateSaveRender,
        completion:@escaping(([URL]?) -> ()))
    {
        for slice:MCreateSaveRenderSlice in render.slices
        {
            dispatchGroup?.enter()
            
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
