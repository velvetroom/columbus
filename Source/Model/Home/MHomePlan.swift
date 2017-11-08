import Foundation

final class MHomePlan
{
    private(set) weak var plan:DPlan!
    let tileTemplate:String
    
    init(
        plan:DPlan,
        tileTemplate:String)
    {
        self.plan = plan
        self.tileTemplate = tileTemplate
    }
}
