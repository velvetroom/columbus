import Foundation

extension MCreateSave
{
    //MARK: private
    
    private func save(
        plan:DPlan)
    {
        
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
