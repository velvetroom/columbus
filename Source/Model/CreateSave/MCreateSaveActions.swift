import UIKit

extension MCreateSave
{
    //MARK: private
    
    private func save(
        plan:DPlan)
    {
        guard
        
            let stops:[DPlanStop] = plan.stops?.array as? [DPlanStop],
            let mapRange:MCreateSaveMapRange = MCreateSave.factoryMapRange(
                stops:stops)
        
        else
        {
            return
        }
        
        MCreateSave.snapshots(
            mapRange:mapRange)
        { [weak self] (snapshots:[UIImage]) in
            
            self?.save(
                plan:plan,
                snapshots:snapshots)
        }
    }
    
    private func save(
        plan:DPlan,
        snapshots:[UIImage])
    {
        DispatchQueue.main.async
        {
            let activity:UIActivityViewController = UIActivityViewController(
                activityItems:snapshots,
                applicationActivities:nil)
            
            self.view?.controller.present(activity, animated:true, completion:nil)
        }
    }
    
    //MARK: internal
    
    func save()
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            guard
                
                let plan:DPlan = self?.plan
            
            else
            {
                return
            }
            
            self?.save(plan:plan)
        }
    }
}
