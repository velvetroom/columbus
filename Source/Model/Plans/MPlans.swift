import Foundation

final class MPlans:Model<ArchPlans>
{
    var database:Database?
    var settings:DSettings?
    var plans:[DPlan]?
    let kSortersKey:String = "created"
}
