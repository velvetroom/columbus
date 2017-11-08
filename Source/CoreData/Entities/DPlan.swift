import Foundation

extension DPlan
{
    public override func awakeFromInsert()
    {
        identifier = UUID().uuidString 
    }
    
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
