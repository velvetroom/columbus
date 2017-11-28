import Foundation

final class MPlansDetail:Model<ArchPlansDetail>
{
    var database:Database?
    var settings:DSettings?
    var plans:[DPlan]?
}
