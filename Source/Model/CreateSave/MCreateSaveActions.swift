import UIKit

extension MCreateSave
{
    //MARK: private
    
    private func asyncSave()
    {
        print("save 2")
        
        guard
        
            let plan:DPlan = self.plan,
            let settings:DSettings = self.settings,
            let stops:[DPlanStop] = plan.stops?.array as? [DPlanStop],
            let mapRange:MCreateSaveMapRange = MCreateSave.factoryMapRange(
                stops:stops)
        
        else
        {
            return
        }
        
        MCreateSave.snapshots(
            plan:plan,
            mapRange:mapRange,
            settings:settings)
        { [weak self] (urls:[URL]) in
            
            self?.save(urls:urls)
        }
    }
    
    private func save(
        urls:[URL])
    {   
        plan?.updateTimestamp()
        settings?.activePlan = plan
        
        print("save 3")
        
        database?.save
        { [weak self] in
            
            print("save 4")
            
            self?.saveDone()
        }
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
}
