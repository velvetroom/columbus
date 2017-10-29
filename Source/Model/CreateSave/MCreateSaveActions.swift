import UIKit

extension MCreateSave
{
    //MARK: private
    
    private func save(
        plan:DPlan,
        settings:DSettings)
    {
        print("save 2")
        
        guard
        
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
            
            self?.save(
                plan:plan,
                urls:urls)
        }
    }
    
    private func save(
        plan:DPlan,
        urls:[URL])
    {
        print("save 3")
        
        DispatchQueue.main.async
        {
            print("save 4")
            
            let activity:UIActivityViewController = UIActivityViewController(
                activityItems:urls,
                applicationActivities:nil)
            
            self.view?.controller.present(activity, animated:true, completion:nil)
        }
    }
    
    //MARK: internal
    
    func save()
    {
        print("---- start save")
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            guard
                
                let plan:DPlan = self?.plan,
                let settings:DSettings = self?.settings
            
            else
            {
                return
            }
            
            self?.save(
                plan:plan,
                settings:settings)
        }
    }
}
