import Foundation

extension MCreateSave
{
    //MARK: private
    
    private func asyncPullSnapshot(builder:MCreateSaveBuilder)
    {
        print("total renders \(builder.renders.count)")
        
        guard
            
            let render:MCreateSaveRender = builder.renders.first
            
        else
        {
            savedSnapshots()
            
            return
        }
        
        pullSnapshot(
            builder:builder,
            render:render)
    }
    
    private func pullSnapshot(
        builder:MCreateSaveBuilder,
        render:MCreateSaveRender)
    {
        print("total slices \(render.slices.count)")
        
        guard
            
            let slice:MCreateSaveRenderSlice = render.slices.first
            
        else
        {
            builder.renders.removeFirst()
            asyncPullSnapshot(builder:builder)
            
            return
        }
        
        builder.startTimer()
        
        factorySnapshot(
            zoom:render.zoom,
            directory:builder.directory,
            slice:slice)
    }
    
    //MARK: internal
    
    func snapshots(mapRange:MCreateSaveMapRange)
    {
        guard
            
            let plan:DPlan = self.plan,
            let settings:DSettings = self.settings,
            let directory:URL = MCreateSave.factoryDirectory(
                plan:plan)
        
        else
        {
            return
        }
        
        let renders:[MCreateSaveRender] = MCreateSave.factorySnapshotRender(
            mapRange:mapRange,
            settings:settings)
        
        builder = MCreateSaveBuilder(
            renders:renders,
            directory:directory)
    }
    
    func pullSnapshot()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            guard
                
                let builder:MCreateSaveBuilder = self?.builder
            
            else
            {
                return
            }
            
            self?.asyncPullSnapshot(builder:builder)
        }
    }
}
