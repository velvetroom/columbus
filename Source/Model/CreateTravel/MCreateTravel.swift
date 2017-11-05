import Foundation

final class MCreateTravel:Model<ArchCreateTravel>
{
    weak var database:Database?
    weak var travel:DPlanTravel?
    let items:[MCreateTravelProtocol]
    let indexMap:[DPlanTravelMode:Int]
    
    required init()
    {
        items = MCreateTravel.factoryItems()
        indexMap = MCreateTravel.factoryIndexMap(
            items:items)
        
        super.init()
    }
}
