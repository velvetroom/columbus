import Foundation

extension DPlan
{
    //MARK: internal
    
    func updateTimestamp()
    {
        let now:Date = Date()
        timestamp = now
        
        guard
        
            created == nil
        
        else
        {
            return
        }
        
        created = now
    }
}
