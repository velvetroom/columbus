import Foundation

extension MCreatePlan
{
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        plan.updateTimestamp()
        
        model?.database?.save
        {
            completion()
        }
    }
}
