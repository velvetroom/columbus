import Foundation

final class MCreatePlan
{
    let database:Database
    let plan:DPlan
    
    init(database:Database, plan:DPlan)
    {
        self.database = database
        self.plan = plan
    }
    
    //MARK: internal
}
