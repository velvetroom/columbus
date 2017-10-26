import UIKit

extension VCreateStatusReadyBarTravel
{
    //MARK: internal
    
    func modelAtIndex(
        index:IndexPath) -> DPlanTravel
    {
        let item:DPlanTravel = model![index.item]
        
        return item
    }
}
