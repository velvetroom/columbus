import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func modelAtIndex(
        index:IndexPath) -> DPlanStop
    {
        let item:DPlanStop = model![index.item]
        
        return item
    }
}
