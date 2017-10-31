import UIKit

extension MCreateSave
{
    //MARK: private
    
    private func asyncSave()
    {
        print("save 2")
        
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
        print("---- start save")
        
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
        settings?.activePlan = plan
        
        print("save 3")
        
        database?.save
        { [weak self] in
            
            print("save 4")
            
            self?.saveDone()
        }
    }
}
