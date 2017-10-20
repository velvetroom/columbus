import Foundation

final class MCreatePlan
{
    private(set) weak var model:MCreate?
    let database:Database
    let plan:DPlan
    
    init(
        model:MCreate,
        database:Database,
        plan:DPlan)
    {
        self.model = model
        self.database = database
        self.plan = plan
    }
}
