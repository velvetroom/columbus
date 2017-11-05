import Foundation

final class MCreateTravel:Model<ArchCreateTravel>
{
    weak var travel:DPlanTravel?
    let items:[MCreateTravelProtocol]
    let indexMap:[DPlanTravelMode:Int]
    
    var selectedIndex:Int?
    {
        get
        {
            guard
                
                let travel:DPlanTravel = self.travel,
                let index:Int = indexMap[travel.mode]
            
            else
            {
                return nil
            }
            
            return index
        }
    }
    
    required init()
    {
        items = MCreateTravel.factoryItems()
        indexMap = MCreateTravel.factoryIndexMap(
            items:items)
        
        super.init()
    }
}
