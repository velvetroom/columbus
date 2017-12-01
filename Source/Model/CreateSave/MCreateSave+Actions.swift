import UIKit

extension MCreateSave
{
    //MARK: private
    
    private func asyncSave()
    {
        guard
        
            let stops:[DPlanStop] = plan?.stopsList,
            let mapRange:MCreateSaveMapRange = MCreateSave.factoryMapRange(stops:stops)
        
        else
        {
            return
        }
        
        snapshots(mapRange:mapRange)
    }
    
    private func saveDone()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncSaveDone()
        }
    }
    
    private func asyncSaveDone()
    {
        guard
        
            let controller:CCreateSave = view?.controller as? CCreateSave
        
        else
        {
            return
        }
        
        controller.moveToPlans()
    }
    
    private func updateBuilder(urls:[URL])
    {
        guard
            
            let builder:MCreateSaveBuilder = self.builder
            
        else
        {
            return
        }
        
        builder.urls.append(contentsOf:urls)
        builder.renders.first?.slices.removeFirst()
    }
    
    //MARK: internal
    
    func save()
    {
        changeStatus(statusType:MCreateSaveStatusBusy.self)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSave()
        }
    }
    
    func snapshotUrls(urls:[URL])
    {
        updateBuilder(urls:urls)
        pullSnapshot()
    }
    
    func savedSnapshots()
    {
        plan?.updateTimestamp()
        
        database?.save
        { [weak self] in
            
            self?.saveDone()
        }
    }
    
    func updateProgress()
    {
        guard
            
            let builder:MCreateSaveBuilder = self.builder,
            let view:VCreateSaveStatusBusy = self.view?.view as? VCreateSaveStatusBusy
            
        else
        {
            return
        }
        
        let progress:Float = builder.progress()
        view.viewProgress.update(progress:progress)
    }
}
