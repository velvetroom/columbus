import UIKit

extension MCreateSave
{
    //MARK: private
    
    private func asyncSave()
    {
        guard
        
            let stops:[DPlanStop] = plan?.stops?.array as? [DPlanStop],
            let mapRange:MCreateSaveMapRange = MCreateSave.factoryMapRange(
                stops:stops)
        
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
    
    //MARK: internal
    
    func save()
    {
        changeStatus(statusType:MCreateSaveStatusBusy.self)
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSave()
        }
    }
    
    func savedSnapshots()
    {
        timer?.invalidate()
        plan?.updateTimestamp()
        
        database?.save
        { [weak self] in
            
            self?.saveDone()
        }
    }
}
