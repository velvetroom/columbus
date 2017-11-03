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
    
    func updateCreated(model:DPlan)
    {
        guard
            
            let date:Date = model.created
        
        else
        {
            return
        }
        
        let dateString:String = dateFormatter.string(
            from:date)
        labelCreated.text = dateString
    }
}
