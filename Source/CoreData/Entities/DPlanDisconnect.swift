import Foundation

extension DPlan
{
    //MARK: internal
    
    func disconnect(
        database:Database,
        stop:DPlanStop,
        completion:@escaping(() -> ()))
    {
        stop.plan = nil
        
        
    }
}
