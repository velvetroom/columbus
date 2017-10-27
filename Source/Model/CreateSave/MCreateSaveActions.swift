import Foundation

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
