import Foundation

final class MPlans:Model<ArchPlans>
{
    required init()
    {
        super.init()
        
        let database:Database = Database(bundle:nil)!
        
        database.fetch
        { (travels:[DPlanTravel]) in
            
            guard
            
                let first:DPlanTravel = travels.first
            
            else
            {
                return
            }
        }
    }
}
