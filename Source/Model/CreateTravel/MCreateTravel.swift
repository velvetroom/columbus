import Foundation

final class MCreateTravel:Model<ArchCreateTravel>
{
    weak var database:Database?
    weak var travel:DPlanTravel?
    let items:[MCreateTravelProtocol]
    
    required init()
    {
        items = MCreateTravel.factoryItems()
        
        super.init()
    }
}
