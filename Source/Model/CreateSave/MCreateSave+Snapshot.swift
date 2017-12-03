import Foundation

extension MCreateSave
{
    //MARK: private
    
    private func asyncPullSnapshot(builder:MCreateSaveBuilder)
    {
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
        guard
            
            let slice:MCreateSaveRenderSlice = render.slices.first
            
        else
        {
            renderFinished(
                builder:builder,
                render:render)
            
            return
        }
        
        updateProgress()
        builder.startTimer()
        
        factorySnapshot(
            zoom:render.zoom,
            directory:builder.directory,
            slice:slice)
    }
    
    private func renderFinished(
        builder:MCreateSaveBuilder,
        render:MCreateSaveRender)
    {
        builder.renders.removeFirst()
        asyncPullSnapshot(builder:builder)
    }
    
    //MARK: internal
    
    func snapshots(mapRange:MCreateSaveMapRange)
    {
        guard
            
            let plan:DPlan = self.plan,
            let settings:DSettings = self.settings,
            let directory:URL = MGlobalPlan.factoryDirectory(plan:plan)
        
        else
        {
            return
        }
        
        let renders:[MCreateSaveRender] = MCreateSave.factorySnapshotRender(
            mapRange:mapRange,
            settings:settings)
        
        let builder:MCreateSaveBuilder = MCreateSaveBuilder(
            renders:renders,
            directory:directory)
        
        builder.model = self
        self.builder = builder
        
        pullSnapshot()
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
