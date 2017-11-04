import Foundation

final class CCreateTravel:Controller<ArchCreateTravel>
{
    init(
        database:Database,
        travel:DPlanTravel)
    {
        super.init()
        model.database = database
        model.travel = travel
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
