import UIKit

extension VPlansListCell
{
    //MARK: internal
    
    func updateRoute(model:DPlan)
    {
        guard
        
            let origin:DPlanStop = model.stops?.firstObject as? DPlanStop,
            let destination:DPlanStop = model.stops?.lastObject as? DPlanStop
        
        else
        {
            return
        }
        
        labelOrigin.text = origin.name
        labelDestination.text = destination.name
    }
}
