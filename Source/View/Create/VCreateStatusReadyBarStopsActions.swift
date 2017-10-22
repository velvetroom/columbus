import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func stopList() -> [DPlanStop]?
    {
        guard
        
            let allStops:[
            DPlanStop] = controller.model.plan?.plan.stops?.array as? [
                DPlanStop]
        
        else
        {
            return nil
        }
        
        return allStops
    }
    
    func modelAtIndex(
        index:IndexPath) -> DPlanStop
    {
        let stops:[DPlanStop] = stopList()!
        let item:DPlanStop = stops[index.item]
        
        return item
    }
}
