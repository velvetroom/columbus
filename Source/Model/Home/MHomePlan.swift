import Foundation

final class MHomePlan
{
    let items:[MHomePlanItemProtocol]
    let tileTemplate:String
    private(set) weak var plan:DPlan!
    
    init(
        plan:DPlan,
        tileTemplate:String)
    {
        self.plan = plan
        self.tileTemplate = tileTemplate
        items = MHomePlan.factoryItems(plan:plan)
    }
}
