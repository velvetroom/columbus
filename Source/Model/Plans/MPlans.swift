import Foundation

final class MPlans:Model<ArchPlans>
{
    required init()
    {
        super.init()
        
        let database:Database = Database(bundle:nil)!
        
        database.fetch
        { (travels:[DPlanTravel]) in
            
            print("travels \(travels.count)")
        }
    }
}
